<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>LA GUERRILLA</title>            
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
                                <div class="profile-data-title"></div>
                            </div>
                            
                        </div>                                                                        
                    </li>
                    <li class="xn-title">Menu</li>
                    <li class="xn-openable active">
                        <a href="<?php echo base_url();?>assets/atlant/#"><span class="fa fa-dashboard"></span> <span class="xn-text">Inicio</span></a>
                        <ul>
                            <li class="active"><a href="<?php echo base_url();?>assets/atlant/index.html"><span class="xn-text">Postulaciones</span></a></li>
                            <li><a href="<?php echo base_url();?>index.php/welcome/bandeja"><span class="xn-text">Bandeja de Entrada</span></a></li>
                        </ul>
                    </li>                    
                    
                    
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
                        <a href="<?php echo base_url();?>assets/atlant/#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH -->
                    <li class="xn-search">
                        <form role="form">
                            <input type="text" name="buscar" placeholder="buscar..."/>
                        </form>
                    </li>   
                    <!-- END SEARCH -->                    
                    <!-- POWER OFF -->
                    <li class="xn-icon-button pull-right last">
                        <a href="<?php echo base_url();?>assets/atlant/#"><span class="fa fa-power-off"></span></a>
                        <ul class="xn-drop-left animated zoomIn">
                            
                            <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span>Salir</a></li>
                        </ul>                        
                    </li> 
                    <!-- END POWER OFF -->                    
                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="<?php echo base_url();?>assets/atlant/#">Home</a></li>                    
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
                                    <div class="widget-int num-count"><?php echo $user_profile['statuses_count'];?></div>
                                    <div class="widget-title">Tweets</div>
                                    
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
                                    <div class="widget-int num-count"><?php echo $user_profile['followers_count'];?></div>
                                    <div class="widget-title">Seguidores</div>
                                    
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
                                    <div class="widget-int num-count"><?php echo $user_profile['friends_count'];?></div>
                                    <div class="widget-title">Seguidos</div>
                                    
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
                                    <div class="widget-int num-count"><?php echo $user_profile['favourites_count'];?></div>
                                    <div class="widget-title">Likes</div>
                                    
                                </div>
                                                           
                            </div>                            
                            <!-- END WIDGET REGISTRED -->
                            
                        </div>
                    </div>
                    <!-- END WIDGETS -->                    
                    
                    <div class="row">
                        <div class="col-md-8">
                            
                            <!-- START SALES BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Estadisticas</h3>
                                        <span>Numero de seguidores a nivel mundial</span>
                                    </div>                                     
                                                                       
                                    
                                </div>
                                <div class="panel-body">                                    
                                    <div class="row stacked">
                                        <div class="col-md-4">                                            
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong>Europa</strong></div>
                                                <div class="pull-right">33000</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">75%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong>Latinoamerica</strong></div>
                                                <div class="pull-right">450</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">90%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong class="text-danger">Norte America</strong></div>
                                                <div class="pull-right">25</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">5%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong class="text-warning">Otros</strong></div>
                                                <div class="pull-right">75</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-md-8">
                                            <div id="dashboard-map-seles" style="width: 100%; height: 200px"></div>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            <!-- END SALES BLOCK -->
                            
                        </div>
                        <div class="col-md-4">
                            
                            <!-- START PROJECTS BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Cuentas Twitter</h3>
                                        <span>Por re-twetts</span>
                                    </div>                                    
                                    
                                </div>
                                <div class="panel-body panel-body-table">
                                    
                                    <div class="table-responsive">
                                        <table class="table table-condensed table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th width="50%">Cuenta</th>
                                                    <th width="20%">Re-tweets</th>
                                                    <th width="30%">Tweets</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><strong>@OscarMendez</strong></td>
                                                    <td><span class="label label-danger">345666</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">85444</div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>@gimenesUrbina</strong></td>
                                                    <td><span class="label label-warning">838393</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">6464749</div>
                                                        </div>
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <td><strong>@Taurus</strong></td>
                                                    <td><span class="label label-warning">234242</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 72%;">234342</div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>@Leoin</strong></td>
                                                    <td><span class="label label-success">353535</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">234234</div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>@Virgo</strong></td>
                                                    <td><span class="label label-success">343434</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">343434</div>
                                                        </div>
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <td><strong>@AquariusVzla</strong></td>
                                                    <td><span class="label label-success">345345345</span></td>
                                                    <td>
                                                        <div class="progress progress-small progress-striped active">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">343454</div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                </div>
                            </div>
                            <!-- END PROJECTS BLOCK -->
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            
                            <!-- START SALES & EVENTS BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Cuentas Oficiales</h3>
                                        
                                    </div>
                                    
                                </div>
                                <div class="panel-body padding-0">
                                    <div class="chart-holder" id="dashboard-line-1" style="height: 200px;"></div>
                                </div>
                            </div>
                            <!-- END SALES & EVENTS BLOCK -->
                            
                        </div>
                        <div class="col-md-4">
                            
                            <!-- START USERS ACTIVITY BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Usuarios Activos en las redes</h3>
                                        
                                    </div>                                    
                                                                        
                                </div>                                
                                <div class="panel-body padding-0">
                                    <div class="chart-holder" id="dashboard-bar-1" style="height: 200px;"></div>
                                </div>                                    
                            </div>
                            <!-- END USERS ACTIVITY BLOCK -->
                            
                        </div>
                        <div class="col-md-4">
                            
                            <!-- START VISITORS BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Usuarios por cuentas</h3>
                                        
                                    </div>
                                    
                                </div>
                                <div class="panel-body padding-0">
                                    <div class="chart-holder" id="dashboard-donut-1" style="height: 200px;"></div>
                                </div>
                            </div>
                            <!-- END VISITORS BLOCK -->
                            
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
        <!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        
        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/plugins.js"></script>        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/actions.js"></script>
        
        <script type="text/javascript" src="<?php echo base_url();?>assets/atlant/js/demo_dashboard.js"></script>
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->
    
    
    
    <!-- /Yandex.Metrika counter -->    
    </body>
</html>






