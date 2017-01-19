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
class ModelObservacionesProy extends CI_Model
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
//        $result = $this->db->get('observaciones_acciones_proy');
//
//        if ($result->num_rows() > 0) {
//            #echo "CORRECTO";
//            echo 'existe';
//        } else {
            // Proceso de registro de la Observacion de un Proyecto
            $result = $this->db->insert("observaciones_acciones_proy", $datos);
            // Actualización de los datos en la tabla de registro de proyecto
            $array  = array(
                'reg_res'               => $this->input->post('revisado'),
                'estruc_presupuestaria' => $this->input->post('estructura'),
                'observaciones'         => $this->input->post('observaciones'),
                'estatus'               => $this->input->post('estatus'),
                'fecha_revision'        => $this->input->post('fecha_elaboracion'),
            );
            $this->db->where('id', $datos['id_accion']);
            $this->db->update('proyecto_registro', $array);
//        }
    }

    // Metodo publico, forma de actualizar los datos
    public function actualizar($datos)
    {
        $result = $this->db->where('id', $datos['id']);
        $result = $this->db->update('observaciones_acciones_proy', $datos);
        // Actualización de los datos en la tabla de registro de proyecto
        $array = array(
            'reg_res'               => $this->input->post('revisado'),
            'estruc_presupuestaria' => $this->input->post('estructura'),
            'observaciones'         => $this->input->post('observaciones'),
            'estatus'               => $this->input->post('estatus'),
            'fecha_revision'        => $this->input->post('fecha_elaboracion'),
        );
        $this->db->where('id', $datos['id_accion']);
        $this->db->update('proyecto_registro', $array);
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
        $result = $this->db->delete('observaciones_acciones_proy');
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
        $query = $this->db->get('observaciones_acciones_proy');
        return $query->row();
    }

    public function ajax_table($id)
    {
        $result = $this->db->from('proyecto_registro p');
        $result = $this->db->join('distribucion_trimestral_imp_pre d', 'p.id = d.pk');
        $result = $this->db->where('d.pk', $id);
        $result = $this->db->get();
        return $result->result();
    }

    public function procesar($id, $datos)
    {
        $result = $this->db->where('id', $id);
        $result = $this->db->update('distribucion_trimestral_imp_pre', $datos);
        return $result;
    }

}
