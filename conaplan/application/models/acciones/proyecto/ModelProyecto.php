<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ModelPrueba
 *
 * @author jesus
 */
class ModelProyecto extends CI_Model
{

    //put your code here

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    // Metodo publico, forma de insertar los datos
    public function insertar($datos)
    {
        $result = $this->db->where('nom_proyecto =', $datos['nom_proyecto']);
        $result = $this->db->get('proyecto_registro');

        if ($result->num_rows() > 0) {
            #echo "CORRECTO";
            echo 'existe';
        } else {
        $result = $this->db->insert("proyecto_registro", $datos);
        return $result;
        }
    }

    // Metodo publico, forma de actualizar los datos
    public function actualizar($datos)
    {
        $result = $this->db->where('codigo', $datos['codigo']);
        $result = $this->db->update('proyecto_registro', $datos);
        return $result;
    }

    // Metodo publico, forma de eliminar los datos
    public function eliminar($id)
    {
        /* $result = $this->db->where('sector =', $id);
          $result = $this->db->get('organos_entes');

          if ($result->num_rows() > 0) {
          #echo "CORRECTO";
          echo 'existe';
          } else { */

        $result = $this->db->where('id', $id);
        $result = $this->db->delete('proyecto_registro');
        return $result;
        /* } */
    }

    public function detailList($table)
    {
        return $this->db->count_all($table);
    }

    public function datos($codigo)
    {
        $this->db->where('codigo', $codigo);
        $query = $this->db->get('proyecto_registro');
        return $query->row();
    }
    
    // Metodo publico, forma de insertar las actividades para la asociacion de la accion
    public function procesar($P,$id,$datos)
    {   
        // Se registra las Acciones especificas como tambien de forma automatica se carga las Metas financieras
        if($P == "1"){
            $result = $this->db->where('acc_esp =', $datos['acc_esp']);
            $result = $this->db->get('distribucion_acc_especifica');

            if ($result->num_rows() > 0) {
                echo '1';
            } else {
            // Se insertan la distribucion de las Acciones Especificas
            $this->db->insert('distribucion_acc_especifica', $datos);
            
            // Se registra las Acciones Especificas trimestrales para la pre-carga de los montos
            $result = $this->db->where('pk =', $datos['pk']);
            $result = $this->db->get('distribucion_acc_especifica');
            foreach ($result->result() as $row){
                $id_acc = $row->id;
                $pk     = $row->pk;

                $result = $this->db->where('id_acc =', $id_acc);
                $result = $this->db->get('distribucion_trimestral_acc_especifica');
                if ($result->num_rows() > 0) {
                    echo "existe";
                }else if ($result->num_rows() == "") {
                    $array = array(
                        'id_acc' => $id_acc,
                        'pk'  => $pk,
                    );
                    $this->db->insert("distribucion_trimestral_acc_especifica", $array);
                }
            }
            }
        }else if($P == "2"){
            /*print_r($datos);
            return true;*/
            $result = $this->db->where('id', $id);
            $result = $this->db->update('distribucion_acc_especifica', $datos);
            return $result;
        // Proceso de actualizacion de la Distribución Trimestral (Montos)
        }else if($P == "3"){
            $result = $this->db->where('id_acc', $id);
            $result = $this->db->update('distribucion_trimestral_acc_especifica', $datos);
            return $result;
        }else if($P == "4"){ // Proceso de Carga de las cifras trimestrales (imputacion presupuestaria)
            $this->db->insert("distribucion_trimestral_imp_pre", $datos);
        }else if($P == "5"){ // Proceso de actualizacion de los montos trimestrales de la Imputacion Presupuestaria
            #print_r($datos);
            $result = $this->db->where('id', $id);
            $result = $this->db->update('distribucion_trimestral_imp_pre', $datos);
        }else if($P == "6"){
            
            $dato = explode('-', $id);
            
            $result = $this->db->from('partida_presupuestaria_centralizada');
            $result = $this->db->join('partida_presupuestaria', 'partida_presupuestaria.id = partida_presupuestaria_centralizada.partida_presupuestaria');
            $result = $this->db->where('partida_presupuestaria_centralizada.accion_centralizada', $dato[1]);
            $result = $this->db->get();
            
            foreach ($result->result() as $value){
                /*echo $value->id."\n";
                echo $value->partida_presupuestaria."\n";
                echo $value->codigo."\n";*/
                $result = $this->db->where('partida =', $value->id);
                $result = $this->db->get('imp_presupuestaria');
                if ($result->num_rows() > 0) {
                    echo "existe";
                }else if ($result->num_rows() == "") {
                    $array = array(
                        'id_acc_reg' => $dato[0],
                        'partida'  => $value->id,
                    );
                    $this->db->insert("imp_presupuestaria", $array);
                }
            }
        }else if($P == "7"){ // Carga dinamica de las cifras de las distribucación trimestral financiera
            #print_r($datos);
            
            $result = $this->db->where('pk', $id);
            $result = $this->db->update('imp_presupuestaria', $datos);
        }
    }

    # Proceso para el registro de la Distribución Trimestral de las actividades segun el id principal
    public function insert_act_trimestral($datos)
    {   
        foreach ($datos as $value) {
            $resultA = $this->db->where('actividad =', $value->actividad);
            $resultA = $this->db->get('distribucion_trimestral_actividad');
            $resultB = $this->db->where('actividad =', $value->actividad);
            $resultB = $this->db->get('distribucion_trimestral_financiera');
            if ($resultA->num_rows() > 0 or $resultB->num_rows() > 0) {
                echo 'existe';
                #return true;
            } else if ($resultA->num_rows() == "" or $resultB->num_rows() == "") {
                $array = array(
                    'id_acc_reg' => $value->id_acc_reg,
                    'actividad'  => $value->actividad,
                    'id_actividad'  => $value->id,
                );
                $this->db->insert("distribucion_trimestral_actividad", $array);
                $this->db->insert("distribucion_trimestral_financiera", $array);
            }
        }
    }
}