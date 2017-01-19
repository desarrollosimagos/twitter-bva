<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Your description here"/>
        <meta name="keywords" content="Your keywords here" />
        <meta name="author" content="Your author name here" />
		<title>coming soon</title>
        <link rel="apple-touch-icon" sizes="144x144" href="<?php echo base_url();?>assets/bgimage/images/icons/apple-touch-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<?php echo base_url();?>assets/bgimage/images/icons/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<?php echo base_url();?>assets/bgimage/images/icons/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" href="<?php echo base_url();?>assets/bgimage/images/icons/apple-touch-icon.png">
        <link rel="shortcut icon" href="<?php echo base_url();?>assets/bgimage/images/favicon.ico">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
        <link href="<?php echo base_url();?>assets/bgimage/css/bootstrap.css" rel="stylesheet">
        <link href="<?php echo base_url();?>assets/bgimage/css/font-awesome.min.css" rel="stylesheet">
        <link href="<?php echo base_url();?>assets/bgimage/css/owl.carousel.css" rel="stylesheet">
		<link href="<?php echo base_url();?>assets/bgimage/css/magic.min.css" rel="stylesheet">		
        <link href="<?php echo base_url();?>assets/bgimage/css/style.css" rel="stylesheet">
        
        <link href="<?php echo base_url();?>assets/css/theme.min.css" rel="stylesheet" type="text/css">
        
		<!--Color Scheme -->
		<link rel="stylesheet" type="text/css" id="color" href="<?php echo base_url();?>assets/bgimage/css/colors/default.css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

       <!-- PRELOADER-->
		<div id="preloader">
			<div id="status"><svg class="circular" viewBox="25 25 50 50">
			  <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
			</svg></div>
		</div> 
		
		<!-- END PRELOADER -->

        <div id="overlay"></div>
        <div class="col-md-6 content-column-background"></div>
        <div class="col-md-6 content-column">                
            <!-- Header starts -->
            <div class="content-inner">
				 <!-- Header -->
				<header class="top-section">
					<div class="topbanner clearfix">
					<a href="<?php echo base_url();?>">
						 <img src="<?php echo base_url();?>assets/bgimage/images/guerrilla.jpg" width="630px">
					</a>
					</div>
				</header>	
                
                <!-- Header ends -->

                <!-- Left column content starts -->
				<div class="row">
					<div class="main-column clearfix">
						<!--Home section -->
						<section class="home-panel">
							<div class="col-xs-12">
								<div class="col-sm-12">
                <div class="panel widget light-widget panel-bd-top">
                  <div class="panel-heading no-title"> </div>
                  <div class="panel-body">
                    <div class="text-center vd_info-parent"> <img height="200px" src="<?php echo str_replace('_normal', '',$user_profile['profile_image_url']);?>"> </div>
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
							</div>
							<div class="col-xs-12 mobile-subscription">								
								!-- form -->								
							</div>
						</section>
						<!--End home section -->

						

						
						
							
					</div><!-- main-columns -->
				</div>
                <!-- Left column content ends -->
            </div>
			
            <!-- Footer starts -->
            <footer class="contentinfo clearfix">
                <div class="row">
                    <div class="col-xs-12 col-lg-6">
                        <ul class="social-media">
                            <li><a href="<?php echo base_url();?>assets/bgimage/#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="<?php echo base_url();?>assets/bgimage/#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="<?php echo base_url();?>assets/bgimage/#"><i class="fa fa-linkedin"></i></a></li>
                        </ul><!-- social-media -->
                    </div>
                    <div class="col-xs-12 col-lg-6">
						<p class="address"><strong>A :</strong>Blade Studio, 47 Vagasrin Road, UK <br/><strong>P :</strong> (000) 123 4567 <br/><strong>E :</strong>mail@companyname.com</p>
					</div>
					
                </div>
            </footer>
            <!-- Footer ends -->
        </div>
		
		<div class="col-md-6">
				<div class="row">
					<br>
					<div class="col-sm-12">
						<div class="tabs widget">
							<ul class="nav nav-tabs widget">
								<li> <a data-toggle="tab" href="#"> Panel de Postulaciones <span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
							</ul>
							<div class="tab-content">
								<div id="profile-tab" class="tab-pane active">
									<div class="pd-20">
										<p>Al momento de postular debe tener el nombre correcto del usuario.</p>
										<h1 style="color:#000000;"><b><?php echo $categorias->nombre; ?><input type="hidden" id="hidden_categoria" value="<?php echo $categorias->id; ?>"></b></h1>
										<label>Cuenta twitter a postular:</label>
										<input type="text" id="cuentatwitter" name="cuentatwitter"><br><br>
										<a class="btn vd_btn btn-xs vd_bg-yellow" id="btnbuscar">Buscar</a>
										<br><br>
										<div id="mostrarcuenta">
										</div> 
									</div> 
								</div>
							</div>
						</div>
					</div>    	
			   </div>
        </div>
	</div>
	</div>	
		
	   <!-- Right column content ends -->
       
       
        <!-- Scripts -->
        <script src="<?php echo base_url();?>assets/bgimage/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>assets/bgimage/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="<?php echo base_url();?>assets/bgimage/js/jquery.easing.1.3.js"></script>
		<script src="<?php echo base_url();?>assets/bgimage/js/jquery.lwtCountdown-1.0.js"></script>
		<script src="<?php echo base_url();?>assets/bgimage/js/jquery.backstretch.min.js"></script>
        <script src="<?php echo base_url();?>assets/bgimage/js/owl.carousel.min.js"></script>
        <script src="<?php echo base_url();?>assets/bgimage/js/bootstrap.min.js"></script>
        <!--[if lte IE 9]>
		    <script src="<?php echo base_url();?>assets/bgimage/js/jquery.placeholder.js"></script>
		    <script type="text/javascript">$('input, textarea').placeholder();</script>
	    <![endif]-->
        <script src="<?php echo base_url();?>assets/bgimage/js/script.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>assets/bgimage/js/switcher.js"></script>
		<script>
			$(document).ready(function () {
				"use strict";
				// Background images slider
				// Duration is the amount of time in between slides,
				// and fade is value that determines how quickly the next image will fade in
				$.backstretch([
				  "<?php echo base_url();?>images/Background.jpg"
				],
				{ duration: 4000, fade: 800 });
				
				$(".owl-carousel").owlCarousel({		 
			navigation: false,
			pagination:true, 
			slideSpeed : 300,
			autoPlay : 5000,
			singleItem:true	 
		});
			});
		</script>
		<script>
		$("#btnbuscar").click(function(){
            cuentatwitter = $("#cuentatwitter").val();
            categoria = $("#hidden_categoria").val();
            if(cuentatwitter==""){
				alert("Debe ingresar una cuenta de usuario valida");	            
            }else{
	            $.get('<?php echo base_url();?>index.php/welcome/buscarpostulacion/' + cuentatwitter + '/' + categoria,
	                function(data){
	                    $("#mostrarcuenta").html(data);
	
	            });
            }
        });
        function enviar(){
            id = $("#hidden_user_id").val();
            nombre = $("#hidden_user_name").val();
            categoria = $("#hidden_categoria").val();
            alert(nombre);
            $.get('<?php echo base_url();?>index.php/welcome/procesar/' + id + '/' + nombre + '/' + categoria,
                function(data){
                    $("#mostrarcuenta").html(data);

            });
        }
        
        
        </script>
    </body>
</html>