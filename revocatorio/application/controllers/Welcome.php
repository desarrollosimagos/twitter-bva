<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct(){
		parent::__construct();
        $this->load->model('Mfirmantes');
        $this->load->model('usuario');

	}
	public function index2()
	{
	   $listado = $this->Mfirmantes->registro_electoral();
	   foreach($listado as $li){
           $cedula = $li->cedula;
           $lineas = file('http://www.cne.gob.ve/web/registro_electoral/firmantes.php?nacionalidad=V&cedula='.$cedula);
           $cedula_confirmacion="";
           $firmo_si_no ="";
           $mensaje="";
           foreach ($lineas as $num_linea => $linea) {
                if($num_linea=='25'){
                    $firmo_si_no = $linea;
                }
                
                if($num_linea=='32'){
                    $cedula_confirmacion = $linea;
                }
                
                if($num_linea=='45'){
                    $mensaje = $linea;
                }
            }
            $data = array('cedula'=>$cedula,'firmo'=>'','texto'=>$firmo_si_no,'texto2'=>$mensaje);
            print_r($data);
            $this->Mfirmantes->agregar($data);
        }
        
	}
	
	public function index()
    {   
       $listado = $this->Mfirmantes->registro_electoral();
       foreach($listado as $li){
            $cedula = $li->cedula;
           
            $json = file_get_contents('http://www.cne.gob.ve/web/registro_electoral/firmantes.php?nacionalidad=V&cedula='.$cedula);

            $pos = strpos($json, '<strong>NO FIRMANTE</strong>');
            $pos2 = strpos($json, '<strong>NO ENCONTRADA</strong>');

           if (((int)$pos > 0) || ((int)$pos2 > 0)) {
                $data = array('cedula'=>$cedula,'firmo'=>'NO','texto'=>'','texto2'=>'');
                $this->Mfirmantes->agregar2($data);
                
           }else{
           		
                $data = array('cedula'=>$cedula,'firmo'=>'SI','texto'=>'','texto2'=>'');
                $this->Mfirmantes->agregar($data);
           }
           //$data = array('cedula'=>$cedula,'firmo'=>'NO','texto'=>'NO','texto2'=>'NO');
           
           //
        }
    }
    
    public function index3($numero, $limite){
	   $listado = $this->Mfirmantes->registro_electoral2($numero, $limite);
       foreach($listado as $li){
            $cedula = $li->cedula;
           
            $json = file_get_contents('http://www.cne.gob.ve/web/registro_electoral/firmantes.php?nacionalidad=V&cedula='.$cedula);

            $pos = strpos($json, '<strong>NO FIRMANTE</strong>');
            $pos2 = strpos($json, '<strong>NO ENCONTRADA</strong>');

           if (((int)$pos > 0) || ((int)$pos2 > 0)) {
                $data = array('cedula'=>$cedula,'firmo'=>'NO','texto'=>'','texto2'=>'');
                $this->Mfirmantes->agregar2($data);
                
           }else{
           		
                $data = array('cedula'=>$cedula,'firmo'=>'SI','texto'=>'','texto2'=>'');
                $this->Mfirmantes->agregar($data);
           }
           //$data = array('cedula'=>$cedula,'firmo'=>'NO','texto'=>'NO','texto2'=>'NO');
           
           //
        } 
    }
    
    
    public function ver(){
	    $contents['si'] = $this->Mfirmantes->ver_si();
	    $contents['no'] = $this->Mfirmantes->ver_no();
	    //echo 'Firmantes: '.$si;
	    //echo '<br>No Encontrados o No Firmantes: '.$no; 
	    if($this->input->post()){
			$datas = $this->input->post();
			$contents['resultado'] = $this->Mfirmantes->consulta($datas);
			$contents['resultado2'] = $this->Mfirmantes->consulta($contents['resultado']->cedula);
			//print_r($resultado);
			//exit;
		}
	    
	    $this->load->view('welcome_message',$contents);
    }
    
    
	
	
	
	
}
