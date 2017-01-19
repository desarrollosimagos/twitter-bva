<!DOCTYPE html>
<html lang="en" class="body-full-height">
    <head>        
        <!-- META SECTION -->
        <title>Puesto de Comando Aragua</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="<?php echo base_url();?>assets/atlant/css/theme-default.css"/>
        <link rel="stylesheet" href="<?php echo base_url();?>assets/atlant/font/css/font-awesome.min.css">
        <!-- EOF CSS INCLUDE -->                                     
    </head>
    <body>
        
        <div class="lockscreen-container">
            
            <div class="lockscreen-box animated fadeInDown">
                
                <div class="lsb-access">
                    <div class="lsb-box">
                        <div class="fa fa-lock"></div>
                        <div class="user animated fadeIn">
                            <img src="<?php echo base_url();?>assets/comando.png" alt="Pusto de Comando Aragua"/>
                            
                        </div>
                    </div>
                </div>
                
                <div class="lsb-form animated fadeInDown">
                    <form action="<?php echo site_url('welcome/redirect');?>" method="post" class="form-horizontal">
                        <div class="form-group sign-in animated fadeInDown">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="fa fa-user"></span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Your login"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="fa fa-lock"></span>
                                    </div>
                                    <input type="submit" class="form-control" value="Iniciar Sesion con Twitter"/>
                                </div>
                            </div>
                        </div>
                        
                    </form>
                </div>
                
            </div>
            
        </div>
    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START TEMPLATE -->                
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/actions.js"></script>
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->
    
    
    <!-- /Yandex.Metrika counter -->    
    </body>
</html>                               