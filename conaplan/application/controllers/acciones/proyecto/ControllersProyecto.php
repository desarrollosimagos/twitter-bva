<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ControllersProyecto
 *
 * @author ING: Jesus Laya
 */
class ControllersProyecto extends CI_Controller {

	//put your code here

	public function __construct() {
		parent::__construct();
		$this->load->model('acciones/proyecto/ModelProyecto'); # Llamado a el modelo de Plan de gobierno
		$this->load->model('entes/ModelEntes'); # Llamado a el modelo de Entes
	}

	public function index() {
		$datos['list_proy_registro'] = $this->ModelEntes->listar('proyecto_registro');
		$datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
		$datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
		$this->load->view("base/Base", $datos);
		$this->load->view("acciones/proyecto/ViewLista", $datos);
	}

	public function ultimo_id() {
		$result = $this->ModelStandard->count_all_table_all('proyecto_registro');
		$codigo = str_pad((int) $result->id + (int) 1, (int) 5, '0', STR_PAD_LEFT);
		echo json_encode($codigo);
	}

	public function nuevo() {
		$datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
		$datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
		$datos['organos'] = $this->ModelEntes->listar('organos_entes');
		$datos['acc_centralizada'] = $this->ModelEntes->listar('accion_centralizada');
		$datos['plan_patria'] = $this->ModelEntes->listar('plan_patria');
		$datos['plan_gobierno'] = $this->ModelEntes->listar('plan_gobierno');
		$datos['sectores'] = $this->ModelEntes->listar('sectores');
		$this->load->view("base/Base", $datos);
		$this->load->view("acciones/proyecto/ViewAdd", $datos);
	}

	public function guardar() {

		if ($this->input->post('fecha_revision') == "") {
			$fecha_revision = NULL;
		}

		if ($this->input->post('acc_institucion') == "") {
			$acc_institucion = NULL;
		} else {
			$acc_institucion = $this->input->post('acc_institucion');
		}

		if ($this->input->post('con_institucion') == "") {
			$con_institucion = NULL;
		} else {
			$con_institucion = $this->input->post('con_institucion');
		}

		if ($this->input->post('en_institucion') == "") {
			$en_institucion = NULL;
		} else {
			$en_institucion = $this->input->post('en_institucion');
		}

		$inicio = explode('/', $this->input->post('inicio'));
		$fin = explode('/', $this->input->post('fin'));
		$inicio = $inicio[2] . "-" . $inicio[1] . "-" . $inicio[0];
		$fin = $fin[2] . "-" . $fin[1] . "-" . $fin[0];

		$query = "SELECT a.id + 1 AS id FROM proyecto_registro AS a ORDER BY a.id DESC LIMIT 1";
		$cod = $this->ModelStandard->query_set($query, 'row');
		$codigo = str_pad($cod->id, (int) 9, '0', STR_PAD_LEFT);

		$array = array(
			'codigo' => $codigo,
			'fecha_elaboracion' => $this->input->post('fecha_elaboracion'),
			'reg_registro' => $this->input->post('reg_registro'),
			'estatus' => $this->input->post('estatus'),
			'ente' => $this->input->post('ente'),
			'domicilio' => $this->input->post('domicilio'),
			'cargo' => $this->input->post('cargo'),
			'tlf' => $this->input->post('tlf'),
			'responsable' => $this->input->post('responsable'),
			'correo' => $this->input->post('correo'),
			'nom_proyecto' => $this->input->post('nom_proyecto'),
			'ubicacion' => $this->input->post('ubicacion'),
			'inicio' => $inicio,
			'fin' => $fin,
			'f_financiamiento' => $this->input->post('f_financiamiento'),
			'ano_fiscal' => $this->input->post('ano_fiscal'),
			'indicador_g' => $this->input->post('indicador_g'),
			'duracion' => $this->input->post('duracion'),
			'identificador' => $this->input->post('identificador'),
			'etapa' => $this->input->post('etapa'),
			'm_verificacion' => $this->input->post('m_verificacion'),
			'ambito' => $this->input->post('ambito'),
			'especifique_amb' => $this->input->post('especifique_amb'),
			'plan_patria' => $this->input->post('plan_patria'),
			'objetivo_historico' => $this->input->post('objetivo_historico'),
			'objetivo_nacional' => $this->input->post('objetivo_nacional'),
			'objetivo_estrategico' => $this->input->post('objetivo_estrategico'),
			'objetivo_general' => $this->input->post('objetivo_general'),
			'plan_gobierno' => $this->input->post('plan_gobierno'),
			'linea_estrategica' => $this->input->post('linea_estrategica'),
			'area_inversion' => $this->input->post('area_inversion'),
			'sector' => $this->input->post('sector'),
			'tipo_inversion' => $this->input->post('tipo_inversion'),
			'desc_problema' => $this->input->post('desc_problema'),
			'obj_general' => $this->input->post('obj_general'),
			'imp_impacto' => $this->input->post('imp_impacto'),
			'ben_femeninos' => $this->input->post('ben_femeninos'),
			'ben_masculinos' => $this->input->post('ben_masculinos'),
			'total_ben' => $this->input->post('total_ben'),
			'req_acciones' => $this->input->post('req_acciones'),
			'acc_institucion' => $acc_institucion,
			'acc_especifique' => $this->input->post('acc_especifique'),
			'con_acciones' => $this->input->post('con_acciones'),
			'con_institucion' => $con_institucion,
			'con_especifique' => $this->input->post('con_especifique'),
			'en_acciones' => $this->input->post('en_acciones'),
			'en_institucion' => $en_institucion,
			'en_especifique' => $this->input->post('en_especifique'),
			'estimado_fem' => $this->input->post('estimado_fem'),
			'estimado_mas' => $this->input->post('estimado_mas'),
			'estimado_t_direc' => $this->input->post('estimado_t_direc'),
			'estimado_t_indirec' => $this->input->post('estimado_t_indirec'),
			'fecha_revision' => $fecha_revision,
			'descripcion_proy' => $this->input->post('descripcion_proy'),
			'cierre' => 1,
			'accion' => 1,
		);

		$result = $this->ModelProyecto->insertar($array);
		// =========================================================================
		// Proceso de bitacora
		// =========================================================================
		$time = "%h:%i %a"; // Se captura la hora actual
		$datos = array(
			'modulo' => 'REGISTRO DE ANTE PROYECTO (TABLA proyecto_registro)',
			'accion' => 'NUEVO INGRESO DE REGISTRO DE ANTE PROYECTO',
			'id_usuario' => $this->session->userdata['logged_in']['id'],
			'fecha_registro' => date('Y-m-d', now()),
			'fecha_actualizacion' => NULL,
			'hora_registro' => mdate($time),
			'hora_actualizacion' => NULL,
			'ip' => $_SERVER['REMOTE_ADDR'],
		);
		$result = $this->ModelStandard->bitacora($datos);
		// =========================================================================
	}

	public function modificar() {
		if ($this->input->post('acc_institucion') == "") {
			$acc_institucion = NULL;
		} else {
			$acc_institucion = $this->input->post('acc_institucion');
		}

		if ($this->input->post('con_institucion') == "") {
			$con_institucion = NULL;
		} else {
			$con_institucion = $this->input->post('con_institucion');
		}

		if ($this->input->post('en_institucion') == "") {
			$en_institucion = NULL;
		} else {
			$en_institucion = $this->input->post('en_institucion');
		}

		$array = array(
			'codigo' => $this->input->post('codigo'),
			'fecha_elaboracion' => $this->input->post('fecha_elaboracion'),
			'reg_registro' => $this->input->post('reg_registro'),
			'estatus' => $this->input->post('estatus'),
			'ente' => $this->input->post('ente'),
			'domicilio' => $this->input->post('domicilio'),
			'cargo' => $this->input->post('cargo'),
			'tlf' => $this->input->post('tlf'),
			'responsable' => $this->input->post('responsable'),
			'correo' => $this->input->post('correo'),
			'nom_proyecto' => $this->input->post('nom_proyecto'),
			'ubicacion' => $this->input->post('ubicacion'),
			'inicio' => $this->input->post('inicio'),
			'fin' => $this->input->post('fin'),
			'f_financiamiento' => $this->input->post('f_financiamiento'),
			'ano_fiscal' => $this->input->post('ano_fiscal'),
			'indicador_g' => $this->input->post('indicador_g'),
			'duracion' => $this->input->post('duracion'),
			'identificador' => $this->input->post('identificador'),
			'etapa' => $this->input->post('etapa'),
			'm_verificacion' => $this->input->post('m_verificacion'),
			'ambito' => $this->input->post('ambito'),
			'especifique_amb' => $this->input->post('especifique_amb'),
			'plan_patria' => $this->input->post('plan_patria'),
			'objetivo_historico' => $this->input->post('objetivo_historico'),
			'objetivo_nacional' => $this->input->post('objetivo_nacional'),
			'objetivo_estrategico' => $this->input->post('objetivo_estrategico'),
			'objetivo_general' => $this->input->post('objetivo_general'),
			'plan_gobierno' => $this->input->post('plan_gobierno'),
			'linea_estrategica' => $this->input->post('linea_estrategica'),
			'area_inversion' => $this->input->post('area_inversion'),
			'sector' => $this->input->post('sector'),
			'tipo_inversion' => $this->input->post('tipo_inversion'),
			'desc_problema' => $this->input->post('desc_problema'),
			'obj_general' => $this->input->post('obj_general'),
			'imp_impacto' => $this->input->post('imp_impacto'),
			'ben_femeninos' => $this->input->post('ben_femeninos'),
			'ben_masculinos' => $this->input->post('ben_masculinos'),
			'total_ben' => $this->input->post('total_ben'),
			'req_acciones' => $this->input->post('req_acciones'),
			'acc_institucion' => $acc_institucion,
			'acc_especifique' => $this->input->post('acc_especifique'),
			'con_acciones' => $this->input->post('con_acciones'),
			'con_institucion' => $con_institucion,
			'con_especifique' => $this->input->post('con_especifique'),
			'en_acciones' => $this->input->post('en_acciones'),
			'en_institucion' => $en_institucion,
			'en_especifique' => $this->input->post('en_especifique'),
			'estimado_fem' => $this->input->post('estimado_fem'),
			'estimado_mas' => $this->input->post('estimado_mas'),
			'estimado_t_direc' => $this->input->post('estimado_t_direc'),
			'estimado_t_indirec' => $this->input->post('estimado_t_indirec'),
			'descripcion_proy' => $this->input->post('descripcion_proy'),
			'cierre' => 1,
			'accion' => 2,
		);

		$result = $this->ModelProyecto->actualizar($array);
		// =========================================================================
		// Proceso de bitacora
		// =========================================================================
		$time = "%h:%i %a"; // Se captura la hora actual
		$datos = array(
			'modulo' => 'REGISTRO DE ANTE PROYECTO (TABLA proyecto_registro)',
			'accion' => 'NUEVA ACTUALIZACIÓN DE REGISTRO DE ANTE PROYECTO',
			'id_usuario' => $this->session->userdata['logged_in']['id'],
			'fecha_registro' => NULL,
			'fecha_actualizacion' => date('Y-m-d', now()),
			'hora_registro' => NULL,
			'hora_actualizacion' => mdate($time),
			'ip' => $_SERVER['REMOTE_ADDR'],
		);
		$result = $this->ModelStandard->bitacora($datos);
		// =========================================================================
	}

	public function procesar_list($codigo) {
		$datos['row'] = $this->ModelProyecto->datos($codigo);
		$id = $datos['row']->id;
		$datos['lista_modulo'] = $this->ModelEntes->listar_table('modulo');
		$datos['lista_sub_modulo'] = $this->ModelEntes->listar_table('sub_modulo');
		$datos['codigo'] = $this->ModelStandard->count_all_table('proyecto_registro');
		$datos['organos'] = $this->ModelEntes->listar('organos_entes');
		$datos['acc_centralizada'] = $this->ModelEntes->listar('accion_centralizada');
		$datos['plan_patria'] = $this->ModelEntes->listar('plan_patria');
		$datos['plan_gobierno'] = $this->ModelEntes->listar('plan_gobierno');
		$datos['sectores'] = $this->ModelEntes->listar('sectores');
		$datos['distribucion_acc'] = $this->ModelStandard->search('pk', 'distribucion_acc_especifica', $id);
		$datos['dist_tri_acc'] = $this->ModelStandard->join_table('distribucion_acc_especifica a', 'distribucion_trimestral_acc_especifica b', 'a.id', 'b.id_acc', 'b.pk', $id);
		// Proceso de Busqueda multiple de tablas
		$select = 'd.id,p.codigo,p.partida_presupuestaria,d.denominacion,d.trimestre_i,d.trimestre_ii,d.trimestre_iii,d.trimestre_iv,d.cantidad,d.asignacion';
		$datos['distribucion_imp'] = $this->ModelStandard->join_table_select('distribucion_trimestral_imp_pre d', 'partida_presupuestaria p', 'd.denominacion', 'p.id', 'd.pk', $id, $select);
		$datos['partida'] = $this->ModelEntes->listar('partida_presupuestaria');
		$this->load->view("base/Base", $datos);
		$this->load->view('acciones/proyecto/ViewUpdate', $datos);
	}

	public function delete($id) {
		$result = $this->ModelProyecto->eliminar($id);
		if ($result) {
			redirect('acciones/proyecto/ControllersProyecto');
		}
	}

	// Método publico para traer las lineas estrategicas segun la asociacion con el plan de la nacion
	public function ajax_search($id) {
		#Campo                  #Tabla              ID
		$result = $this->ModelStandard->search('accion_centralizada', 'accion_especifica', $id);
		echo json_encode($result);
	}

	// Método para cargar las partidas presupuestarias asociados a la acción centralizada
	public function cargar($P, $id) {
		# Se retorna los datos de las acciones especificas segun el tipo de accion centralizada
		if ($P == "1") {
			$dato = explode('-', $id);
			$id = $dato[0];

			if ($dato[4] == "") {
				$I = null;
			} else {
				$I = $dato[4];
			}
			if ($dato[5] == "") {
				$II = null;
			} else {
				$II = $dato[5];
			}
			if ($dato[6] == "") {
				$III = null;
			} else {
				$III = $dato[6];
			}
			if ($dato[7] == "") {
				$IV = null;
			} else {
				$IV = $dato[7];
			}
			if ($dato[8] == "") {
				$total = null;
			} else {
				$total = $dato[8];
			}

			$datos = array(
				'acc_esp' => urldecode($dato[1]),
				'unidad_medida' => urldecode($dato[2]),
				'medio_verificacion' => urldecode($dato[3]),
				'trimestre_i' => $I,
				'trimestre_ii' => $II,
				'trimestre_iii' => $III,
				'trimestre_iv' => $IV,
				'total' => $total,
			);

			$result = $this->ModelProyecto->procesar('2', $id, $datos);

			# Proceso para el registro de una las Acciones Especificas / Metas Financieras
		} else if ($P == "2") {

			$result = $this->ModelProyecto->procesar('1', '0', $this->input->post());

			if ($result) {
				redirect('acciones/proyecto/ControllersProyecto/procesar_list/' . $id);
			}
			# Proceso para la actualización de las Distribución Trimestral
		} else if ($P == "3") {
			$dato = explode('-', $id);
			$id = $dato[0];

			if ($dato[1] == "") {
				$I = null;
			} else {
				$I = $dato[1];
			}
			if ($dato[2] == "") {
				$II = null;
			} else {
				$II = $dato[2];
			}
			if ($dato[3] == "") {
				$III = null;
			} else {
				$III = $dato[3];
			}
			if ($dato[4] == "") {
				$IV = null;
			} else {
				$IV = $dato[4];
			}
			if ($dato[5] == "") {
				$total = null;
			} else {
				$total = $dato[5];
			}

			$datos = array(
				'trimestre_i' => $I,
				'trimestre_ii' => $II,
				'trimestre_iii' => $III,
				'trimestre_iv' => $IV,
				'total' => $total,
			);
			$result = $this->ModelProyecto->procesar('3', $id, $datos);

			# Proceso para el registro de una imputacion presupuestaria
		} else if ($P == "4") {
			$id = $this->input->post('pk');

			if ($this->input->post('asignacion') == "") {
				$asignacion = null;
			} else {
				$asignacion = $this->input->post('asignacion');
			}

			$datos = array(
				'denominacion' => $this->input->post('denominacion'),
				'trimestre_i' => $this->input->post('trimestre_i'),
				'trimestre_ii' => $this->input->post('trimestre_ii'),
				'trimestre_iii' => $this->input->post('trimestre_iii'),
				'trimestre_iv' => $this->input->post('trimestre_iv'),
				'cantidad' => $this->input->post('cantidad'),
				'asignacion' => $asignacion,
				'pk' => $id,
			);
			$result = $this->ModelProyecto->procesar('4', $id, $datos);

			# Proceso para la actualizacion de los montos trimestrales de la Imputacion Presupuestaria
		} else if ($P == "5") {

			$dato = explode('-', $id);
			$id = $dato[0];

			if ($dato[6] == "") {
				$asignacion = null;
			} else {
				$asignacion = $dato[6];
			}

			$datos = array(
				'trimestre_i' => $dato[1],
				'trimestre_ii' => $dato[2],
				'trimestre_iii' => $dato[3],
				'trimestre_iv' => $dato[4],
				'cantidad' => $dato[5],
				'asignacion' => $asignacion,
			);
			$result = $this->ModelProyecto->procesar('5', $id, $datos);

			# Proceso para la captura de las actividades segun el id principal del registro
		} else if ($P == "6") {
			#CampoA      CampoB        Tabla                     IDA   IDB
			$result = $this->ModelStandard->search_multiple_two('programado', 'id_acc_reg', 'distribucion_actividad', 'True', $id);
			$result = $this->ModelProyecto->insert_act_trimestral($result);
		} else if ($P == "7") {

			$dato = explode('-', $id);

			if ($dato[1] == "") {
				$trimestre_i = null;
			} else {
				$trimestre_i = $dato[1];
			}
			if ($dato[2] == "") {
				$trimestre_ii = null;
			} else {
				$trimestre_ii = $dato[2];
			}
			if ($dato[3] == "") {
				$trimestre_iii = null;
			} else {
				$trimestre_iii = $dato[3];
			}
			if ($dato[4] == "") {
				$trimestre_iv = null;
			} else {
				$trimestre_iv = $dato[4];
			}
			if ($dato[5] == "") {
				$total = null;
			} else {
				$total = $dato[5];
			}

			$id_act = $dato[0];
			$array = array(
				'trimestre_i' => $trimestre_i,
				'trimestre_ii' => $trimestre_ii,
				'trimestre_iii' => $trimestre_iii,
				'trimestre_iv' => $trimestre_iv,
				'total' => $total,
			);
			$result = $this->ModelProyecto->procesar('4', $id_act, $array);
		} else if ($P == "8") {

			$dato = explode('-', $id);

			if ($dato[1] == "") {
				$trimestre_i = null;
			} else {
				$trimestre_i = $dato[1];
			}
			if ($dato[2] == "") {
				$trimestre_ii = null;
			} else {
				$trimestre_ii = $dato[2];
			}
			if ($dato[3] == "") {
				$trimestre_iii = null;
			} else {
				$trimestre_iii = $dato[3];
			}
			if ($dato[4] == "") {
				$trimestre_iv = null;
			} else {
				$trimestre_iv = $dato[4];
			}
			if ($dato[5] == "") {
				$total = null;
			} else {
				$total = $dato[5];
			}

			$id_act = $dato[0];
			$array = array(
				'trimestre_i' => $trimestre_i,
				'trimestre_ii' => $trimestre_ii,
				'trimestre_iii' => $trimestre_iii,
				'trimestre_iv' => $trimestre_iv,
				'total' => $total,
			);
			$result = $this->ModelProyecto->procesar('5', $id_act, $array);
		} else if ($P == "9") {

			$dato = explode('-', $id);

			if ($dato[1] == "") {
				$trimestre_i = null;
			} else {
				$trimestre_i = $dato[1];
			}
			if ($dato[2] == "") {
				$trimestre_ii = null;
			} else {
				$trimestre_ii = $dato[2];
			}
			if ($dato[3] == "") {
				$trimestre_iii = null;
			} else {
				$trimestre_iii = $dato[3];
			}
			if ($dato[4] == "") {
				$trimestre_iv = null;
			} else {
				$trimestre_iv = $dato[4];
			}
			if ($dato[5] == "") {
				$cantidad = null;
			} else {
				$cantidad = $dato[5];
			}
			if ($dato[6] == "") {
				$monto = null;
			} else {
				$monto = $dato[6];
			}

			$id_act = $dato[0];

			$array = array(
				'trimestre_i' => $trimestre_i,
				'trimestre_ii' => $trimestre_ii,
				'trimestre_iii' => $trimestre_iii,
				'trimestre_iv' => $trimestre_iv,
				'cantidad' => $cantidad,
				'monto' => $monto,
			);

			$result = $this->ModelProyecto->procesar('7', $id_act, $array);
		}
	}

	// Método publico para traer de forma dinamica los valores para la sumatoria
	public function search_table($campo, $table, $id) {
		#Campo  Tabla   ID
		$result = $this->ModelStandard->search($campo, $table, $id);
		echo json_encode($result);
	}

	// Método publico para traer las lineas estrategicas segun la asociacion con el plan de la nacion
	public function ajax_search_lineas_e_planG($id) {
		#Campo         #Tabla                #ID
		$result = $this->ModelStandard->search('plan_gobierno', 'linea_estrategica', $id);
		echo json_encode($result);
	}

	// Método publico para traer el objetivo general segun la asociacion con el plan de la patria, Objetivo historico, Objetivo Nacional, Objetivo Estrategico
	public function ajax_search_multiple_four($idA, $idB, $idC, $idD) {
		#CampoA        CampoB                CampoC              CampoD                Tabla               #IDA  IDB   IDC   IDD
		$result = $this->ModelStandard->search_multiple_four('plan_patria', 'objetivo_historico', 'objetivo_nacional', 'objetivo_estrategico', 'objetivo_general', $idA, $idB, $idC, $idD);
		echo json_encode($result);
	}

}
