<?php
class Twitter{


function follow($usuario){
        ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
        /** Set access tokens here - see: https://dev.twitter.com/apps/ **/ 
        $settings = array(
           'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
        );
        $url = 'https://api.twitter.com/1.1/friendships/create.json';
        $requestMethod = 'POST';
        $postfields = array( 'screen_name' => $usuario,'follow' => "true" );
        $twitter = new TwitterAPIExchange($settings);
        return $twitter->buildOauth($url, $requestMethod)->setPostfields($postfields)->performRequest();
}

function unfollow($usuario){
        ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
        /** Set access tokens here - see: https://dev.twitter.com/apps/ **/ 
        $settings = array(
           'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
        );
        $url = 'https://api.twitter.com/1.1/friendships/destroy.json';
        $requestMethod = 'POST';
        $postfields = array( 'screen_name' => $usuario, );
        $twitter = new TwitterAPIExchange($settings);
        return $twitter->buildOauth($url, $requestMethod)->setPostfields($postfields)->performRequest();
}
 
    function getTweets($tag,$cantidad){
        ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
 
        $settings = array(
          'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
        );
 
        $url = 'https://api.twitter.com/1.1/search/tweets.json';
        $getfield = '?q=' .$tag. '&result_type=mixed&count='.$cantidad;        
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
           $following = $user->user->following;
           echo $id.' - '.$screen_name.' - '. $following;
           echo '<br>';
           if($following == '0'){   
             $url = 'https://api.twitter.com/1.1/friendships/create.json';
             $requestMethod = 'POST';
             $postfields = array( 'screen_name' => $screen_name,'follow' => "true" );
             $twitter = new TwitterAPIExchange($settings);
             $twitter->buildOauth($url, $requestMethod)->setPostfields($postfields)->performRequest();
           }else{
             $url = 'https://api.twitter.com/1.1/friendships/destroy.json';
             $requestMethod = 'POST';
             $postfields = array( 'screen_name' => $screen_name, );
             $twitter = new TwitterAPIExchange($settings);
             $twitter->buildOauth($url, $requestMethod)->setPostfields($postfields)->performRequest();
        }
       }
    }
    
    function getTweets2($tag){
    ini_set('display_errors', 1);
        require_once('TwitterAPIExchange.php');
 
        $settings = array(
          'oauth_access_token' => "752715485213491201-Md2NbNVdFPlqUkOXaegWBsEsjgNvl4Q",
    'oauth_access_token_secret' => "rZI57RzuVlNvUjYdiScViRsb31e8saO1LaNYMVYnwiwb4",
    'consumer_key' => "HYjiz8czs8FL6RsWz3dNB4yjK",
    'consumer_secret' => "JzFfDnod1w1wpyduL2M9qz8HTXDPZTuXhLHVFXd9KVQTLVxCdx"
        );
 
        $url = 'https://api.twitter.com/1.1/users/show.json';
        $getfield = '?screen_name=' .$tag;        
        $requestMethod = 'GET';
        $twitter = new TwitterAPIExchange($settings);
        $json =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();

        //echo $json;
        $json2 = json_decode($json);
        //$user = $json2[0];
        echo $json2->friends_count;
    
    }
    
}
 
$twitterObject = new Twitter();
$jsonraw =  $twitterObject->getTweets2("TeteAngariita");
/*$rawdata =  $twitterObject->getArrayTweets($jsonraw);*/

?>