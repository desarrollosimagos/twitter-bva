<?php error_reporting (0);?>
<?php

class Twitter{
 
    function getTweets($user){
        ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
 
$settings = array(
    'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
);

	$user2 = 'postgres';
	$passwd = 'sergio2015';
	$db = 'twitteros';
	$port = 5432;
	$host = 'localhost';
	$strCnx = "host=$host port=$port dbname=$db user=$user2 password=$passwd";

$con = pg_connect ($strCnx) or die ("Error de conexion.". pg_last_error());
echo "se establecio la conexion<br>";

$resultado = pg_query($con, "SELECT * FROM datos_consultas limit 1");
//echo "SELECT * FROM datos_consultas where twitter='".$user."'  limit 1";
if (!$resultado) { 
	echo "<b>Error de busqueda</b>"; 
	exit;
}
$line = pg_fetch_array($resultado, null, PGSQL_ASSOC);
//$user = $line['twitter'];
$next_result = $line['next_result'];
$twi = $line['twitter'];
//$max_id = $line['max_id'];


        $url = 'https://api.twitter.com/1.1/search/tweets.json';
        if(empty($next_result)){
	        $getfield = "?q=".$twi."&count=100"; 
        }else{
	        $getfield = $next_result; 
        }
           
        $requestMethod = 'GET';
        $twitter = new TwitterAPIExchange($settings);
        $json2 =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();
        //echo $json2;
        
        $json = json_decode($json2);
        
        $json->statuses;
        
        $next = $json->search_metadata;
        echo $next->next_results;
        $query = "update datos_consultas set next_result='".$next->next_results."' where twitter='".$twi."'";
        $result = pg_query($con, $query) or die('ERROR AL INSERTAR DATOS: ' . pg_last_error());
        
        $num_items = count($json->statuses);
        
        
        for($i=0; $i<$num_items; $i++){
 
            $user = $json->statuses[$i];
 
            $solicitante = $user->user->screen_name;
            $fecha = $user->created_at;
            $contenido = $user->text;
            $id = $user->id_str;
            $resultado = pg_query($con, "SELECT * FROM bandeja where solicitante='".$solicitante."' and contenido='".$contenido."'");
			//echo "SELECT * FROM datos_consultas where twitter='".$user."'  limit 1";
			if (!$resultado) { 
				echo "<b>Error de busqueda</b>"; 
				exit;
			}
			//$line = pg_fetch_array($resultado, null, PGSQL_ASSOC);
			if(pg_num_rows($resultado)>0){
				//no registro
				echo "ya existe<br>";
			}else{
				echo "va a registrar<br>";
				//registrar
				$query = "INSERT INTO bandeja(solicitante, fecha, contenido,estatus,id) VALUES ('".$solicitante."','".$fecha."','".$contenido."','Recibido','".$id."');";
				$result = pg_query($con, $query) or die('ERROR AL INSERTAR DATOS: ' . pg_last_error());
				
			}
            
        }
    }  
}
 
$twitterObject = new Twitter();

		$user = "";
		//while(1)
		//{
		//	echo "hola";
        //	sleep(60); # un paro de 60 segundos antes de volver a iniciar las instrucciones
		//}
		$jsonraw =  $twitterObject->getTweets($user);


?>