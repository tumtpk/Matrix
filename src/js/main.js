var alldata = [];
var dataSelected = [];
var place = $("#place");
var search = $("#search");
var btnSearch = $("#btnSearch");
var calucate = $("#calucate");
var source = [];
var destination = [];
var carData = [];
var selectCar = $("#selectCar");

init();

function init(){
    $.get("http://localhost/Matrix/data.php/place/1", {},
        function (data, textStatus, jqXHR) {
            alldata = data;
            setData(alldata);
        }
    );
    $.get("http://localhost/Matrix/data.php/car", {},
        function (data, textStatus, jqXHR) {
            carData = data;
            setCar(carData);
        }
    );
}

place.change(function () { 
    var selectVal = $(this).val();
    search.val("");
    $.get("http://localhost/Matrix/data.php/place/"+selectVal, {},
        function (data, textStatus, jqXHR) {
            alldata = data;
            setData(alldata);
        }
    );
});

btnSearch.click(function () { 
    var input = search.val();
    var result = $.grep(alldata, function(val) {
        return (val.name).includes(input);
    });
    setData(result);
});

function setCar(carData){
    var html = '<option value="">เลือกพาหนะ</option>';
    $.each(carData, function( index, value ) {
        html += '<option value="'+index+'">'+value.carName+'</option>';
    });
    selectCar.html(html);
}

function setData(dataSelect){
    var html = "";
    if(dataSelect != null && dataSelect != undefined){
        $.each(dataSelect, function( index, value ) {
            html += '<tr>'
                + '<td>'+value.name+'</td>'
                + '<td class="right">'
                    + '<button type="button" class="btn btn-info btn-sm" onclick="addResult(\''+value.name+'\','+value.latitude+','+value.longtitude+')"><i class="fas fa-plus"></i></button>'
                    + '</td>'
            + '</tr>';
        });
    }
    $("#place-result").html(html);    
}

function addResult(name, latitude, longtitude){
    var size = dataSelected.length;
    var lastData = null;
    if(size > 0){
        lastData = dataSelected[size-1];
        if(lastData != null && lastData.name != name){
            var temp = {
                "name": name,
                "latitude": latitude,
                "longtitude": longtitude
            }
            dataSelected.push(temp);
            setMap(dataSelected);
        }else{
            $.alert({
                title: 'แจ้งเตือน',
                content: 'ตำแหน่ง ณ ขณะนี้เป็นตำแหน่งสุดท้ายของปัจจุบัน',
            });
        }
    }else{
        var temp = {
            "name": name,
            "latitude": latitude,
            "longtitude": longtitude,
            "distance": 0
        }
        dataSelected.push(temp);
        setMap(dataSelected);
    }
}

function removeResult(index){
    $.confirm({
        title: 'แจ้งเตือน',
        content: 'กดตกลงเพื่อยืนยันการลบ',
        buttons: {
            ok: {
                text: 'ตกลง',
                keys: ['enter'],
                action: function(){
                    dataSelected.splice(index, 1);
                    setMap(dataSelected);
                }
            },
            cancle: {
                text: 'ยกเลิก',
                action: function(){
                    
                }
            }
        }
    });
}

function setMap(dataSelect){
    var html = "";
    if(dataSelect != null && dataSelect != undefined){
        $.each(dataSelect, function( index, value ) {
            html += '<tr>'
                + '<td>'+value.name+'</td>'
                + '<td class="right">'
                    + '<button type="button" class="btn btn-danger btn-sm" onclick="removeResult('+index+')"><i class="fas fa-minus"></i></button>'
                    + '</td>'
            + '</tr>';
        });
    }
    $("#runway").html(html);  
}

calucate.submit(function (e) { 
    e.preventDefault();
    var size = dataSelected.length;
    if(size > 1){
        showAllDistance();
    }else{
        $.alert({
            title: 'แจ้งเตือน',
            content: 'ไม่สามารถคำนวนได้',
        });
    }
});

function setSourceDestination(){
    if(dataSelected != null && dataSelected != undefined){
        $.each(dataSelected, function( index, point ) {
            var nextPoint = dataSelected[index+1];
            if(nextPoint == undefined){
                return false;
            }else{
                source[index] = new google.maps.LatLng(point.latitude, point.longtitude);
                destination[index] = new google.maps.LatLng(nextPoint.latitude, nextPoint.longtitude);
            }
        });
    }
}

function callback(response, status) {
    var distance = [];
    var totalDistance = 0;
    $.each(response.rows, function( index, value ) {
        distance[index] = value.elements[index].distance.value;
        totalDistance += value.elements[index].distance.value;
    });

    var html = "";
    if(dataSelected != null && dataSelected != undefined){
        $.each(dataSelected, function( index, value ) {
            var nextPoint = dataSelected[index+1];
            if(nextPoint == undefined){
                return false;
            }
            html += '<div class="row content-result">'
                + '<div class="col-7">'
                    + value.name +' -> '+ nextPoint.name
                + '</div>'
                + '<div class="col-5 right">'
                    + (distance[index]/1000)+' กม.'
                + '</div>'
            + '</div>';
        });
    }
    $("#distanceList").html(html);

    var selectedCar = carData[selectCar.val()];
    var number = $("#number").val();
    var total = ((totalDistance/1000)*selectedCar.carOilPrice)+(selectedCar.carPrice*number);
    var isCheck = $("#return").prop("checked");
    if(isCheck){
        total *= 2;
    }
    $("#totalDistance").html(totalDistance/1000+" กม.");
    $("#total").html(total+" บาท");
}

function showAllDistance(){
    setSourceDestination();
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
        {
            origins: source,
            destinations: destination,
            travelMode: google.maps.TravelMode.DRIVING,
            avoidHighways: true,
            avoidTolls: true
        }, 
        callback
    );
}

