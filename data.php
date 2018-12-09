<?php
// echo "OK";

require 'vendor/autoload.php';


$app = new \Slim\App;
$corsOptions = array(
    "origin" => "*",
    "exposeHeaders" => array("Content-Type", "X-Requested-With", "X-authentication", "X-client"),
    "allowMethods" => array('GET', 'POST', 'PUT', 'DELETE', 'OPTIONS')
);
$cors = new \CorsSlim\CorsSlim($corsOptions);
$app->add($cors);

$app->get('/place/{type}', function($request, $response){

	$newsCount = (int)$request->getAttribute('type');
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "matrix";

	$conn = new mysqli($servername, $username, $password,$dbname);
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	mysqli_set_charset($conn,"utf8");
	
	if($newsCount == 2){
		// โรงแรม
		$newResponse = $response->withJson([]);
	}
	else if($newsCount == 3){
		// ร้านอาหาร
		$newResponse = $response->withJson([]);
	}
	else if($newsCount == 4){
		//มัสยิด
		$newResponse = $response->withJson([]);
	}
	else{
		// สถานที่ท่องเที่ยว
		$sql = "SELECT * FROM travel";
		$result = $conn->query($sql);
		$array = [];

		while ($obj = mysqli_fetch_object($result)){

			$value[] = $obj;
			
		}
		$newResponse = $response->withJson($value);	
	}
	return $newResponse;
	
});
$app->get('/car', function($request, $response){

	$newsCount = (int)$request->getAttribute('type');
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "matrix";
	
	$conn = new mysqli($servername, $username, $password,$dbname);
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	mysqli_set_charset($conn,"utf8");

	$sql = "SELECT * FROM car";
	$result = $conn->query($sql);
	$value = [];

	while ($obj = mysqli_fetch_object($result)){

		$value[] =  $obj;
		
	}
	$newResponse = $response->withJson($value);	
		
	return $newResponse;
});

// $app->get('/news', function($request, $response){

// 	$result = array(array('title'=>'A', 'imageUrl'=>'assets/a.jpg', 'content'=>'blah blah blah'),
// 		array('title'=>'A', 'imageUrl'=>'assets/a.jpg', 'content'=>'blah blah blah'),
// 		array('title'=>'A', 'imageUrl'=>'assets/a.jpg', 'content'=>'blah blah blah')
// 		);
// 	$newResponse = $response->withJson($result);
// 	return $newResponse;

// });

// $app->get('/news/amount/{count}',function($request, $response){

// 	$newsCount = $request->getAttribute('count');

// 	$result = array('newsCount' => $newsCount);
// 	$newResponse = $response->withJson($result);
// 	return $newResponse;

// });

// $app->post('/news/search/', function($request, $response){

// 	$keyword = $request->getParam('keyword');

// 	$result = array('searchKeyword' => $keyword );
// 	$newResponse = $response->withJson($result);
// 	return $newResponse;

// });

$app->run();
 ?>
 
