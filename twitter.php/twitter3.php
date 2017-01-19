<?php

require_once('TwitterAPIExchange.php');
 
$settings = array(
    'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
);
 
        
$url = 'https://api.twitter.com/1.1/search/tweets.json';
$getfield = '?q=#FelizMartes&result_type=mixed&until=2016-02-02&count=1';        
$requestMethod = 'GET';
$twitter = new TwitterAPIExchange($settings);
$json =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();

$json2 = json_decode($json);

$num_items = count($json2->statuses);

for($i=0; $i<$num_items; $i++){
   $user = $json2->statuses[$i];
   $screen_name = $user->user->screen_name;
   $id = $user->user->id;
       
       $url = 'https://api.twitter.com/1.1/friendships/create.json';
       $getfield = '?user_id='.$id.'&follow=true';        
       $requestMethod = 'POST';
       $twitter = new TwitterAPIExchange($settings);
       $json3 =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();
echo $json3;

}


?>


