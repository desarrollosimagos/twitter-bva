
<script>
    $(document).ready(function () {

        var TPP = $('#tab_plan_patria').dataTable({
            "iDisplayLength": 10,
            "iDisplayStart": 0,
            "sPaginationType": "full_numbers",
            "aLengthMenu": [25, 50, 75, 100],
            "oLanguage": {"sUrl": "<?php echo base_url(); ?>assets/js/es.txt"},
            //"order": [[1, "asc"]],
            "aoColumns": [
                {"sClass": "control", "sWidth": "1%"},
                {"sClass": "registro center", "sWidth": "1%"},
                {"sClass": "registro center", "sWidth": "3%"},
                {"sClass": "registro center", "sWidth": "30%"},
                {"sClass": "registro center", "sWidth": "7%"},
                {"sWidth": "3%", "bSortable": false, "sClass": "center sorting_false", "bSearchable": false},
                {"sWidth": "3%", "bSortable": false, "sClass": "center sorting_false", "bSearchable": false}

            ]
        });

        // Validacion para borrar
        $("table#tab_plan_patria").on('click', 'img.borrar', function (e) {
            e.preventDefault();
            var id = this.getAttribute('id');


            bootbox.dialog({
                message: "¿Desea manipular la información",
                title: "Borrar registro de bien",
                buttons: {
                    success: {
                        label: "Descartar",
                        className: "btn-primary",
                        callback: function () {

                        }
                    },
                    danger: {
                        label: "Procesar",
                        className: "btn-warning",
                        callback: function () {
                            //alert(id)
                            $.post('<?php echo base_url(); ?>acciones/registro/ControllersRegistro/delete/' + id + '', function (response) {

                                if (response == "existe") {

                                    bootbox.alert("Disculpe, Se encuentra asociado a un Organo u Ente", function () {
                                    }).on('hidden.bs.modal', function (event) {
                                    });

                                } else {
                                    bootbox.alert("Se elimino con exito", function () {
                                    }).on('hidden.bs.modal', function (event) {
                                        url = '<?php echo base_url(); ?>acciones/registro/ControllersRegistro'
                                        window.location = url
                                    });
                                }



                            });

                        }
                    }
                }
            });
        });
    });

</script>
<br/>
<br/>
<br/>
<br/>
<div class="row-fluid" >
    <div class="container mainbody-section text-center"  style="width:100%;">
        <a href="<?php echo base_url('acciones/registro/ControllersRegistro/nuevo'); ?>">
            <button role="button" class="btn btn-default" style="font-weight: bold;font-size: 13px" id="enviar" >
                &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;
                Agregar Acción
            </button>
        </a>
        </br>
        </br>
        <table style="width:100%;" border="0" align="center" cellspacing="1" id="tab_plan_patria" align="center"
               class="table table-bordered table-striped table-hover table-condensed dt-responsive table-responsive" style="width:30%">
            <thead style="font-size: 16px">
                <tr style="background-color: silver">
                    <th style='text-align: center;color: white' colspan="15">Listado de Acciones</th>
                </tr>
                <tr style="background-color: #8BA8A7">
                    <th></th>
                    <th style='text-align: center'>Item</th>
                    <th style='text-align: center'>Código</th>
                    <th style='text-align: center'>Nombre de la Máxima Autoridad de la Institución</th>
                    <th style='text-align: center'>Estátus</th>
                    <th style='text-align: center'>Estado</th>
                    <th style='text-align: center'>Editar</th>
                </tr>
            </thead>
            <tbody>

                <?php
                $i = 1;
                foreach ($list_acc_reg as $value) {
                    if($value->cierre == 1){
                        
                    ?>

                    <tr style="font-size: 16px" class="{% cycle 'impar' 'par' %}">
                        <td></td>
                        <td><?php echo $i; ?></td>
                        <td><?php echo $value->codigo; ?></td>
                        <td><?php echo $value->m_autoridad; ?></td> 
                        <td>
                            <?php
                             if($value->estatus == 1){
                                echo "Revisando";
                             }else if($value->estatus == 2){
                                echo "Rechazado";
                             }else if($value->estatus == 3){
                                echo "Para Ajuste";
                             }else if($value->estatus == 4){
                                echo "Aprobado";
                             }
                            ?>
                        </td>
                        <td
                            <?php
                                if($value->accion == 1){
                            ?>
                            style="background-color: #DB9B9B;color: #000000;"
                            <?php
                            }else{
                            ?>
                                style="background-color: #BADCD2;color: #000000;"
                            <?php
                            }
                            ?>
                        >
                            <?php
                             if($value->accion == 1){
                                echo "En Proceso";
                             }else{
                                echo "Ejecutado";
                             }
                            ?>
                        </td>
                        <td style='text-align: center'>
                            <?php if($value->estatus == 1 or $value->estatus == 3){?>
                                <a href="<?php echo base_url('acciones/registro/ControllersRegistro/procesar_list/' . $value->codigo); ?>">
                                    <img style="width:25px;height: 25px" src="<?php echo base_url("assets/image/editar.png"); ?>"/>   
                                </a>
                            <?php }else{?>
                                <a style="text-decoration:none" href="<?php echo base_url('acciones/registro/ControllersRegistro/procesar_list/' . $value->codigo); ?>">
                                    <!--<img style="width:25px;height: 25px" src="<?php echo base_url("assets/image/editar.png"); ?>"/>   -->
                                    Ver
                                </a>
                            <?php }?>
                        </td>
                        <!--<td style='text-align: center'>
                            
                            <?php if($value->estatus == 1 or $value->estatus == 3){?>
                                <img class='borrar' id='<?php echo $value->id; ?>'  style="width:25px;height: 25px" src="<?php echo base_url("assets/image/eliminar.png"); ?>"/>
                            <?php }else{?>
                                <img style="width:25px;height: 25px" src="<?php echo base_url("assets/image/block.png"); ?>"/>
                            <?php }?>
                            
                        </td>-->
                    </tr>
                    <?php
                    $i = $i + 1;
                        }
                    }
                ?>
            </tbody>
        </table>
    </div>
</div>


