<?php

$this->load->model('model_standard/ModelStandard'); # Llamado a el modelo Estandard
$this->pdf   = new PdfLeyTomoI($orientation = 'L', $unit        = 'mm', $format      = 'A4');
// Agregamos una página
$this->pdf->AddPage();
// Define el alias para el número de página que se imprimirá en el pie
$this->pdf->AliasNbPages();
/* Se define el titulo, márgenes izquierdo, derecho y
 * el color de relleno predeterminado
 */
$this->pdf->SetLeftMargin(15);
$this->pdf->SetRightMargin(15);
$this->pdf->SetFillColor(56, 119, 119);
// Titulo del formato PDF
// Registro de Acciones Centralizadas
if ($dato[0] == 1 AND $dato[1] == 4) {
    $nom       = "ORGANOS Y UNIDADES DE APOYO";
    $tomo      = "Tomo I";
    $SetXT     = 158;
    $SetX      = 153;
} elseif ($dato[0] == 2 AND $dato[1] == 3) {
    $nom       = "ENTES Y EMPRESAS";
    $tomo      = "Tomo II";
    $SetXT     = 163;
    $SetX      = 165;
}

$this->pdf->SetTitle(utf8_decode($nom)); // Nombre del titulo
// =============================================================================
// PLAN OPERATIVO ANUAL (REGISTRO DE ACCIONES Y ANTE PROYECTOS)
// =============================================================================
$this->pdf->Ln(3);
$this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
$this->pdf->SetFillColor(255, 255, 255);
$this->pdf->Ln(80);
$this->pdf->SetFont('Helvetica', 'B', 16);
$this->pdf->Ln(95);
$this->pdf->Image(base_url() . 'assets/image/POA.jpg', 0, 0, 209.9);
$this->pdf->SetY(165); // Arriba y Abajo
$this->pdf->SetX(102); // Izquierda y Derecha
$this->pdf->SetFont('Helvetica', 'B', 27);
$this->pdf->Cell(180, 7, utf8_decode("$ano"), '', 1, 'L', '0');

$this->pdf->SetY(255);
$this->pdf->SetX(105);
$this->pdf->SetFont('Helvetica', 'B', 16);
$this->pdf->Cell(180, 7, utf8_decode("$tomo"), '', 1, 'L', '0');
$this->pdf->SetX(25);
$this->pdf->Cell(180, 7, utf8_decode("Ejercicio Fiscal $ano"), '', 1, 'C', '1');

$this->pdf->SetY(10); # Arriba y Abajo
$this->pdf->SetX($SetX); # Izquierda y derecha
$this->pdf->SetFont('Helvetica', 'B', 8);
$this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
$this->pdf->Cell(180, 7, utf8_decode("$nom"), '', 1, 'L', '0');

// =============================================================================
// Contra Portada Tomo I (Ley Presupuestaria)
// =============================================================================
$this->pdf->AddPage();
$this->pdf->Ln(10);
$this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
$this->pdf->SetFillColor(255, 255, 255);
$this->pdf->SetFont('Helvetica', 'B', 11);

if ($dato[0] == 1 AND $dato[1] == 4) {
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 32.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Acuérdese el monto total de los créditos presupuestario para cada Órgano del estado y para las'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('rectificaciones al presupuesto de gasto, de acuerdo con la distribución siguiente:'), '', 1, 'L', '1');
    $query = "SELECT oe.id,oe.tipo_ins,oe.sector,oe.nom_ins,SUM(im.m_asig) AS monto_general FROM imp_presupuestaria AS im INNER JOIN acciones_registro AS acc ON(im.id_acc_reg=acc.id) INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 GROUP BY oe.nom_ins,oe.sector,oe.tipo_ins,oe.id";
} elseif ($dato[0] == 2 AND $dato[1] == 3) {
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 33.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Se aprueba la estimación de los ingresos y fuentes de financiamiento y se acuerdan los presupuestos'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('de gastos y aplicaciones financieras de los Entes Descentralizados Funcionalmente con y sin Fines Empresariales,'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('que a continuación se señalan:'), '', 1, 'L', '1');
    $query = "SELECT oe.id,oe.tipo_ins,oe.sector,oe.nom_ins,SUM(im.m_asig) AS monto_general FROM imp_presupuestaria AS im INNER JOIN acciones_registro AS acc ON(im.id_acc_reg=acc.id) INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 GROUP BY oe.nom_ins,oe.sector,oe.tipo_ins,oe.id";


// Registro de Proyectos
} elseif ($dato[0] == 2 AND $dato[0] == 1 AND $dato[1] == 4) {
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 32.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Acuérdese el monto total de los créditos presupuestario para cada Órgano del estado y para las'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('rectificaciones al presupuesto de gasto, de acuerdo con la distribución siguiente:'), '', 1, 'L', '1');
    $query = "SELECT oe.id,oe.tipo_ins,oe.sector,oe.nom_ins,SUM(dis.m_asig) AS monto_general FROM distribucion_trimestral_imp_pre AS dis INNER JOIN proyecto_registro AS proy ON(dis.pk=proy.id) INNER JOIN organos_entes AS oe ON(proy.ente=oe.id) INNER JOIN observaciones_acciones_proy AS obs ON(proy.ente=obs.organo) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND proy.estatus = 4 GROUP BY oe.nom_ins,oe.id,proy.id";
    //echo $query;
} elseif ($dato[0] == 2 AND $dato[0] == 2 AND $dato[1] == 3) {
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 33.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Se aprueba la estimación de los ingresos y fuentes de financiamiento y se acuerdan los presupuestos'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('de gastos y aplicaciones financieras de los Entes Descentralizados Funcionalmente con y sin Fines Empresariales,'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('que a continuación se señalan:'), '', 1, 'L', '1');
    $query = "SELECT oe.id,oe.tipo_ins,oe.sector,oe.nom_ins,SUM(dis.m_asig) AS monto_general FROM distribucion_trimestral_imp_pre AS dis INNER JOIN proyecto_registro AS proy ON(dis.pk=proy.id) INNER JOIN organos_entes AS oe ON(proy.ente=oe.id) INNER JOIN observaciones_acciones_proy AS obs ON(proy.ente=obs.organo) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND proy.estatus = 4 GROUP BY oe.nom_ins,oe.id,proy.id";
}

// =============================================================================
// Proceso para el listado de sectores
// =============================================================================
$this->pdf->SetTitle(utf8_decode($tomo));
$this->pdf->Ln(5);

foreach ($sectores as $sec) {
    $this->pdf->SetFont('Helvetica', 'B', 8);
    $this->pdf->Cell(25, 7, utf8_decode($sec->sector), '', 1, 'L', '1'); // Salida de los sectores
    // Proceso para reflejar los Organismos asociados al sector
    $monto_general   = 0; // Monto General por Organos
    $monto_asig      = 0; // Monto asignado por proyectos
    $gastos_fiscales = 0; // Monto General de los gastos fiscales
    $organos_montos  = $this->ModelStandard->query_set($query, 'result');
    foreach ($organos_montos as $org) {
        $id_org        = $org->id;
        $monto_general = $org->monto_general;
        
        $query2           = "SELECT proy.id AS id_proyecto,oe.id,SUM(dis.m_asig) AS monto_asig FROM distribucion_trimestral_imp_pre AS dis INNER JOIN proyecto_registro AS proy ON(dis.pk=proy.id) INNER JOIN organos_entes AS oe ON(proy.ente=oe.id) INNER JOIN observaciones_acciones_proy AS obs ON(proy.ente=obs.organo) WHERE proy.estatus=4 GROUP BY oe.nom_ins,oe.id,proy.id";
        $proyectos_montos = $this->ModelStandard->query_set($query2, 'result');
        foreach ($proyectos_montos as $proy) {
            $id_proy     = $proy->id;
            $id_proyecto = $proy->id_proyecto;
            // Condicional para efectuar el calculo de los proyectos
            if ($id_org == $id_proy) {
                $monto_asig = $proy->monto_asig;
            }
        }
        
        $gastos_fiscales += (int)$monto_general + (int)$monto_asig;
        if ($org->sector == $sec->id) {
            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(3);
            $this->pdf->Cell(160, 7, utf8_decode($org->nom_ins), '', 0, 'L', '1');
            $this->pdf->Cell(20, 7, $this->pdf->Format_number($gastos_fiscales), '', 1, 'L', '1');
            // Seleccion de Unidades de Apoyo
        } elseif ($org->sector == $sec->id) {

            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(3);
            $this->pdf->Cell(160, 7, utf8_decode($org->nom_ins), '', 0, 'L', '1');
            $this->pdf->Cell(20, 7, $this->pdf->Format_number($gastos_fiscales), '', 1, 'L', '1');
        }
    }
}
// =============================================================================
$this->pdf->Ln(60);
$this->pdf->SetFont('Arial', 'B', 8);
$this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
$this->pdf->SetFillColor(255, 255, 255);
$this->pdf->Cell(160, 7, "TOTAL GASTOS FISCALES", '', 0, 'L', '1');
$this->pdf->SetFont('Arial', '', 8);
$this->pdf->Cell(20, 7, $this->pdf->Format_number($gastos_fiscales), '', 1, 'L', '1');
/* =========================================================================== */

$this->pdf->AddPage(); // Salto de pagina para la contra portada, reflejando los detallado de sectores y organos
foreach ($titulo_org_sectores as $row) { // Apertura de ciclo for (iteracion en cuanto a los Sectores y Organos)
    $this->pdf->Ln(82);
    $ente = $row->ente; // ID del Ente asociado a las Acciones Centralizadas
    $this->pdf->SetFont('Helvetica', 'B', 10);
    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
    $this->pdf->SetFillColor(255, 255, 255);
    $this->pdf->Cell(180, 7, utf8_decode("SECTOR: $row->codigo $row->sector"), '', 0, 'C', '1'); // Salida de los sectores
    $this->pdf->Ln(5);
    $this->pdf->Cell(180, 7, utf8_decode("$row->nom_ins"), '', 0, 'C', '1'); // Salida de los sectores
    /* ==============================================================================
      # Inicio del formato del Plan Operativo Anual
      ============================================================================== */
    // Identificación del Proponente
    //$this->pdf->AddPage();
    $this->pdf->AliasNbPages(); // Define el alias para el número de página que se imprimirá en el pie
    /* Se define el titulo, márgenes izquierdo, derecho y el color de relleno predeterminado */
    $this->pdf->SetTitle(utf8_decode("$nom"));
    $this->pdf->SetLeftMargin(15);
    $this->pdf->SetRightMargin(15);
    $this->pdf->SetFillColor(56, 119, 119);
    $this->pdf->SetFont('Arial', 'B', 9); // Se define el formato de fuente: Arial, negritas, tamaño 9

    if (($dato[0] == 1 AND $dato[1] == 4) OR ($dato[0] == 2 AND $dato[1] == 3)) { // Bloque de validación para generar el reporte de Acción Centralizada (POA)
        // El encabezado del PDF
        $query_iden     = "SELECT acc.id AS id_acc,ac.id AS accion,acc.ente,oe.nom_ins,ac.accion_centralizada FROM acciones_registro AS acc INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) INNER JOIN accion_centralizada AS ac ON(acc.acc_centralizada=ac.id) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 AND acc.ente=$ente AND acc.ano_fiscal=$ano GROUP BY acc.ente,oe.nom_ins,ac.accion_centralizada,ac.id,acc.id";
        $identificacion = $this->ModelStandard->query_set($query_iden, 'result');
        foreach ($identificacion as $row) {
            $id_accion     = $row->accion;
            $id_acc        = $row->id_acc;
            $this->pdf->AddPage();
            $this->pdf->Ln(10);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('1. IDENTIFICACIÓN DEL PROPONENTE'), 'TBL', 1, 'C', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(45, 7, utf8_decode('1.1 Organismo/Ente/Empresa:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(135, 7, utf8_decode($row->nom_ins), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('3. DATOS BÁSICOS DE LA ACCIÓN CENTRALIZADA'), 'TBL', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(191, 191, 191);
            $this->pdf->Cell(180.2, 5, utf8_decode('3.1 ACCIÓN CENTRALIZADA'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(55, 7, utf8_decode('3.1 Nombre de la Accion Centralizada:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(125, 7, utf8_decode($row->accion_centralizada), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('3.2 Nombre de la Accion Específica:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $query_acc_esp = "SELECT ace.accion_especifica FROM acciones_registro AS acc INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) INNER JOIN accion_especifica AS ace ON(acc.acc_centralizada=ace.accion_centralizada) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 AND acc.ente=$ente AND ace.accion_centralizada=$id_accion AND acc.ano_fiscal=$ano GROUP BY ace.accion_especifica";
            $acc_esp       = $this->ModelStandard->query_set($query_acc_esp, 'result');
            foreach ($acc_esp as $row) {
                $this->pdf->MultiCell(180, 5, utf8_decode($row->accion_especifica), 'LR', 'J', 0);
            }
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('4 ACTIVIDADES DE LA ACCIÓN ESPECÍFICA'), 'TBL', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(127, 127, 127);
            $this->pdf->Cell(180.2, 5, utf8_decode('4.1 Distribución de las Actividades'), 'TBLR', 1, 'C', '1');

            $x               = 1;
            $query_actividad = "SELECT dis.actividad,dis.unidad_medida,dis.medio_verificacion,dis.cantidad,dis.indicador_actividad FROM acciones_registro AS acc INNER JOIN distribucion_actividad AS dis ON(acc.id=dis.id_acc_reg) WHERE dis.id_acc_reg = $id_acc";
            $actividad       = $this->ModelStandard->query_set($query_actividad, 'result');
            foreach ($actividad as $row) {

                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(180, 5, utf8_decode('Actividad'), 'TBLR', 0, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->SetFont('Arial', '', 7);
                $this->pdf->Ln('5');
                $this->pdf->MultiCell(180, 3.8, utf8_decode($row->actividad), 'TBLR', 'L', 1);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(20, 5, 'Unidad/Medida:', 'TBLR', 0, 'C', '1');
                $this->pdf->SetFont('Arial', '', 6.5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(58, 5, utf8_decode($row->unidad_medida), 'TBLR', 0, 'L', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(25, 5, utf8_decode('Medio/Verificación:'), 'TBLR', 0, 'C', '1');
                $this->pdf->SetFont('Arial', '', 6.5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(77, 5, utf8_decode($row->medio_verificacion), 'TBLR', 1, 'L', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(20, 5, 'Cantidad', 'TBLR', 0, 'C', '1');
                $this->pdf->SetFont('Arial', '', 6.5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(58, 5, $row->cantidad, 'TBLR', 0, 'L', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(25, 5, 'Indicador/Actividad', 'TBLR', 0, 'C', '1');
                $this->pdf->SetFont('Arial', '', 6.5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(77, 5, utf8_decode($row->indicador_actividad), 'TBLR', 1, 'L', '1');

                if ($x == 5) {
                    $this->pdf->AddPage();
                    $this->pdf->Ln('10');
                    $this->pdf->SetFont('Arial', 'B', 10);
                    $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(56, 119, 119);
                    $this->pdf->Cell(180.2, 5, utf8_decode('4 ACTIVIDADES DE LA ACCIÓN ESPECÍFICA'), 'TBL', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(127, 127, 127);
                    $this->pdf->Cell(180.2, 5, utf8_decode('4.1 Distribución de las Actividades'), 'TBLR', 1, 'C', '1');
                }

                $x = $x + 1;
            }
            //$this->pdf->AddPage();
            $this->pdf->Ln(2);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('4.2 Distribución Trimestral de las Actividades'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetFont('Arial', '', 8);

            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $y             = 1;
            $trimestre_i   = 0;
            $trimestre_ii  = 0;
            $trimestre_iii = 0;
            $trimestre_iv  = 0;
            $total         = 0;
            $query_dis_act = "SELECT disac.actividad,dis.trimestre_i,dis.trimestre_ii,dis.trimestre_iii,dis.trimestre_iv,dis.total FROM acciones_registro AS acc INNER JOIN distribucion_trimestral_actividad AS dis ON(acc.id=dis.id_acc_reg) INNER JOIN distribucion_actividad AS disac ON(dis.id_actividad=disac.id) WHERE dis.id_acc_reg = $id_acc";
            $dis_actividad = $this->ModelStandard->query_set($query_dis_act, 'result');
            foreach ($dis_actividad as $row) {
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(56, 119, 119);
                $this->pdf->Cell(180, 5, 'Actividad', 'TBLR', 0, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Ln(5);
                $this->pdf->MultiCell(180, 3.8, utf8_decode($row->actividad), 'TBLR', 'L', 1);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(36, 5, 'I Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'II Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'III Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'IV Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'Total', 'TBLR', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_i), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_ii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iv), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->total), 'TBLR', 1, 'C', '1');

                if ($y == 6) {
                    $this->pdf->AddPage();
                    $this->pdf->Ln(10);
                    $this->pdf->SetFont('Arial', 'B', 10);
                    $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(56, 119, 119);
                    $this->pdf->Cell(180.2, 5, utf8_decode('4.2 Distribución Trimestral de las Actividades'), 'TBLR', 1, 'C', '1');
                }

                $y = $y + 1;
                $trimestre_i +=$row->trimestre_i;
                $trimestre_ii +=$row->trimestre_ii;
                $trimestre_iii +=$row->trimestre_iii;
                $trimestre_iv +=$row->trimestre_iv;
                $total +=$row->total;
            }
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($trimestre_i), 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($trimestre_ii), 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($trimestre_iii), 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($trimestre_iv), 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($total), 'TBLR', 1, 'C', '1');

            // 6. IMPUTACIÓN ACCIONES
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('6. IMPUTACIÓN ACCIONES'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(15, 7.5, utf8_decode('Código P'), 'LR', 0, 'C', '0');
            $this->pdf->Cell(165, 7.5, utf8_decode('Denominación'), 'LRTB', 1, 'C', '0');


            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(191, 191, 191);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            //$this->pdf->Cell(17, 5, utf8_decode(''), 'BLR', 1, 'C', '1');

            $trimestre_ip   = 0;
            $trimestre_iip  = 0;
            $trimestre_iiip = 0;
            $trimestre_ivp  = 0;
            $montop         = 0;

            $query_imp         = "SELECT p.codigo,p.partida_presupuestaria,imp.m_asig AS monto FROM acciones_registro AS acc INNER JOIN imp_presupuestaria AS imp ON(acc.id=imp.id_acc_reg) INNER JOIN partida_presupuestaria AS p ON(imp.partida=p.id) WHERE imp.id_acc_reg = $id_acc AND imp.m_asig > 0.00";
            $dis_actividad_imp = $this->ModelStandard->query_set($query_imp, 'result');
            foreach ($dis_actividad_imp as $row) {
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(15, 5, utf8_decode($row->codigo . ".00.00.00"), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(148, 5, utf8_decode($row->partida_presupuestaria), 'TBLR', 0, 'L', '1');
                $this->pdf->Cell(17, 5, $this->pdf->Format_number($row->monto), 'TBLR', 1, 'C', '1');

                $montop +=$row->monto; // Sumatoria total de los montos por partidas presupuestarias (Distribucion presupuestaria)
            }
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(15, 5, utf8_decode('TOTALES'), 'TBLR', 0, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(148, 5, '', 'TBLR', 0, 'L', '1');
            $this->pdf->Cell(17, 5, $this->pdf->Format_number($montop), 'TBLR', 1, 'C', '1');
        }
        
        // Segmento para los Proyectos Asociados a las Acciones
        $this->pdf->AddPage();
        $this->pdf->Ln(10);

        $query_pro = "SELECT p.id AS id_proy,o.nom_ins,p.nom_proyecto,p.ambito,p.especifique_amb,plan.plan_patria,objh.objetivo_historico,objn.objetivo_nacional,obje.objetivo_estrategico,objg.objetivo_general,plan_g.plan_gobierno,l.linea_estrategica,p.area_inversion,s.sector,p.tipo_inversion,p.obj_general,p.imp_impacto FROM proyecto_registro AS p INNER JOIN organos_entes AS o ON(p.ente=o.id) INNER JOIN plan_patria AS plan ON(p.plan_patria=plan.id) INNER JOIN objetivo_historico AS objh ON(p.objetivo_historico=objh.id) INNER JOIN objetivo_nacional AS objn ON(p.objetivo_nacional=objn.id) INNER JOIN objetivo_estrategico AS obje ON(p.objetivo_estrategico=obje.id) INNER JOIN objetivo_general AS objg ON(p.objetivo_general=objg.id) INNER JOIN plan_gobierno AS plan_g ON(p.plan_gobierno=plan_g.id) INNER JOIN linea_estrategica AS l ON(p.linea_estrategica=l.id) INNER JOIN sectores AS s ON(p.sector=s.id) WHERE o.tipo_ins = $dato[0] OR o.tipo_ins = $dato[1] AND p.ente = $ente AND p.ano_fiscal = $ano";
        $datos_pro = $this->ModelStandard->query_set($query_pro, 'result');
        foreach ($datos_pro as $row) {
            $id_proy = $row->id_proy; // Id que cumple el vinculo de los Proyectos
            // Validación para los distintos Ambitos
            if ($row->ambito == 1):
                $ambito = "ESTADAL";
            elseif ($row->ambito == 2):
                $ambito = "NACIONAL";
            elseif ($row->ambito == 3):
                $ambito = "INTERNACIONAL";
            elseif ($row->ambito == 4):
                $ambito = "MUNICIPAL";
            elseif ($row->ambito == 5):
                $ambito = "PARROQUIAL";
            elseif ($row->ambito == 6):
                $ambito = "SIN EXTENSIÓN TERRITORIAL";
            elseif ($row->ambito == 7):
                $ambito = "COMUNAL";
            endif;

            // Validacion de tipo de Inversión
            if ($row->tipo_inversion == 1):
                $tipo = "INVERSIÓN PRODUCTIVA";
            elseif ($row->tipo_inversion == 2):
                $tipo = "FORTALECIMIENTO INSTITUCIONAL";
            elseif ($row->tipo_inversion == 3):
                $tipo = "INFRAESTRUCTURA";
            elseif ($row->tipo_inversion == 4):
                $tipo = "SERVICIOS";
            endif;

            # Primera Pagina Todo lo referente a los datos principales de proyecto
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('1. IDENTIFICACIÓN DEL PROPONENTE'), 'TBL', 1, 'C', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(45, 7, utf8_decode('1.1 Organismo/Ente/Empresa:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(135, 7, utf8_decode($row->nom_ins), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 6.5, utf8_decode('2. DATOS DEL PROYECTO'), 'TBL', 0, 'C', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(180, 7, utf8_decode('2.1 Nombre del Proyecto:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->nom_proyecto), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('3. LOCALIZACIÓN POLÍTICO ADMINISTRATIVA'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(18, 7, utf8_decode('3.1. Ámbito'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(162, 7, utf8_decode($ambito), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('3.2 Especifique:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->especifique_amb), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 9);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180, 5, utf8_decode('4. ÁREA ESTRATÉGICA'), 'TBLR', 1, 'C', '1');
            $this->pdf->Cell(180, 7, utf8_decode("4.1. " . $row->plan_patria), 'TBLR', 1, 'L', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.1. Objetivo Histórico:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_historico), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.2. Objetivo Nacional:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_nacional), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.3. Objetivo Estratégico:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_estrategico), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.4. Objetivo General:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_general), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 9);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180, 5, utf8_decode("4.2. " . $row->plan_gobierno), 'TBLR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(65, 7, utf8_decode('4.2.1. Lineas Estratégicas del plan de Gobierno:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(115, 7, utf8_decode($row->linea_estrategica), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(35, 7, utf8_decode('4.2.2. Area de Inversión:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(145, 7, utf8_decode($row->area_inversion), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(20, 7, utf8_decode('4.2.3. Sector:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(160, 7, utf8_decode($row->sector), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(20, 7, utf8_decode('4.2.4. Tipo:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(160, 7, utf8_decode($tipo), 'TBR', 1, 'L', '1');

            # Segunda Pagina de datos del proyecto
            $this->pdf->AddPage();
            $this->pdf->Ln(10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->Cell(180.2, 5, utf8_decode('5. IDENTIFICACIÓN DEL PROBLEMA Y JUSTIFICACIÓN'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('5.2. Objetivo general:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->obj_general), 'LR', 'J', 0);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('5.3. Importancia e Impacto:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->imp_impacto), 'LRB', 'J', 0);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);

            // Acciones Especificas
            //$this->pdf->AddPage();
            $this->pdf->SetFont('Arial', 'B', 13);
            $this->pdf->Ln(0);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->Cell(180.2, 5, utf8_decode('9. ACCIONES ESPECIFICAS'), 'TBLR', 1, 'C', '1');

            $y             = 1;
            $trimestre_i   = 0;
            $trimestre_ii  = 0;
            $trimestre_iii = 0;
            $trimestre_iv  = 0;
            $total         = 0;
            $query_dis     = "SELECT d.acc_esp,d.unidad_medida,d.medio_verificacion,d.trimestre_i,d.trimestre_ii,d.trimestre_iii,d.trimestre_iv,d.total FROM proyecto_registro AS p INNER JOIN distribucion_acc_especifica AS d ON(p.id=d.pk) WHERE p.ano_fiscal = $ano AND p.ente = $ente AND d.pk = $id_proy";
            $acciones      = $this->ModelStandard->query_set($query_dis, 'result');
            foreach ($acciones as $row) {
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(56, 119, 119);
                $this->pdf->Cell(180, 5, utf8_decode('Nombre de la Acción Específica'), 'TBLR', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->MultiCell(180, 3.8, utf8_decode($row->acc_esp), 'TBLR', 'L', 1);
                $this->pdf->SetFont('Arial', 'B', 8);
                $this->pdf->Cell(26, 7, 'Unidad de Medida:', 'TBL', 0, 'L', '1');
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->Cell(40, 7, utf8_decode($row->unidad_medida), 'TBR', 0, 'L', '1');
                $this->pdf->SetFont('Arial', 'B', 8);
                $this->pdf->Cell(27, 7, utf8_decode('Medio/Verificación:'), 'TBL', 0, 'L', '1');
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->Cell(87, 7, utf8_decode($row->medio_verificacion), 'TBR', 1, 'L', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(36, 5, 'I Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'II Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'III Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'IV Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'Total', 'TBLR', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_i), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_ii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iv), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->total), 'TBLR', 1, 'C', '1');

                if ($y == 5): // Si cumple con 5 registro, efectua un salto de pagina
                    $this->pdf->AddPage();
                    $this->pdf->Ln(10);
                    $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(56, 119, 119);
                    $this->pdf->Cell(180, 5, utf8_decode('Nombre de la Acción Específica'), 'TBLR', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->MultiCell(180, 3.8, utf8_decode($row->acc_esp), 'TBLR', 'L', 1);
                    $this->pdf->SetFont('Arial', 'B', 8);
                    $this->pdf->Cell(26, 7, 'Unidad de Medida:', 'TBL', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', '', 8);
                    $this->pdf->Cell(40, 7, utf8_decode($row->unidad_medida), 'TBR', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', 'B', 8);
                    $this->pdf->Cell(27, 7, utf8_decode('Medio/Verificación:'), 'TBL', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', '', 8);
                    $this->pdf->Cell(87, 7, utf8_decode($row->medio_verificacion), 'TBR', 1, 'L', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(191, 191, 191);
                    $this->pdf->Cell(36, 5, 'I Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'II Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'III Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'IV Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'Total', 'TBLR', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_i), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_ii), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iii), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iv), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->total), 'TBLR', 1, 'C', '1');
                endif;

                $y = $y + 1;
                $trimestre_i += $row->trimestre_i;
                $trimestre_ii += $row->trimestre_ii;
                $trimestre_iii += $row->trimestre_iii;
                $trimestre_iv += $row->trimestre_iv;
                $total += $row->total;
            }

            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(36, 5, $trimestre_i, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_ii, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_iii, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_iv, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $total, 'TBLR', 1, 'C', '1');

            // IMPUTACION PRESUPUESTARIA

            $trimestre_iimp    = 0;
            $trimestre_iipimp  = 0;
            $trimestre_iiipimp = 0;
            $trimestre_ivpimp  = 0;
            $montopimp         = 0;
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 5, utf8_decode('11. IMPUTACIÓN PRESUPUESTARIA'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(15, 5, utf8_decode('Código P'), 'LR', 0, 'C', '0');
            $this->pdf->Cell(148, 5, utf8_decode('Denominación'), 'LR', 0, 'C', '0');

            $this->pdf->Cell(17, 5, utf8_decode('Total'), 'LR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(191, 191, 191);

            $query_imp = "SELECT pa.codigo,pa.partida_presupuestaria,d.trimestre_i,d.trimestre_ii,d.trimestre_iii,d.trimestre_iv,d.m_asig AS asignacion FROM proyecto_registro AS p INNER JOIN distribucion_trimestral_imp_pre AS d ON(p.id=d.pk) INNER JOIN partida_presupuestaria AS pa ON(d.denominacion=pa.id) WHERE p.ano_fiscal = $ano AND p.ente = $ente AND d.pk = $id_proy";
            $imp       = $this->ModelStandard->query_set($query_imp, 'result');
            foreach ($imp as $row) {

                $this->pdf->SetFont('Arial', '', 5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(15, 5, $row->codigo . ".00.00.00", 'TL', 0, 'C', '1');
                $this->pdf->Cell(148, 5, utf8_decode($row->partida_presupuestaria), 'TBR', 0, 'L', '1');
                $this->pdf->Cell(17, 5, $this->pdf->Format_number($row->asignacion), 'TBLR', 1, 'C', '1');

                $montopimp += $row->asignacion;
            }
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(163, 5, utf8_decode('TOTAL GENERAL'), 'TBLR', 0, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(17, 5, $montopimp, 'TBLR', 1, 'C', '1');
        }
        
        /* Cierre de Bloque de Accion Centralizada (POA) */
    } elseif (($dato[0] == 2 AND $dato[0] == 1 AND $dato[1] == 4) OR ( $dato[0] == 2 AND $dato[0] == 2 AND $dato[1] == 3)) { // Apertura la plasmar la generación del reporte POA para los Proyectos
        // ======================================================================
        // Comienzo para le POA de Proyectos Parte II
        // ======================================================================
        $this->pdf->AddPage();
        $this->pdf->Ln(10);

        $query_pro = "SELECT p.id AS id_proy,o.nom_ins,p.nom_proyecto,p.ambito,p.especifique_amb,plan.plan_patria,objh.objetivo_historico,objn.objetivo_nacional,obje.objetivo_estrategico,objg.objetivo_general,plan_g.plan_gobierno,l.linea_estrategica,p.area_inversion,s.sector,p.tipo_inversion,p.obj_general,p.imp_impacto FROM proyecto_registro AS p INNER JOIN organos_entes AS o ON(p.ente=o.id) INNER JOIN plan_patria AS plan ON(p.plan_patria=plan.id) INNER JOIN objetivo_historico AS objh ON(p.objetivo_historico=objh.id) INNER JOIN objetivo_nacional AS objn ON(p.objetivo_nacional=objn.id) INNER JOIN objetivo_estrategico AS obje ON(p.objetivo_estrategico=obje.id) INNER JOIN objetivo_general AS objg ON(p.objetivo_general=objg.id) INNER JOIN plan_gobierno AS plan_g ON(p.plan_gobierno=plan_g.id) INNER JOIN linea_estrategica AS l ON(p.linea_estrategica=l.id) INNER JOIN sectores AS s ON(p.sector=s.id) WHERE o.tipo_ins = $dato[0] OR o.tipo_ins = $dato[1] AND p.ente = $ente AND p.ano_fiscal = $ano";
        $datos_pro = $this->ModelStandard->query_set($query_pro, 'result');
        foreach ($datos_pro as $row) {
            $id_proy = $row->id_proy; // Id que cumple el vinculo de los Proyectos
            // Validación para los distintos Ambitos
            if ($row->ambito == 1):
                $ambito = "ESTADAL";
            elseif ($row->ambito == 2):
                $ambito = "NACIONAL";
            elseif ($row->ambito == 3):
                $ambito = "INTERNACIONAL";
            elseif ($row->ambito == 4):
                $ambito = "MUNICIPAL";
            elseif ($row->ambito == 5):
                $ambito = "PARROQUIAL";
            elseif ($row->ambito == 6):
                $ambito = "SIN EXTENSIÓN TERRITORIAL";
            elseif ($row->ambito == 7):
                $ambito = "COMUNAL";
            endif;

            // Validacion de tipo de Inversión
            if ($row->tipo_inversion == 1):
                $tipo = "INVERSIÓN PRODUCTIVA";
            elseif ($row->tipo_inversion == 2):
                $tipo = "FORTALECIMIENTO INSTITUCIONAL";
            elseif ($row->tipo_inversion == 3):
                $tipo = "INFRAESTRUCTURA";
            elseif ($row->tipo_inversion == 4):
                $tipo = "SERVICIOS";
            endif;

            # Primera Pagina Todo lo referente a los datos principales de proyecto
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->Cell(180.2, 5, utf8_decode('1. IDENTIFICACIÓN DEL PROPONENTE'), 'TBL', 1, 'C', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(45, 7, utf8_decode('1.1 Organismo/Ente/Empresa:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(135, 7, utf8_decode($row->nom_ins), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 6.5, utf8_decode('2. DATOS DEL PROYECTO'), 'TBL', 0, 'C', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(180, 7, utf8_decode('2.1 Nombre del Proyecto:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->nom_proyecto), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180.2, 5, utf8_decode('3. LOCALIZACIÓN POLÍTICO ADMINISTRATIVA'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(18, 7, utf8_decode('3.1. Ámbito'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(162, 7, utf8_decode($ambito), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('3.2 Especifique:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->especifique_amb), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 9);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180, 5, utf8_decode('4. ÁREA ESTRATÉGICA'), 'TBLR', 1, 'C', '1');
            $this->pdf->Cell(180, 7, utf8_decode("4.1. " . $row->plan_patria), 'TBLR', 1, 'L', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.1. Objetivo Histórico:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_historico), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.2. Objetivo Nacional:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_nacional), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.3. Objetivo Estratégico:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_estrategico), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('4.1.4. Objetivo General:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->objetivo_general), 'LR', 'J', 0);
            $this->pdf->SetFont('Arial', 'B', 9);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180, 5, utf8_decode("4.2. " . $row->plan_gobierno), 'TBLR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(65, 7, utf8_decode('4.2.1. Lineas Estratégicas del plan de Gobierno:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(115, 7, utf8_decode($row->linea_estrategica), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(35, 7, utf8_decode('4.2.2. Area de Inversión:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(145, 7, utf8_decode($row->area_inversion), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(20, 7, utf8_decode('4.2.3. Sector:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(160, 7, utf8_decode($row->sector), 'TBR', 1, 'L', '1');
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(20, 7, utf8_decode('4.2.4. Tipo:'), 'TBL', 0, 'L', '1');
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->Cell(160, 7, utf8_decode($tipo), 'TBR', 1, 'L', '1');

            # Segunda Pagina de datos del proyecto
            $this->pdf->AddPage();
            $this->pdf->Ln(10);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->Cell(180.2, 5, utf8_decode('5. IDENTIFICACIÓN DEL PROBLEMA Y JUSTIFICACIÓN'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('5.2. Objetivo general:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->obj_general), 'LR', 'J', 0);
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 7, utf8_decode('5.3. Importancia e Impacto:'), 'TRL', 0, 'L', '1');
            $this->pdf->Ln(7);
            $this->pdf->SetFont('Arial', '', 8);
            $this->pdf->MultiCell(180, 4, utf8_decode($row->imp_impacto), 'LRB', 'J', 0);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);

            // Acciones Especificas
            //$this->pdf->AddPage();
            $this->pdf->SetFont('Arial', 'B', 13);
            $this->pdf->Ln(0);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 10);
            $this->pdf->Cell(180.2, 5, utf8_decode('9. ACCIONES ESPECIFICAS'), 'TBLR', 1, 'C', '1');

            $y             = 1;
            $trimestre_i   = 0;
            $trimestre_ii  = 0;
            $trimestre_iii = 0;
            $trimestre_iv  = 0;
            $total         = 0;
            $query_dis     = "SELECT d.acc_esp,d.unidad_medida,d.medio_verificacion,d.trimestre_i,d.trimestre_ii,d.trimestre_iii,d.trimestre_iv,d.total FROM proyecto_registro AS p INNER JOIN distribucion_acc_especifica AS d ON(p.id=d.pk) WHERE p.ano_fiscal = $ano AND p.ente = $ente AND d.pk = $id_proy";
            $acciones      = $this->ModelStandard->query_set($query_dis, 'result');
            foreach ($acciones as $row) {
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(56, 119, 119);
                $this->pdf->Cell(180, 5, utf8_decode('Nombre de la Acción Específica'), 'TBLR', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->MultiCell(180, 3.8, utf8_decode($row->acc_esp), 'TBLR', 'L', 1);
                $this->pdf->SetFont('Arial', 'B', 8);
                $this->pdf->Cell(26, 7, 'Unidad de Medida:', 'TBL', 0, 'L', '1');
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->Cell(40, 7, utf8_decode($row->unidad_medida), 'TBR', 0, 'L', '1');
                $this->pdf->SetFont('Arial', 'B', 8);
                $this->pdf->Cell(27, 7, utf8_decode('Medio/Verificación:'), 'TBL', 0, 'L', '1');
                $this->pdf->SetFont('Arial', '', 8);
                $this->pdf->Cell(87, 7, utf8_decode($row->medio_verificacion), 'TBR', 1, 'L', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(191, 191, 191);
                $this->pdf->Cell(36, 5, 'I Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'II Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'III Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'IV Trimestre', 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, 'Total', 'TBLR', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_i), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_ii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iii), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iv), 'TBLR', 0, 'C', '1');
                $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->total), 'TBLR', 1, 'C', '1');

                if ($y == 5): // Si cumple con 5 registro, efectua un salto de pagina
                    $this->pdf->AddPage();
                    $this->pdf->Ln(10);
                    $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(56, 119, 119);
                    $this->pdf->Cell(180, 5, utf8_decode('Nombre de la Acción Específica'), 'TBLR', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->MultiCell(180, 3.8, utf8_decode($row->acc_esp), 'TBLR', 'L', 1);
                    $this->pdf->SetFont('Arial', 'B', 8);
                    $this->pdf->Cell(26, 7, 'Unidad de Medida:', 'TBL', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', '', 8);
                    $this->pdf->Cell(40, 7, utf8_decode($row->unidad_medida), 'TBR', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', 'B', 8);
                    $this->pdf->Cell(27, 7, utf8_decode('Medio/Verificación:'), 'TBL', 0, 'L', '1');
                    $this->pdf->SetFont('Arial', '', 8);
                    $this->pdf->Cell(87, 7, utf8_decode($row->medio_verificacion), 'TBR', 1, 'L', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(191, 191, 191);
                    $this->pdf->Cell(36, 5, 'I Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'II Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'III Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'IV Trimestre', 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, 'Total', 'TBLR', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_i), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_ii), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iii), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->trimestre_iv), 'TBLR', 0, 'C', '1');
                    $this->pdf->Cell(36, 5, $this->pdf->Format_Miles($row->total), 'TBLR', 1, 'C', '1');
                endif;

                $y = $y + 1;
                $trimestre_i += $row->trimestre_i;
                $trimestre_ii += $row->trimestre_ii;
                $trimestre_iii += $row->trimestre_iii;
                $trimestre_iv += $row->trimestre_iv;
                $total += $row->total;
            }

            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(36, 5, $trimestre_i, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_ii, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_iii, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $trimestre_iv, 'TBLR', 0, 'C', '1');
            $this->pdf->Cell(36, 5, $total, 'TBLR', 1, 'C', '1');

            // IMPUTACION PRESUPUESTARIA

            $trimestre_iimp    = 0;
            $trimestre_iipimp  = 0;
            $trimestre_iiipimp = 0;
            $trimestre_ivpimp  = 0;
            $montopimp         = 0;
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->SetFont('Arial', 'B', 8);
            $this->pdf->Cell(180, 5, utf8_decode('11. IMPUTACIÓN PRESUPUESTARIA'), 'TBLR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(15, 5, utf8_decode('Código P'), 'LR', 0, 'C', '0');
            $this->pdf->Cell(148, 5, utf8_decode('Denominación'), 'LR', 0, 'C', '0');

            $this->pdf->Cell(17, 5, utf8_decode('Total'), 'LR', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(191, 191, 191);

            $query_imp = "SELECT pa.codigo,pa.partida_presupuestaria,d.trimestre_i,d.trimestre_ii,d.trimestre_iii,d.trimestre_iv,d.m_asig AS asignacion FROM proyecto_registro AS p INNER JOIN distribucion_trimestral_imp_pre AS d ON(p.id=d.pk) INNER JOIN partida_presupuestaria AS pa ON(d.denominacion=pa.id) WHERE p.ano_fiscal = $ano AND p.ente = $ente AND d.pk = $id_proy";
            $imp       = $this->ModelStandard->query_set($query_imp, 'result');
            foreach ($imp as $row) {

                $this->pdf->SetFont('Arial', '', 5);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(15, 5, $row->codigo . ".00.00.00", 'TL', 0, 'C', '1');
                $this->pdf->Cell(148, 5, utf8_decode($row->partida_presupuestaria), 'TBR', 0, 'L', '1');
                $this->pdf->Cell(17, 5, $this->pdf->Format_number($row->asignacion), 'TBLR', 1, 'C', '1');

                $montopimp += $row->asignacion;
            }
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(209, 153, 153);
            $this->pdf->Cell(163, 5, utf8_decode('TOTAL GENERAL'), 'TBLR', 0, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->Cell(17, 5, $montopimp, 'TBLR', 1, 'C', '1');
        }
        // ======================================================================
    }
} // Cierre de ciclo for (iteracion en cuanto a los Sectores y Organos)
// =============================================================================
// Salida del Formato PDF
$this->pdf->Output("$nom $ano.pdf", 'I');
