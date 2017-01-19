<?php echo validation_errors(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("select").select2();
        $('#cedula').numeric(); //Valida solo valores tipo texto
        $('#first_name,#last_name').alpha({allow: " "}); //Valida solo valores tipo texto

        $("#cedula").change(function (event) {
            var cedula = $('#cedula').val();
            //var hosting = $('#id_hosting').val(); // Captura del hosting (dominio)
            var hosting = "www.consultaelectoral.org.ve/cedula="
            if (hosting) {
                $.get("http://" + hosting + cedula, function (data) {
                    var option = "";
                    $.each(data, function (i) {
                        $("#first_name").val(data[i].p_nombre + " " + data[i].s_nombre)
                        $("#last_name").val(data[i].p_apellido + " " + data[i].s_apellido)
                    });
                    // Proceso para validar con la clase error 404 Not Found
                }, 'json');
            }
        });

        // Validamos los campos del formulario
        $("#registrar").click(function (e) {
            e.preventDefault();  // Para evitar que se envíe por defecto
            var is_superuser = $("#is_superuser").is(':checked');
            var is_staff = $("#is_staff").is(':checked');

            if ($('#cedula').val().trim() == '' || $('#cedula').val().trim() == 0) {

                bootbox.alert("Rellene el campo de cédula", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#cedula").parent('div').addClass('has-error')
                    $('#cedula').val('')
                    $("#cedula").focus();
                });

            } else if ($('#cedula').val().length < 6) {


                bootbox.alert("La cédula está incompleta", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#cedula").parent('div').addClass('has-error')
                    $('#cedula').val('')
                    $("#cedula").focus();
                });

            } else if ($('#first_name').val().trim() == '') {

                bootbox.alert("Rellene el campo de nombres", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#first_name").parent('div').addClass('has-error')
                    $('#first_name').val('')
                    $("#first_name").focus();
                });

            } else if ($('#last_name').val().trim() == '') {

                bootbox.alert("Rellene el campo de apellidos", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#last_name").parent('div').addClass('has-error')
                    $('#last_name').val('')
                    $("#last_name").focus();
                });

            } else if ($('#username_id').val().trim() == '') {

                bootbox.alert("Rellene el campo de usuario", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#username_id").parent('div').addClass('has-error')
                    $('#username_id').val('')
                    $("#username_id").focus();
                });

            } else if ($('#password').val() == '') {

                bootbox.alert("El campo contraseña no puede estar en blanco", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#password").parent('div').addClass('has-error')
                    $('#password').val('')
                    $("#password").focus();
                });

            } else if (($('#is_superuser,#is_staff').is(':checked')!=true)) {
                bootbox.alert("Indique si es Administrador o Usuario", function() {
                        $('.nav-tabs a[href=#tabs_B]').tab('show');
                });
        } else if ($('#group_id').val() == '') {

                bootbox.alert("Debe seleccionar un grupo", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#group_id").parent('div').addClass('has-error')
                    $("#group_id").select2('open');
                });

            } else if (($('#agregar,#modificar,#eliminar,#ver,#reporte').is(':checked')!=true)) {

                bootbox.alert("Debe seleccionar los permiso de acceso", function () {
                }).on('hidden.bs.modal', function (event) {
                    
                });

            } else {

                $.post("<?php echo base_url(); ?>ControllersUser/guardar", $('#form_usuario_user').serialize(), function (response) {
                    
                    if (response == 'existe') {

                        bootbox.alert("Disculpe, ya existe el usuario "+$("#username_id").val()+", verifique los datos ", function () {
                        }).on('hidden.bs.modal', function (event) {
                            $("#username_id").parent('div').addClass('has-error');
                            $("#username_id").focus();
                        });

                    } else {
                        $("#group_id").prop('disabled',false);
                        //return true;
                        bootbox.alert("Se registro con exito", function () {
                        }).on('hidden.bs.modal', function (event) {
                            url = '<?php echo base_url(); ?>ControllersUser/listar'
                            window.location = url
                        });
                    }
                    
                });
            }
        });

    // validacion para checkear solo un checkbox con jquery
    $('#is_superuser,#is_staff').click(function() {
        is_superuser = $("#is_superuser").is(':checked');
        is_staff = $("#is_staff").is(':checked');
        
        if (is_superuser == true) {
            $("#is_staff").prop('disabled',true);
            $("#group_id").select2('val',1);
            
        }else{
            $("#is_staff").prop('disabled',false);
            $("#group_id").select2('val','');
        }
        if(is_staff == true) {
            $("#is_superuser").prop('disabled',true);
            //$("#group_id").prop('disabled',false);
            
        }else{
            $("#is_superuser").prop('disabled',false);
            //$("#group_id").prop('disabled',true);
        }
    });

    });
</script>
<br/>
<br/>
<br/>
<br/>
<body> 
    <form method="post" action="" id="form_usuario_user" class="form-horizontal">
        <div style="width: 95%;text-transform:uppercase;box-shadow: 0 1px 5px rgba(0,0,0,.85);margin: auto" class="panel panel-default">
            <div class="panel-heading" style='background: linear-gradient(#2F9292, #3B7272);color:#FFFFFF;' >
            <label style="float: left" class="panel-title " ><a  href="<?php echo base_url();?>ControllersUser/listar" >Gestión de Usuarios</a>
                > Registrar Usuarios</label>
            <br>
        </div>
        <fieldset><legend class="titulo text-center">Datos del Usuario</legend></fieldset>
            
            <div class="panel-body">
                <div class="form-inline">
                    <div class="form-group col-xs-6">
                        <label>Cédula&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input class="form-control" type='text' style="width:80%" placeholder="Ejemplo: 12345678" id="cedula" maxlength="8" name="cedula" autofocus='true'/>
                    </div>
                    <div class="form-group col-xs-6">
                        <label>&nbsp;&nbsp;Nombres&nbsp;</label>
                        <input class="form-control" style="width:83%" type='text' placeholder="Nombres" id="first_name" name="first_name"/>                           
                    </div>
                </div>
                <br/><br/><br/>
                <div class="form-inline">
                    <div class="form-group col-xs-6">
                        <label>Apellidos&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input class="form-control" style="width:80%" type='text' placeholder="Apellidos" id="last_name" name="last_name"/>
                    </div>
                    <div class="form-group col-xs-6">
                        <label>&nbsp;&nbsp;Usuario&nbsp;&nbsp;&nbsp;</label>
                        <input class="form-control" style="width:83%" type='text' placeholder="Usuario" id="username_id" name="username"/>
                    </div>
                </div>
                <br/><br/><br/>
                <div class="form-inline">
                    <div class="form-group col-xs-6">
                        <label>Contraseña</label>
                        <input class="form-control" style="width:80%" type='password' placeholder="Contraseña" id="password" name="password"/>
                    </div>

                </div>
                <div class="form-inline">
                    <div class="form-group col-xs-2" id='' style=''>
                        <label>&nbsp;&nbsp;Estátus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="is_active" name="is_active" checked="checked" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-2" id='' >
                        <label>Administrador&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="is_superuser" name="is_superuser" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-2" id='' style='margin-left:6%'>
                        <label>Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="is_staff" name="is_staff" style='cursor:pointer;'/>
                    </div>
                </div>
                <br/><br/><br/>
                

                <div class="form-group col-xs-12" id='div_grupo' style='display: block'>
                    <label>&nbsp;&nbsp;Grupo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <select id='group_id' name='group_id' style='width:88%;' class="form-control input-sm"/>
                    <option value=''>----------------</option>
                    <?php
                    foreach ($list_group as $value) {
                        ?>
                        <option value="<?php echo $value->id; ?>"><?php echo $value->name; ?></option>
                        <?php
                    }
                    ?>
                    </select>
                </div>

                <div class="form-inline">
                    <br>
                    <br>
                    <br>
                    
                    <fieldset>
                        <legend>Permiso de acceso</legend>
                    </fieldset>
                    <div class="form-group col-xs-2" id='' style=''>
                        <label>&nbsp;&nbsp;Agregar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="agregar" name="agregar" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-2" id='' >
                        <label>Modificar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="modificar" name="modificar" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-2" id=''>
                        <label>Eliminar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="eliminar" name="eliminar" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-2" id=''>
                        <label>Ver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="ver" name="ver" style='cursor:pointer;'/>
                    </div>
                    <div class="form-group col-xs-3" id=''>
                        <label>Generar reporte&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input type="checkbox" id="reporte" name="reporte" style='cursor:pointer;'/>
                    </div>
                </div>
                
                <br/><br/><br/>
                <div class='div_button'>
                    <div class="form-group col-xs-12 text-center">
                        <a href="<?php echo base_url('ControllersUser/listar'); ?>">
                        <button type="button" id="volver" style="font-weight: bold;font-size: 13px" class="btn btn-warning " >
                            &nbsp;<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;Volver
                        </button>
                        </a>
                        <button type="button" id="registrar" style="font-weight: bold;font-size: 13px" class="btn btn-danger"/>
                        &nbsp;<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;Guardar cambios
                        </button>
                        <button type="reset" id="limpiar" style="font-weight: bold;font-size: 13px; background: -moz-linear-gradient(#f4eb2f, #e5a32d); color: white " class="btn"/>
                        &nbsp;<span class="glyphicon glyphicon-retweet"></span>&nbsp;&nbsp;Limpiar
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <br/>
        <br/>
        <br/>
    </div>
</form>
