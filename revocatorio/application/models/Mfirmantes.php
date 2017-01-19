<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Mfirmantes extends CI_Model
{

    private $table = 'normalizacio_data';

    function __construct()
    {
        parent::__construct();
    }

    public function agregar($data)
    {
        //print_r($data);
        $insert = $this->db->insert('normalizacio_data', $data);
    }
    
    public function agregar2($data)
    {
        //print_r($data);
        $insert = $this->db->insert('normalizacio_data_revisados', $data);
    }
    
    public function ver_si(){
        return $this->db->count_all_results('normalizacio_data');
    }
    
    public function ver_no(){
        return $this->db->count_all_results('normalizacio_data_revisados');
    }
    
    public function registro_electoral()
    {
        //$this->db->limit();
        //$this->db->limit(10000, 1000);
        $this->db->limit(100000, 11000);
        //$this->db->where('cedula','14450103');
        $query = $this->db->get("registro_registroelectoral");
        return $query->result();
    }
    
    public function registro_electoral2($numero,$limite)
    {
        //$this->db->limit();
        //$this->db->limit(10000, 1000);
        $this->db->limit($numero, $limite);
        //$this->db->where('cedula','14450103');
        $query = $this->db->get("registro_registroelectoral");
        return $query->result();
    }
    
    public function consulta($data){
	    $this->db->select('registro_registroelectoral.*');
	    $this->db->where("normalizacio_data.cedula", $data['cedula']);
	    $this->db->join('registro_registroelectoral', 'registro_registroelectoral.cedula = normalizacio_data.cedula');
	    $query = $this->db->get("normalizacio_data");
        return $query->row();   
    }
    
    public function consulta2($cedula){
	    $this->db->select('*');
	    $this->db->where("cedula", $cedula);
	    $query = $this->db->get("psuv");
        return $query->row();   
    }

    

}
