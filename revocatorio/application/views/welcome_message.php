<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>CONSULTA NACIONAL</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="http://puestocomandoaragua.bva.org.ve/comando/assets/atlant/favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="http://puestocomandoaragua.bva.org.ve/comando/assets/atlant/css/theme-default.css"/>
        <link rel="stylesheet" href="http://puestocomandoaragua.bva.org.ve/comando/assets/atlant/font/css/font-awesome.min.css">
        <!-- EOF CSS INCLUDE -->                   
    </head>
<body>
<div class="container">
	<div class="row">
                        <div class="col-md-12">
                            
                            <!-- START WIDGET MESSAGES -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    
                                </div>                             
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="casos">
	                                    <?php echo $si; ?>
                                    </div>
                                    <div class="widget-title">Firmantes</div>
                                    
                                </div>      
                                
                            </div>                            
                            <!-- END WIDGET MESSAGES -->
                            
                        </div>
                        <div class="col-md-12">
                            
                            <!-- START WIDGET REGISTRED -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count" id="asignados">
	                                    <?php echo $no; ?>
                                    </div>
                                    <div class="widget-title">No Firmantes</div>
                                    
                                </div>
                                                            
                            </div>                            
                        </div>
	</div>
	<div class="row">
		<div class="col-md-12">
		<h1>Consultar Cedula</h1>
		<form method="post" action="<?php echo site_url('welcome/ver');?>">
		  
		    <div class="form-group">
		      <label for="TextInput">Cedula de Identidad</label>
		      <input type="text" id="TextInput" name="cedula" class="form-control" placeholder="Cedula de Identidad">
		    </div>
		    <button type="submit" class="btn btn-primary">Submit</button>
		  
		</form>
		</div>
		<?php
		if(!empty($resultado->cedula)){
			?>
			<div class="col-md-12">
			<b>Resultado</b><br>
			<b>Cedula: </b><?php echo $resultado->cedula; ?><br>
			<b>Nombre: </b><?php echo $resultado->p_nombre; ?><br>
			<b>Apellido: </b><?php echo $resultado->p_apellido; ?><br>
			</div>
			<?php
			if(!empty($resultado2->cedula)){
			?>
			<div class="col-md-12">
			<b>Esta en el PSUV</b>
			</div>
			<?php
			}
			
		}else{
			?>
			<div class="col-md-12">
			<b>No hay datos</b>
			</div>
			<?php
		}
		?>
		
	</div> 
	
</div>
</body>
</html>
