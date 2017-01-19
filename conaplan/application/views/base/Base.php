<?php
if (isset($this->session->userdata['logged_in'])) {
    $username   = ($this->session->userdata['logged_in']['username']);
    $id         = ($this->session->userdata['logged_in']['id']);
    $first_name = ($this->session->userdata['logged_in']['first_name']);
    $last_name  = ($this->session->userdata['logged_in']['last_name']);
    $group_id   = ($this->session->userdata['logged_in']['group_id']);
} else {
    $header = base_url() . "?error=1";
    header("location: " . $header);
}
?>

<html>
    <title>Planificación y Presupuesto</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--SCRIPT CSS-->
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.theme.css'); ?>">   
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/select2.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/select2-bootstrap.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/dataTables.responsive.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/dataTables.bootstrap.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/fancybox/jquery.fancybox.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/apprise.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/style.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap-datepicker.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/tooltips.css'); ?>">
        
        <!--SCRIPT JS-->
        <script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/fancybox/jquery.fancybox.js'); ?>"></script> 
        <script src="<?php echo base_url('assets/js/bootbox.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/apprise.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/json_response.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/alphanumeric.js'); ?>"></script>
        <!--<script src="<?php echo base_url('assets/js/validaciones.js'); ?>"></script>-->
        <script src="<?php echo base_url('assets/js/script.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/select2.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/select2_locale_es.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/jquery.dataTables.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/jquery.jeditable.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/jquery.dataTables.editable.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/bootstrap.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/dataTables.responsive.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/bootstrap-datepicker.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/bootstrap-datepicker.es.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/dataTables.bootstrap.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/maskedinput.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/tooltips.js'); ?>"></script>
        <script>
            $(function() {
                $("li[title]").tooltips();
            });
        </script>
        <style>
            .fondo_trans {
                background-image: url("<?php echo base_url('assets/image/background.jpg'); ?>");
                background-repeat: no-repeat;
                background-size: 100% auto;
            }
        </style>
        <script src="<?php echo base_url('assets/js/footerfijo.js'); ?>"></script>
        <script>
            $(document).ready(function () {
                
                $("form").keypress(function(e) {
                    if (e.which == 13) {
                        return false;
                    }
                });
                
                $(".cierre_ano").click(function (e) {
                    e.preventDefault();  // Para evitar que se envíe por defecto

                    bootbox.dialog({
                        message: "<span style='color:red;'>Advertencia:</span> Cierre de Año Fiscal <?=date('Y',now())?>",
                        title: "Cerrar Año Fiscal <?=date('Y',now())?>",
                        buttons: {
                            success: {
                                label: "Descartar",
                                className: "btn-primary",
                                callback: function () {

                                }
                            },
                            danger: {
                                label: "Cerrar Año Fiscal <?=date('Y',now())?>",
                                className: "btn-warning",
                                callback: function () {
                                    //alert(id)
                                    $.post('<?php echo base_url(); ?>cierre/ControllersCierre/close_ano', function (response) {
                                        bootbox.alert("Se ha cerrado el Año Fiscal <?=date('Y',now())?>", function () {
                                        }).on('hidden.bs.modal', function (event) {
                                        });
                                    });
                                }
                            }
                        }
                    });
                });

                $('input.capturar_item').numeric({allow: "."});
                $('textarea.numeric').numeric({allow: "."});

                $("input,select,textarea").change(function () {
                    $('input,select,textarea').parent('div').removeClass('has-error');
                });

                $(".logout").click(function (e) {
                    e.preventDefault();  // Para evitar que se envíe por defecto

                    bootbox.dialog({
                        message: "¿Desea cerrar la sesión?",
                        title: "Cerrar sesión",
                        buttons: {
                            success: {
                                label: "Descartar",
                                className: "btn-primary",
                                callback: function () {

                                }
                            },
                            danger: {
                                label: "Cerrar",
                                className: "btn-warning",
                                callback: function () {
                                    //alert(id)
                                    $.post('<?php echo base_url(); ?>ControllersUser/close_session', function (response) {

                                        url = '<?php echo base_url(); ?>'
                                        window.location = url

                                    });
                                }
                            }
                        }
                    });
                });
            });
        </script>
        <style>
            .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
                background: linear-gradient(#64BCBC, #8CCECE);
            }
            .nav-tabs > li > a:hover {
                border-color: red #eeeeee #e7e7e7;
            }
            .tooltip, .arrow:after {
                background: #012923;
                border: 2px solid white;
            }

            .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
                background-color: #FFFFFF;
                opacity: 1;
            }

        </style>
    </head>

    <!-- MODULO DINAMICO -->
    <nav class="navbar navbar-default" style="background: linear-gradient(#2F9292, #3B7272);height:54.4px;">
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav" style="float:left; font-size: 16px">
                <li class="dropdown">
                    <a style='color:#FFFFFF;' href="#" style="font-weight: bold" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i></i>&nbsp; Configuración <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" style="font-size: 16px">
                        <li><a href="<?php echo base_url('modulo/ControllersModulo'); ?>">Módulos</a></li>
                        <li><a href="<?php echo base_url('sub_modulo/ControllersSubModulo'); ?>">Sub Módulos</a></li>
                    </ul>
                </li>
            </ul>
            <?php
            foreach ($lista_modulo as $value) {
                if ($value->desplegable == "t" AND $value->activo == "t") {
                    ?>
                    <ul class="nav navbar-nav" style="float:left; font-size: 16px">
                        <li id='id_inicio'>
                            <a style='color:#FFFFFF;' href='<?php echo base_url(); ?><?php echo $value->url ?>'><span class=""></span>&nbsp;&nbsp;<?php echo $value->modulo; ?></a>
                        </li>
                    </ul>
                    <?php
                }
            }
            ?>
            <?php
            foreach ($lista_modulo as $value) {
                if ($value->desplegable == "f") {
                    ?>
                    <ul class="nav navbar-nav" style="float:left; font-size: 16px">
                        <li class="dropdown">
                            <a style='color:#FFFFFF;' href="#" style="font-weight: bold" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i></i>&nbsp; <?php echo $value->modulo; ?> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" style="font-size: 16px">
                                <?php
                                foreach ($lista_sub_modulo as $value_s) {
                                    if ($value->id == $value_s->id_modulo AND $value_s->activo == "t") {
                                        ?>
                                        <li><a href='<?php echo base_url() ?><?php echo $value_s->url ?>'><i class=""></i>&nbsp;<?php echo $value_s->sub_modulo ?></button></a></li>
                                    <?php }
                                }
                                ?>
                            </ul>
                        </li>
                    </ul>
                    <?php
                }
            }
            ?>
            <ul class="nav navbar-nav navbar-right" style="font-size: 16px">
                <li><a style='color:#FFFFFF;' class="logout" href="" title="Cerrar sesión <?php echo $username; ?>" style="font-weight: bold"><span class='' style="color: white;"></span>&nbsp;&nbsp;&nbsp;<img class='borrar' id='<?php echo $value->id; ?>'  style="width:20px;height: 20px" src="<?php echo base_url("assets/image/login-128.png"); ?>"/> Cerrar sesión</a></li>
            </ul>

        </div>
    </nav>
    <!-- FIN DINAMICO -->

    <div style="float: right;margin: 15px">
        <span style="font-weight: bold;">Usuario:</span> <?php
        echo $first_name . " ";
        echo $last_name
        ?>
        <br/>
        <span style="font-weight: bold;">Grupo:</span> <?php echo $group_id ?>
        <br/>
        <span class='cierre_ano' style='font-weight: bold;cursor: pointer;' title='Cierre de Año Fiscal <?=date('Y',now())?>'>
            Cerrar año fiscal <?=date('Y',now())?>
        </span>

        <?php
        //$datestring = "01/02/2016";
        //$time       = "%h:%i %a";
        #echo date('Y',now())
        #echo $this->db->last_query();
        
        #echo $_SERVER['REMOTE_ADDR'];

        #echo mdate($datestring);
        #echo mdate($time);
        //$fecha = explode('/', $datestring);
        //echo $fecha[2]."-".$fecha[1]."-".$fecha[0];
        
        ?>

    </div>
    <!--    <div id="footer" style="text-align:center;margin-bottom: -18px; margin-left: 0px">
            <img style="width: 100%;" src="<?php echo base_url() ?>assets/image/footer.png"/>
        </div>-->
    <body>



