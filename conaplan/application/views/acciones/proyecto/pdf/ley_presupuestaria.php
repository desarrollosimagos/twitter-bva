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

if ($dato[0] == 1 AND $dato[1] == 4) {
    $tomo   = "Tomo I $ano";
    $titulo = "Tomo I";
    $tipo_f = "Organos y Unidades de Apoyo";
} elseif ($dato[0] == 2 AND $dato[1] == 3) {
    $tomo   = "Tomo II $ano";
    $titulo = "Tomo II";
    $tipo_f = "Entes y Empresas";
}
// =============================================================================
// Portada Tomo (Ley Presupuestaria)
// =============================================================================
$this->pdf->Ln(3);
$this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
$this->pdf->SetFillColor(255, 255, 255);
$this->pdf->Ln(80);
$this->pdf->SetFont('Helvetica', 'B', 16);
$this->pdf->Cell(180, 7, utf8_decode('Ley de Presupuesto de Ingresos y Egresos'), '', 0, 'C', '1');
$this->pdf->Ln(7);
$this->pdf->Cell(180, 7, utf8_decode('del Estado Aragua'), '', 1, 'C', '1');
$this->pdf->Ln(95);
$this->pdf->Cell(180, 7, utf8_decode($titulo), '', 1, 'C', '1');
$this->pdf->Cell(180, 7, utf8_decode("Ejercicio Fiscal $ano"), '', 1, 'C', '1');
// =============================================================================
// Contra Portada Tomo I (Ley Presupuestaria)
// =============================================================================
$this->pdf->AddPage();
$this->pdf->Ln(10);
$this->pdf->SetFont('Helvetica', 'B', 11);

if ($dato[0] == 1 AND $dato[1] == 4) {
    $this->pdf->MultiCell(180, 5, utf8_decode("Presupuestos de Ingresos, Gastos y Operaciones de Financiamiento de los Órganos y Unidades de Apoyo del Estado Bolivariano de Aragua"), 0, 'J', 0);
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 32.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Acuérdese el monto total de los créditos presupuestario para cada Órgano del estado y para las'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('rectificaciones al presupuesto de gasto, de acuerdo con la distribución siguiente:'), '', 1, 'L', '1');
} elseif ($dato[0] == 2 AND $dato[1] == 3) {
    $this->pdf->MultiCell(180, 5, utf8_decode("Presupuesto de Ingresos, Gastos y Operaciones de Financiamiento de los Entes Descentralizados, Desconcentrados sin Fines Empresariales y Empresas del Estado Funcionalmente del Estado Bolivariano de Aragua"), 0, 'J', 0);
    $this->pdf->Ln(6);
    $this->pdf->Cell(25, 7, utf8_decode('Artículo 33.'), '', 0, 'L', '1');
    $this->pdf->SetFont('Helvetica', '', 10);
    $this->pdf->Cell(155, 7, utf8_decode('Se aprueba la estimación de los ingresos y fuentes de financiamiento y se acuerdan los presupuestos'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('de gastos y aplicaciones financieras de los Entes Descentralizados Funcionalmente con y sin Fines Empresariales,'), '', 1, 'L', '1');
    $this->pdf->Cell(155, 7, utf8_decode('que a continuación se señalan:'), '', 1, 'L', '1');
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
    $query1          = "SELECT oe.id,oe.tipo_ins,oe.sector,oe.nom_ins,SUM(im.m_asig) AS monto_general FROM imp_presupuestaria AS im INNER JOIN acciones_registro AS acc ON(im.id_acc_reg=acc.id) INNER JOIN organos_entes AS oe ON(acc.ente=oe.id) WHERE oe.tipo_ins = $dato[0] OR oe.tipo_ins = $dato[1] AND acc.estatus=4 GROUP BY oe.nom_ins,oe.sector,oe.tipo_ins,oe.id";
    $organos_montos  = $this->ModelStandard->query_set($query1, 'result');
    foreach ($organos_montos as $org) {
        $id_org           = $org->id;
        $monto_general    = $org->monto_general;
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
        // Seleccion de Organos
        $gastos_fiscales += (int) $monto_general + (int) $monto_asig;
        $tipo = $tipo; // Elemento para la captura de los valores a filtar, ya sea por Tomo I o Tomo II
        $dato = explode('-', $tipo);
        if ($org->sector == $sec->id) {
            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(3);
            $this->pdf->Cell(160, 7, utf8_decode($org->nom_ins), '', 0, 'L', '1');
            $this->pdf->Cell(20, 7, $this->pdf->Format_number((int) $monto_general + (int) $monto_asig), '', 1, 'L', '1');
            // Seleccion de Unidades de Apoyo
        } elseif ($org->sector == $sec->id) {

            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(3);
            $this->pdf->Cell(160, 7, utf8_decode($org->nom_ins), '', 0, 'L', '1');
            $this->pdf->Cell(20, 7, $this->pdf->Format_number((int) $monto_general + (int) $monto_asig), '', 1, 'L', '1');
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
// =============================================================================
// Inicio de los procesos por sectores asociados a los organismos
// =============================================================================
$this->pdf->AddPage();
$this->pdf->Ln(82);

foreach ($titulo_org_pro as $row) {
    $ente = $row->ente; // ID del Ente asociado
    $this->pdf->SetFont('Helvetica', 'B', 10);
    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
    $this->pdf->SetFillColor(255, 255, 255);
    $this->pdf->Cell(180, 7, utf8_decode("SECTOR: $row->codigo $row->sector"), '', 0, 'C', '1'); // Salida de los sectores
    $this->pdf->Ln(5);
    $this->pdf->Cell(180, 7, utf8_decode("$row->nom_ins"), '', 0, 'C', '1'); // Salida de los sectores
    //$this->pdf->AddPage(); // Siguiente pagina para reflejar de forma detallada la informacion de las Acciones Y Proyectos vinculados a los Sectores y Organos
    // =============================================================================
    // Siguiente pagina para reflejar de forma detallada la informacion de las Acciones Y Proyectos vinculados a los Sectores y Organos
    // =============================================================================
    $this->pdf->AddPage();
    $this->pdf->Ln(10);
    $this->pdf->SetLineWidth(-50); // Grozor de la linea
    $this->pdf->SetFont('Helvetica', 'B', 8);
    $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
    $this->pdf->SetFillColor(56, 119, 119);
    $this->pdf->Cell(180, 6, utf8_decode("$row->nom_ins"), 'RBLT', 1, 'L', '1'); // Salida de los sectores
    //$this->pdf->Cell(50, 6, "LEY DE PRESUPUESTO $ano", 'RBLT', 1, 'R', '1');

    $query4           = "SELECT acc.ente,acc.estruc_presupuestaria,ac.id AS id_accion,ac.accion_centralizada,SUM(imp.s_cons) AS s_cons, SUM(imp.g_fiscal) AS g_fiscal, SUM(imp.fci) AS fci,SUM(imp.ticr) AS ticr,SUM(imp.m_asig) AS m_asig FROM acciones_registro AS acc INNER JOIN accion_centralizada AS ac ON(acc.acc_centralizada = ac.id) INNER JOIN imp_presupuestaria AS imp ON(imp.id_acc_reg = acc.id) WHERE acc.acc_centralizada = ac.id AND acc.ente = $ente AND acc.estatus=4 GROUP BY imp.id_acc_reg,acc.estruc_presupuestaria,ac.accion_centralizada,acc.ente,ac.id";
    $resumen_acciones = $this->ModelStandard->query_set($query4, 'result');
    #echo count($resumen_acciones);
    if (count($resumen_acciones) > 0) { // Validacion si existe resumenes existentes por Sectores y Organos
        $this->pdf->Cell(180, 6, "RESUMEN DE LAS ACCIONES CENTRALIZADAS (EN BOLIVARES)", 'RBLT', 1, 'L', '1');
        $m_asig = 0;
        foreach ($resumen_acciones as $row) {
            $m_asig +=$row->m_asig;
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(222, 222, 222);
            $this->pdf->SetFont('Helvetica', 'B', 5);
            $this->pdf->Cell(32, 6, "ESTRUCTURA PRESUPUESTARIA", 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(32, 6, "$row->estruc_presupuestaria", 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(148, 6, utf8_decode("$row->accion_centralizada"), 'RBLT', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(222, 222, 222);
            $this->pdf->SetFont('Helvetica', 'B', 5);
            $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(60, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(19, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
            $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(255, 255, 255);
            $this->pdf->SetFont('Helvetica', '', 7);
            $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(60, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(19, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');
        }
        $this->pdf->SetFont('Helvetica', 'B', 6);
        $this->pdf->Cell(32, 5, utf8_decode("TOTAL"), 'RBLT', 0, 'C', '1');
        $this->pdf->Cell(129, 5, "", 'RBLT', 0, 'C', '1');
        $this->pdf->Cell(19, 5, $this->pdf->Format_number($m_asig), 'RBLT', 1, 'C', '1');

        // Bloque de validacion para reflejar de forma detallada por Accion Centralida (Sectores / Organos)
        $this->pdf->SetLineWidth(-50); // Grozor de la linea
        $this->pdf->SetFont('Helvetica', 'B', 8);
        $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
        $this->pdf->SetFillColor(56, 119, 119);
        // Bloque donde se refleja el Resumen de los Creditos Presupuestarios (Bolivares) por Organos Entes
        $this->pdf->Cell(180, 5, utf8_decode("RESUMEN DE CRÉDITOS PRESUPUESTARIOS (EN BOLIVARES)"), 'RBLT', 1, 'L', '1');
        foreach ($resumen_acciones as $row) {
            $id_accion = $row->id_accion; // ID de la Accion Centralizada
            $this->pdf->SetFont('Helvetica', 'B', 8);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            // Accion centralizada (Ciclo foreach)
            $this->pdf->Cell(180, 5, utf8_decode("ACCIÓN CENTRALIZADA: $row->accion_centralizada"), 'RBLT', 1, 'L', '1');

            // Proceso de llamado de los datos de forma detallada (Resumen de Creditos Presupuestarios)
            $query_resumen = "SELECT acc.acc_centralizada,p.codigo,p.partida_presupuestaria,imp.s_cons,imp.g_fiscal,imp.fci,imp.ticr,imp.m_asig FROM acciones_registro acc INNER JOIN imp_presupuestaria AS imp ON(imp.id_acc_reg=acc.id) INNER JOIN partida_presupuestaria AS p ON(imp.partida=p.id) WHERE acc.acc_centralizada= $id_accion";
            $resumen_c_p   = $this->ModelStandard->query_set($query_resumen, 'result');
            foreach ($resumen_c_p as $row) {
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(222, 222, 222);
                $this->pdf->SetFont('Helvetica', 'B', 5);

                if ($row->m_asig > 0.00) { // Bloque de validacion para determinar la existencia de los montos por partidas
                    $this->pdf->Cell(32, 6, "PARTIDA DE EGRESO", 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->SetFont('Helvetica', '', 7);
                    $this->pdf->Cell(32, 6, "$row->codigo.00.00.00", 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(148, 6, utf8_decode("$row->partida_presupuestaria"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(222, 222, 222);
                    $this->pdf->SetFont('Helvetica', 'B', 5);
                    $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(60, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(19, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->SetFont('Helvetica', '', 7);
                    $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(60, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(19, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');
                }
            }
        }
    }

    $query5           = "SELECT proy.id AS id_proyecto,oe.id,SUM(dis.m_asig) AS monto_asig FROM distribucion_trimestral_imp_pre AS dis INNER JOIN proyecto_registro AS proy ON(dis.pk=proy.id) INNER JOIN organos_entes AS oe ON(proy.ente=oe.id) INNER JOIN observaciones_acciones_proy AS obs ON(proy.ente=obs.organo) WHERE proy.estatus=4 GROUP BY oe.nom_ins,oe.id,proy.id";
    $proyectos_montos = $this->ModelStandard->query_set($query5, 'result');
    foreach ($proyectos_montos as $proy) {
        $id_proyecto   = $proy->id_proyecto; // ID del Proyecto
        $id_ente       = $proy->id; // ID del Ente
        $monto_general = $proy->monto_asig; // Monto General por Proyectos (Sectores / Organos)

        if ($monto_general > 0) { // Se deternina si posee un existente por organo monto del proyecto
            $query6       = "SELECT proy.id,proy.estruc_presupuestaria,proy.descripcion_proy,proy.obj_general AS obj_proyecto,obj_h.objetivo_historico,obj_n.objetivo_nacional,obj_e.objetivo_estrategico,obj_g.objetivo_general,li_es.linea_estrategica,proy.nom_proyecto,SUM(dis.s_cons) AS s_cons,SUM(dis.g_fiscal) AS g_fiscal, SUM(dis.fci) AS fci,SUM(dis.ticr) AS ticr,SUM(dis.m_asig) AS m_asig FROM proyecto_registro AS proy INNER JOIN distribucion_trimestral_imp_pre AS dis ON(dis.pk = proy.id) INNER JOIN objetivo_historico AS obj_h ON(proy.objetivo_historico=obj_h.id) INNER JOIN objetivo_nacional AS obj_n ON(proy.objetivo_nacional=obj_n.id) INNER JOIN objetivo_estrategico AS obj_e ON(proy.objetivo_estrategico=obj_e.id) INNER JOIN objetivo_general AS obj_g ON(proy.objetivo_general=obj_g.id) INNER JOIN linea_estrategica AS li_es ON(proy.linea_estrategica=li_es.id) WHERE proy.ente = $id_ente AND proy.id = $id_proyecto AND proy.estatus=4 GROUP BY dis.pk,proy.estruc_presupuestaria,proy.ente,proy.id,obj_h.objetivo_historico,obj_n.objetivo_nacional,obj_e.objetivo_estrategico,obj_g.objetivo_general,li_es.linea_estrategica,proy.descripcion_proy";
            $resumen_proy = $this->ModelStandard->query_set($query6, 'result');
            $this->pdf->AddPage(); // Salto de pagina
            $this->pdf->Ln(13);
            $this->pdf->SetLineWidth(-50); // Grozor de la linea
            $this->pdf->SetFont('Helvetica', 'B', 8);
            $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
            $this->pdf->SetFillColor(56, 119, 119);
            $this->pdf->Cell(180, 5, "RESUMEN DE PROYECTOS", 'RBLT', 1, 'L', '1');
            $s            = 5;
            $m_asig       = 0; // Variable en donde se toman la sumatoria de los montos asignados por cada proyecto (Sectores / Organos)
            $i            = 1; // Variable que se encarga de contar la cantidad de registros por proyectos
            foreach ($resumen_proy as $row) { // Recorrido de los proyectos
                $m_asig += $row->m_asig; // Monto general de los proyectos (Organos/Entes)
                $denominacion = strlen("$row->nom_proyecto"); // Se cuenta la cantidad de caracteres que posee el nombre del proyecto para poder validar la longitud de cada celda
                if ($denominacion > 160) {
                    $s = 10;
                    $e = 5;
                } elseif ($denominacion < 160) {
                    $s = 5;
                    $e = 0;
                }
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(222, 222, 222);
                $this->pdf->SetFont('Helvetica', 'B', 5);
                $this->pdf->Cell(32, 6, "ESTRUCTURA PRESUPUESTARIA", 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->Cell(32, $s, "$row->estruc_presupuestaria", 'RBLT', 0, 'C', '1');
                $this->pdf->MultiCell(148, $s - $e, utf8_decode("$row->nom_proyecto"), 'LR', 'J', 0);
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(222, 222, 222);
                $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(56, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(23, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
                $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(255, 255, 255);
                $this->pdf->SetFont('Helvetica', '', 7);
                // Bloque de montos por Fuente de Financiamiento
                $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(56, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
                $this->pdf->Cell(23, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');

                /* =========================================================================================
                  Detallado especifico del proyecto
                  ========================================================================================= */
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('DESCRIPCIÓN DEL PROYECTO'), 'TRL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->descripcion_proy"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO GENERAL DEL PROYECTO'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->obj_proyecto"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO HISTÓRICO'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_historico"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO NACIONAL'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_nacional"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO ESTRATÉGICO'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_estrategico"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO GENERAL'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_general"), 'LR', 'J', 0);
                $this->pdf->SetFont('Arial', 'B', 7);
                $this->pdf->Cell(180, 5, utf8_decode('LÍNEA ESTRÁTEGICA DEL PLAN DE GOBIERNO'), 'RL', 0, 'L', '1');
                $this->pdf->Ln(5);
                $this->pdf->SetFont('Arial', '', 6);
                $this->pdf->MultiCell(180, 3, utf8_decode("$row->linea_estrategica"), 'LR', 'J', 0);
                /* =====================================================================================
                 * RESUMEN DE CRÉDITOS PRESUPUESTARIOS (EN BOLIVARES) - PROYECTOS
                  ===================================================================================== */
                $this->pdf->SetFont('Helvetica', 'B', 8);
                $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                $this->pdf->SetFillColor(56, 119, 119);
                $this->pdf->Cell(180, 5, utf8_decode("RESUMEN DE CRÉDITOS PRESUPUESTARIOS (EN BOLIVARES)"), 'RBLT', 1, 'L', '1');

                $query_creditos   = "SELECT p.partida_presupuestaria,p.codigo,dis.s_cons,dis.g_fiscal,dis.fci,dis.ticr,dis.m_asig FROM proyecto_registro AS proy INNER JOIN distribucion_trimestral_imp_pre AS dis ON(proy.id=dis.pk) INNER JOIN partida_presupuestaria AS p ON(dis.denominacion=p.id) WHERE proy.ente = $id_ente";
                $resumen_creditos = $this->ModelStandard->query_set($query_creditos, 'result');
                foreach ($resumen_creditos as $row) {
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(222, 222, 222);
                    $this->pdf->SetFont('Helvetica', 'B', 5);
                    $this->pdf->Cell(32, 6, "PARTIDA PRESUPUESTARIA", 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->SetFont('Helvetica', '', 7);
                    $this->pdf->Cell(32, 6, utf8_decode("$row->codigo.00.00.00"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(148, 6, utf8_decode("$row->partida_presupuestaria"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(222, 222, 222);
                    $this->pdf->SetFont('Helvetica', 'B', 5);
                    $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(60, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(19, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
                    $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                    $this->pdf->SetFillColor(255, 255, 255);
                    $this->pdf->SetFont('Helvetica', '', 7);
                    $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(60, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
                    $this->pdf->Cell(19, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');
                    /* ===================================================================================== */
                    // Si tiene mas de un proyecto, se muestra en la siguiente pagina de forma detallada
                    if ($i == 2) {
                        $this->pdf->AddPage(); // Salto de linea
                        $this->pdf->Ln(82);
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(222, 222, 222);
                        $this->pdf->SetFont('Helvetica', 'B', 5);
                        $this->pdf->Cell(32, 6, "ESTRUCTURA PRESUPUESTARIA", 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(255, 255, 255);
                        $this->pdf->Cell(32, $s, "$row->estruc_presupuestaria", 'RBLT', 0, 'C', '1');
                        $this->pdf->MultiCell(148, $s - $e, utf8_decode("$row->nom_proyecto"), 'LR', 'J', 0);
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(222, 222, 222);
                        $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(56, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(23, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(255, 255, 255);
                        $this->pdf->SetFont('Helvetica', '', 7);
                        // Bloque de montos por Fuente de Financiamiento
                        $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(56, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(23, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');
                        /* =========================================================================================
                          Detallado especifico del proyecto (Caracteristicas principales)
                          ========================================================================================= */
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('DESCRIPCIÓN DEL PROYECTO'), 'TRL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->descripcion_proy"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO GENERAL DEL PROYECTO'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->obj_proyecto"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO HISTÓRICO'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_historico"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO NACIONAL'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_nacional"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO ESTRATÉGICO'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_estrategico"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('OBJETIVO GENERAL'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->objetivo_general"), 'LR', 'J', 0);
                        $this->pdf->SetFont('Arial', 'B', 7);
                        $this->pdf->Cell(180, 5, utf8_decode('LÍNEA ESTRÁTEGICA DEL PLAN DE GOBIERNO'), 'RL', 0, 'L', '1');
                        $this->pdf->Ln(5);
                        $this->pdf->SetFont('Arial', '', 6);
                        $this->pdf->MultiCell(180, 3, utf8_decode("$row->linea_estrategica"), 'LR', 'J', 0);
                        $this->pdf->Cell(180, 5, utf8_decode('LÍNEA ESTRÁTEGICA DEL PLAN DE GOBIERNO'), 'RL', 0, 'L', '1');
                        /* =====================================================================================
                         * RESUMEN DE CRÉDITOS PRESUPUESTARIOS (EN BOLIVARES) - PROYECTOS
                          ===================================================================================== */
                        $this->pdf->SetFont('Helvetica', 'B', 8);
                        $this->pdf->SetTextColor(255, 255, 255);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(56, 119, 119);
                        $this->pdf->Cell(180, 5, utf8_decode("RESUMEN DE CRÉDITOS PRESUPUESTARIOS (EN BOLIVARES)"), 'RBLT', 1, 'L', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(222, 222, 222);
                        $this->pdf->SetFont('Helvetica', 'B', 5);
                        $this->pdf->Cell(32, 6, "PARTIDA PRESUPUESTARIA", 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(148, 6, utf8_decode("DENOMINACIÓN"), 'RBLT', 1, 'C', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(255, 255, 255);
                        $this->pdf->SetFont('Helvetica', '', 7);
                        $this->pdf->Cell(32, 6, utf8_decode("$row->codigo.00.00.00"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(148, 6, utf8_decode("$row->partida_presupuestaria"), 'RBLT', 1, 'C', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(222, 222, 222);
                        $this->pdf->SetFont('Helvetica', 'B', 5);
                        $this->pdf->Cell(32, 5, utf8_decode("SITUADO CONSTITUCIONAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(24, 5, utf8_decode("GESTIÓN FISCAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(45, 5, utf8_decode("FONDO DE COMPENSACIÓN INTERTERRITORIAL"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(60, 5, utf8_decode("TRANSFERENCIAS CORRIENTES INTERNAS DE LA REPÚBLICA"), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(19, 5, utf8_decode("TOTAL"), 'RBLT', 1, 'C', '1');
                        $this->pdf->SetTextColor(0, 0, 0);  # COLOR DEL TEXTO
                        $this->pdf->SetFillColor(255, 255, 255);
                        $this->pdf->SetFont('Helvetica', '', 7);
                        $this->pdf->Cell(32, 5, $this->pdf->Format_number($row->s_cons), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(24, 5, $this->pdf->Format_number($row->g_fiscal), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(45, 5, $this->pdf->Format_number($row->fci), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(60, 5, $this->pdf->Format_number($row->ticr), 'RBLT', 0, 'C', '1');
                        $this->pdf->Cell(19, 5, $this->pdf->Format_number($row->m_asig), 'RBLT', 1, 'C', '1');
                        /* ===================================================================================== */
                    }
                }
                $s = $s + 5; // Acumulador de dimension de las celdas
                $i = $i + 1; // Acumulador de cantidad de registros por proyecto (Sectores/ Organos)
                /* ========================================================================================= */
            }
            $this->pdf->SetFont('Helvetica', 'B', 6);
            $this->pdf->Cell(32, 5, utf8_decode("MONTO TOTAL"), 'RBLT', 0, 'C', '1');
            $this->pdf->Cell(129, 5, "", 'RBLT', 0, 'C', '1');
            // Bloque de monto General asignado por proyecto
            $this->pdf->Cell(19, 5, $this->pdf->Format_number($m_asig), 'RBLT', 1, 'C', '1');
        }
    }
    $this->pdf->AddPage();
    $this->pdf->Ln(82);
}
// =============================================================================
// Salida del Formato PDF
$this->pdf->Output("Ley Presupuestaria $tipo_f $ano.pdf", 'I');
