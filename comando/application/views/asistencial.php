<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>PUESTO DE COMANDO ARAGUA</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="<?php echo base_url();?>assets/atlant/favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="<?php echo base_url();?>assets/atlant/css/theme-default.css"/>
        <link rel="stylesheet" href="<?php echo base_url();?>assets/atlant/font/css/font-awesome.min.css">
        <!-- EOF CSS INCLUDE -->                   
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="<?php echo base_url();?>assets/atlant/index.html">PUESTO DE COMANDO ARAGUA</a>
                        <a href="<?php echo base_url();?>assets/atlant/#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="<?php echo base_url();?>assets/atlant/#" class="profile-mini">
                            <img src="<?php echo base_url();?>assets/comando.png" alt="John Doe"/>
                        </a>
                        <div class="profile">
                            <div class="profile-image">
                                <img src="<?php echo base_url();?>assets/comando.png" alt="John Doe"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name">PUESTO DE COMANDO ARAGUA</div>
                                <div class="profile-data-title">----</div>
                            </div>
                            <div class="profile-controls">
                                <a href="#" class="profile-control-left"><span class="fa fa-info"></span></a>
                                <a href="#" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                            </div>
                        </div>                                                                        
                    </li>
                    <li class="xn-title">Menu</li>
                    <li class="xn-openable">
                        <a href="<?php echo base_url();?>index.php/welcome/bandeja"><span class="xn-text">En espera</span></a>
                        <ul>
                        	<li><a href="<?php echo base_url();?>index.php/welcome/bandeja"><span class="xn-text">Bandeja de Entrada</span></a></li>
                        </ul>
                    </li>
                    <?php if((int)$menu_asistencial > 0 ){ ?>
                    <li class="xn-openable">
                        <a href="<?php echo base_url();?>index.php/welcome/bandeja"><span class="xn-text">Asistencial</span></a>
                        <ul>
                            <li><a href="<?php echo base_url();?>index.php/welcome/asistencial"><span class="xn-text">Bandeja de Entrada</span></a></li>
                            <?php if((int)$menu_individual > 0 ){ ?>
                            <li><a href="<?php echo base_url();?>index.php/welcome/individual"><span class="xn-text">Individual</span></a></li>
                            <?php } ?>
                            <?php if((int)$menu_colectivo > 0 ){ ?>
                            <li><a href="<?php echo base_url();?>index.php/welcome/colectivo"><span class="xn-text">Colectivo</span></a></li>
                            <?php } ?>
                        </ul>
                    </li> 
                    <?php } ?> 
                    <?php if((int)$menu_politico > 0 ){ ?>
                    <li class="xn-openable">
                        <a href="<?php echo base_url();?>index.php/welcome/bandeja"><span class="xn-text">Politico</span></a>
                        <ul>
                        	<li><a href="<?php echo base_url();?>index.php/welcome/politico"><span class="xn-text">Bandeja de Entrada</span></a></li> 
                        </ul>
                    </li>
                    <?php } ?>
                    <?php if((int)$menu_permisos > 0 ){ ?>
                    <li class="xn-openable">
                        <a href="<?php echo base_url();?>index.php/welcome/usuarioslista"><span class="xn-text">Usuarios y Permisos</span></a>
                        <ul>
                        	<li><a href="<?php echo base_url();?>index.php/welcome/usuarioslista"><span class="xn-text">Usuarios</span></a></li> 
                        	
                        </ul>
                    </li>            
                    <?php } ?>                     
                    
                    
                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->
            
            <!-- PAGE CONTENT -->
            <div class="page-content">
                
                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH -->
                    <li class="xn-search">
                        <form role="form" action="<?php echo base_url();?>index.php/welcome/buscadores" method="post">
                            <input type="text" name="buscar" placeholder="buscar..."/>
                        </form>
                    </li>   
                    <!-- END SEARCH -->                    
                    <!-- POWER OFF -->
                    <li class="xn-icon-button pull-right last">
                        <a href=""><span class="fa fa-power-off"></span></a>
                        <ul class="xn-drop-left animated zoomIn">
                            
                            <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span>Salir</a></li>
                        </ul>                        
                    </li> 
                    <!-- END POWER OFF -->                    
                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="<?php echo base_url();?>">INICIO</a></li>                    
                    <li class="active">Dashboard</li>
                </ul>
                <!-- END BREADCRUMB -->                       
                
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                    
                    <!-- START WIDGETS -->                    
                    <div class="row">
                        <div class="col-md-3">
                            
                            <!-- START WIDGET MESSAGES -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-envelope"></span>
                                </div>                             
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="casos"><?php echo $casos;?></div>
                                    <div class="widget-title">En espera.</div>
                                    
                                </div>      
                                
                            </div>                            
                            <!-- END WIDGET MESSAGES -->
                            
                        </div>
                        <div class="col-md-3">
                            
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-user"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="asignados"><?php echo $asignados;?></div>
                                    <div class="widget-title">Politico</div>
                                    
                                </div>
                                                            
                            </div>                            
                            <!-- END WIDGET REGISTRED -->
                            
                        </div>
                        <div class="col-md-3">
                            
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-user"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="individual"><?php echo $individual;?></div>
                                    <div class="widget-title">Individual</div>
                                    
                                </div>
                                                           
                            </div>                            
                            <!-- END WIDGET REGISTRED -->
                            
                        </div>
                        <div class="col-md-3">
                            
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-user"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="colectivo"><?php echo $colectivo;?></div>
                                    <div class="widget-title">Colectivo</div>
                                    
                                </div>
                                                           
                            </div>                            
                            <!-- END WIDGET REGISTRED -->
                            
                        </div>
                    </div>
                    <!-- END WIDGETS -->                     
                    
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table" id="tabla_solicitud">
                                <thead>
                                    <tr>
                                        <th># Solicitud</th>
                                        <th>Cuenta</th>
                                        <th>Mensaje</th>
                                        <th>Fecha</th>
                                        <th>Identificar</th>
                                        <th>Asignar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<?php
                                	$ci = &get_instance();
                                	$ci->load->model('Usuario');
                                	foreach ($bandeja as $listado) {
                                	?>
                                    <tr id="<?php echo $listado->id; ?>">
                                        <td><?php echo $listado->id; ?></td>
                                        <td><?php echo "<a href='vercuenta/".$listado->solicitante."'>".$listado->solicitante."</a>"; 
                                        echo ' <span class="contador_'.$listado->solicitante.'">('.$ci->Usuario->ContadordeTwitter($listado->solicitante).')<span>';
                                        ?>
                                        </td>
                                        <td><?php echo $listado->contenido; ?></td>
                                        <td><?php 
                                        
										echo  date("Y-m-d H:i:s", strtotime($listado->fecha));
                                         ?></td>
                                        <td>
                                        <?php
                                        //if(empty($listado->cedula)){
                                        	?>
	                                        <a href="#" class="mb-control2" data-box="#mb-identificar" onclick="identificar('<?php echo $listado->solicitante; ?>',this); return false;">
												<span class="fa fa-sign-out"></span>Identificar</a>
                                        	<?php
                                        //}else{
	                                        ?>
	                                        <!--<a href="#" class="mb-control2" data-box="#mb-ver-datos" onclick="mostrarident('<?php echo $listado->cedula; ?>',this); return false;">
												<span class="fa fa-sign-out"></span>Ver datos</a>-->
                                        	<?php
                                        //}
                                        
                                        ?>
                                        </td>
                                        <td>
                                        <a href="#" class="mb-control2" data-box="#mb-asignar" onclick="asignarParametros('<?php echo $listado->id; ?>',this); return false;">
                                        <span class="fa fa-sign-out"></span>Asignar</a>
                                        </td>
                                        
                                    </tr>
                                    <?php
                                	}
                                	?>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                    
                    
                    <!-- START DASHBOARD CHART -->
                    <div class="block-full-width">
                        <div id="dashboard-chart" style="height: 250px; width: 100%; float: left;"></div>
                        <div class="chart-legend">
                            <div id="dashboard-legend"></div>
                        </div>                                                
                    </div>                    
                    <!-- END DASHBOARD CHART -->
                    
                </div>
                <!-- END PAGE CONTENT WRAPPER -->                                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Cerrar <strong>Sesion</strong> ?</div>
                    <div class="mb-content">
                        <p>Esta seguro de cerrar su sesion de usuario.</p>                    
                        <p>Haga click en no si no esta seguro.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="<?php echo base_url();?>index.php/welcome/logout" class="btn btn-success btn-lg">Si</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->
        
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" id="mb-asignar">
        
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span>Solicitud #<span id="solicitud"></span></div>
                    <div class="mb-content">
                        <p>
                        <input type="hidden" id="id_sol" name="id_sol" value="">
                        <input type="radio" class="iradio" id="tipo" name="tipo" value="individual"> Individual 
                        <input type="radio" id="tipo" class="iradio" name="tipo" value="colectivo"> Colectivo </p>                    
                        <p>Observaciones</p>
                        <p><input type="text" name="observaciones" id="observaciones" class="form-control"></p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a onclick="enviar();" class="btn btn-default btn-lg mb-control-close">Asignar</a>
                            <button class="btn btn-default btn-lg mb-control-close">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        <!-- END MESSAGE BOX-->
        
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" id="mb-identificar">
        
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span>Solicitante @<span id="usuario"></span></div>
                    <div class="mb-content">
                        <p>                    
                        <p>Documento de Identidad</p>
                        <p><input type="hidden" name="name" id="name" class="form-control">
                        <input type="text" name="cedula" id="cedula" class="form-control"></p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a onclick="buscar(this);" class="btn btn-default btn-lg mb-control-close" data-box="#mb-buscando">Buscar</a>
                            <button class="btn btn-default btn-lg mb-control-close">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        <!-- END MESSAGE BOX-->
        
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" id="mb-buscando">
        
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span><span id="titulo_result">Buscando en la base de datos...</span></div>
                    <div class="mb-content">
                        <p id="loading1"> 
                        <img src="<?php echo base_url();?>assets/loading.gif">                   
                        </p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a id="enlace4" class="btn btn-default btn-lg mb-control-close" onclick='asociarcuenta();'>Asociar persona a cuenta Twitter</a>
                            <button class="btn btn-default btn-lg mb-control-close">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        <!-- END MESSAGE BOX-->
        
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" id="mb-ver-datos">
        
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span><span id="titulo_result">Datos Personales</span></div>
                    <div class="mb-content">
                        <p id="loading2"> 
                                          
                        </p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a id="enlace3" class="btn btn-default btn-lg">Asociar persona a cuenta Twitter</a>
                            <a id="enlace2" class="btn btn-default btn-lg">Completar Datos de Contactos</a>
                            <button class="btn btn-default btn-lg mb-control-close">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        <!-- END MESSAGE BOX-->
                
        
    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='<?php echo base_url();?>assets/atlant/js/plugins/icheck/icheck.min.js'></script>        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/scrolltotop/scrolltopcontrol.js"></script>
        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/morris/raphael-min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/morris/morris.min.js"></script>       
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/rickshaw/d3.v3.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/rickshaw/rickshaw.min.js"></script>
        <script type='text/javascript' src='<?php echo base_url();?>assets/atlant/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
        <script type='text/javascript' src='<?php echo base_url();?>assets/atlant/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>                
        <script type='text/javascript' src='<?php echo base_url();?>assets/atlant/js/plugins/bootstrap/bootstrap-datepicker.js'></script>                
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/owl/owl.carousel.min.js"></script>                 
        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/moment.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/daterangepicker/daterangepicker.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/datatables/jquery.dataTables.min.js"></script>
        
         
        <!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        
        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins.js"></script>        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/actions.js"></script>
        

        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->
    <script>
    	$(document).ready(function() {
    	    setInterval(actualizar_bandejas, 50000);

    	
		    $('#tabla_solicitud').DataTable({
			    "columns": [
				    { "width": "10%" },
				    { "width": "10%" },
				    { "width": "40%" },
				    { "width": "10%" },
				    { "width": "10%" },
				    { "width": "10%" }
				  ]
		    });
		} );
    	function asignarParametros(id,en){
    		//alert('aqui');
    		var box = $($(en).data("box"));
    		
	    	$('#solicitud').text(id);
	    	$('#id_sol').val(id);
	    	//$('#'+id).attr('class', 'selected');
	    	box.toggleClass("open");

    	}
    	
    	function identificar(usuario,en){
    		//alert('aqui');
    		var box = $($(en).data("box"));
    		
	    	$('#usuario').text(usuario);
	    	//$('#'+id).attr('class', 'selected');
	    	box.toggleClass("open");

    	}
    	
    	function buscar(en){
	    	var box = $($(en).data("box"));
	    	box.toggleClass("open");
	    	cedula = $("#cedula").val();
			$.get('http://consultaelectoral.bva.org.ve/cedula='+cedula, function(data,textStatus) {
				texto = "<p><b>Apellidos: </b>" + data[0].p_apellido + "," + data[0].s_apellido +"</p>" +
				"<p><b>Nombres: </b>" + data[0].p_nombre + "," + data[0].s_nombre +"</p>" +
				"<p><b>Sexo: </b>" + data[0].sexo + "</p>" +
				"<p><b>Estado: </b>" + data[0].nom_estado + "</p>" +
				"<p><b>Municipio: </b>" + data[0].nom_mun + "</p>" +
				"<p><b>Parroquia: </b>" + data[0].nom_parroquia + "</p>" +
				"<p><b>Centro de Votacion: </b>" + data[0].c_votacion + "</p>" +
				"<p><b>Direccion del Centro de Votacion: </b>" + data[0].c_direccion + "</p>";
				$('#titulo_result').text("Resultado encontrado:");
            	$('#loading1').html(texto);
            	$("#enlace").attr("href", "<?php echo base_url();?>index.php/welcome/contactar/"+cedula);
            	
            	usuario = $('#usuario').text();
            	//alert(usuario);
            	
            	
                },'json').fail(function (jqXHR, textStatus) {
				$('#titulo_result').text("Resultado encontrado:");
				$('#loading1').html("No se encontraron coincidencias.");
            });	
    	}
    	
    	function asociarcuenta(){
    	//alert(cedula);
    	cedula = $("#cedula").val();
    	usuario = $('#usuario').text();
    	$('.contador_'+usuario).html('<img src="<?php echo base_url();?>assets/27.gif">'); 
    	$.post( "<?php echo base_url();?>index.php/welcome/asignardatos", { usuario: usuario, cedula:cedula },function( data ) {
            		//alert('aca');
				  	$('#casos').text(data.casos);
				    $('#asignados').text(data.asignados);
				    $('#individual').text(data.individual);
				    $('#colectivo').text(data.colectivo);
				    $('.contador_'+usuario).text(' ('+data.contador+')');
				},'json');
	    $("#cedula").val('');
    	$('#usuario').text('');
    	}
    	
    	
    	function mostrarident(cedula,en){
    	//alert(cedula);
    	var box = $($(en).data("box"));
	    	
	    	//cedula = cedula;
			$.get('http://consultaelectoral.bva.org.ve/cedula='+cedula, function(data,textStatus) {
				
				texto = "<p><b>Apellidos: </b>" + data[0].p_apellido + "," + data[0].s_apellido +"</p>" +
				"<p><b>Nombres: </b>" + data[0].p_nombre + "," + data[0].s_nombre +"</p>" +
				"<p><b>Sexo: </b>" + data[0].sexo + "</p>" +
				"<p><b>Estado: </b>" + data[0].nom_estado + "</p>" +
				"<p><b>Municipio: </b>" + data[0].nom_mun + "</p>" +
				"<p><b>Parroquia: </b>" + data[0].nom_parroquia + "</p>" +
				"<p><b>Centro de Votacion: </b>" + data[0].c_votacion + "</p>" +
				"<p><b>Direccion del Centro de Votacion: </b>" + data[0].c_direccion + "</p>";
				
            	$('#loading2').html(texto);
            	$('#enlace2').text('Editar Datos de Contacto');
            	$("#enlace2").attr("href", "<?php echo base_url();?>index.php/welcome/contactar/"+cedula);
            	
            	usuario = $('#usuario').text();
            	box.toggleClass("open");
            	//alert(usuario);
                },'json').fail(function (jqXHR, textStatus) {
                //alert('0');
				$('#titulo_result').text("Resultado encontrado:");
				$('#loading2').html("Problemas de Conectividad");
				box.toggleClass("open");
            });	
    	}
    	
    	function enviar(){
    		id = $('#id_sol').val();
    		tipo = $("#tipo:checked").val();
    		
    		//alert(tipo);
    		observacion = $('#observaciones').val();
    		  
			  $.post( "<?php echo base_url();?>index.php/welcome/asignarnivel2", { id: id, tipo: tipo,observacion:observacion },function( data ) {
				  $('#casos').text(data.casos);
			    $('#asignados').text(data.asignados);
			    $('#individual').text(data.individual);
			    $('#colectivo').text(data.colectivo);
				},'json');
    		
    		var table = $('#tabla_solicitud').DataTable();
	    	var rows = table
		    .rows( '#'+id)
		    .remove()
		    .draw();
		    
		    $('#id_sol').val('');
    		$('#observaciones').val('');
	    	
    	}
    	
    	function actualizar_bandejas(){
    	     $('#casos').html('<img src="<?php echo base_url();?>assets/27.gif">'); 
			    $('#asignados').html('<img src="<?php echo base_url();?>assets/27.gif">'); 
			    $('#individual').html('<img src="<?php echo base_url();?>assets/27.gif">'); 
			    $('#colectivo').html('<img src="<?php echo base_url();?>assets/27.gif">'); 
			    
    	   $.post( "<?php echo base_url();?>index.php/welcome/actualizarBandejas", { id: ''},function( data ) {
				  $('#casos').text(data.casos);
			    $('#asignados').text(data.asignados);
			    $('#individual').text(data.individual);
			    $('#colectivo').text(data.colectivo);
				},'json'); 
    	}
    	
    </script>
    
    
    
    <!-- /Yandex.Metrika counter -->    
    </body>
</html>






