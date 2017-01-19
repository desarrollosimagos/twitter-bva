<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct(){
		parent::__construct();
        $this->load->library(array('twconnect'));
        $this->load->model('usuario');
   		$this->load->library('table');//-->haremos uso de tablas
		$this->load->library('Jquery_pagination');
	}
	public function index()
	{
		if($this->session->userdata('login') == true){
			$user = $this->session->userdata('tw_access_token');
			$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
			if($datos_user_db->tipo==''){
				redirect('welcome/logout');
			}else{
				redirect('welcome/bandeja');
			}
		}
		
		
		$this->load->view('welcome_message');
	}
	
	public function redirect() {

		if($this->session->userdata('login') == true){
			$user = $this->session->userdata('tw_access_token');
			$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
			if($datos_user_db->tipo==''){
				redirect('welcome/logout');
			}else{
				redirect('welcome/bandeja');
			}
		}
		
		$ok = $this->twconnect->twredirect('welcome/callback');

		if (!$ok) {
			//echo 'Could not connect to Twitter. Refresh the page or try again later.';
   			echo 'No pudimos conectar con Twitter. Por favor actualiza la pagina.';
			redirect('welcome/redirect');

		}
		
	}
	



	public function callback() {
		
		if($this->session->userdata('login') == true){
			$user = $this->session->userdata('tw_access_token');
			$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
			if($datos_user_db->tipo==''){
				redirect('welcome/logout');
			}else{
				redirect('welcome/bandeja');
			}
			
		}
		
		$ok = $this->twconnect->twprocess_callback();
		
		if ( $ok ) { redirect('welcome/success'); }
			else redirect ('welcome/failure');
			
	}
	
	
	public function buscarpostulacion($cuenta,$categoria){
		$json = file_get_contents('http://localhost/twitter.php/show.php?twitter='.$cuenta);
		$data = json_decode($json);
		if(isset($data->name)){
			$usuario = $this->session->userdata('user_profile');
			if(!$this->usuario->existe_postulacion($usuario['id'],$data->id,$categoria)){
				$visual='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title"> </div>
	                  <div class="panel-body">
	                    <div class="text-center vd_info-parent"> <img src="'.str_replace('_normal', '',$data->profile_image_url).'" width="200"> </div>
	                    <div class="row">
	                      <div class="col-xs-12"> <a class="btn vd_btn vd_bg-red btn-xs btn-block no-br">'.$data->name.'</a> </div>
	                    </div>
	                    <h2 class="font-semibold mgbt-xs-5" style="color:#000000;">'.$data->screen_name.'</h2>
	                    <input type="hidden" id="hidden_user_id" value="'.$data->id.'">
	                    <input type="hidden" id="hidden_user_name" value="'.$data->screen_name.'">
	                    <input type="button" class="btn vd_btn vd_bg-grey btn-xs btn-block no-br" value="YA FUE POSTULADO POR USTED.">
	                  </div>
	                </div></div>';
	              echo $visual;
              }else{
		          $visual='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title"> </div>
	                  <div class="panel-body">
	                    <div class="text-center vd_info-parent"> <img src="'.str_replace('_normal', '',$data->profile_image_url).'" width="200"> </div>
	                    <div class="row">
	                      <div class="col-xs-12"> <a class="btn vd_btn vd_bg-red btn-xs btn-block no-br">'.$data->name.'</a> </div>
	                    </div>
	                    <h2 class="font-semibold mgbt-xs-5" style="color:#000000;">'.$data->screen_name.'</h2>
	                    <input type="hidden" id="hidden_user_id" value="'.$data->id.'">
	                    <input type="hidden" id="hidden_user_name" value="'.$data->screen_name.'">
	                    <input type="button" id="btnpostular" onclick="enviar();"  class="btn vd_btn vd_bg-yellow btn-xs btn-block no-br" value="POSTULAR EN ESTA CATEGORIA">
	                  </div>
	                </div></div>';
	              echo $visual;    
              }
		}else{
			echo "no existe";
		}
		
	}
	
	public function procesar($id,$nombre,$categoria) {
		if($this->session->userdata('login') == true){
			$usuario = $this->session->userdata('user_profile');
			
			$json = file_get_contents('http://localhost/twitter.php/show.php?twitter='.$nombre);
			$data = json_decode($json);
			$arr = array(
			'id' => $data->id,
			'id_str' => $data->id_str,
			'name' => $data->name,
			'screen_name' => $data->screen_name,
			
			'followers_count' => $data->followers_count,
			'friends_count' => $data->friends_count,
			'listed_count' => $data->listed_count,
			
			'favourites_count' => $data->favourites_count,
			'statuses_count' => $data->statuses_count,
			
			'profile_image_url' => $data->profile_image_url,
			'profile_image_url_https' => $data->profile_image_url_https,
				
			);
			
			if($this->usuario->existe_postulado($id)){
				$this->usuario->add_postulado($arr);
			}
			if($this->usuario->existe_postulacion($usuario['id'],$id,$categoria)){
				$arr = array(
					'usuario_id' => $usuario['id'],
					'postulado_id' => $id,
					'categorias_id' => $categoria,
				);
				$this->usuario->add_postulacion($arr);
				
			}
			$json = file_get_contents('http://localhost/twitter.php/mensajes.php?mensaje=hola%20@'.$usuario['screen_name'].',%20@'.$data->screen_name.'%20te%20postulo%20para%20las%20olimpiadas%20de%20twitteros,%20quieres%20saber%20mas%20guerrilla.org.ve');
			echo "Proceso finalizado con exito";
			
			
			
		}
	}


	public function success() {

		if($this->session->userdata('login') == true){
			$user = $this->session->userdata('tw_access_token');
			$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
			if($datos_user_db->tipo==''){
				redirect('welcome/logout');
			}else{
				redirect('welcome/bandeja');
			}
			
		}
		
		$this->twconnect->twaccount_verify_credentials();

		
		$user_profile = $this->twconnect->tw_user_info;
		
		
		$this->session->set_userdata('login',true);
		

		$arr = array(
			'id' => $user_profile->id,
			'id_str' => $user_profile->id_str,
			'name' => $user_profile->name,
			'screen_name' => $user_profile->screen_name,
			'location' => $user_profile->location,
			'description' => $user_profile->description,
			'followers_count' => $user_profile->followers_count,
			'friends_count' => $user_profile->friends_count,
			'listed_count' => $user_profile->listed_count,
			'created_at' => $user_profile->created_at,
			'favourites_count' => $user_profile->favourites_count,
			'statuses_count' => $user_profile->statuses_count,
			'profile_background_color' => $user_profile->profile_background_color,
			'profile_background_image_url' => $user_profile->profile_background_image_url,
			'profile_background_image_url_https' => $user_profile->profile_background_image_url_https,
			'profile_background_tile ' => $user_profile->profile_background_tile,
			'profile_image_url' => $user_profile->profile_image_url,
			'profile_image_url_https' => $user_profile->profile_image_url_https,
			'profile_banner_url' => $user_profile->profile_banner_url,	
			);
		
		$this->session->set_userdata('user_profile',$arr);
		
		if($this->usuario->existe_usuario($user_profile->id)){
			
			$this->usuario->add_usuario($arr);
			$url=str_replace('_normal', '',$user_profile->profile_image_url);
			$contents=file_get_contents($url);
			$save_path="fotos/".$user_profile->id.".jpg";
			file_put_contents($save_path,$contents);
		}
		
		
		redirect('welcome/bandeja');
		
	}



	public function failure() {

		if($this->session->userdata('login') == true){
			$user = $this->session->userdata('tw_access_token');
			$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
			if($datos_user_db->tipo==''){
				redirect('welcome/logout');
			}else{
				redirect('welcome/bandeja');
			}
		}
		
		echo '<p>Twitter connect failed</p>';
		echo '<p><a href="' . base_url() . 'welcome/logout">Try again!</a></p>';
	}
	
	public function postular($categoria){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		$contents['user_profile'] = $this->session->userdata('user_profile');
		$contents['categorias'] =  $this->usuario->categoriasdetalle($categoria);
		$contents['listadoPostulados'] = $this->usuario->listado_ultimos_categoria($categoria);
		
		
		$this->load->view('postular',$contents);
	}
	
	public function profile(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		$contents['user_profile'] = $this->session->userdata('user_profile');
		$contents['categorias'] =  $this->usuario->categoriaslist();
		
		
		
		$this->load->view('profile',$contents);
		
	}
	
	public function bandeja(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			
			//exit;
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'bandeja');
			
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('Recibido');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		

		$this->load->view('bandeja',$contents);
		
	}
	
	public function politico(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('politico');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos() ;
		
		$contents['individual'] =  $this->usuario->cooperante();
		$contents['colectivo'] =  $this->usuario->oponente();
		
		

		$this->load->view('politico',$contents);
		
	}
	
	public function asistencial(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('asistencial');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		

		$this->load->view('asistencial',$contents);
		
	}
	
	public function individual(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('individual');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		

		$this->load->view('individual',$contents);
		
	}
	
	public function colectivo(){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('colectivo');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		

		$this->load->view('colectivo',$contents);
		
	}
	
	public function contactar($twitter){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'contactar');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('colectivo');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		$contents['twitter'] =  $twitter;
		
		
		if($this->input->post()){
			$datas = $this->input->post();
			if($this->usuario->existe_contacto($twitter)){
				$this->usuario->actualizar_contacto($twitter,$datas);
			}else{
				//$this->usuario->add_contactos($datas);
			}
		}
		
		
		
		$data = $this->usuario->verTwitterAsociados($twitter);
		//$json = file_get_contents('http://consultaelectoral.bva.org.ve/cedula='.$twitter);
		//$data = json_decode($json);
		
		
		$contents['cedula'] =  $twitter;
        $contents['twitter'] = $data->twitter;
        $contents['email'] = $data->email;
        $contents['telefono'] = $data->telefono;
        $contents['facebook'] = $data->facebook;
        $contents['direccion'] = $data->direccion;
        $contents['nombre'] = $data->nombre;
        $contents['apellido'] = $data->apellido;
        $contents['sexo'] = $data->sexo;
        $contents['estado'] = $data->estado;
        $contents['parroquia'] = $data->parroquia;
        $contents['municipio'] = $data->municipio;
        $contents['centro'] = $data->centro;
        $contents['dir_centro'] = $data->dir_centro;
		$contents['existe_datos'] = true;

		$this->load->view('contactar',$contents);
		
	}
	
	
	public function agregarpersona($twitter){
		if($this->session->userdata('login') != true){
			redirect('');
		}
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'contactar');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['user_profile'] = $this->session->userdata('user_profile');
		
		$contents['bandeja'] =  $this->usuario->bandeja('colectivo');
		
		$contents['casos'] =  $this->usuario->bandejanum();
		
		$contents['asignados'] =  (int)$this->usuario->politicos();
		
		$contents['individual'] =  $this->usuario->individual();
		
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		$contents['twitter'] =  $twitter;
		
		
		if($this->input->post()){
			$datas = $this->input->post();
			//print_r($datas);
				$this->usuario->add_contactos($datas);
				
				//exit;
				redirect('welcome/contactar/'.$twitter);
		}
		
		
		
		//$data = $this->usuario->verTwitterAsociados($twitter);
		$json = file_get_contents('http://consultaelectoral.bva.org.ve/cedula='.$twitter);
		$data = json_decode($json);
		
		//print_r($data);
		//exit;
		
		$contents['cedula'] =  $twitter;
        $contents['nombre'] = $data[0]->p_nombre . ', '.$data[0]->s_nombre;
        $contents['apellido'] = $data[0]->p_apellido . ', '.$data[0]->s_apellido ;
        $contents['sexo'] = $data[0]->sexo;
        $contents['estado'] = $data[0]->nom_estado;
        $contents['parroquia'] = $data[0]->nom_parroquia;
        $contents['municipio'] = $data[0]->nom_mun;
        $contents['centro'] = $data[0]->c_votacion;
        $contents['dir_centro'] = $data[0]->c_direccion;
		//$contents['existe_datos'] = true;

		$this->load->view('new_contactar',$contents);
		
	}
	
	
	function asignarnivel1(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$id = $this->input->post('id');
		$tipo = $this->input->post('tipo');
		$observacion = $this->input->post('observacion');
		$data = array('estatus'=>$tipo,'observacion'=>$observacion);
		$resultado = $this->usuario->actualizar_bandeja($id,$data);
		
		$contents['success']='ok';
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		echo json_encode($contents);
	}
	
	function respuestapolitica(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		$id = $this->input->post('id');
		$tipo = $this->input->post('tipo');
		$observacion = $this->input->post('observacion');
		$data = array('estatus'=>$tipo,'observacion2'=>$observacion);
		$resultado = $this->usuario->actualizar_bandeja($id,$data);
		
		$contents['success']='ok';
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  $this->usuario->politicos();
		$contents['individual'] =  $this->usuario->cooperante();
		$contents['colectivo'] =  $this->usuario->oponente();
		
		echo json_encode($contents);
	}
	
	function asignarnivel2(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$id = $this->input->post('id');
		$tipo = $this->input->post('tipo');
		$observacion = $this->input->post('observacion');
		$data = array('estatus'=>$tipo,'observacion'=>$observacion);
		$resultado = $this->usuario->actualizar_bandeja($id,$data);
		
		$contents['success']='ok';
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		echo json_encode($contents);
	}
	
	function asignardatos(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$usuario = $this->input->post('usuario');
		$cedula = $this->input->post('cedula');
		
		$data = array('cedula'=>$cedula);
		$data2 = array('personas'=>$cedula,'twitter'=>$usuario);
		
		//$resultado = $this->usuario->actualizar_bandeja2($usuario,$data);
		
		$json = file_get_contents('http://consultaelectoral.bva.org.ve/cedula='.$cedula);
		    $data3 = json_decode($json);
		    $data4 = array('cedula'=>$data3[0]->cedula,
		    'nombre'=>$data3[0]->p_nombre.', '.$data3[0]->s_nombre,
		    'apellido'=>$data3[0]->p_apellido.', '.$data3[0]->s_apellido,
		    'sexo'=>$data3[0]->sexo,
		    'estado'=>$data3[0]->nom_estado,
		    'parroquia'=>$data3[0]->nom_parroquia,
		    'municipio'=>$data3[0]->nom_mun,
		    'centro'=>$data3[0]->c_votacion,
		    'dir_centro'=>$data3[0]->c_direccion
		    );
		
		
		$resultado2 = $this->usuario->registrar_persona($cedula,$usuario,$data2,$data4);
		
		$contents['contador'] = $this->usuario->ContadordeTwitter($usuario);
		
		$contents['success']='ok';
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		$contents['resultado'] = $resultado2;
		
		$asociadas = $this->usuario->verpersonasasociadas($usuario);
        foreach ($asociadas as $listado) {
            $asoc = $this->usuario->ContadordePersonas($listado->cedula);
            
            $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/contactar/'.$listado->cedula.'">'.$listado->cedula.'</a></td><td>'.$listado->nombre.'</td><td>'.$listado->apellido.'</td><td><a href="/comando/index.php/welcome/asociados/'.$listado->cedula.'">'.$asoc.'</a></td></tr>';
        }
        
		$contents['lista'] = $lista;
		
		
		echo json_encode($contents);
	}
	
	function asignarboots(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$usuario = $this->input->post('usuario');
		$cedula = $this->input->post('cedula');
		
		$data = array('cedula'=>$cedula);
		$data2 = array('personas'=>$cedula,'twitter'=>$usuario);
		
		//$resultado = $this->usuario->actualizar_bandeja2($usuario,$data);
		
		$json = file_get_contents('http://consultaelectoral.bva.org.ve/cedula='.$cedula);
		    $data3 = json_decode($json);
		    $data4 = array('cedula'=>$data3[0]->cedula,
		    'nombre'=>$data3[0]->p_nombre.', '.$data3[0]->s_nombre,
		    'apellido'=>$data3[0]->p_apellido.', '.$data3[0]->s_apellido,
		    'sexo'=>$data3[0]->sexo,
		    'estado'=>$data3[0]->nom_estado,
		    'parroquia'=>$data3[0]->nom_parroquia,
		    'municipio'=>$data3[0]->nom_mun,
		    'centro'=>$data3[0]->c_votacion,
		    'dir_centro'=>$data3[0]->c_direccion
		    );
		
		
		$resultado2 = $this->usuario->registrar_boots($cedula,$usuario,$data2,$data4);
		
		
		
		$contents['success']='ok';
		
		
		
		echo json_encode($contents);
	}
	
	
	function asignardatos2(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$usuario = $this->input->post('usuario');
		$cedula = $this->input->post('cedula');
		
		$data = array('cedula'=>$cedula);
		$data2 = array('personas'=>$cedula,'twitter'=>$usuario);
		
		//$resultado = $this->usuario->actualizar_bandeja2($usuario,$data);
		
		$json = file_get_contents('http://consultaelectoral.bva.org.ve/cedula='.$cedula);
		    $data3 = json_decode($json);
		    $data4 = array('cedula'=>$data3[0]->cedula,
		    'nombre'=>$data3[0]->p_nombre.', '.$data3[0]->s_nombre,
		    'apellido'=>$data3[0]->p_apellido.', '.$data3[0]->s_apellido,
		    'sexo'=>$data3[0]->sexo,
		    'estado'=>$data3[0]->nom_estado,
		    'parroquia'=>$data3[0]->nom_parroquia,
		    'municipio'=>$data3[0]->nom_mun,
		    'centro'=>$data3[0]->c_votacion,
		    'dir_centro'=>$data3[0]->c_direccion
		    );
		
		
		$resultado2 = $this->usuario->registrar_persona($cedula,$usuario,$data2,$data4);
		
		$contents['contador'] = $this->usuario->ContadordeTwitter($usuario);
		
		$contents['success']='ok';
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		$contents['resultado'] = $resultado2;
		
		$asociadas = $this->usuario->verpersonasasociadas($usuario);
        foreach ($asociadas as $listado) {
            $asoc = $this->usuario->ContadordePersonas($listado->cedula);
            
            $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/contactar/'.$listado->cedula.'">'.$listado->cedula.'</a></td><td>'.$listado->nombre.'</td><td>'.$listado->apellido.'</td><td><a href="/comando/index.php/welcome/asociados/'.$listado->cedula.'">'.$asoc.'</a></td></tr>';
        }
        
		$contents['lista'] = $lista;
		echo json_encode($contents);
	}
	
	
	function asignarpermisos(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$user2 = $this->input->post('user');
		$modulo = $this->input->post('modulo');
		
		
		$tiene = $this->usuario->TienePermisosNum($user2,$modulo);
		
		if((int)$tiene > 0){
			//quitar
			$this->usuario->PermisosDelete($user2,$modulo);
			$contents['text'] = 'Agregar';
		}else{
			//agregar
			$data2 = array('twitter'=>$user2,'modulo'=>$modulo);
			$this->usuario->PermisosAdd($data2);
			$contents['text'] = 'Quitar';
		}
		
		echo json_encode($contents);
	}
	
	function asignartipouser(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$user2 = $this->input->post('user');
		
		$tiene = $this->usuario->esUsuarioTipo($user2,'Operador');
		
		if((int)$tiene > 0){
			//quitar
			$data2 = array('tipo'=>'');
			$this->usuario->actualizarDatosUsuarios($user2,$data2);
			$contents['text'] = 'Convertir en Usuario';
		}else{
			//agregar
			$data2 = array('tipo'=>'Operador');
			$this->usuario->actualizarDatosUsuarios($user2,$data2);
			$contents['text'] = 'Quitar Privilegios de Usuarios';
		}
		
		echo json_encode($contents);
	}

	
	
	function actualizarBandejas(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		echo json_encode($contents);
	}
	
	function actualizarBandejas2(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->cooperante();
		$contents['colectivo'] =  $this->usuario->oponente();
		
		echo json_encode($contents);
	}
	
	public function logout(){
		$this->session->sess_destroy();
		redirect('');
		
	}
	
	public function vercuenta($cuenta){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'vercuenta');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		$json = file_get_contents('http://puestocomandoaragua.bva.org.ve/twitter.php/show.php?twitter='.$cuenta);
		$data = json_decode($json);
		if(isset($data->name)){
			$usuario = $this->session->userdata('user_profile');
			
				$contents['visual']='<div class="col-sm-4"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Datos de la Cuenta</div>
	                  <div class="panel-body">
	                    <h2 class="font-semibold mgbt-xs-5">@'.$data->screen_name.'</h2>
	                    <div class="text-center vd_info-parent"> <img src="'.str_replace('_normal', '',$data->profile_image_url).'" width="200"> </div>
	                    <BR>
	                    <div class="row">
	                      <div class="col-xs-12"> <a class="btn btn-primary col-xs-12">'.$data->name.'</a> </div>
	                      <div class="col-xs-12">
<a href="#" class="mb-control2" data-box="#mb-identificar" onclick="identificar(\''.$data->screen_name.'\',this); return false;">
												<span class="fa fa-sign-out"></span>Asignar Persona</a>
	                      </div>
	                    </div>
	                  </div>
	                </div></div>';
	            $asociadas = $this->usuario->verpersonasasociadas($cuenta);
	            foreach ($asociadas as $listado) {
	                $asoc = $this->usuario->ContadordePersonas($listado->cedula);
	                
	                $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/contactar/'.$listado->cedula.'">'.$listado->cedula.'</a></td><td>'.$listado->nombre.'</td><td>'.$listado->apellido.'</td><td><a href="/comando/index.php/welcome/asociados/'.$listado->cedula.'">'.$asoc.'</a></td></tr>';
	            }
	            
	            $contents['visual2']='<div class="col-sm-8"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Personas Asociadas</div>
	                  <div class="panel-body">
	                    <div class="row">
	                        <table class="table"><thead>
                                    <tr>
                                        <th>Cedula</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Cuentas Asociadas</th>
                                    </tr>
                                </thead>
                                <tbody id="lista_personas">
                                    '.$lista.'
                                </tbody>
                                </table>
	                      
	                    </div>
	                  </div>
	                </div></div>';
	                
	            $contents['graficos']='<div class="col-sm-8"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Estadistica</div>
	                  <div class="panel-body">
	                    <div id="donut-grafico" style="height: 300px;"></div>
	                  </div>
	                </div></div>';
	                
	            $cooperante = $this->usuario->cooperante2($cuenta);
	            $oponente = $this->usuario->oponente2($cuenta);
	            $sinclasificar = $this->usuario->sinclasificar($cuenta);
	                
	            $contents['js_grafico']='$(document).ready(function() {
				var morrisCharts = function() {
					Morris.Donut({
				        element: \'donut-grafico\',
				        data: [
				            {label: "Cooperantes", value: '.$cooperante.'},
				            {label: "Oponentes", value: '.$oponente.'},
				            {label: "Sin clasificar", value: '.$sinclasificar.'}
				        ],
				        colors: [\'#de1f03\', \'#3FBAE4\', \'#adafb2\']
				    });
				}();
				
				
				
			} );
			
			
			';
	              
              
		}else{
			$contents['visual'] = 'Problemas con la conexion.';
		}
		//print_r($contents);
		//exit;
		$this->load->view('vercuenta',$contents);
		
	}
	
	
	public function asociados($cuenta){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo==''){
			redirect('welcome/logout');
		}
		
		
		if($datos_user_db->tipo!='Administrador'){
			//valirdar permisos
			$tiene = $this->usuario->TienePermisosNum($user['screen_name'],'asociados');
			if((int)$tiene <= 0){
				redirect('welcome/logout');
			}
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
		}else{
			$contents['menu_asistencial'] = $this->usuario->TienePermisosNum($user['screen_name'],'asistencial');
			$contents['menu_individual'] = $this->usuario->TienePermisosNum($user['screen_name'],'individual');
			$contents['menu_colectivo'] = $this->usuario->TienePermisosNum($user['screen_name'],'colectivo');
			$contents['menu_politico'] = $this->usuario->TienePermisosNum($user['screen_name'],'politico');
			$contents['menu_permisos'] = 1;
			
		}
		
		$contents['casos'] =  $this->usuario->bandejanum();
		$contents['asignados'] =  (int)$this->usuario->politicos();
		$contents['individual'] =  $this->usuario->individual();
		$contents['colectivo'] =  $this->usuario->colectivo();
		
		$data = $this->usuario->verTwitterAsociados($cuenta);
		
		if(isset($data->cedula)){
			    $contents['visual']='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  
	                  <div class="panel-body">
	                    <h2 class="font-semibold mgbt-xs-5">'.$data->cedula.'</h2>
	                    <div class="row">
	                      <div class="col-xs-12" style="color:#000000;">
	                        <b>Nombre:</b> '.$data->nombre.'<br>
	                        <b>Apellido:</b> '.$data->apellido.'<br>
	                        <b>Telefono:</b> '.$data->telefono.'<br>
	                        <b>Twitter:</b> '.$data->twitter.'<br>
	                        <b>Correo:</b> '.$data->email.'<br>
	                        <b>Facebook:</b> '.$data->facebook.'<br>
	                        <b>Direccion:</b> '.$data->direccion.'<br>
	                        <hr>
	                        <b>Estado:</b> '.$data->estado.'<br>
	                        <b>Municipio:</b> '.$data->municipio.'<br>
	                        <b>Parroquia:</b> '.$data->parroquia.'<br>
	                        <b>Centro de Votacion:</b> '.$data->centro.'<br>
	                      </div>
	                    </div>
	                  </div>
	                </div></div>';
	            $asociadas = $this->usuario->vertwitterdepersonas($cuenta);
	            foreach ($asociadas as $listado) {
	                $asoc = $this->usuario->ContadordeTwitter($listado->twitter);
	                
	                $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/vercuenta/'.$listado->twitter.'">'.$listado->twitter.'</a></td><td>'.$asoc.'</td></tr>';
	            }
	            
	            $contents['visual2']='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Cuentas Asociadas</div>
	                  <div class="panel-body">
	                    <div class="row">
	                        <table class="table"><thead>
                                    <tr>
                                        <th>Cuentas</th>
                                        <th>Personas Asociadas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    '.$lista.'
                                </tbody>
                                </table>
	                      
	                    </div>
	                  </div>
	                </div></div>';
	                
	            $contents['graficos']='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Estadistica</div>
	                  <div class="panel-body">
	                    <div id="donut-grafico" style="height: 300px;"></div>
	                  </div>
	                </div></div>';
	                
	            $cooperante = $this->usuario->cooperante3($cuenta);
	            $oponente = $this->usuario->oponente3($cuenta);
	            $sinclasificar = $this->usuario->sinclasificar3($cuenta);
	                
	            $contents['js_grafico']='$(document).ready(function() {
				var morrisCharts = function() {
					Morris.Donut({
				        element: \'donut-grafico\',
				        data: [
				            {label: "Cooperantes", value: '.$cooperante.'},
				            {label: "Oponentes", value: '.$oponente.'},
				            {label: "Sin clasificar", value: '.$sinclasificar.'}
				        ],
				        colors: [\'#de1f03\', \'#3FBAE4\', \'#adafb2\']
				    });
				}();
			} );';

	              
              
		}else{
			$contents['visual'] = 'Problemas con la conexion.';
		}
		//print_r($contents);
		//exit;
		$this->load->view('vercuenta',$contents);
		
	}
	
	public function usuarios($cuenta){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo!='Administrador'){
			redirect('welcome/logout');
		}
			
				$contents['casos'] =  $this->usuario->bandejanum();
				$contents['asignados'] =  (int)$this->usuario->politicos();
				$contents['individual'] =  $this->usuario->individual();
				$contents['colectivo'] =  $this->usuario->colectivo();
				$json = file_get_contents('http://puestocomandoaragua.bva.org.ve/twitter.php/show.php?twitter='.$cuenta);
				$data = json_decode($json);
				if(isset($data->name)){
					$usuario = $this->session->userdata('user_profile');
					
					$u = $this->usuario->usuriotipo($cuenta);
					
					if($u->tipo==''){
						$dat = '<a id="btnuser" class="btn btn-info col-xs-12" onclick="asignar2(\''.$cuenta.'\');">Convertir en Usuario</a>';
					}else{
						$dat = '<a id="btnuser" class="btn btn-info col-xs-12" onclick="asignar2(\''.$cuenta.'\');">Eliminar de los Usuarios</a>';
					}
					
						$contents['visual']='<div class="col-sm-4"><div class="panel widget light-widget panel-bd-top">
			                  <div class="panel-heading no-title" style="color:#000000;">Datos de la Cuenta</div>
			                  <div class="panel-body">
			                    <h2 class="font-semibold mgbt-xs-5">@'.$data->screen_name.'</h2>
			                    <div class="text-center vd_info-parent"> <img src="'.str_replace('_normal', '',$data->profile_image_url).'" width="200"> </div>
			                    <BR>
			                    <div class="row">
			                      <div class="col-xs-12"> <a class="btn btn-primary col-xs-12">'.$data->name.'</a> </div>
			                    </div>
			                    <div class="row">
			                      <div class="col-xs-12"> '.$dat.' </div>
			                    </div>
			                  </div>
			                </div></div>';
			            $asociadas = $this->usuario->verpersonasasociadas($cuenta);
			            foreach ($asociadas as $listado) {
			                $asoc = $this->usuario->ContadordePersonas($listado->cedula);
			                
			                $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/contactar/'.$listado->cedula.'">'.$listado->cedula.'</a></td><td>'.$listado->nombre.'</td><td>'.$listado->apellido.'</td><td><a href="/comando/index.php/welcome/asociados/'.$listado->cedula.'">'.$asoc.'</a></td></tr>';
			            }
			            
			            $contents['visual2']='<div class="col-sm-12"><div class="panel widget light-widget panel-bd-top">
			                  <div class="panel-heading no-title" style="color:#000000;">Personas Asociadas</div>
			                  <div class="panel-body">
			                    <div class="row">
			                        <table class="table"><thead>
		                                    <tr>
		                                        <th>Cedula</th>
		                                        <th>Nombre</th>
		                                        <th>Apellido</th>
		                                        <th>Cuentas Asociadas</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    '.$lista.'
		                                </tbody>
		                                </table>
			                      
			                    </div>
			                  </div>
			                </div></div>';
			                
			            $contents['graficos']='<div class="col-sm-8"><div class="panel widget light-widget panel-bd-top">
			                  <div class="panel-heading no-title" style="color:#000000;">Estadistica</div>
			                  <div class="panel-body">
			                    <div id="donut-grafico" style="height: 300px;"></div>
			                  </div>
			                </div></div>';
			                
			            $cooperante = $this->usuario->cooperante2($cuenta);
			            $oponente = $this->usuario->oponente2($cuenta);
			            $sinclasificar = $this->usuario->sinclasificar($cuenta);
			                
			            $contents['js_grafico']='$(document).ready(function() {
						var morrisCharts = function() {
							Morris.Donut({
						        element: \'donut-grafico\',
						        data: [
						            {label: "Cooperantes", value: '.$cooperante.'},
						            {label: "Oponentes", value: '.$oponente.'},
						            {label: "Sin clasificar", value: '.$sinclasificar.'}
						        ],
						        colors: [\'#de1f03\', \'#3FBAE4\', \'#adafb2\']
						    });
						}();
					} );
					function asignar(user,modulo){ 
					 
					  $.post( "'.base_url().'index.php/welcome/asignarpermisos", { user:user,modulo:modulo},function( data ) {
						  $(\'#m_\'+modulo).text(data.text);
						},\'json\');
					}
					
					function asignar2(user){ 
					 
					  $.post( "'.base_url().'index.php/welcome/asignartipouser", { user:user},function( data ) {
						  $(\'#btnuser\').text(data.text);
						},\'json\');
					}

					
					';
					
					$listaModulos = $this->usuario->ListaModulos();
			           foreach ($listaModulos as $listado) {
			           		$tiene = $this->usuario->TienePermisos($cuenta,$listado->nombre);
			           		if((int)$tiene > 0){
			           			$mt = '<a onclick="asignar(\''.$cuenta.'\',\''.$listado->nombre.'\');" id="m_'.$listado->nombre.'">Quitar</a>';
			           		}else{
				           		$mt = '<a onclick="asignar(\''.$cuenta.'\',\''.$listado->nombre.'\');" id="m_'.$listado->nombre.'">Agregar</a>';
			           		}
			                $lista = $lista . '<tr><td>'.$listado->id.'</td><td>'.$listado->nombre.'</td><td>'.$mt.'</td></tr>';
			            }
			            
			            $contents['visual3']='<div class="col-sm-12"><div class="panel widget light-widget panel-bd-top">
			                  <div class="panel-heading no-title" style="color:#000000;">Permisos</div>
			                  <div class="panel-body">
			                    <div class="row">
			                        <table class="table"><thead>
		                                    <tr>
		                                        <th>Id</th>
		                                        <th>Modulo</th>
		                                        <th>Permisos</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    '.$lista.'
		                                </tbody>
		                                </table>
			                      
			                    </div>
			                  </div>
			                </div></div>';
			              
		              
				}else{
					$contents['visual'] = 'Problemas con la conexion.';
				}
				//print_r($contents);
				//exit;
				$this->load->view('vercuenta',$contents);
			
		
	}
	
	public function usuarioslista(){
		$user = $this->session->userdata('tw_access_token');
		$datos_user_db = $this->usuario->usuriotipo($user['screen_name']);
		if($datos_user_db->tipo!='Administrador'){
			redirect('welcome/logout');
		}
		
				$contents['casos'] =  $this->usuario->bandejanum();
				$contents['asignados'] =  (int)$this->usuario->politicos();
				$contents['individual'] =  $this->usuario->individual();
				$contents['colectivo'] =  $this->usuario->colectivo();
				
				$listaUsuarios = $this->usuario->ListaUsuarios();
	            foreach ($listaUsuarios as $listado) {
	                $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/usuarios/'.$listado->screen_name.'">'.$listado->id_str.'</a></td><td>'.$listado->screen_name.'</td><td>'.$listado->tipo.'</td></tr>';
	            }
	            
	            $contents['visual2']='<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
	                  <div class="panel-heading no-title" style="color:#000000;">Listado de Usuarios</div>
	                  <div class="panel-body">
	                    <div class="row">
	                        <table class="table"><thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>screen_name</th>
                                        <th>tipo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    '.$lista.'
                                </tbody>
                                </table>
	                      
	                    </div>
	                  </div>
	                </div></div>';
			              
		              
				
				//print_r($contents);
				//exit;
				$this->load->view('vercuenta',$contents);
			
	}
	
	public function buscadores(){
	    if($this->input->post()){
	        $contents['casos'] =  $this->usuario->bandejanum();
			$contents['asignados'] =  (int)$this->usuario->politicos();
			$contents['individual'] =  $this->usuario->individual();
			$contents['colectivo'] =  $this->usuario->colectivo();
			
			$datas = $this->input->post('buscar');
			//echo $datas;
			//exit;
			$listaUsuarios = $this->usuario->buscadorPersonas($datas);
			
            foreach ($listaUsuarios as $listado) {
                $lista = $lista . '<tr><td><a href="/comando/index.php/welcome/contactar/'.$listado->cedula.'">'.$listado->cedula.'</a>
                </td><td>'.$listado->nombre.'</td></tr>';
            }
			
			$contents['visual2']='
			<div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
              <div class="panel-heading no-title" style="color:#000000;">Resultados Personas</div>
              <div class="panel-body">
                <div class="row">
                    <table class="table"><thead>
                            <tr>
                                <th>Cedula</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                            '.$lista.'
                        </tbody>
                        </table>
                  <a id="btnuser" href="'.base_url().'index.php/welcome/agregarpersona/'.$datas.'" class="btn btn-info col-xs-12">Agregar Nuevo</a>
                </div>
              </div>
            </div></div>
            
            <div class="col-sm-6"><div class="panel widget light-widget panel-bd-top">
              <div class="panel-heading no-title" style="color:#000000;">Resultados Cuentas Twitter</div>
              <div class="panel-body">
                <div class="row">
                    <table class="table"><thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                        </table>
                  <a id="btnuser" href="'.base_url().'index.php/welcome/vercuenta/'.$datas.'" class="btn btn-info col-xs-12">Agregar Cuenta Twitter</a>
                </div>
              </div>
            </div></div>';
			
			
			$this->load->view('vercuenta',$contents);
		}else{
		    echo "No paso";
		}
	    
	}
}
