<?php error_reporting (0);?>
<?php

class Twitter{
 
    function getTweets($mensaje){
        ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
 
$settings = array(
    'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
);
 
        $url = 'https://api.twitter.com/1.1/statuses/update.json';
        $requestMethod = 'POST';
        /** POST fields required by the URL above. See relevant docs as above **/
        $postfields = array( 'status' => $mensaje, );
        /** Perform a POST request and echo the response **/
        $twitter = new TwitterAPIExchange($settings);
        return $twitter->buildOauth($url, $requestMethod)->setPostfields($postfields)->performRequest();
    }  
}
 
		$twitterObject = new Twitter();

		$mensaje = $_GET['mensaje'];
		$jsonraw =  $twitterObject->getTweets($mensaje);
		$json = json_decode($jsonraw);
		
		echo '<meta charset="utf-8">';
		echo "Tweet Enviado por: ".$json->user->name." (@".$json->user->screen_name.")";
		echo "<br>";
		echo "Tweet: ".$json->text;
		echo "<br>";
		echo "Tweet ID: ".$json->id_str;
		echo "<br>";
		echo "Fecha Envio: ".$json->created_at;


?>