<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ControllersReportes
 *
 * @author ING: Jesus Laya
 */
class ControllersReportes extends CI_Controller
{

    //put your code here

    public function __construct()
    {
        parent::__construct();
        $this->load->model('entes/ModelEntes'); # Llamado a el modelo de Entes
    }

    // Metodo que permite el filtrado por Año Fiscal y Estatus de (Acciones Centralizadas/Proyectos)
    public function search_datos($ano_fiscal, $d)
    {
        if ($d == 1) {
            $campos = "acc.ente = or.id";
            $select = 'acc.id,acc.codigo,or.nom_ins';
            $where  = "acc.ano_fiscal=$ano_fiscal AND acc.estatus=4";
            $result = $this->ModelStandard->join_table_where('acciones_registro acc', 'organos_entes or', $campos, $select, $where, 'result');
        } else if ($d == 2) {
            $campos = "p.ente = o.id";
            $select = 'p.estatus,p.id,p.codigo,o.nom_ins';
            $where  = "ano_fiscal=$ano_fiscal AND estatus=4";
            $result = $this->ModelStandard->join_table_where('proyecto_registro p', 'organos_entes o', $campos, $select, $where, 'result');
        }
        echo json_encode($result); // Salida en formato json
    }

    // Método para generar Reportes de distinta Indole
    public function generacion_pdf()
    {
        $datos['lista_modulo']     = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base", $datos);
        $this->load->view("reportes/generacion/ViewReportes", $datos);
    }

    // Metodo para el formato PDF de Acción Centralizada
    public function pdf_accion_centralizada($id)
    {
        $select1                     = 'a.acc_centralizada,a.correo,a.m_autoridad,a.cedula,a.cargo,o.nom_ins,a.tlf,a.politica_presupuestaria';
        $datos['row']                = $this->ModelStandard->join_table_row('acciones_registro a', 'organos_entes o', 'a.ente', 'o.id', 'a.id', $id, $select1);
        $select2                     = 'acc.accion_centralizada';
        $datos['acc_centralizada']   = $this->ModelStandard->join_table_row('acciones_registro a', 'accion_centralizada acc', 'a.acc_centralizada', 'acc.id', 'a.id', $id, $select2);
        $datos['accion_especifica']  = $this->ModelStandard->search('accion_centralizada', 'accion_especifica', $datos['row']->acc_centralizada);
        // Actividades
        $datos['actividades']        = $this->ModelStandard->search('id_acc_reg', 'distribucion_actividad', $id);
        // Distribucion trimestral de las Actividades
        $datos['distrib_tri_act']    = $this->ModelStandard->join_table('distribucion_trimestral_actividad dis', 'distribucion_actividad d', 'dis.id_actividad', 'd.id', 'dis.id_acc_reg', $id);
        // Distribucion trimestral Financiera
        $datos['distrib_tri_fin']    = $this->ModelStandard->join_table('distribucion_trimestral_financiera dis', 'distribucion_actividad d', 'dis.id_actividad', 'd.id', 'dis.id_acc_reg', $id);
        // Imputacion Acciones
        $datos['imp_presupuestaria'] = $this->ModelStandard->join_table('imp_presupuestaria i', 'partida_presupuestaria p', 'i.partida', 'p.id', 'i.id_acc_reg', $id);
        $this->load->view('acciones/registro/pdf/accion_centralizada', $datos);
    }

    // Metodo para el formato PDF de Generacion de Proyectos
    public function pdf_proyecto($id)
    {

        $select1      = 'p.id,p.fecha_elaboracion,p.responsable,p.tlf,p.domicilio,p.cargo,p.correo,'
                . 'p.nom_proyecto,p.ubicacion, p.duracion,p.inicio,p.fin,p.ano_fiscal,p.etapa,'
                . 'p.f_financiamiento, p.indicador_g,p.identificador,p.m_verificacion,p.ambito,'
                . 'p.especifique_amb,p.plan_patria,p.objetivo_historico,p.objetivo_nacional,'
                . 'p.objetivo_estrategico,p.objetivo_general,p.plan_gobierno,p.linea_estrategica,'
                . 'p.area_inversion,p.sector,p.tipo_inversion,p.desc_problema,p.obj_general,'
                . 'p.imp_impacto,p.ben_femeninos,p.ben_masculinos,p.total_ben,p.req_acciones,'
                . 'p.acc_institucion,p.estimado_fem,p.estimado_mas,p.estimado_t_direc,'
                . 'p.estimado_t_indirec,p.acc_institucion,p.acc_especifique,p.con_acciones,'
                . 'p.con_institucion,p.con_especifique,p.en_acciones,p.en_institucion,'
                . 'p.en_especifique,p.codigo, o.nom_ins';
        $datos['row'] = $this->ModelStandard->join_table_row('proyecto_registro p', 'organos_entes o', 'p.ente', 'o.id', 'p.id', $id, $select1);

        // Proceso de Carga de Planes de la Patria
        $campos1              = "acc.plan_patria = p.id";
        $select1              = 'p.plan_patria';
        $where1               = "p.id=" . $datos['row']->plan_patria;
        $datos['plan_patria'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'plan_patria p', $campos1, $select1, $where1, 'row');

        // Proceso de carga de Objetivos Historico
        $campos2                     = "acc.objetivo_historico = o.id";
        $select2                     = 'o.objetivo_historico';
        $where2                      = "o.id=" . $datos['row']->objetivo_historico;
        $datos['objetivo_historico'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'objetivo_historico o', $campos2, $select2, $where2, 'row');

        // Proceso de carga Objetivo Nacional
        $campos3                    = "acc.objetivo_nacional = o.id";
        $select3                    = 'o.objetivo_nacional';
        $where3                     = "o.id=" . $datos['row']->objetivo_nacional;
        $datos['objetivo_nacional'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'objetivo_nacional o', $campos3, $select3, $where3, 'row');

        // Proceso de carga de Objetivo Estrategico
        $campos4                       = "acc.objetivo_estrategico = o.id";
        $select4                       = 'o.objetivo_estrategico';
        $where4                        = "o.id=" . $datos['row']->objetivo_estrategico;
        //echo $where4;
        $datos['objetivo_estrategico'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'objetivo_estrategico o', $campos4, $select4, $where4, 'row');

        // Proceso de carga de Objetivo General
        $campos5 = "acc.objetivo_general = o.id";
        $select5 = 'o.objetivo_general';
        $where5  = "o.id=" . $datos['row']->objetivo_general;

        $datos['objetivo_general'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'objetivo_general o', $campos5, $select5, $where5, 'row');

        // Proceso de carga de Plan de Gobierno
        $campos6                = "acc.plan_gobierno = p.id";
        $select6                = 'p.plan_gobierno';
        $where6                 = "p.id=" . $datos['row']->plan_gobierno;
        $datos['plan_gobierno'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'plan_gobierno p', $campos6, $select6, $where6, 'row');

        // Proceso de carga de la Linea
        $campos7                    = "acc.linea_estrategica = l.id";
        $select7                    = 'l.linea_estrategica';
        $where7                     = "l.id=" . $datos['row']->linea_estrategica . " AND l.plan_gobierno=" . $datos['row']->plan_gobierno;
        $datos['linea_estrategica'] = $this->ModelStandard->join_table_where('proyecto_registro acc', 'linea_estrategica l', $campos7, $select7, $where7, 'row');

        // Proceso de carga del Sector
        $campos8         = "p.sector = s.id";
        $select8         = 's.sector';
        $where8          = "s.id=" . $datos['row']->sector;
        $datos['sector'] = $this->ModelStandard->join_table_where('proyecto_registro p', 'sectores s', $campos8, $select8, $where8, 'row');

        // Proceso de carga Acciones no financieras
        if ($datos['row']->acc_institucion > 0) {
            $campos9                    = "p.acc_institucion = o.id";
            $select9                    = 'o.nom_ins';
            $where9                     = "o.id=" . $datos['row']->acc_institucion;
            $datos['acc_institucion']   = $this->ModelStandard->join_table_where('proyecto_registro p', 'organos_entes o', $campos9, $select9, $where9, 'row');
            $datos['acc_instituciones'] = $datos['acc_institucion']->nom_ins;
        } else {
            $datos['acc_instituciones'] = "N/A";
        }
        // Proceso para la carga de Acciones de otras Instituciones
        if ($datos['row']->con_institucion > 0) {
            $campos10                   = "p.con_institucion = o.id";
            $select10                   = 'o.nom_ins';
            $where10                    = "o.id=" . $datos['row']->con_institucion;
            $datos['con_institucion']   = $this->ModelStandard->join_table_where('proyecto_registro p', 'organos_entes o', $campos10, $select10, $where10, 'row');
            $datos['con_instituciones'] = $datos['con_institucion']->nom_ins;
        } else {
            $datos['con_instituciones'] = "N/A";
        }

        // Proceso de carga de Conflicto con otra institución
        if ($datos['row']->en_institucion > 0) {
            $campos11                  = "p.en_institucion = o.id";
            $select11                  = 'o.nom_ins';
            $where11                   = "o.id=" . $datos['row']->en_institucion;
            $datos['en_institucion']   = $this->ModelStandard->join_table_where('proyecto_registro p', 'organos_entes o', $campos11, $select11, $where11, 'row');
            $datos['en_instituciones'] = $datos['en_institucion']->nom_ins;
        } else {
            $datos['en_instituciones'] = "N/A";
        }
        // Proceso de carga de las Acciones Especificas en base al tiempo de ejecución
        $datos['acc_esp_te'] = $this->ModelStandard->search('pk', 'distribucion_acc_especifica', $datos['row']->id);

        // Proceso de carga de las Metas Financieras de las Acciones Especificas
        $campos12            = "a.id = b.id_acc";
        $select12            = 'a.acc_esp,b.trimestre_i,b.trimestre_ii,b.trimestre_iii,b.trimestre_iv,b.total';
        $where12             = "b.pk=" . $datos['row']->id;
        $datos['acc_es_fin'] = $this->ModelStandard->join_table_where('distribucion_acc_especifica a', 'distribucion_trimestral_acc_especifica b', $campos12, $select12, $where12, 'result');

        // Monto general del Proyecto (Solicitud)
        $monto_proyecto = 0;
        foreach ($datos['acc_es_fin'] as $value) {
            $monto_proyecto += $value->total;
        }
        $datos['monto_soli'] = $monto_proyecto;

        // Monto general del Proyecto (Asignacion)
        $query_monto_asig      = "SELECT proy.id AS id_proyecto,oe.id,SUM(dis.m_asig) AS monto_asig FROM distribucion_trimestral_imp_pre AS dis INNER JOIN proyecto_registro AS proy ON(dis.pk=proy.id) INNER JOIN organos_entes AS oe ON(proy.ente=oe.id) INNER JOIN observaciones_acciones_proy AS obs ON(proy.ente=obs.organo) WHERE proy.estatus=4 AND proy.id=$id GROUP BY oe.nom_ins,oe.id,proy.id";
        $proyectos_montos_asig = $this->ModelStandard->query_set($query_monto_asig, 'row');
        $datos['monto_asig']   = $proyectos_montos_asig;

        // Proceso de carga de las Imputaciones Presupuestarias
        $campos13                        = "a.id = b.denominacion";
        $select13                        = 'a.partida_presupuestaria,a.codigo,b.trimestre_i,b.trimestre_ii,b.trimestre_iii,b.trimestre_iv,b.cantidad';
        $where13                         = "b.pk=" . $datos['row']->id;
        $datos['partida_presupuestaria'] = $this->ModelStandard->join_table_where('partida_presupuestaria a', 'distribucion_trimestral_imp_pre b', $campos13, $select13, $where13, 'result');

        $this->load->view('acciones/proyecto/pdf/proyecto', $datos);
    }

    // Metodo que permite generar la ley presupuestaria del tomo I y II
    public function ley_presupuestaria_tomo_I($ano, $tipo)
    {

        $datos['dato']           = explode('-', $tipo);
        $dato                    = $datos['dato'];
        $datos['ano']            = $ano;
        $datos['tipo']           = $tipo;
        // Proceso de carga para los Sectores asociados a los Organismos
        $datos['sectores']       = $this->ModelStandard->busqueda_esp('sectores', '');
        $query3                  = "SELECT acc.ente,s.sector,s.codigo,oe.nom_ins,oe.tipo_ins FROM imp_presupuestaria AS im INNER JOIN acciones_registro AS acc ON(im.id_acc_reg=acc.id)  INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) INNER JOIN sectores AS s ON(s.id=oe.sector) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 GROUP BY oe.nom_ins,s.sector,s.codigo,oe.tipo_ins,acc.ente";
        $datos['titulo_org_pro'] = $this->ModelStandard->query_set($query3, 'result');
        //echo "<h3>".$this->db->last_query()."</h3>";
        $this->load->view('acciones/proyecto/pdf/ley_presupuestaria', $datos);
    }

    // Metodo que permite generar el Plan Operativo Anual
    public function plan_operativo_anual($ano, $tipo)
    {
        $datos['ano']                 = $ano; // Se refleja el ano
        $datos['tipo']                = $tipo; // Se refleja la opcion de tipo de reporte
        $datos['dato']           = explode('-', $tipo);
        $dato                         = $datos['dato'];
        // Encabezado principal de los Sectores asociados a los Organismos
        $datos['sectores']       = $this->ModelStandard->busqueda_esp('sectores', '');
        $query_titulo                 = "SELECT acc.ente,s.sector,s.codigo,oe.nom_ins FROM imp_presupuestaria AS im INNER JOIN acciones_registro AS acc ON(im.id_acc_reg=acc.id)  INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) INNER JOIN sectores AS s ON(s.id=oe.sector) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 GROUP BY oe.nom_ins,s.sector,s.codigo,acc.ente";
        $datos['titulo_org_sectores'] = $this->ModelStandard->query_set($query_titulo, 'result');
        $this->load->view('acciones/proyecto/pdf/plan_operativo_anual', $datos);
    }

}
