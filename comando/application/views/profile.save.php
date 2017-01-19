<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Codeigniter Sign In With Twitter</title>
<!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="<?php echo base_url();?>assets/css/font-awesome-ie7.min.css"><![endif]-->
    <link href="<?php echo base_url();?>assets/css/font-entypo.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <link href="<?php echo base_url();?>assets/css/fonts.css" rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="<?php echo base_url();?>assets/plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">    
    <link href="<?php echo base_url();?>assets/plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">    
	<link href="<?php echo base_url();?>assets/plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css"> 
   
         
    <link href="<?php echo base_url();?>assets/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">    
    <link href="<?php echo base_url();?>assets/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">    
    <link href="<?php echo base_url();?>assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>assets/plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">            

	<!-- Specific CSS -->
	    
     
    <!-- Theme CSS -->
    <link href="<?php echo base_url();?>assets/css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="<?php echo base_url();?>assets/css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="<?php echo base_url();?>assets/css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
        	<link href="<?php echo base_url();?>assets/css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

	  
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="<?php echo base_url();?>assets/custom/custom.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	::selection{ background-color: #E13300; color: white; }
	::moz-selection{ background-color: #E13300; color: white; }
	::webkit-selection{ background-color: #E13300; color: white; }
	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}
	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}
	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}
	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}
	#body{
		margin: 0 15px 0 15px;
	}
	
	p.footer{
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	
	#container{
		margin: 10px;
		border: 1px solid #D0D0D0;
		-webkit-box-shadow: 0 0 8px #D0D0D0;
	}
	</style>
</head>
<body>

<div class="content">
  <div class="container">
            <div class="row">

		<div class="col-sm-3">
                <div class="panel widget light-widget panel-bd-top">
                  <div class="panel-heading no-title"> </div>
                  <div class="panel-body">
                    <div class="text-center vd_info-parent"> <img src="<?php echo str_replace('_normal', '',$user_profile['profile_image_url']);?>" width="200"> </div>
                    <div class="row">
                      <div class="col-xs-12"> <a href="<?php echo base_url();?>index.php/welcome/logout" class="btn vd_btn vd_bg-red btn-xs btn-block no-br">Cerrar Sesion</a> </div>
                    </div>
                    <h2 class="font-semibold mgbt-xs-5"><?php echo $user_profile['name'];?></h2>
                    <h4><?php echo $user_profile['location'];?></h4>
                    <p><?php echo $user_profile['description'];?></p>
                    <div class="mgtp-20">
                      <table class="table table-striped table-hover">
                        <tbody>
                          <tr>
                            <td style="width:60%;">Postulaciones</td>
                            <td><span class="label label-success">0</span></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
		</div>
		<div class="col-sm-9">
                <div class="tabs widget">
  <ul class="nav nav-tabs widget">
    <li> <a data-toggle="tab" href="#"> Listado de Categorias <span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
      </ul>
  <div class="tab-content">
    <div id="profile-tab" class="tab-pane active">
      <div class="pd-20">
      <p>Postula a cualquier usuario de twitter en las siguientes categorias.</p>
		  
        <hr class="pd-10">
        <div class="row">
          <?php 
          foreach ($categorias as $lcategorias) {
          ?>
          <!-- col-sm-7 --> 
          <div class="col-sm-6">
            <h3 class="mgbt-xs-15 font-semibold"><a href="<?php echo base_url();?>index.php/welcome/postular/<?php echo $lcategorias->id; ?>" class="btn vd_btn btn-xs vd_bg-yellow">Postular</a> <?php echo $lcategorias->nombre; ?></h3>
                                             
          </div>  
          <?php
          }
          ?>       
        </div>
        <!-- -->
        
        <!-- row --> 
      </div>
      
      <!-- pd-20 --> 
    </div>
    <!-- home-tab -->
    
    
    
          
        
      </div>
            </div>
  </div>
</div>
</body>
</html>