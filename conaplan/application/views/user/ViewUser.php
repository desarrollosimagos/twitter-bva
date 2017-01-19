<?php
if (isset($_REQUEST['error']) == "1") {

    $warning = '<div class="alert alert-dismissible alert-danger" style="width:300px;color:#3B542F;margin: auto">';
    $warning .= 'Disculpe, debe iniciar sesión';
    $warning .= '</div>';
} else {
    $warning = "";
}
?>
<style>
    body {
        background-image: url("<?php echo base_url('assets/image/background.jpg'); ?>");
        background-repeat: no-repeat;
        background-size: 100% auto;
    }
</style>

<!DOCTYPE html>
<html>
    <title>Planificación y Presupuesto</title>
    <head>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
        <script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/bootbox.js'); ?>"></script>
        <script src="<?php echo base_url('assets/js/bootstrap.min.js'); ?>"></script>
        <script>
            $(document).ready(function () {

                $("#iniciar").click(function (e) {

                    e.preventDefault();  // Para evitar que se envíe por defecto

                    if ($('#username').val().trim() == '') {

                        bootbox.alert("Ingrese el usuario", function () {
                        }).on('hidden.bs.modal', function (event) {
                            $("#username").parent('div').addClass('has-error');
                            $("#username").focus();
                        });

                    } else if ($('#password').val().trim() == '') {
                        bootbox.alert("Ingrese la contraseña", function () {
                        }).on('hidden.bs.modal', function (event) {
                            $("#password").parent('div').addClass('has-error');
                            $("#password").focus();
                        });
                    } else {

                        $.post('<?php echo base_url(); ?>ControllersUser/iniciar', $('#form_login').serialize(), function (response) {

                            if (response == 1) {
                                url = '<?php echo base_url(); ?>ControllersUser/home'
                                window.location = url

                            } else if (response == 2) {
                                bootbox.alert("Usuario inactivo", function () {
                                }).on('hidden.bs.modal', function (event) {

                                });
                            } else {
                                bootbox.alert("Usuario y Contraseña Invalidos", function () {
                                }).on('hidden.bs.modal', function (event) {

                                });
                            }
                        });
                    }
                });
            });

        </script>
        <style type="text/css">
            .row {
                background-color: #fff;
                padding: 20px;
                margin: 0 -20px; 
                -webkit-border-radius: 10px 10px 10px 10px;
                -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
            }
        </style>
    </head>
    <body>
        <div class="panel panel-default" style='width:45%;margin:auto;margin-top:13%;'>
            <div class='row' style="height:348px;">
                <div class="panel-heading row" style='font-size: 20px;font-weight:bold;text-align:center;color:#FFFFFF;background: linear-gradient(#2F9292, #3B7272);width:100%;margin:auto;'>Iniciar sesión
                </div>
                <form id="form_login" action="" method="POST">
                    <div class="panel-body" style="height:80px">
                        <div class="col-xs-4">
                            <img src='<?php echo base_url() ?>assets/image/Home.png' style='width:110%;height:180px;'>
                        </div>
                        <div class="col-xs-8">
                            <div class="col-xs-8" style="margin-top:5%;">
                                <input autofocus="autofocus" id='username' name='username' style="width: 168%;" placeholder='Ingrese su Usuario' title="Ingrese su Usuario" type="text" class="form-control" />
                            </div>
                            <div class="col-xs-2 col-md-offset-2" style="margin-top:5.5%;">
                                <img src='<?php echo base_url() ?>assets/image/user.png' style='width:32px;height:32px;'>
                            </div>

                            <div class="col-xs-8" style="margin-top:15%;">
                                <input type='password' id='password' name='password' style="width: 168%;" placeholder='Ingrese su Contraseña' title="Ingrese su Contraseña" class="form-control" />
                            </div>
                            <div class="col-xs-2 col-md-offset-2" style="margin-top:16%;">
                                <img src='<?php echo base_url() ?>assets/image/candado.png' style='width:32px;height:32px;'>
                            </div>

                        </div>
                    </div>
                </form>
                <div class="panel-body" style="height:80px">
                    <input id='iniciar' type='submit' value='Ingresar al Sistema' class="btn btn-primary btn-lg btn-block" />
                </div>
            </div>
        </div>
    </body>
</html>
