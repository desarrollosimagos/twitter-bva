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
 
        $url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
        $getfield = '?screen_name='.$user.'&count=100';        
        $requestMethod = 'GET';
        $twitter = new TwitterAPIExchange($settings);
        $json =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();
        return $json;
 
    }
 
    function getArrayTweets($jsonraw){
        $rawdata = "";
        $json = json_decode($jsonraw);
        $num_items = count($json);
        for($i=0; $i<$num_items; $i++){
 
            $user = $json[$i];
 
            $fecha = $user->created_at;
            $url_imagen = $user->user->profile_image_url;
            $screen_name = $user->user->screen_name;
            $tweet = $user->text;
 
            $imagen = "<a href='https://twitter.com/".$screen_name."' target=_blank><img src=".$url_imagen."></img></a>";
            $name = "<a href='https://twitter.com/".$screen_name."' target=_blank>@".$screen_name."</a>";
 
            $rawdata[$i][0]=$fecha;
            $rawdata[$i]["FECHA"]=$fecha;
            $rawdata[$i][1]=$imagen;
            $rawdata[$i]["imagen"]=$imagen;
            $rawdata[$i][2]=$name;
            $rawdata[$i]["screen_name"]=$name;
            $rawdata[$i][3]=$tweet;
            $rawdata[$i]["tweet"]=$tweet;
        }
        return $rawdata;
    }
 
    function displayTable($rawdata){
 
        //DIBUJAMOS LA TABLA
        echo '<table border=1>';
        $columnas = count($rawdata[0])/2;
        //echo $columnas;
        $filas = count($rawdata);
        //echo "<br>".$filas."<br>";
        //Añadimos los titulos
 
        for($i=1;$i<count($rawdata[0]);$i=$i+2){
            next($rawdata[0]);
            echo "<th><b>".key($rawdata[0])."</b></th>";
            next($rawdata[0]);
        }
        for($i=0;$i<$filas;$i++){
            echo "<tr>";
            for($j=0;$j<$columnas;$j++){
                echo "<td>".$rawdata[$i][$j]."</td>";
 
            }
            echo "</tr>";
        }       
        echo '</table>';
    }
}
 
$twitterObject = new Twitter();
$jsonraw =  $twitterObject->getTweets("tareckpsuv");
$rawdata =  $twitterObject->getArrayTweets($jsonraw);
$twitterObject->displayTable($rawdata);

?>