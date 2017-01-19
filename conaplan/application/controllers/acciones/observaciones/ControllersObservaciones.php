<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ControllersObservaciones
 *
 * @author ING: Jesus Laya
 */
class ControllersObservaciones extends CI_Controller
{

    //put your code here

    public function __construct()
    {
        parent::__construct();
        $this->load->model('acciones/observaciones/ModelObservaciones'); # Llamado a el modelo de Plan de gobierno
        $this->load->model('entes/ModelEntes'); # Llamado a el modelo de Entes
    }

    public function index()
    {
        $datos['list_observaciones'] = $this->ModelStandard->join_table_two('observaciones_acciones ob','acciones_registro a','organos_entes o','ob.id_accion','a.id','ob.organo','o.id');
        $datos['lista_modulo']       = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo']   = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base", $datos);
        $this->load->view("acciones/observaciones/ViewLista", $datos);
    }

    public function nuevo()
    {   $datos['codigo']           = $this->ModelStandard->count_all_table('observaciones_acciones');
        $datos['lista_modulo']     = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $datos['organos']          = $this->ModelEntes->listar('organos_entes');
        $datos['acc_centralizada'] = $this->ModelEntes->listar('accion_centralizada');
        $this->load->view("base/Base", $datos);
        $this->load->view("acciones/observaciones/ViewAdd", $datos);
    }

    public function guardar()
    {   
        $this->ModelObservaciones->insertar($this->input->post());
        // =========================================================================
		// Proceso de bitacora
		// =========================================================================
		$time   = "%h:%i %a"; // Se captura la hora actual
		$datos  = array(
			'modulo'              => 'OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)',
			'accion'              => 'NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS',
			'id_usuario'          => $this->session->userdata['logged_in']['id'],
			'fecha_registro'      => date('Y-m-d',now()),
			'fecha_actualizacion' => NULL,
			'hora_registro'       => mdate($time),
			'hora_actualizacion'  => NULL,
			'ip'                  => $_SERVER['REMOTE_ADDR'],
		);
		$result = $this->ModelStandard->bitacora($datos);
		// =========================================================================
    }

    public function modificar()
    {   
        $array = array(
            'id'                => $this->input->post('id'),
            'organo'            => $this->input->post('organo'),
            'id_accion'         => $this->input->post('id_accion'),
            'revisado'          => $this->input->post('revisado'),
            'estructura'        => $this->input->post('estructura'),
            'observaciones'     => $this->input->post('observaciones'),
            'estatus'           => $this->input->post('estatus'),
            'fecha_elaboracion' => $this->input->post('fecha_elaboracion'),
			'cierre'            => 1,
			'ano_fiscal'        => date('Y',now()),
        );

        $result = $this->ModelObservaciones->actualizar($array);
        // =========================================================================
		// Proceso de bitacora
		// =========================================================================
		$time   = "%h:%i %a"; // Se captura la hora actual
		$datos  = array(
			'modulo'              => 'OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)',
			'accion'              => 'NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS',
			'id_usuario'          => $this->session->userdata['logged_in']['id'],
			'fecha_registro'      => NULL,
			'fecha_actualizacion' => date('Y-m-d',now()),
			'hora_registro'       => NULL,
			'hora_actualizacion'  => mdate($time),
			'ip'                  => $_SERVER['REMOTE_ADDR'],
		);
		$result = $this->ModelStandard->bitacora($datos);
		// =========================================================================
    }

    public function procesar($id)
    {
        $datos['detalles_lista']     = $this->ModelObservaciones->datos($id);
        $datos['lista_modulo']       = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo']   = $this->ModelEntes->listar_table('sub_modulo');
        $datos['organos']            = $this->ModelEntes->listar('organos_entes');
        $datos['acc_centralizada']   = $this->ModelEntes->listar('accion_centralizada');
        $id                          = $datos['detalles_lista']->id;
        $id_accion                   = $datos['detalles_lista']->id_accion;
        $datos['imp_presupuestaria'] = $this->ModelStandard->join_table('imp_presupuestaria i', 'partida_presupuestaria p', 'i.partida', 'p.id','i.id_acc_reg',$id_accion);
        $this->load->view("base/Base", $datos);
        $this->load->view('acciones/observaciones/ViewUpdate', $datos);
    }

    public function delete($id)
    {
        $result = $this->ModelRegistro->eliminar($id);
        if ($result) {
            redirect('acciones/observaciones/ControllersObservaciones');
        }
    }

    // Método publico para traer las lineas estrategicas segun la asociacion con el plan de la nacion
    public function ajax_search($id)
    {
        #Campo   Tabla                ID
        $result = $this->ModelStandard->search('ente', 'acciones_registro', $id);
        echo json_encode($result);
    }

    // Método publico para traer las lineas estrategicas segun la asociacion con el plan de la nacion
    public function ajax_table($id)
    {
        $result = $this->ModelObservaciones->ajax_table($id);
        echo json_encode($result);
    }

    public function cargar($id)
    {
        $dato = explode('-', $id);
            
        if ($dato[1] == "") {
            $s_cons = null;
        }else{
            $s_cons = $dato[1];
        }
        if ($dato[2] == "") {
            $g_fiscal = null;
        }else{
            $g_fiscal = $dato[2];
        }
        if ($dato[3] == "") {
            $fci = null;
        }else{
            $fci = $dato[3];
        }
        if ($dato[4] == "") {
            $ticr = null;
        }else{
            $ticr = $dato[4];
        }
        if ($dato[5] == "") {
            $m_asig = null;
        }else{
            $m_asig = $dato[5];
        }

        $id = $dato[0];
        
        $array = array(
            's_cons'   => $s_cons,
            'g_fiscal' => $g_fiscal,
            'fci'      => $fci,
            'ticr'     => $ticr,
            'm_asig'   => $m_asig,
        );
        
        $this->ModelObservaciones->procesar($id,$array);
    }
    
}
