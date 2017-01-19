<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ControllersUser
 *
 * @author ING: Jesus Laya
 */
class ControllersUser extends CI_Controller
{

    //put your code here

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('url'));
        $this->load->library('session');
        $this->load->helper('date');
        $this->load->model('user/ModelUser'); # Llamado a el modelo de Usuarios
        $this->load->model('entes/ModelEntes'); # Llamado a el modelo de Entes
        
    }

    public function index()
    {   
        $this->load->view("user/ViewUser");
    }
    
    public function listar()
    {   
        $datos['lista_user'] = $this->ModelEntes->listar('auth_user');
        $datos['list_group'] = $this->ModelEntes->listar('auth_group');
        $datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base",$datos);
        $this->load->view("user/ViewList", $datos);
        
    }
    
    public function home()
    {   
        $datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base",$datos);
        $this->load->view("user/Home");
    }
    
    
    public function guardar()
    {   
        
        # Validacion los distintos acceso de usuarios
        if($this->input->post('is_active') ==''){
            $is_active = 'False';
        }else{
            $is_active = 'True';
        }

        if($this->input->post('is_superuser') ==''){
            $is_superuser = 'False';
        }else{
            $is_superuser = 'True';
        }

        if($this->input->post('is_staff') ==''){
            $is_staff = 'False';
        }else{
            $is_staff = 'True';
        }
        
        # Validacion para los distintos permisos de acceso al usuario
        if($this->input->post('agregar') ==''){
            $agregar = 'False';
        }else{
            $agregar = 'True';
        }
        if($this->input->post('modificar') ==''){
            $modificar = 'False';
        }else{
            $modificar = 'True';
        }
        if($this->input->post('eliminar') ==''){
            $eliminar = 'False';
        }else{
            $eliminar = 'True';
        }
        if($this->input->post('ver') ==''){
            $ver = 'False';
        }else{
            $ver = 'True';
        }
        
        if($this->input->post('reporte') ==''){
            $reporte = 'False';
        }else{
            $reporte = 'True';
        }
        
        $array = array(
            'password' => 'pbkdf2_sha256$12000$'.hash ( "sha256", $this->input->post('password') ),
            'is_superuser' => $is_superuser,
            'username' => $this->input->post('username'),
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'cedula' => $this->input->post('cedula'),
            'is_staff' => $is_staff,
            'is_active' => $is_active,
            'group_id' => $this->input->post('group_id'),
            'agregar' => $agregar,
            'modificar' => $modificar,
            'eliminar' => $eliminar,
            'ver' => $ver,
            'reporte' => $reporte,
        );

        #echo print_r($array);

        #return true;
        
        if($this->input->post('id') == ''){
        
            $result = $this->ModelUser->insertar($array);
            if ($result) {
                redirect('ControllersUser/listar');
            }
        } else {
            $id = $this->input->post('id');
            $result = $this->ModelUser->actualizar($id,$array);
            if ($result) {
                redirect('ControllersUser/listar');
            }
        }
    }
    

    public function procesar($id)
    {
        $datos['detalles_lista'] = $this->ModelUser->detailList($id);
        $datos['list_group'] = $this->ModelEntes->listar('auth_group');
        $datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base",$datos);
        $this->load->view('user/ViewUpdate', $datos);
    }
    
    
    public function new_user()
    {   
        $datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
        $datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
        $this->load->view("base/Base",$datos);
        $datos['list_group'] = $this->ModelEntes->listar('auth_group');
        $this->load->view("user/ViewNew",$datos);
    }
    

    public function iniciar()
    {
        #$result = $this->ModelUser->login($_POST['username'], md5($_POST['password']));
        $result_login = $this->ModelUser->login($_POST['username'], 'pbkdf2_sha256$12000$'.hash ( "sha256", $_POST['password'] ));
        $result       = $this->ModelUser->information($_POST['username']);
        
        if ($result_login == '1') {
            if ($result_login != false) {
                $result_group  = $this->ModelUser->information_auth_group('id', $result[0]->group_id, 'auth_group');
                $session_data  = array(
                    'username'  => $result[0]->username,
                    'id'        => $result[0]->id,
                    'first_name'=> $result[0]->first_name,
                    'last_name' => $result[0]->last_name,
                    'group_id'  => $result_group[0]->name,
                );
                $this->session->set_userdata('logged_in', $session_data);
                echo 1;
            }
            // =========================================================================
            // Proceso de bitacora
            // =========================================================================
            $time   = "%h:%i %a"; // Se captura la hora actual
            $datos  = array(
                'modulo'              => 'USUARIO  (TABLA auth_user)',
                'accion'              => 'NUEVO INGRESO DE SESIÓN',
                'id_usuario'          => $this->session->userdata['logged_in']['id'],
                'fecha_registro'      => date('Y-m-d',now()),
                'fecha_actualizacion' => NULL,
                'hora_registro'       => mdate($time),
                'hora_actualizacion'  => NULL,
                'ip'                  => $_SERVER['REMOTE_ADDR'],
            );
            $result = $this->ModelStandard->bitacora($datos);
            // =========================================================================
        } else {
            
            if ($result == true and $result[0]->is_active == True) {
                echo 2;
            }else{
                echo 3;
            }

            
        }
    }

    public function close_session()
    {
        $result = $this->ModelUser->logout();
        // =========================================================================
		// Proceso de bitacora
		// =========================================================================
		$time   = "%h:%i %a"; // Se captura la hora actual
		$datos  = array(
			'modulo'              => 'USUARIO  (TABLA auth_user)',
			'accion'              => 'NUEVO CIERRE DE SESIÓN',
			'id_usuario'          => $this->session->userdata['logged_in']['id'],
			'fecha_registro'      => date('Y-m-d',now()),
			'fecha_actualizacion' => NULL,
			'hora_registro'       => mdate($time),
			'hora_actualizacion'  => NULL,
			'ip'                  => $_SERVER['REMOTE_ADDR'],
		);
		$result = $this->ModelStandard->bitacora($datos);
		// =========================================================================
        if ($result) {
            echo 1;
        }
    }

}
