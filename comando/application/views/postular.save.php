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
        
    <script src="<?php echo base_url();?>assets/js/jquery.js" type="text/javascript" charset="utf-8" ></script>
    <script src="<?php echo base_url();?>assets/js/funciones.js" type="text/javascript" charset="utf-8" ></script>
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
  <div class="col-sm-12">
  <a href="<?php echo base_url();?>">
  <img src="http://localhost/twitter-login-ci3/assets/banner.png" width="1300px">
  </a>
  </div>
  </div>
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
    <li> <a data-toggle="tab" href="#"> Panel de Postulaciones <span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
      </ul>
  <div class="tab-content">
    <div id="profile-tab" class="tab-pane active">
      <div class="pd-20">
      <p>Al momento de postular debe tener el nombre correcto del usuario.</p>
		  <h1>Categoria a postular: <b><?php echo $categorias->nombre; ?><input type="hidden" id="hidden_categoria" value="<?php echo $categorias->id; ?>"></b></h1>
          <label>Cuenta twitter a postular:</label>
          <input type="text" id="cuentatwitter" name="cuentatwitter"><br><br>
          <a class="btn vd_btn btn-xs vd_bg-yellow" id="btnbuscar">Buscar</a>
          <br>
          <br>
          <div id="mostrarcuenta">
          </div> 
        </div>
        <div class="row">
        <div class="col-sm-12">
        <h1>Ultimos postulados para esta categoria:</h1>
        <?php
        foreach($listadoPostulados as $li){
        if($li->cantidad == '1'){
	        $cantidad = 'POSTUALADO '.$li->cantidad.' VEZ';
        }else{
	        $cantidad = 'POSTUALADO '.$li->cantidad.' VECES';
        }
        $visual='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title"> </div>
	                  <div class="panel-body">
	                    <div class="text-center vd_info-parent"> <img src="'.str_replace('_normal', '',$li->profile_image_url).'" width="200"> </div>
	                    <div class="row">
	                      <div class="col-xs-12"> <a class="btn vd_btn vd_bg-red btn-xs btn-block no-br">'.$li->name.'</a> </div>
	                    </div>
	                    <h2 class="font-semibold mgbt-xs-5">'.$li->screen_name.'</h2>
	                    <input type="hidden" id="hidden_user_id" value="'.$li->id.'">
	                    <input type="hidden" id="hidden_user_name" value="'.$li->screen_name.'">
	                    
	                    <input type="button" class="btn vd_btn vd_bg-grey btn-xs btn-block no-br" value="'.$cantidad.'">
	                    
	                  </div>
	                </div></div>';
	              echo $visual; 
	     }
        ?>
        </div>
        </div>
        
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
        
        
        
        
        
        
        
        