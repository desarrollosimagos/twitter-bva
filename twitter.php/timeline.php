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
 
        $url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
        $getfield = '?screen_name='.$user.'&count=10';        
        $requestMethod = 'GET';
        $twitter = new TwitterAPIExchange($settings);
        $json =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();
        echo $json;
    }  
}
 
$twitterObject = new Twitter();

		$user = $_GET['twitter'];
		$jsonraw =  $twitterObject->getTweets($user);


?>