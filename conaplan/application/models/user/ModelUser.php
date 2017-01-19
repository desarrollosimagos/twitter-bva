<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ModelUser
 *
 * @author jesus
 */
class ModelUser extends CI_Model
{

    //put your code here
    public $variable;

    public function __construct()
    {
        parent::__construct();
        #$this->load->database();
        $this->load->library('session');
    }

    
    // Metodo publico, forma de insertar los datos
    public function insertar($datos)
    {

        $result = $this->db->where('username =', $datos['username']);
        $result = $this->db->get('auth_user');

        if ($result->num_rows() > 0) {
            #echo "CORRECTO";
            echo 'existe';
        } else {

            $result = $this->db->insert("auth_user", $datos);
            return $result;
        }
    }
    
    // Metodo publico, forma de actualizar los datos
    public function actualizar($id,$datos)
    {   #echo print_r($datos['id']);
        #return true;
        $result = $this->db->where('id', $id);
        $result = $this->db->update('auth_user', $datos);
        return $result;
    }

    public function detailList($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('auth_user');
        return $query->row();
    }
    

    // Metodo publico, proceso para el logeo
    public function login($username,$password)
    {   
        $array = array('username' => $username, 'password' => $password, 'is_active' => True);
        
        $this->db->where($array);
        
        $result = $this->db->get('auth_user');
        
        if ($result->num_rows() > 0){
            return true;
        }else{
            return false;
        }
    }
    
    public function logout()
    {
        $logout_session = $this->session->sess_destroy();
        
        if($logout_session){
            return true;
        }
    }
    
    
    public function information($username) {

        $array = array('username' => $username);
        $this->db->where($array);
        $this->db->limit(1);
        $query = $this->db->get('auth_user');

        if ($query->num_rows() == 1) {
            return $query->result();
        } else {
            return false;
        }
    }
    
    
    // Metodo publico para reflejar un dato en especifico
    public function information_auth_group($campo, $id, $table) {

        $array = array($campo => $id);
        $this->db->where($array);
        $this->db->limit(1);
        $query = $this->db->get($table);

        if ($query->num_rows() == 1) {
            return $query->result();
        } else {
            return false;
        }
    }
    
    
}
