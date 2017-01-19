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
class ModelRegistro extends CI_Model
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
//        $result = $this->db->where('plan_patria =', $datos['plan_patria']);
//        $result = $this->db->or_where('codigo = ', $datos['codigo']);
//        $result = $this->db->get('plan_patria');
//
//        if ($result->num_rows() > 0) {
//            #echo "CORRECTO";
//            echo '1';
//        } else {
        $result = $this->db->insert("acciones_registro", $datos);
        return $result;
//        }
    }

    // Metodo publico, forma de actualizar los datos
    public function actualizar($datos)
    {
        $result = $this->db->where('codigo', $datos['codigo']);
        $result = $this->db->update('acciones_registro', $datos);
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
        $result = $this->db->delete('plan_patria');
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
        $query = $this->db->get('acciones_registro');
        return $query->row();
    }
    
    // Metodo publico, forma de insertar las actividades para la asociacion de la accion
    public function procesar($P,$id,$datos)
    {   
        if($P == "1"){
            $result = $this->db->where('actividad =', $datos['actividad']);
            $result = $this->db->get('distribucion_actividad');

            if ($result->num_rows() > 0) {
                #echo "CORRECTO";
                echo '1';
            } else {
            $result = $this->db->insert('distribucion_actividad', $datos);
            return $result;
            }
        }else if($P == "2"){
            $result = $this->db->where('id', $id);
            $result = $this->db->update('distribucion_actividad', $datos);
            return $result;
        }else if($P == "3"){
            $result = $this->db->where('id', $id);
            $result = $this->db->delete('distribucion_actividad');
            $result = $this->db->where('id_actividad', $id);
            $result = $this->db->delete('distribucion_trimestral_actividad');
            $result = $this->db->where('id_actividad', $id);
            $result = $this->db->delete('distribucion_trimestral_financiera');
            return $result;
        }else if($P == "4"){ // Carga dinamica de las cifras trimestrales de las actividades
            #print_r($datos);
            $result = $this->db->where('id_actividad', $id);
            $result = $this->db->update('distribucion_trimestral_actividad', $datos);
        }else if($P == "5"){ // Carga dinamica de las cifras de las distribucación trimestral financiera
            #print_r($datos);
            $result = $this->db->where('id_actividad', $id);
            $result = $this->db->update('distribucion_trimestral_financiera', $datos);
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
                $where  = "id_acc_reg=$dato[0] AND partida=$value->id";
                $result = $this->db->where($where);
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
//                $array = array(
//                    'id_acc_reg' => $dato[0],
//                    'partida'  => $value->id,
//                );
//                $this->db->insert("imp_presupuestaria", $array);
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
            
            $resultA = $this->db->where('id_actividad =', $value->id);
            $resultA = $this->db->get('distribucion_trimestral_actividad');
            $resultB = $this->db->where('id_actividad =', $value->id);
            $resultB = $this->db->get('distribucion_trimestral_financiera');
            if ($resultA->num_rows() > 0 or $resultB->num_rows() > 0) {
                echo 'existe';
                #return true;
            } else if ($resultA->num_rows() == "" or $resultB->num_rows() == "") {
                $array = array(
                    'id_acc_reg' => $value->id_acc_reg,
                    #'actividad'  => $value->actividad,
                    'id_actividad'  => $value->id,
                );
                $this->db->insert("distribucion_trimestral_actividad", $array);
                $this->db->insert("distribucion_trimestral_financiera", $array);
            }
        }
    }
}