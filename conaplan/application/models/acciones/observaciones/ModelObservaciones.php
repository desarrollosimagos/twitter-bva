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
class ModelObservaciones extends CI_Model
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
//        $result = $this->db->where('estructura =', $datos['estructura']);
//        $result = $this->db->get('observaciones_acciones');
//
//        if ($result->num_rows() > 0) {
//            #echo "CORRECTO";
//            echo 'existe';
//        } else {
            // Se procesa la informacion para el registro de la observacion de la Accion Especifica
            $result = $this->db->insert("observaciones_acciones", $datos);
            // Se procesa la informacion para el registro de Acciones de Registro
            $array  = array(
                'reg_res'               => $this->input->post('revisado'),
                'estruc_presupuestaria' => $this->input->post('estructura'),
                'observaciones'         => $this->input->post('observaciones'),
                'estatus'               => $this->input->post('estatus'),
                'fecha_revision'        => $this->input->post('fecha_elaboracion'),
            );
            $this->db->where('id', $datos['id_accion']);
            $this->db->update('acciones_registro', $array);
//        }
    }

    // Metodo publico, forma de actualizar los datos
    public function actualizar($datos)
    {   // Se procesa la informacion para la Actualizacion de la observacion de la Accion Especifica
        $result = $this->db->where('id', $datos['id']);
        $result = $this->db->update('observaciones_acciones', $datos);
        // Se procesa la informacion para la Actualizacion de Acciones de Registro
        $array  = array(
            'reg_res'               => $this->input->post('revisado'),
            'estruc_presupuestaria' => $this->input->post('estructura'),
            'observaciones'         => $this->input->post('observaciones'),
            'estatus'               => $this->input->post('estatus'),
            'fecha_revision'        => $this->input->post('fecha_elaboracion'),
        );
        $this->db->where('id', $datos['id_accion']);
        $this->db->update('acciones_registro', $array);

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

    public function datos($id)
    {
        $this->db->where('id_accion', $id);
        $query = $this->db->get('observaciones_acciones');
        return $query->row();
    }

    public function ajax_table($id)
    {
        $result = $this->db->from('acciones_registro a');
        $result = $this->db->join('imp_presupuestaria i', 'a.id = i.id_acc_reg');
        $result = $this->db->where('i.id_acc_reg', $id);
        $result = $this->db->get();
        return $result->result();
    }

    public function procesar($id, $datos)
    {
        $result = $this->db->where('pk', $id);
        $result = $this->db->update('imp_presupuestaria', $datos);
        return $result;
    }

}
