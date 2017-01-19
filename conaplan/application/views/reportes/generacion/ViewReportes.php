<?php
if (isset($this->session->userdata['logged_in'])) {
    $username = ($this->session->userdata['logged_in']['username']);
    $id       = ($this->session->userdata['logged_in']['id']);
} else {
    $header = base_url();
    header("location: " . $header);
}
?>
<script>
    $(document).ready(function () {

        $("select").select2();

        $("#ano_fiscal").click(function () {
            var ano_fiscal = $("#ano_fiscal").val();
            $('#accion_centralizada').find('option:gt(0)').remove().end().select2('val', "");
            $.post('<?php echo base_url(); ?>reportes/generacion/ControllersReportes/search_datos/' + ano_fiscal + '/1', function (response) {

                var option = "";
                $.each(response, function (i) {

                    option += "<option value=" + response[i]['id'] + ">" + response[i]['codigo'] + " - " + response[i]['nom_ins'] + "</option>";
                });
                $('#accion_centralizada').append(option);
            }, 'json');

        });

        $("#ano_fiscal_p").click(function () {
            var ano_fiscal = $("#ano_fiscal_p").val();
            $('#proyecto').find('option:gt(0)').remove().end().select2('val', "");
            $.post('<?php echo base_url(); ?>reportes/generacion/ControllersReportes/search_datos/' + ano_fiscal + '/2', function (response) {

                var option = "";
                $.each(response, function (i) {

                    option += "<option value=" + response[i]['id'] + ">" + response[i]['codigo'] + " - " + response[i]['nom_ins'] + "</option>";
                });
                $('#proyecto').append(option);
            }, 'json');

        });

        // Generacion de PDF Acción Centralizada
        $(".generar_pdf").click(function (e) {

            e.preventDefault();  // Para evitar que se envíe por defecto

            if ($('#ano_fiscal').val().trim() == '') {

                bootbox.alert("Seleccione el Año Fiscal", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#ano_fiscal").parent('div').addClass('has-error');
                    $("#ano_fiscal").select2('open');
                });

            } else if ($('#accion_centralizada').val().trim() == '') {

                bootbox.alert("Seleccione la Acción Centralizada", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#accion_centralizada").parent('div').addClass('has-error');
                    $("#accion_centralizada").select2('open');
                });

            } else {
                var id = $("#accion_centralizada").val();
                URL = '<?php echo base_url(); ?>accion/' + id + '';
                $.fancybox.open({padding: 0, href: URL, type: 'iframe', width: 2000, height: 1024, });
            }
        });

        // Generacion de PDF Proyecto
        $(".generar_pdf_proy").click(function (e) {

            e.preventDefault();  // Para evitar que se envíe por defecto

            if ($('#ano_fiscal_p').val().trim() == '') {

                bootbox.alert("Seleccione el Año Fiscal", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#ano_fiscal_p").parent('div').addClass('has-error');
                    $("#ano_fiscal_p").select2('open');
                });

            } else if ($('#proyecto').val().trim() == '') {

                bootbox.alert("Seleccione el Proyecto", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#proyecto").parent('div').addClass('has-error');
                    $("#proyecto").select2('open');
                });

            } else {
                var id = $("#proyecto").val();
                URL = '<?php echo base_url(); ?>proyecto/' + id + '';
                $.fancybox.open({padding: 0, href: URL, type: 'iframe', width: 2000, height: 1024, });
            }
        });

        // Generacion de pdf para la emision de los Tomos I y II
        $(".generar_tomo").click(function (e) {

            e.preventDefault();  // Para evitar que se envíe por defecto

            if ($('#ano_fiscal_tomo').val().trim() == '') {

                bootbox.alert("Seleccione el Año Fiscal", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#ano_fiscal_tomo").parent('div').addClass('has-error');
                    $("#ano_fiscal_tomo").select2('open');
                });

            } else if ($('#tomo').val().trim() == '') {

                bootbox.alert("Seleccione un tipo de Tomo", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#tomo").parent('div').addClass('has-error');
                    $("#tomo").select2('open');
                });

            } else {
                var ano_fiscal_tomo = $("#ano_fiscal_tomo").val();
                var tomo = $("#tomo").val();
                URL = '<?php echo base_url(); ?>tomo/' + ano_fiscal_tomo + '/' + tomo;
                $.fancybox.open({padding: 0, href: URL, type: 'iframe', width: 2000, height: 1024, });
            }
        });

        // Generacion de pdf POA - PLAN OPERATIVO ANUAL
        $(".generar_POA").click(function (e) {

            e.preventDefault();  // Para evitar que se envíe por defecto

            if ($('#ano_fiscal_poa').val().trim() == '') {

                bootbox.alert("Seleccione el Año Fiscal", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#ano_fiscal_poa").parent('div').addClass('has-error');
                    $("#ano_fiscal_poa").select2('open');
                });

            } else if ($('#tomo_poa').val().trim() == '') {

                bootbox.alert("Seleccione un tipo de Plan Operativo Anual", function () {
                }).on('hidden.bs.modal', function (event) {
                    $("#tomo_poa").parent('div').addClass('has-error');
                    $("#tomo_poa").select2('open');
                });

            } else {
                var ano_fiscal_poa = $("#ano_fiscal_poa").val();
                var tomo_poa = $("#tomo_poa").val();
                URL = '<?php echo base_url(); ?>poa/' + ano_fiscal_poa + '/' + tomo_poa;
                $.fancybox.open({padding: 0, href: URL, type: 'iframe', width: 2000, height: 1024, });
            }
        });

    });

</script>
<br/>
<br/>
<br/>
<br/>



<form id='form_sectores' action="" method="POST">
    <div style="width: 95%;text-transform:uppercase;box-shadow: 0 1px 5px rgba(0,0,0,.85);margin: auto;" class="panel panel-default fondo_trans">
        <div class="panel-heading" style='background: linear-gradient(#2F9292, #3B7272);color:#FFFFFF;' >
            <label style="float: left" class="panel-title " ><a  href="<?php echo base_url(); ?>sectores/ControllersSectores" >Reportes</a>
                > Acciones / Proyectos</label>
            <br>
        </div>
        <fieldset><legend class="titulo text-center">Generación de Reportes</legend></fieldset>
        <div class="panel-body">
            <div class="col-xs-2">Accion Centralizada</div>
            <div class="col-xs-9">
                <div class="col-md-12">
                    <div class="input-group">
                        <select id="ano_fiscal" style="width: 10%;" class="form-control input-lg">
                            <option value="">Año</option>
                            <?php
                            foreach (range(2013, 2045) as $número) {
                                ?>
                                <option value="<?php echo $número; ?>"><?php echo $número; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                        <select id="accion_centralizada" style="width: 90%;" class="form-control input-lg">
                            <option value="">Seleccione</option>
                        </select>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-lg btn-default generar_pdf">Emitir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--SECCION PARA LA GENERACION DE PDF PARA LOS PROYECTOS-->
        <div class="panel-body">
            <div class="col-xs-2">Proyecto</div>
            <div class="col-xs-9">
                <div class="col-md-12">
                    <div class="input-group">
                        <select id="ano_fiscal_p" style="width: 10%;" class="form-control input-lg">
                            <option value="">Año</option>
                            <?php
                            foreach (range(2013, 2045) as $número) {
                                ?>
                                <option value="<?php echo $número; ?>"><?php echo $número; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                        <select id="proyecto" style="width: 90%;" class="form-control input-lg">
                            <option value="">Seleccione</option>
                        </select>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-lg btn-default generar_pdf_proy">Emitir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- SECCION PARA LA GENERACION DE PDF (TOMO I: ORGANOS Y UNIDADES DE APOYO) Y (TOMO II: ENTES Y EMPRESAS) -->
        <div class="panel-body">
            <div class="col-xs-2">Tomo(s)</div>
            <div class="col-xs-9">
                <div class="col-md-12">
                    <div class="input-group">
                        <select id="ano_fiscal_tomo" style="width: 10%;" class="form-control input-lg">
                            <option value="">Año</option>
                            <?php
                            foreach (range(2013, 2045) as $número) {
                                ?>
                                <option value="<?php echo $número; ?>"><?php echo $número; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                        <select id="tomo" style="width: 90%;" class="form-control input-lg">
                            <option value="">Seleccione</option>
                            <option value="1-4">ORGANOS Y UNIDADES DE APOYO</option>
                            <option value="2-3">ENTES Y EMPRESAS</option>
                        </select>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-lg btn-default generar_tomo">Emitir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- SECCION PARA LA GENERACION DEL POA (PLAN OPERATIVO ANUAL) -->
        <div class="panel-body">
            <div class="col-xs-2"><span title='PLAN OPERATIVO ANUAL'></span>POA</div>
            <div class="col-xs-9">
                <div class="col-md-12">
                    <div class="input-group">
                        <select id="ano_fiscal_poa" style="width: 10%;" class="form-control input-lg">
                            <option value="">Año</option>
                            <?php
                            foreach (range(2013, 2045) as $número) {
                                ?>
                                <option value="<?php echo $número; ?>"><?php echo $número; ?></option>
                                <?php
                            }
                            ?>
                        </select>
                        <select id="tomo_poa" style="width: 90%;" class="form-control input-lg">
                            <option value="">Seleccione</option>
                            <option value="1-4">TOMO I - ORGANOS Y UNIDADES DE APOYO</option>
                            <option value="2-3">TOMO II - ENTES Y EMPRESAS</option>
                        </select>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-lg btn-default generar_POA">Emitir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
    </div>
</form>
