<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuario extends CI_Model {
    
    public function __construct()
    {
        parent::__construct();
    }
	public function add_usuario($data)
	{
		
		$this->db->insert('usuarios',$data);
		//echo $this->db->last_query();
        //exit;
        return true;
        
	}
	
	public function add_contactos($data)
	{
		
		$this->db->insert('contactos',$data);
		//echo $this->db->last_query();
        //exit;
        return true;
        
	}
	
	public function existe_contacto($cedula)
    {
        $this->db->select('*');
        $this->db->where("cedula", $cedula);
        $query = $this->db->get("contactos");
        if($query->num_rows()>0){
	        return true;
        }else{
	        return false;
        }
    }
    
    
    public function actualizar_contacto($cedula,$data)
    {
        $this->db->where('cedula', $cedula);
        $result = $this->db->update('contactos',$data);   
        return $result;
    }
    
    
    public function contactolist($cedula)
    {
        $this->db->select('*');
        $this->db->where('cedula', $cedula);
        $query = $this->db->get("contactos");
        return $query->row();
    }
	
	public function existe_usuario($id)
    {
        $this->db->select('*');
        $this->db->where("id", $id);
        $query = $this->db->get("usuarios");
        if($query->num_rows()>0){
	        return false;
        }else{
	        return true;
        }
    }
    
    public function add_postulado($data)
	{
		
		$this->db->insert('postulados',$data);
		//echo $this->db->last_query();
        //exit;
        return true;
        
	}
	
	public function existe_postulado($id)
    {
        $this->db->select('*');
        $this->db->where("id", $id);
        $query = $this->db->get("postulados");
        if($query->num_rows()>0){
	        return false;
        }else{
	        return true;
        }
    }
    
    public function existe_postulacion($id,$postulado,$categoria)
    {
        $this->db->select('*');
        $this->db->where("usuario_id", $id);
        $this->db->where("postulado_id", $postulado);
        $this->db->where("categorias_id", $categoria);
        $query = $this->db->get("postulaciones");
        if($query->num_rows()>0){
	        return false;
        }else{
	        return true;
        }
    }
    
    public function listado_ultimos_categoria($id)
    {
        $this->db->select('postulados.id, 
  postulados.id_str, 
  postulados.name, 
  postulados.screen_name, 
  postulados.followers_count, 
  postulados.friends_count, 
  postulados.listed_count, 
  postulados.favourites_count, 
  postulados.statuses_count, 
  postulados.profile_image_url, 
  postulados.profile_image_url_https, count(*) as cantidad');
        $this->db->join('postulaciones', 'postulaciones.postulado_id = postulados.id and postulaciones.categorias_id = '.$id);
        $this->db->group_by("postulados.id, 
  postulados.id_str, 
  postulados.name, 
  postulados.screen_name, 
  postulados.followers_count, 
  postulados.friends_count, 
  postulados.listed_count, 
  postulados.favourites_count, 
  postulados.statuses_count, 
  postulados.profile_image_url, 
  postulados.profile_image_url_https");
        $this->db->order_by("postulados.id", "desc");
        
        $query = $this->db->get("postulados");
        //echo $this->db->last_query();
        //exit;
        return $query->result();
    }
    
    
    public function add_postulacion($data)
	{
		
		$this->db->insert('postulaciones',$data);
		//echo $this->db->last_query();
        //exit;
        return true;
        
	}
    
    public function categoriaslist()
    {
        $this->db->select('*');
        $query = $this->db->get("categorias");
        return $query->result();
    }
    
    public function categoriasdetalle($id)
    {
        $this->db->select('*');
        $this->db->where('id',$id);
        $query = $this->db->get("categorias");
        return $query->row();
    }
    
    public function bandeja($estatus)
    {
        $this->db->select('*');
        $this->db->where('estatus',$estatus);
        $this->db->limit(2000);
        $query = $this->db->get("bandeja");
        return $query->result();
    }
    
    public function ContadordeTwitter($twitter)
    {
        $this->db->select('*');
        $this->db->where('twitter',$twitter);
        $query = $this->db->get("personas_twitter");
        
        return $query->num_rows();
    }
    
    public function ContadordePersonas($cedula)
    {
        $this->db->select('*');
        $this->db->where('personas',$cedula);
        $query = $this->db->get("personas_twitter");
        
        return $query->num_rows();
    }
    
    public function bandejanum()
    {
        $this->db->select('*');
        $this->db->where('estatus','Recibido');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function politicos()
    {
        $this->db->select('*');
        $this->db->where('estatus','politico');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function oponente()
    {
        $this->db->select('*');
        $this->db->where('estatus','oponente');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function cooperante()
    {
        $this->db->select('*');
        $this->db->where('estatus','cooperante');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function asistencial()
    {
        $this->db->select('*');
        $this->db->where('estatus','asistencial');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function individual()
    {
        $this->db->select('*');
        $this->db->where('estatus','individual');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function colectivo()
    {
        $this->db->select('*');
        $this->db->where('estatus','colectivo');
        $query = $this->db->get("bandeja");
        return $query->num_rows();
    }
    
    public function actualizar_bandeja($id,$data)
    {
        $this->db->where('id', $id);
        $result = $this->db->update('bandeja',$data);   
        return $result;
    }
    
    public function actualizar_bandeja2($usuario,$data)
    {
        $this->db->where('solicitante', $usuario);
        $result = $this->db->update('bandeja',$data);   
        return $result;
    }
    
    public function registrar_persona($cedula,$usuario,$data2,$data4)
    {
        
            $result = $this->db->insert('personas_twitter',$data2);
            $result = $this->db->insert('contactos',$data4);
           
        
    }
    
    public function verpersonasasociadas($usuario)
    {
        $this->db->select('contactos.cedula as cedula, 
  contactos.nombre as nombre, 
  contactos.apellido as apellido, 
  contactos.sexo as sexo');
        $this->db->where("personas_twitter.twitter", $usuario);
        $this->db->join("contactos", "contactos.cedula = personas_twitter.personas");
        $query = $this->db->get("personas_twitter");
        return $query->result();
    }
    
    public function vertwitterdepersonas($usuario)
    {
        $this->db->select('*');
        $this->db->where("personas_twitter.personas", $usuario);
        $query = $this->db->get("personas_twitter");
        return $query->result();
    }
    
    public function verTwitterAsociados($cedula)
    {
        $this->db->select('*');
        $this->db->where("cedula", $cedula);
        $query = $this->db->get("contactos");
	    return $query->row();
    }
    
    
    
    
    
    
    
}
