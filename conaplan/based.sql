--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accion_centralizada; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE accion_centralizada (
    accion_centralizada character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.accion_centralizada OWNER TO conaplan1;

--
-- Name: accion_centralizada_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE accion_centralizada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accion_centralizada_id_seq OWNER TO conaplan1;

--
-- Name: accion_centralizada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE accion_centralizada_id_seq OWNED BY accion_centralizada.id;


--
-- Name: accion_especifica; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE accion_especifica (
    accion_especifica character varying(350),
    id integer NOT NULL,
    accion_centralizada integer
);


ALTER TABLE public.accion_especifica OWNER TO conaplan1;

--
-- Name: accion_especifica_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE accion_especifica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accion_especifica_id_seq OWNER TO conaplan1;

--
-- Name: accion_especifica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE accion_especifica_id_seq OWNED BY accion_especifica.id;


--
-- Name: acciones_registro; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE acciones_registro (
    id integer NOT NULL,
    estatus integer,
    codigo character(20),
    fecha_elaboracion date,
    ano_fiscal integer,
    ente integer,
    cargo character(170),
    m_autoridad character(170),
    tlf character(15),
    cedula integer,
    correo character varying(100),
    politica_presupuestaria text,
    acc_centralizada integer,
    reg_res integer,
    fecha_revision date,
    estruc_presupuestaria character varying(20),
    observaciones character varying(1000),
    reg_registro integer,
    cierre integer,
    accion integer
);


ALTER TABLE public.acciones_registro OWNER TO conaplan1;

--
-- Name: acciones_registro_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE acciones_registro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acciones_registro_id_seq OWNER TO conaplan1;

--
-- Name: acciones_registro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE acciones_registro_id_seq OWNED BY acciones_registro.id;


--
-- Name: actividad_ejecutada; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE actividad_ejecutada (
    id integer NOT NULL,
    id_act integer,
    trimestre_i double precision,
    porcentaje_i double precision,
    observacion_i text,
    trimestre_ii double precision,
    porcentaje_ii double precision,
    observacion_ii text,
    trimestre_iii double precision,
    porcentaje_iii double precision,
    observacion_iii text,
    trimestre_iv double precision,
    porcentaje_iv double precision,
    observacion_iv text
);


ALTER TABLE public.actividad_ejecutada OWNER TO conaplan1;

--
-- Name: actividad_ejecutada_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE actividad_ejecutada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actividad_ejecutada_id_seq OWNER TO conaplan1;

--
-- Name: actividad_ejecutada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE actividad_ejecutada_id_seq OWNED BY actividad_ejecutada.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE auth_group (
    name character varying(80) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.auth_group OWNER TO conaplan1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO conaplan1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE auth_user (
    password character varying(128) NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    cedula character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    group_id integer,
    agregar boolean,
    modificar boolean,
    eliminar boolean,
    ver boolean,
    reporte boolean,
    id integer NOT NULL
);


ALTER TABLE public.auth_user OWNER TO conaplan1;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO conaplan1;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE bitacora (
    modulo character(200),
    accion character(100),
    id_usuario integer,
    fecha_registro date,
    fecha_actualizacion date,
    hora_registro character(8),
    hora_actualizacion character(8),
    id integer NOT NULL,
    ip character(20)
);


ALTER TABLE public.bitacora OWNER TO conaplan1;

--
-- Name: bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_id_seq OWNER TO conaplan1;

--
-- Name: bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE bitacora_id_seq OWNED BY bitacora.id;


--
-- Name: distribucion_acc_especifica; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_acc_especifica (
    id integer NOT NULL,
    pk integer,
    acc_esp character varying(198),
    unidad_medida character varying(40),
    medio_verificacion character varying(40),
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    total double precision
);


ALTER TABLE public.distribucion_acc_especifica OWNER TO conaplan1;

--
-- Name: distribucion_acc_especifica_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_acc_especifica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_acc_especifica_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_acc_especifica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_acc_especifica_id_seq OWNED BY distribucion_acc_especifica.id;


--
-- Name: distribucion_actividad; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_actividad (
    id integer NOT NULL,
    id_acc_reg integer,
    actividad character varying(198),
    unidad_medida character varying(40),
    medio_verificacion character varying(40),
    cantidad double precision,
    indicador_actividad character varying(40),
    programado boolean DEFAULT false
);


ALTER TABLE public.distribucion_actividad OWNER TO conaplan1;

--
-- Name: distribucion_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_actividad_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_actividad_id_seq OWNED BY distribucion_actividad.id;


--
-- Name: distribucion_trimestral_acc_especifica; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_trimestral_acc_especifica (
    id integer NOT NULL,
    pk integer,
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    total double precision,
    id_acc integer
);


ALTER TABLE public.distribucion_trimestral_acc_especifica OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_acc_especifica_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_trimestral_acc_especifica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_trimestral_acc_especifica_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_acc_especifica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_trimestral_acc_especifica_id_seq OWNED BY distribucion_trimestral_acc_especifica.id;


--
-- Name: distribucion_trimestral_actividad; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_trimestral_actividad (
    id integer NOT NULL,
    id_acc_reg integer,
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    total double precision,
    id_actividad integer
);


ALTER TABLE public.distribucion_trimestral_actividad OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_trimestral_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_trimestral_actividad_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_trimestral_actividad_id_seq OWNED BY distribucion_trimestral_actividad.id;


--
-- Name: distribucion_trimestral_financiera; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_trimestral_financiera (
    id integer NOT NULL,
    id_acc_reg integer,
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    total double precision,
    id_actividad integer
);


ALTER TABLE public.distribucion_trimestral_financiera OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_financiera_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_trimestral_financiera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_trimestral_financiera_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_financiera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_trimestral_financiera_id_seq OWNED BY distribucion_trimestral_financiera.id;


--
-- Name: distribucion_trimestral_imp_pre; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE distribucion_trimestral_imp_pre (
    id integer NOT NULL,
    pk integer,
    denominacion integer,
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    cantidad double precision,
    asignacion double precision,
    s_cons double precision,
    g_fiscal double precision,
    fci double precision,
    ticr double precision,
    m_asig double precision
);


ALTER TABLE public.distribucion_trimestral_imp_pre OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_imp_pre_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE distribucion_trimestral_imp_pre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribucion_trimestral_imp_pre_id_seq OWNER TO conaplan1;

--
-- Name: distribucion_trimestral_imp_pre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE distribucion_trimestral_imp_pre_id_seq OWNED BY distribucion_trimestral_imp_pre.id;


--
-- Name: estructura; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE estructura (
    estructura character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.estructura OWNER TO conaplan1;

--
-- Name: estructura_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE estructura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estructura_id_seq OWNER TO conaplan1;

--
-- Name: estructura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE estructura_id_seq OWNED BY estructura.id;


--
-- Name: imp_presupuestaria; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE imp_presupuestaria (
    id integer NOT NULL,
    id_acc_reg integer,
    partida integer,
    trimestre_i double precision,
    trimestre_ii double precision,
    trimestre_iii double precision,
    trimestre_iv double precision,
    cantidad double precision,
    monto double precision,
    s_cons double precision,
    g_fiscal double precision,
    fci double precision,
    ticr double precision,
    m_asig double precision,
    pk integer NOT NULL
);


ALTER TABLE public.imp_presupuestaria OWNER TO conaplan1;

--
-- Name: imp_presupuestaria_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE imp_presupuestaria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imp_presupuestaria_id_seq OWNER TO conaplan1;

--
-- Name: imp_presupuestaria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE imp_presupuestaria_id_seq OWNED BY imp_presupuestaria.id;


--
-- Name: imp_presupuestaria_pk_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE imp_presupuestaria_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imp_presupuestaria_pk_seq OWNER TO conaplan1;

--
-- Name: imp_presupuestaria_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE imp_presupuestaria_pk_seq OWNED BY imp_presupuestaria.pk;


--
-- Name: linea_estrategica; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE linea_estrategica (
    linea_estrategica character varying(350),
    id integer NOT NULL,
    plan_gobierno integer
);


ALTER TABLE public.linea_estrategica OWNER TO conaplan1;

--
-- Name: linea_estrategica_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE linea_estrategica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linea_estrategica_id_seq OWNER TO conaplan1;

--
-- Name: linea_estrategica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE linea_estrategica_id_seq OWNED BY linea_estrategica.id;


--
-- Name: modulo; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE modulo (
    modulo character varying(250) NOT NULL,
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    posicion integer,
    activo boolean,
    desplegable boolean,
    usuario_creado integer,
    usuario_actualizado integer,
    fecha_creado date,
    fecha_actualizado date
);


ALTER TABLE public.modulo OWNER TO conaplan1;

--
-- Name: modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE modulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modulo_id_seq OWNER TO conaplan1;

--
-- Name: modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE modulo_id_seq OWNED BY modulo.id;


--
-- Name: objetivo_especifico; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE objetivo_especifico (
    objetivo_especifico text,
    id integer NOT NULL,
    plan_gobierno integer,
    linea_estrategica integer
);


ALTER TABLE public.objetivo_especifico OWNER TO conaplan1;

--
-- Name: objetivo_especifico_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE objetivo_especifico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_especifico_id_seq OWNER TO conaplan1;

--
-- Name: objetivo_especifico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE objetivo_especifico_id_seq OWNED BY objetivo_especifico.id;


--
-- Name: objetivo_estrategico; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE objetivo_estrategico (
    objetivo_estrategico text,
    id integer NOT NULL,
    plan_patria integer,
    objetivo_historico integer,
    objetivo_nacional integer
);


ALTER TABLE public.objetivo_estrategico OWNER TO conaplan1;

--
-- Name: objetivo_estrategico_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE objetivo_estrategico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_estrategico_id_seq OWNER TO conaplan1;

--
-- Name: objetivo_estrategico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE objetivo_estrategico_id_seq OWNED BY objetivo_estrategico.id;


--
-- Name: objetivo_general; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE objetivo_general (
    objetivo_general text,
    id integer NOT NULL,
    plan_patria integer,
    objetivo_historico integer,
    objetivo_nacional integer,
    objetivo_estrategico integer
);


ALTER TABLE public.objetivo_general OWNER TO conaplan1;

--
-- Name: objetivo_general_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE objetivo_general_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_general_id_seq OWNER TO conaplan1;

--
-- Name: objetivo_general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE objetivo_general_id_seq OWNED BY objetivo_general.id;


--
-- Name: objetivo_historico; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE objetivo_historico (
    objetivo_historico text,
    id integer NOT NULL,
    plan_patria integer
);


ALTER TABLE public.objetivo_historico OWNER TO conaplan1;

--
-- Name: objetivo_historico_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE objetivo_historico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_historico_id_seq OWNER TO conaplan1;

--
-- Name: objetivo_historico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE objetivo_historico_id_seq OWNED BY objetivo_historico.id;


--
-- Name: objetivo_nacional; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE objetivo_nacional (
    objetivo_nacional text,
    id integer NOT NULL,
    plan_patria integer,
    objetivo_historico integer
);


ALTER TABLE public.objetivo_nacional OWNER TO conaplan1;

--
-- Name: objetivo_nacional_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE objetivo_nacional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_nacional_id_seq OWNER TO conaplan1;

--
-- Name: objetivo_nacional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE objetivo_nacional_id_seq OWNED BY objetivo_nacional.id;


--
-- Name: observaciones_acciones; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE observaciones_acciones (
    id integer NOT NULL,
    organo integer,
    id_accion integer,
    revisado integer,
    estructura character varying(15),
    observaciones character varying(1000),
    estatus integer,
    fecha_elaboracion date,
    cierre integer,
    ano_fiscal integer
);


ALTER TABLE public.observaciones_acciones OWNER TO conaplan1;

--
-- Name: observaciones_acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE observaciones_acciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observaciones_acciones_id_seq OWNER TO conaplan1;

--
-- Name: observaciones_acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE observaciones_acciones_id_seq OWNED BY observaciones_acciones.id;


--
-- Name: observaciones_acciones_proy; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE observaciones_acciones_proy (
    id integer NOT NULL,
    organo integer,
    id_accion integer,
    revisado integer,
    estructura character varying(15),
    observaciones character varying(1000),
    estatus integer,
    fecha_elaboracion date,
    cierre integer,
    ano_fiscal integer
);


ALTER TABLE public.observaciones_acciones_proy OWNER TO conaplan1;

--
-- Name: observaciones_acciones_proy_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE observaciones_acciones_proy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observaciones_acciones_proy_id_seq OWNER TO conaplan1;

--
-- Name: observaciones_acciones_proy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE observaciones_acciones_proy_id_seq OWNED BY observaciones_acciones_proy.id;


--
-- Name: organos_entes; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE organos_entes (
    user_create integer,
    user_update integer,
    nom_ins character varying(300),
    siglas character varying(10),
    tipo_ins integer,
    tipo_estructura integer,
    nom_resp character varying(300),
    cedula character varying(9),
    tlf character varying(26),
    cargo character varying(50),
    sector integer,
    correo character varying(300),
    direccion text,
    id integer NOT NULL
);


ALTER TABLE public.organos_entes OWNER TO conaplan1;

--
-- Name: organos_entes_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE organos_entes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organos_entes_id_seq OWNER TO conaplan1;

--
-- Name: organos_entes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE organos_entes_id_seq OWNED BY organos_entes.id;


--
-- Name: partida_presupuestaria; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE partida_presupuestaria (
    partida_presupuestaria character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.partida_presupuestaria OWNER TO conaplan1;

--
-- Name: partida_presupuestaria_centralizada; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE partida_presupuestaria_centralizada (
    accion_centralizada integer,
    partida_presupuestaria integer,
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.partida_presupuestaria_centralizada OWNER TO conaplan1;

--
-- Name: partida_presupuestaria_centralizada_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE partida_presupuestaria_centralizada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_presupuestaria_centralizada_id_seq OWNER TO conaplan1;

--
-- Name: partida_presupuestaria_centralizada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE partida_presupuestaria_centralizada_id_seq OWNED BY partida_presupuestaria_centralizada.id;


--
-- Name: partida_presupuestaria_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE partida_presupuestaria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_presupuestaria_id_seq OWNER TO conaplan1;

--
-- Name: partida_presupuestaria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE partida_presupuestaria_id_seq OWNED BY partida_presupuestaria.id;


--
-- Name: plan_gobierno; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE plan_gobierno (
    plan_gobierno character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.plan_gobierno OWNER TO conaplan1;

--
-- Name: plan_gobierno_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE plan_gobierno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_gobierno_id_seq OWNER TO conaplan1;

--
-- Name: plan_gobierno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE plan_gobierno_id_seq OWNED BY plan_gobierno.id;


--
-- Name: plan_patria; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE plan_patria (
    plan_patria character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.plan_patria OWNER TO conaplan1;

--
-- Name: plan_patria_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE plan_patria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_patria_id_seq OWNER TO conaplan1;

--
-- Name: plan_patria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE plan_patria_id_seq OWNED BY plan_patria.id;


--
-- Name: proyecto_registro; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE proyecto_registro (
    id integer NOT NULL,
    codigo character(20),
    fecha_elaboracion date,
    reg_registro integer,
    estatus integer,
    ente integer,
    domicilio character varying(450),
    cargo character varying(170),
    tlf character(15),
    responsable character varying(170),
    correo character varying(100),
    nom_proyecto character varying(250),
    ubicacion character varying(200),
    inicio date,
    fin date,
    f_financiamiento integer,
    ano_fiscal integer,
    indicador_g character varying(150),
    duracion integer,
    identificador character varying(150),
    etapa integer,
    m_verificacion character varying(150),
    ambito integer,
    especifique_amb text,
    plan_patria integer,
    objetivo_historico integer,
    objetivo_nacional integer,
    objetivo_estrategico integer,
    objetivo_general integer,
    plan_gobierno integer,
    linea_estrategica integer,
    area_inversion character varying(200),
    sector integer,
    tipo_inversion integer,
    desc_problema character varying(450),
    obj_general character varying(450),
    imp_impacto character varying(450),
    ben_femeninos double precision,
    ben_masculinos double precision,
    total_ben double precision,
    req_acciones integer,
    acc_institucion integer,
    acc_especifique text,
    con_acciones integer,
    con_institucion integer,
    con_especifique text,
    en_acciones integer,
    en_institucion integer,
    en_especifique text,
    estimado_fem double precision,
    estimado_mas double precision,
    estimado_t_direc double precision,
    estimado_t_indirec double precision,
    reg_res integer,
    fecha_revision date,
    estruc_presupuestaria character(11),
    observaciones text,
    descripcion_proy text,
    cierre integer,
    accion integer
);


ALTER TABLE public.proyecto_registro OWNER TO conaplan1;

--
-- Name: proyecto_registro_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE proyecto_registro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_registro_id_seq OWNER TO conaplan1;

--
-- Name: proyecto_registro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE proyecto_registro_id_seq OWNED BY proyecto_registro.id;


--
-- Name: sectores; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE sectores (
    sector character varying(350),
    codigo character varying(25),
    id integer NOT NULL
);


ALTER TABLE public.sectores OWNER TO conaplan1;

--
-- Name: sectores_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE sectores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sectores_id_seq OWNER TO conaplan1;

--
-- Name: sectores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE sectores_id_seq OWNED BY sectores.id;


--
-- Name: sub_modulo; Type: TABLE; Schema: public; Owner: conaplan1; Tablespace: 
--

CREATE TABLE sub_modulo (
    sub_modulo character varying(250) NOT NULL,
    id integer NOT NULL,
    id_modulo integer,
    url character varying(250) NOT NULL,
    posicion integer,
    activo boolean,
    usuario_creado integer,
    usuario_actualizado integer,
    fecha_creado date,
    fecha_actualizado date
);


ALTER TABLE public.sub_modulo OWNER TO conaplan1;

--
-- Name: sub_modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: conaplan1
--

CREATE SEQUENCE sub_modulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_modulo_id_seq OWNER TO conaplan1;

--
-- Name: sub_modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: conaplan1
--

ALTER SEQUENCE sub_modulo_id_seq OWNED BY sub_modulo.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY accion_centralizada ALTER COLUMN id SET DEFAULT nextval('accion_centralizada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY accion_especifica ALTER COLUMN id SET DEFAULT nextval('accion_especifica_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY acciones_registro ALTER COLUMN id SET DEFAULT nextval('acciones_registro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY actividad_ejecutada ALTER COLUMN id SET DEFAULT nextval('actividad_ejecutada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY bitacora ALTER COLUMN id SET DEFAULT nextval('bitacora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_acc_especifica ALTER COLUMN id SET DEFAULT nextval('distribucion_acc_especifica_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_actividad ALTER COLUMN id SET DEFAULT nextval('distribucion_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_acc_especifica ALTER COLUMN id SET DEFAULT nextval('distribucion_trimestral_acc_especifica_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_actividad ALTER COLUMN id SET DEFAULT nextval('distribucion_trimestral_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_financiera ALTER COLUMN id SET DEFAULT nextval('distribucion_trimestral_financiera_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_imp_pre ALTER COLUMN id SET DEFAULT nextval('distribucion_trimestral_imp_pre_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY estructura ALTER COLUMN id SET DEFAULT nextval('estructura_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY imp_presupuestaria ALTER COLUMN id SET DEFAULT nextval('imp_presupuestaria_id_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY imp_presupuestaria ALTER COLUMN pk SET DEFAULT nextval('imp_presupuestaria_pk_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY linea_estrategica ALTER COLUMN id SET DEFAULT nextval('linea_estrategica_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY modulo ALTER COLUMN id SET DEFAULT nextval('modulo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_especifico ALTER COLUMN id SET DEFAULT nextval('objetivo_especifico_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_estrategico ALTER COLUMN id SET DEFAULT nextval('objetivo_estrategico_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_general ALTER COLUMN id SET DEFAULT nextval('objetivo_general_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_historico ALTER COLUMN id SET DEFAULT nextval('objetivo_historico_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_nacional ALTER COLUMN id SET DEFAULT nextval('objetivo_nacional_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY observaciones_acciones ALTER COLUMN id SET DEFAULT nextval('observaciones_acciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY observaciones_acciones_proy ALTER COLUMN id SET DEFAULT nextval('observaciones_acciones_proy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY organos_entes ALTER COLUMN id SET DEFAULT nextval('organos_entes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY partida_presupuestaria ALTER COLUMN id SET DEFAULT nextval('partida_presupuestaria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY partida_presupuestaria_centralizada ALTER COLUMN id SET DEFAULT nextval('partida_presupuestaria_centralizada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY plan_gobierno ALTER COLUMN id SET DEFAULT nextval('plan_gobierno_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY plan_patria ALTER COLUMN id SET DEFAULT nextval('plan_patria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY proyecto_registro ALTER COLUMN id SET DEFAULT nextval('proyecto_registro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY sectores ALTER COLUMN id SET DEFAULT nextval('sectores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY sub_modulo ALTER COLUMN id SET DEFAULT nextval('sub_modulo_id_seq'::regclass);


--
-- Data for Name: accion_centralizada; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY accion_centralizada (accion_centralizada, codigo, id) FROM stdin;
GESTIÓN ADMINISTRATIVA	01	2
ASIGNACIONES PREDETERMINADAS	02	3
DIRECCIÓN Y COORDINACIÓN DE LOS GASTOS DE LOS TRABAJADORES	03	4
DIRECCIÓN Y COORDINACIÓN DEL SERVICIO DE LA DEUDA PÚBLICA NACIONAL	04	5
PREVISIÓN Y PROTECCIÓN SOCIAL	06	7
OTRA	05	6
\.


--
-- Name: accion_centralizada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('accion_centralizada_id_seq', 7, true);


--
-- Data for Name: accion_especifica; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY accion_especifica (accion_especifica, id, accion_centralizada) FROM stdin;
APOYO INSTITUCIONAL A LAS ACCIONES ESPECÍFICAS DE LOS PROYECTOS DEL ENTE	3	2
APOYO INSTITUCIONAL AL SECTOR PRIVADO Y AL SECTOR EXTERNO	4	2
APOYO INSTITUCIONAL AL SECTOR PÚBLICO	5	2
ASIGNACIÓN Y CONTROL DE LOS RECURSOS PARA GASTOS DE LOS PENSIONADOS, PENSIONADAS, JUBILADOS Y JUBILADAS	6	7
ASIGNACIÓN Y CONTROL DE LOS APORTES CONSTITUCIONALES Y LEGALES	7	3
ASIGNACIÓN Y CONTROL DE LOS RECURSOS PARA EL SERVICIO DE LA DEUDA PÚBLICA NACIONAL	8	5
ASIGNACIÓN Y CONTROL DE LOS RECURSOS PARA GASTOS DE LOS TRABAJADORES	10	4
LAS DETERMINADAS SEGÚN EL PROPÓSITO DE LA ACCIÓN CENTRALIZADA	9	6
\.


--
-- Name: accion_especifica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('accion_especifica_id_seq', 10, true);


--
-- Data for Name: acciones_registro; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY acciones_registro (id, estatus, codigo, fecha_elaboracion, ano_fiscal, ente, cargo, m_autoridad, tlf, cedula, correo, politica_presupuestaria, acc_centralizada, reg_res, fecha_revision, estruc_presupuestaria, observaciones, reg_registro, cierre, accion) FROM stdin;
2	1	000000002           	2016-04-12	2016	76	PRESIDENTE                                                                                                                                                                	G/B LUIS ALBERTO GODOY                                                                                                                                                    	(0243) 233-2853	5042902	viasdearaguagmail.com	LA POLÍTICA PRESUPUESTARTIA 2016, ESTA FUNDAMENTADA ES LA VISION DEL PROGRAMA DE GOBIERNO 2013-2019, Y SE ORIENTA AL CUMPLIMIENTO DE LOS OBJETIVOS Y METAS TRAZADAS A CORTO Y MEDIANO PLAZO, ENTRE LOS CUALES SE DESTACA EL CONVENTIR AL ESTADO ARAGUA EN UNA POTENCIA EN CUANTO A INFRAESTRUCTURA VIAL SE REFIERE, EL CUAL LE PERTIMITE ANTE A LOS ARAGUEÑOS COMO A LAS PERSONAS QUE NOS VISITEN, VIAS EN EXCELENTES CONDICIONES QUE NOS PERMITAN BRINDARLES MAYOR Y MEJOR COMODIDAD Y CONFORT A LA HORA DE TRANSITAR POR NUESTRO TERRITOTIO ARAGUEÑO. EN EL EJERCICIO FÍSCAL 2016, SE PRETENDE CONTINUAR CON LA CONSTR	2	\N	\N	\N	\N	76	1	1
3	1	000000003           	2016-04-12	2016	40	PRESIDENTE                                                                                                                                                                	G/D RAMÓN VIÑAS                                                                                                                                                           	(0424) 334-0901	7011445	vidaplanificacion@hotmail.com	EL PRESUPUESTO ASIGNADO DURANTE EL EJERCICIO FISCAL 2016 AL  ORGANISMO, VAN DIRIGIDOS A CONTRIBUIR AL FUNCIONAMIENTO GENERAL DE LAS GERENCIAS QUE CONTRIBUYAN A SATISFACER LAS NECESIDADES DE VIVIENDA DE LA COMUNIDAD ARAGUEÑA,A SI COMO TAMBIEN LOS PLANES GENERALES, PROGRAMAS Y PROYECTOS QUE EN MATERIA DE VIVIENDA Y HÁBITAT LE COMPETEN A EL ESTADO ARAGUA. Y CUMPLIENDO CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA Y EL PLA DE LA PATRIA 2013-2019, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS DE LA POBLACIÓN.\r\n  	2	\N	\N			40	1	2
40	4	000000040           	2016-04-26	2016	56	SECRETARIO                                                                                                                                                                	REINALDO HIDALGO                                                                                                                                                          	(0424) 010-4780	9513609	secretariatecnica.reynaldo@gmail.com	PARA EL EJERCICIO FISCAL 2016 A TODA VIDA ARAGUA IMPLEMENTARA Y DARA SEGUIMIENTO A PLANES Y PROGRAMAS DE PREVENCIÓN INTEGRAL Y DE PROMOCIÓN DE LA CONVIVENCIA SOLIDARIA, FORTALECIENDO LAS ACCIONES DE LOS ÓRGANOS DE LA SEGURIDAD CIUDADANA. 	4	56	2016-06-14	02-04-00-00	SIN OBSERVACIONES	56	1	2
4	4	000000004           	2016-04-12	2016	76	PRESIDENTE                                                                                                                                                                	G/B LUIS ALBERTO GODOY                                                                                                                                                    	(0243) 233-2853	5042902	viasdearagua@gmail.com	LA POLÍTICA PRESUPUESTARIA 2016, ESTÁ FUNDAMENTADA ES LA VISIÓN DEL PROGRAMA DE GOBIERNO 2013-2019, Y SE ORIENTA AL CUMPLIMIENTO DE LOS OBJETIVOS Y METAS TRAZADAS A CORTO Y MEDIANO PLAZO, ENTRE LOS CUALES SE DESTACA EL CONVERTIR AL ESTADO ARAGUA EN UNA POTENCIA EN CUANTO A INFRAESTRUCTURA VIAL SE REFIERE, EL CUAL LE PERMITA A LOS ARAGÜEÑOS COMO A LAS PERSONAS QUE NOS VISITEN, VÍAS EN EXCELENTES CONDICIONES QUE NOS PERMITAN BRINDARLES MAYOR Y MEJOR COMODIDAD Y CONFORT A LA HORA DE TRANSITAR POR NUESTRO TERRITORIO ARAGÜEÑO. EN EL EJERCICIO FÍSCAL 2016, SE PRETENDE CONTINUAR CON LA CONSTRUCCIÓN, 	4	76	2016-05-02	01-04-07-00	SIN OBSERVACIÓN	76	1	2
6	1	000000006           	2016-04-12	2016	39	DIRECTOR GENERAL                                                                                                                                                          	COMISIONADO JEFE (CPNB) EULISES MANUEL FARIAS VALDERRAMA                                                                                                                  	(0412) 670-0986	6293224	directorgeneral.2011@gmail.com	EL INSTITUTO DE LA POLICÍA DEL ESTADO BOLIVARIANO DE ARAGUA TENDRÁ POR OBJETO LA ADMINISTRACIÓN, DE LOS RECURSOS DESTINADOS A LOS SERVICIOS DE POLICÍA; ASÍ COMO LA FORMULACIÓN, EJECUCIÓN, EVALUACIÓN Y CONTROL PRESUPUESTARIO DE LAS ACTIVIDADES POLICIALES, DE CONFORMIDAD CON LA NORMATIVA ESTADAL APLICABLE A LA MATERIA.	2	\N	\N			39	1	2
1	1	000000000           	2016-04-07	2016	15	DIRECTORA                                                                                                                                                                 	MARBELLIS LINARES                                                                                                                                                         	(0243) 233-6413	16203831	cherilobrien@hotmail.com	POLITICA PRESUPUESTARIA	4	\N	\N			15	1	2
17	4	000000017           	2016-04-20	2016	68	DIRECTOR                                                                                                                                                                  	LCDO. SALVADOR BASILE                                                                                                                                                     	(0243) 246-7204	12340734	antelizvic@hotmail.com	LA POLÍTICA PRESUPUESTARIA 2016, SE FUNDAMENTA EN CUMPLIR CABAL Y OPORTUNAMENTE CON LOS COMPROMISOS LEGALES Y CONTRAUTUALES A CADA UNO DE NUESTROS TRABAJADORES SATISFACIENDO SUS NECECIDADES Y LAS DE SU NÚCLEO Y POR ENDE UNA MEJOR DISPOSICIÓN AL SERVICIO BRINDADO A LA POBLACIÓN ARAGUEÑA. 	4	68	2016-05-16	02-01-02-00	SIN OBSERVACIÓN	68	1	2
95	1	000000095           	2016-06-13	2016	4	JEFE DE ARCHIVO GENERAL DEL ESTADO ARAGUA                                                                                                                                 	GERARDO SALAZAR                                                                                                                                                           	(0416) 312-3218	13869183	archivo_general_del_estado@hotmail.com	EL ARCHIVO GENERAL DEL ESTADO ES EL ÓRGANO DE LA ADMINISTRACIÓN PÚBLICA ESTADAL RESPONSABLE DE LA CREACIÓN, ORIENTACIÓN Y COORDINACIÓN DEL SISTEMA ESTADAL DE ARCHIVO Y TENDRÁ BAJO SU RESPONSABILIDAD VELAR POR LA HOMOGENEIZACIÓN Y NORMALIZACIÓN DE LOS PROCESOS DE ARCHIVO.	4	\N	\N			4	1	2
8	1	000000008           	2016-04-13	2016	38	PRESIDENTA                                                                                                                                                                	MAIGUALIDA GUTIÉRREZ                                                                                                                                                      	(0243) 247-4722	7191862	institutodelamujeraragua@gmail.com	  EL PRESUPUESTO ASIGNADO PARA EL EJERCICIO FISCAL 2016 AL ORGANISMO,VA DIRIGIDO A LA ADQUISICIÓN DE MATERIALES Y SUMINISTROS PARA EL LOGRO DE LA ATENCION Y SEGUIMENTOS A LAS MUJERES VICTIMAS DE VIOLENCIA DE GÉNERO DEL ESTADO ARAGUA,ASI COMO LA DIFUSION DEL DERECHO A ALA MUJER A UNA VIDA LIBRE DE VIOLENCIA. 	2	\N	\N			38	1	2
39	1	000000039           	2016-04-26	2016	47	SECRETARIO                                                                                                                                                                	YSMEL ROMER SERRANO FLOREZ                                                                                                                                                	(0426) 445-8206	13148780	sedec.aragua@gmail.com	PROMOVER, COORDINAR E IMPULSAR LAS POLÍTICAS ECONÓMICAS Y COMERCIALES PARA CONSOLIDAR AL ESTADO ARAGUA COMO UN TERRITORIO SEGURO, INCLUYENTE, COMPETITIVO Y SUSTENTABLE, CON DESARROLLO HUMANO E INTEGRACIÓN REGIONAL, IDÓNEO PARA FORTALECER EL SECTOR EMPRESARIAL SUSTENTADO EN EL APROVECHAMIENTO DE SUS POTENCIALIDADES GENERANDO OPORTUNIDADES DE DESARROLLO A ESCALA HUMANA, PROCESO DE INCLUSIÓN SOCIAL Y GOBERNABILIDAD EN	2	\N	\N			47	1	2
10	4	000000010           	2016-04-13	2016	75	DIRECTOR                                                                                                                                                                  	OSCAR BRICEÑO                                                                                                                                                             	(0416) 642-6818	10626152	araguapotenciamisiones@gmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL 2016 DE LA UNIDAD DE ENLACE Y COORDINACIÓN CON EL SISTEMA DE MISIONES SE FUNDAMENTA EN COORDINAR, PROGRAMAR Y EJECUTAR ACTIVIDADES EN LAS DIFERENTES ÁREAS DEL SISTEMA DE MISIONES A NIVEL REGIONAL Y NACIONAL, COMO; TALLERES, CHARLAS, FOROS Y VIDEOS CONFERENCIAS DE PARTICIPACIÓN SOCIAL, REUNIONES PERMANENTES CON LOS EQUIPOS DE TRABAJOS; REGIONALES, MUNICIPALES, PARROQUIALES, PERSONAL OPERATIVO Y TRABAJOS VOLUNTARIOS EN LA BASES DE MISIONES SOCIALES Y DIFERENTES COMUNIDADES. 	2	75	2016-05-10	01-17-00-00	SIN OBSERVACIONES	75	1	2
5	1	000000005           	2016-04-12	2016	39	DIRECTOR GENERAL                                                                                                                                                          	COMISIONADO JEFE (CPNB) EULISES MANUEL FARIAS VALDERRAMA                                                                                                                  	(0412) 670-0986	6293224	directorgeneral.2011@gmail.com	EL INSTITUTO DE LA POLICÍA DEL ESTADO BOLIVARIANO DE ARAGUA TENDRÁ POR OBJETO LA ADMINISTRACIÓN, DE LOS RECURSOS DESTINADOS A LOS SERVICIOS DE POLICÍA; ASÍ COMO LA FORMULACIÓN, EJECUCIÓN, EVALUACIÓN Y CONTROL PRESUPUESTARIO DE LAS ACTIVIDADES POLICIALES, DE CONFORMIDAD CON LA NORMATIVA ESTADAL APLICABLE A LA MATERIA.	4	\N	\N			39	1	2
24	4	000000024           	2016-04-20	2016	64	SECRETARIA SECTORIAL                                                                                                                                                      	ROSA LEÓN BRABO                                                                                                                                                           	(0243) 247-9326	15734904	planificacionypresupuesto64@gmail.com	LOS RECURSOS PRESUPUESTARIOS ASIGNADOS DURANTE EL EJERCICIO FISCAL 2016 A LA SECRETARIA SECTORIAL PARA EL FORTALECIMIENTO DEL PODER POPULAR,, VAN DIRIGIDOS A CONTRIBUIR   A FORTALECER EL DISEÑO Y PUESTAS EN MARCHAS DE POLITICAS PUBLICAS DIRIGIDAS AL FORTALECIMIENTO DEL PODER POPULAR EN TODA LA GEOGRAFIA DEL ESTADO ARAGUA A FIN DE  PONTENCIAR LA PARTICIPACIÓN Y CAPACITACIÓN DE LOS CIUDADANOS Y CIUDADANAS, PARA PROPICIAR LA ORGANIZACIÓN, PARTICIPACIÓN Y FORMACIÓN Y PONER EN PRÁCTICA LA AUGESTIÓN, DESDE EL NIVEL COMUNAL.	2	64	2016-05-31	13-05-00-00	SIN OBSERVACION	64	1	2
92	1	000000092           	2016-06-13	2016	7	DIRECTOR GENERAL                                                                                                                                                          	(G/D) RAMON JESUS VIÑAS GARCIA                                                                                                                                            	(0243) 234-1364	7011445	planificacionsacccp@gmail.com	LA POLÍTICA PRESUPUESTARIA ESTÁ ORIENTADA A CONTRIBUIR CON LA FORMACIÓN Y CAPACITACIÓN DE CIUDADANOS EN EL ÁREA DE LA CONSTRUCCIÓN Y MEJORAMIENTO DE VIVIENDAS DE INTERÉS SOCIAL, ASÍ COMO ORIENTAR EL DESARROLLO DE PROYECTOS QUE PERMITA EL PROGRESO SOCIO-ECONÓMICO DE LAS COMUNIDADES ORGANIZADAS DEL ESTADO ARAGUA.  	2	\N	\N			7	1	2
36	4	000000036           	2016-04-25	2016	57	SECRETARIO                                                                                                                                                                	CESAR OTERO DUNO                                                                                                                                                          	(0414) 455-6757	7174407	SPPPPCG@GMAIL.COM	LA POLITICA PRESUPUESTARIA DE LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA  PLANIFICACION, PRESUPUESTO Y CONTROL DE GESTION PARA EL EJERCICIO FISCAL 2016 ESTA ORIENTADA A BRINDAR EL SOPORTE TECNICO GERENCIAL NECESARIO PARA EL DESARROLLO DE LOS DIFERENTES PLANES Y PROYECTOS, SEGUIMIENTO Y CONTROL A NIVEL PRESUPUESTARIO Y EL ANALISIS DE LOGROS Y METAS ALCANZADAS. 	4	57	2016-06-14	01-06-00-00	SIN OBSERVACIÓN	57	1	2
42	4	000000042           	2016-04-26	2016	56	SECRETARIO                                                                                                                                                                	REINALDO HIDALGO                                                                                                                                                          	(0424) 010-4780	9513609	secretariatecnica.reynaldo@gmail.com	PARA EL EJERCICIO FISCAL 2016 A TODA VIDA ARAGUA IMPLEMENTARA Y DARA SEGUIMIENTO A PLANES Y PROGRAMAS DE PREVENCIÓN INTEGRAL Y DE PROMOCIÓN DE LA CONVIVENCIA SOLIDARIA, FORTALECIENDO LAS ACCIONES DE LOS ÓRGANOS DE LA SEGURIDAD CIUDADANA. 	2	56	2016-06-14	02-04-00-00	SIN OBSERVACIONES	56	1	2
14	4	000000014           	2016-04-14	2016	70	SUPERINTENDENTE                                                                                                                                                           	KARINA CARPIO BEJARANO                                                                                                                                                    	(0243) 808-6265	562568	plan_controlseta@hotmail.com	INCREMENTAR LOS INGRESOS POR RECAUDACIÓN COMO COADYUVANTE PARA EL DESARROLLO SOSTENIBLE DEL ESTADO ARAGUA, APLICANDO LAS ESTRATEGIAS DE LIQUIDACIÓN, RECAUDACIÓN, DETERMINACIÓN, CONTROL, INSPECCIÓN Y FISCALIZACIÓN DE LOS RAMOS TRIBUTARIOS, SEGÚN LAS DISPOSICIONES LEGALES QUE LA REGULAN.\r\nCON FACULTAD TÉCNICA, ADMINISTRATIVA Y FUNCIONAL EN MATERIA TRIBUTARIA.	4	70	2016-05-16	01-07-03-00	SIN OBSERVACIÓN	70	1	2
9	1	000000009           	2016-04-13	2016	37	PRESIDENTA                                                                                                                                                                	GUAQUIRIMA CASTRO                                                                                                                                                         	(0243) 233-3423	17366198	plancultura2013@gmail.com	EL INSTITUTO DE CULTURA DE ARAGUA, ENTE CREADO EL 14 DE MARZO DEL 2011, SEGÚN GACETA DEL ESTADO ARAGUA, ORDINARIA,  Nº 1793, PARA GARANTIZAR Y ENRIQUECIMIENTO, DEL PATRIMONIO CULTURAL Y LA MEMORIA DEL ESTADO ARAGUA, ADMINISTRA Y COORDINA LOS RECURSOS DESTINADOS POR EL EJECUTIVO ESTADAL PARA EL CRECIMIENTO Y DESARROLLO DE LA GESTIÓN CULTURAL, EN ESE SENTIDO PRESTA ATENCIÓN DE FORMA INTEGRAL AL PERSONAL ADMINISTRATIVO Y OBRERO, COORDINA LOS PROCESOS DE CAPTACIÓN, RECLUTAMIENTO Y SELECCIÓN DE PERSONAL, GENERA PLANIFICACIÓN DE CAPACITACIÓN, ACTUALIZA EXPEDIENTES, ELABORA NÓMINAS ASÍ COMO LOS CÁLCU	2	\N	\N			37	1	2
11	4	000000011           	2016-04-13	2016	74	AUDITOR INTERNO (E)                                                                                                                                                       	ANDRES FELIPE HERNANDEZ VASQUEZ                                                                                                                                           	(0243) 233-6880	14806561	auditoriainternagba@gmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL EJERCICIO FISCAL 2016 DE LA UNIDAD DE AUDITORÍA INTERNA, CORRESPONDE A CUMPLIR CON LOS GASTOS DE LOS TRABAJADORES, SIENDO ESTOS LOS PRESTADORES DE SERVICIOS CON EL OBJETO DE MEJORAR EL SISTEMA DE CONTROL INTERNO, BRINDANDO ASESORÍAS, CURSOS,  AUDITORÍAS, INSPECCIONES, FISCALIZACIONES, EXÁMENES, ESTUDIOS, ANÁLISIS E INVESTIGACIONES DE CUALQUIER NATURALEZA, A LOS FINES DE VERIFICAR LA LEGALIDAD Y EXACTITUD DE LAS OPERACIONES EFECTUADAS POR EL GOBIERNO BOLIVARIANO DE ARAGUA.	4	74	2016-05-16	01-13-00-00	SIN OBSERVACIONES	74	1	2
12	4	000000012           	2016-04-13	2016	74	AUDITOR INTERNO (E)                                                                                                                                                       	ANDRES FELIPE HERNANDEZ VASQUEZ                                                                                                                                           	(0243) 233-6880	14806561	auditoriainternagba@gmail.com	  LA UNIDAD DE AUDITORIA INTERNA, COMO UNIDAD DE APOYO O SOPORTE LOGÍSTICO DE LA ESTRUCTURA ORGANIZATIVA DEL GOBIERNO BOLIVARIANO DE ARAGUA, ES EL ÓRGANO QUE TIENE COMO COMPETENCIA REALIZAR EL EXAMEN POSTERIOR, OBJETIVO, SISTEMÁTICO Y PROFESIONAL, DE LAS ACTIVIDADES FINANCIERAS Y ADMINISTRATIVAS DEL GOBIERNO BOLIVARIANO DE ARAGUA, CON EL PROPÓSITO DE MEJORAR EL SISTEMA DE CONTROL INTERNO Y AUMENTAR LA EFECTIVIDAD Y EFICIENCIA DE LA GESTIÓN ADMINISTRATIVA. ASÍ MISMO, REALIZAR AUDITORÍAS, INSPECCIONES, FISCALIZACIONES, EXÁMENES, ESTUDIOS, ANÁLISIS E INVESTIGACIONES DE CUALQUIER NATURALEZA, A LOS	2	74	2016-05-16	01-13-00-00	SIN OBSERVACIÓN	74	1	2
16	4	000000016           	2016-04-14	2016	68	DIRECTOR                                                                                                                                                                  	LCDO. SALVADOR BASILE                                                                                                                                                     	(0243) 246-7204	12340734	antelizvic@hotmail.com	LA POLÍTICA PRESUPUESTARIA 2016, SE FUNDAMENTA EN LA VISIÓN DEL PROGRAMA DE GOBIERNO 2013-2019, LA CUAL VA ORIENTADA A CUMPLIR CON LA MISIÓN Y VISIÓN INSTITUCIONAL, CON EL FIN DE ATENDER A LA POBLACIÓN EN GENERAL, YA SEA EN CONCENTRACIÓN DE MASAS, EVENTOS ADVERSOS O LA PREPARACIÓN DE LA POBLACIÓN CAPACITANDOLA PARA ACTUAR ANTE UNA EMERGENCIA O DESASTRE.	2	68	2016-05-16	02-01-02-00	SIN OBSERVACIÓN	68	1	2
13	4	000000013           	2016-04-13	2016	71	PRESIDENTE                                                                                                                                                                	MANUEL VIVAS                                                                                                                                                              	(0416) 624-9460	14401555	manuelvivas@hotmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL EJERCICIO FISCAL 2016, DEL SISTEMA DE SALUD INTEGRADO DEL GOBIERNO BOLIVARIANO DE ARAGUA,  CORRESPONDE A  CUMPLIR CON LOS GASTOS DE LOS TRABAJADORES, SIENDO LOS PRESTADORES DE SERVICIOS CON EL OBJETO DE MEJORAR Y OPTIMIZAR LA ATENCIÓN, GARANTIZANDO UN SERVICIO DE CALIDAD EN MATERIA DE SALUD A LOS TRABAJADORES, EMPLEADOS Y FAMILIARES DE LOS ENTES ADSCRITOS A LA GOBERNACIÓN DEL ESTADO ARAGUA.	2	71	2016-05-02	01-08-01-00	SIN OBSERVACIONES	71	1	2
15	4	000000015           	2016-04-14	2016	70	SUPERINTENDENTE                                                                                                                                                           	KARINA CARPIO BEJARANO                                                                                                                                                    	(0243) 808-6265	562568	plan_controlseta@hotmail.com	INCREMENTAR LOS INGRESOS POR RECAUDACIÓN COMO COADYUVANTE PARA EL DESARROLLO SOSTENIBLE DEL ESTADO ARAGUA, APLICANDO LAS ESTRATEGIAS DE LIQUIDACIÓN, RECAUDACIÓN, DETERMINACIÓN, CONTROL, INSPECCIÓN Y FISCALIZACIÓN DE LOS RAMOS TRIBUTARIOS, SEGÚN LAS DISPOSICIONES LEGALES QUE LA REGULAN. CON FACULTAD TÉCNICA, ADMINISTRATIVA Y FUNCIONAL EN MATERIA TRIBUTARIA. 	2	70	2016-05-16	01-07-03-00	SIN OBSERVACIÓN	70	1	2
19	4	000000019           	2016-04-20	2016	67	DIRECTOR GENERAL                                                                                                                                                          	MIGUEL ANGEL JIMENEZ RIVAS                                                                                                                                                	(0416) 543-5160	6400460	injuba@gmail.com	PARA EL EJERCICIO ECONÓMICO FINANCIERO 2016, EL SERVICIO AUTÓNOMO DE PROTECCIÓN Y ATENCIÓN AL NIÑO, NIÑA Y ADOLESCENTE DE ARAGUA, EN EL MARCO DE LAS LINEAS GENERALES DEL PLAN DE LA PATRIA, LINEAS ESTRATEGICAS DEL PLAN DE GOBIERNO ARAGUA SOCIALISTA 2013-2017 ESPECIFICAMENTE ARAGUA POTENCIA HUMANISTICA Y SOCIAL, PREVE EL FORTALECIMIENTO DE LOS PLANES, PROGRAMAS Y PROYECTOS QUE BENEFICIARÁN A NIÑOS, NIÑAS Y ADOLESCENTES QUE SE ENCUENTRAN AMENAZADOS O EXCLUIDOS DEL SISTEMA DE PROTECCIÓN INTEGRAL O EN SITUACIÓN DE AMENAZA O VULNERACIÓN DE SUS DERECHOS, DANDO CUMPLIMIENTO EN LO ESTABLECIDO EN LA LEY	2	67	2016-05-30	13-01-02-00	SIN OBSERVACIÓN	67	1	2
20	4	000000020           	2016-04-20	2016	66	DIRECTORA                                                                                                                                                                 	ABOG. VANESSA PACIFICO                                                                                                                                                    	(0243) 232-3630	17366944	de.sager@gmail.com	EL PRESUPUESTO ASIGNADO DURANTE EL EJERCICIO FISCAL 2016 AL  ORGANISMO, VAN ORIENTADOS  A CONTRIBUIR A LA ASISTENCIA INTEGRAL DE LOS ADULTOS Y ADULTAS MAYORES A NIVEL REGIONAL OFRECIENDO A ESTE GRUPO ETARIO UNA ATENCIÓN DE CALIDAD A TRAVÉS DE LOS DIFERENTES PROGRAMAS Y SERVICIOS CON LAS QUE CUENTA LA INSTITUCIÓN TANTO EN EL ÁMBITO SOCIAL COMO EL ÁMBITO ASISTENCIAL CON UN EQUIPO PROFESIONAL MULTIDISCIPLINARIO CAPAZ DE DAR UNA RESPUESTA BIO-PSICO-SOCIAL OPORTUNA Y EFECTIVA, Y CUMPLIENDO CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS	2	66	2016-05-31	12-01-02-00	SIN OBSERVACIONES	66	1	2
22	4	000000022           	2016-04-20	2016	65	DIRECTOR GENERAL                                                                                                                                                          	VICTOR JULIO PALENCIA ALARCON                                                                                                                                             	(0414) 443-0520	3844651	atacarigua@gmail.com	PARA EL EJERCICIO FISCAL DEL AÑO 2016 EL SERVICIO AUTÓNOMO BOLIVARIANO AEROPUERTO DE ARAGUA TACARIGUA, TIENE DENTRO DE SUS METAS PRINCIPALES INVERTIR PARTE DEL PRESUPUESTO ASIGNADO EN LA CAPACITACIÓN Y ADIESTRAMIENTO DE UN TALENTO HUMANO QUE OFREZCA UNA ATENCIÓN AL USUARIO DE PRIMERA LÍNEA, ASÍ COMO TAMBIÉN EN EL FUNCIONAMIENTO DE INFRAESTRUCTURA PARA LOGRAR ÓPTIMAS CONDICIONES QUE BRINDE ACTIVIDADES OPERACIONALES SEGURAS Y UN SERVICIO DE CONFORT, CUBRIENDO LOS LINEAMIENTOS EMANADOS POR EL CIUDADANO GOBERNADOR DEL ESTADO ARAGUA. DE IGUAL MANERA SE PAUTA UNA INVERSIÓN IMPORTANTE EN LA COMERCIAL	2	65	2016-05-31	11-01-06-00	SIN OBSERVACIÓN	65	1	2
23	4	000000023           	2016-04-20	2016	64	SECRETARIA SECTORIAL                                                                                                                                                      	ROSA LEÓN BRABO                                                                                                                                                           	(0243) 247-9326	15734904	planificacionypresupuesto64@gmail.com	 LOS RECURSOS PRESUPUESTARIOS ASIGNADOS DURANTE EL EJERCICIO FISCAL 2016 A LA SECRETARIA SECTORIAL PARA EL FORTALECIMIENTO DEL PODER POPULAR,, VAN DIRIGIDOS A CONTRIBUIR   A FORTALECER EL DISEÑO Y PUESTAS EN MARCHAS DE POLITICAS PUBLICAS DIRIGIDAS AL FORTALECIMIENTO DEL PODER POPULAR EN TODA LA GEOGRAFIA DEL ESTADO ARAGUA A FIN DE  PONTENCIAR LA PARTICIPACIÓN Y CAPACITACIÓN DE LOS CIUDADANOS Y CIUDADANAS, PARA PROPICIAR LA ORGANIZACIÓN, PARTICIPACIÓN Y FORMACIÓN Y PONER EN PRÁCTICA LA AUGESTIÓN, DESDE EL NIVEL COMUNAL.	4	64	2016-05-31	13-05-00-00	SIN OBSERVACIÓN	64	1	2
21	4	000000021           	2016-04-20	2016	66	DIRECTORA                                                                                                                                                                 	ABOG. VANESSA PACIFICO                                                                                                                                                    	(0243) 232-3630	17366944	de.sager@gmail.com	EL PRESUPUESTO ASIGNADO DURANTE EL EJERCICIO FISCAL 2016 AL  ORGANISMO, VAN ORIENTADOS  A CONTRIBUIR A LA ASISTENCIA INTEGRAL DE LOS ADULTOS Y ADULTAS MAYORES A NIVEL REGIONAL OFRECIENDO A ESTE GRUPO ETARIO UNA ATENCIÓN DE CALIDAD A TRAVÉS DE LOS DIFERENTES PROGRAMAS Y SERVICIOS CON LAS QUE CUENTA LA INSTITUCIÓN TANTO EN EL ÁMBITO SOCIAL COMO EL ÁMBITO ASISTENCIAL CON UN EQUIPO PROFESIONAL MULTIDISCIPLINARIO CAPAZ DE DAR UNA RESPUESTA BIO-PSICO-SOCIAL OPORTUNA Y EFECTIVA, Y CUMPLIENDO CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS	2	66	2016-05-31	12-01-02-00	SIN OBSERVACION	66	1	2
18	4	000000018           	2016-04-20	2016	67	DIRECTOR GENERAL                                                                                                                                                          	MIGUEL ANGEL JIMENEZ RIVAS                                                                                                                                                	(0416) 543-5160	6400460	injuba@gmail.com	PARA EL EJERCICIO ECONÓMICO FINANCIERO 2016, EL SERVICIO AUTÓNOMO DE PROTECCIÓN Y ATENCIÓN AL NIÑO, NIÑA Y ADOLESCENTE DE ARAGUA, EN EL MARCO DE LAS LINEAS GENERALES DEL PLAN DE LA PATRIA, LINEAS ESTRATEGICAS DEL PLAN DE GOBIERNO ARAGUA SOCIALISTA 2013-2017 ESPECIFICAMENTE ARAGUA POTENCIA HUMANISTICA Y SOCIAL, PREVE EL FORTALECIMIENTO DE LOS PLANES, PROGRAMAS Y PROYECTOS QUE BENEFICIARÁN A NIÑOS, NIÑAS Y ADOLESCENTES QUE SE ENCUENTRAN AMENAZADOS O EXCLUIDOS DEL SISTEMA DE PROTECCIÓN INTEGRAL O EN SITUACIÓN DE AMENAZA O VULNERACIÓN DE SUS DERECHOS, DANDO CUMPLIMIENTO EN LO ESTABLECIDO EN LA LEY	4	67	2016-05-30	13-01-02-00	SIN OBSERVACIONES	67	1	2
29	1	000000029           	2016-04-21	2016	61	SECRETARIO                                                                                                                                                                	LUIS LOPEZ CHEJADE                                                                                                                                                        	(0414) 745-5278	11355337	dppcorposaludaragua@hotmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA  SALUD ORIENTA SU POLÍTICA PRESUPUESTARIA HACIA LA OPTIMIZACIÓN DE LOS SERVICIOS QUE SE PRESTAN EL LA RED PUBLICA DE SALUD, BASADOS EN LA MAXIMIZACIÓN DE LOS PROCESOS Y ELIMINACIÓN DEL GASTO SUNTUARIO Y SUPERFLUO DEL SECTOR PUBLICO, EN DONDE EL LA PLANIFICACIÓN,  SUPERVISIÓN, EVALUACIÓN Y CONTROL DE TODAS LAS ACTIVIDADES DE SALUD SON FUNDAMENTALES PARA EL LOGRO DE LOS OBJETIVOS PLANTEADOS PARA EL EJERCICIO FISCAL 2016	4	\N	\N	\N	\N	61	1	1
28	4	000000028           	2016-04-21	2016	61	SECRETARIO                                                                                                                                                                	LUIS LOPEZ CHEJADE                                                                                                                                                        	(0414) 745-5278	11355337	dppcorposaludaragua@hotmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA  SALUD ORIENTA SU POLÍTICA PRESUPUESTARIA HACIA LA OPTIMIZACIÓN DE LOS SERVICIOS QUE SE PRESTAN EL LA RED PUBLICA DE SALUD, BASADOS EN LA MAXIMIZACIÓN DE LOS PROCESOS Y ELIMINACIÓN DEL GASTO SUNTUARIO Y SUPERFLUO DEL SECTOR PUBLICO, EN DONDE EL LA PLANIFICACIÓN,  SUPERVISIÓN, EVALUACIÓN Y CONTROL DE TODAS LAS ACTIVIDADES DE SALUD SON FUNDAMENTALES PARA EL LOGRO DE LOS OBJETIVOS PLANTEADOS PARA EL EJERCICIO FISCAL 2016	4	61	2016-06-13	12-01-00-00	SIN OBSERVACIONES	61	1	2
27	4	000000027           	2016-04-21	2016	62	SECRETARIA SECTORIAL                                                                                                                                                      	MAIGUALIDA GUTIERREZ                                                                                                                                                      	(0243) 233-0802	7191862	secretariadelamujer.aragua@gmail.com	 LA POLÍTICA PRESUPUESTARIA PARA EL EJERCICIO FISCAL 2016 DE LA SECRETARÍA SE ENCUENTRA ORIENTADA EN DISEÑAR Y DICTAR POLITICAS  PUBLICAS QUE FAVOREZCAN A LA CONSOLIDACIÓN DEL DERECHO Y ATENCION INTEGRAL  PARA LOS ASUNTOS DE LA MUJER Y LA IGUALDAD DE GENERO EN EL AMBITO NACIONAL, REGIONAL Y MUNICIPAL,  EN LA CONSTRUCCIÓN DE LA ARAGUA POTENCIA SOCIALISTA Y FEMINISTA.	2	62	2016-06-13	13-04-00-00	SIN OBSERVACIONES	62	1	2
30	4	000000030           	2016-04-21	2016	60	SECRETARIA SECTORIAL                                                                                                                                                      	KATIANA HERNÁNDEZ                                                                                                                                                         	(0243) 233-5534	0	desarrollosocialplanificacion@hotmail.com	 EL PRESUPUESTO ASIGNADO AL  ORGANISMO ESTÁ DIRIGIDO A CONTRIBUIR CON LOS COMPROMISOS LABORES DE LOS TRABAJADORES DEL ORGANISMO, PARA LOGRAR  LA ASISTENCIA SOCIAL INTEGRAL A LAS FAMILIAS Y PERSONAS QUE SE ENCUENTRAN EN SITUACIÓN DE VULNERABILIDAD O DE EXTREMA POBREZA,  MEJORANDO SU CALIDAD DE VIDA Y DE ESTA MANERA  DAR CUMPLIMIENTO A LOS LÍNEAS ESTRATÉGICAS DEL GOBIERNO BOLIVARIANO DE ARAGUA Y DEL PLAN DE LA PATRIA 2013-2019.	4	60	2016-06-13	13-01-00-00	SIN OBSERVACION	60	1	2
31	4	000000031           	2016-04-21	2016	60	SECRETARIA SECTORIAL                                                                                                                                                      	KATIANA HERNÁNDEZ                                                                                                                                                         	(0243) 233-5534	0	desarrollosocialplanificacion@hotmail.com	EL PRESUPUESTO ASIGNADO AL ORGANISMO ESTÁ DIRIGIDO A CONTRIBUIR CON LOS COMPROMISOS LABORALES DE LOS TRABAJADORES DEL ORGANISMO, PARA LOGRAR LA ASISTENCIA SOCIAL INTEGRAL A LAS FAMILIAS Y PERSONAS QUE SE ENCUENTRAN EN SITUACIÓN DE VULNERABILIDAD O DE EXTREMA POBREZA, MEJORANDO SU CALIDAD DE\r\nVIDA Y DE ESTA MANERA DAR CUMPLIMIENTO A LOS LÍNEAS ESTRATÉGICAS DEL GOBIERNO BOLIVARIANO DE ARAGUA Y DEL PLAN DE LA PATRIA 2013-2019.	2	60	2016-06-13	13-01-00-00	SIN OBSERVACION	60	1	2
25	4	000000025           	2016-04-21	2016	63	SECRETORIO SECTORIAL                                                                                                                                                      	PEDRO MALDONADO                                                                                                                                                           	(0243) 247-0233	13207446	secretariademinas@gmail.com	FACILITAR EL PROCESO DE ORGANIZACIÓN Y DE PLANIFICACIÓN DE LAS MINAS, SAQUES Y CANTERAS DEPENDIENTES DE LA GOBERNACIÓN DEL ESTADO ARAGU, CON EL FIN DE SENTAR LAS BASES PARA LA REALIZACIÓN DE PROCESOS TECNOLOGICAMENTE SEGUROS, CONFIABLES Y DE BAJO IMPACTO AMBIENTAL, PARA LA EXPLORACIÓN Y EXPLOTACIÓN, TRITURACIÓN Y BENEFICIO, COMERCIALIZACIÓN Y DISTRIBUCIÓN DE MINERALES NO METALICOS, DENTRO DEL MARCO DEL PLAN NACIONAL SOCIALISTA 2013 - 2019, CON UN DESARROLLO SOSTENIBLE, CAPAZ DE APROVECHAR LOS RECURSOS NATURALES NO RENOVABLES, SIN COMPROMETER LA ESTABILIDAD AMBIENTAL, TODO ELLO CON EL OBJETO DE	4	63	2016-06-13	04-01-00-00	SIN  OBSERVACIONES	63	1	2
26	4	000000026           	2016-04-21	2016	62	SECRETARIA SECTORIAL                                                                                                                                                      	MAIGUALIDA GUTIERREZ                                                                                                                                                      	(0243) 233-0802	7191862	secretariadelamujer.aragua@gmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL EJERCICIO FISCAL 2016 DE LA SECRETARÍA SE ENCUENTRA ORIENTADA EN DISEÑAR Y DICTAR POLITICAS  PUBLICAS QUE FAVOREZCAN A LA CONSOLIDACIÓN DEL DERECHO Y ATENCION INTEGRAL  PARA LOS ASUNTOS DE LA MUJER Y LA IGUALDAD DE GENERO EN EL AMBITO NACIONAL, REGIONAL Y MUNICIPAL,  EN LA CONSTRUCCIÓN DE LA ARAGUA POTENCIA SOCIALISTA Y FEMINISTA.	4	62	2016-06-13	13-04-00-00	SIN OBSERVACIONES	62	1	2
32	4	000000032           	2016-04-21	2016	59	SECRETARIO                                                                                                                                                                	EDWARDS V. CASTILLO R.                                                                                                                                                    	(0416) 907-0144	6355303	s.proteccionambientalaragua@gmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA PROTECCIÓN AMBIENTAL Y EL ORDENAMIENTO TERRITORIAL PROMUEVE, PLANIFICA, EJECUTA, CONTROLA Y VIGILA  LAS POLÍTICAS  EN  MATERIA DE GESTIÓN AMBIENTAL, A TRAVÉS DEL CUMPLIMIENTO DE ACTIVIDADES DE ORDENACIÓN DEL TERRITORIO, LA PROMOCIÓN Y  DESARROLLO DE LA  MINERÍA NO METÁLICA, DE LA LEY DE LAS SUSTANCIAS MATERIALES Y  RESIDUOS TÓXICOS  Y  PELIGROSOS, EN COORDINACIÓN CON LAS INSTITUCIONES DEL ESTADO Y LAS COMUNIDADES ORGANIZADAS, PARA CONTRIBUIR CON EL PROCESO DE DESARROLLO HUMANO DE UNA MANERA INCLUYENTE, CONECTADA, EQUITATIVA, PRUDENTE  Y SEGURA.	4	59	2016-06-13	01-10-00-00	SIN OBSERVACIÓN 	59	1	2
33	4	000000033           	2016-04-21	2016	59	SECRETARIO                                                                                                                                                                	EDWARDS V. CASTILLO R.                                                                                                                                                    	(0416) 907-0144	6355303	s.proteccionambientalaragua@gmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA PROTECCIÓN AMBIENTAL Y EL ORDENAMIENTO TERRITORIAL PROMUEVE, PLANIFICA, EJECUTA, CONTROLA Y VIGILA  LAS POLÍTICAS  EN  MATERIA DE GESTIÓN AMBIENTAL, A TRAVÉS DEL CUMPLIMIENTO DE ACTIVIDADES DE ORDENACIÓN DEL TERRITORIO, LA PROMOCIÓN Y  DESARROLLO DE LA  MINERÍA NO METÁLICA, DE LA LEY DE LAS SUSTANCIAS MATERIALES Y  RESIDUOS TÓXICOS  Y  PELIGROSOS, EN COORDINACIÓN CON LAS INSTITUCIONES DEL ESTADO Y LAS COMUNIDADES ORGANIZADAS, PARA CONTRIBUIR CON EL PROCESO DE DESARROLLO HUMANO DE UNA MANERA INCLUYENTE, CONECTADA, EQUITATIVA, PRUDENTE  Y SEGURA.	2	59	2016-06-13	01-10-00-00	SIN OBSERVACION	59	1	2
34	4	000000034           	2016-04-21	2016	58	SECRETARIO                                                                                                                                                                	JUAN ERNESTO SULBARAN QUINTERO                                                                                                                                            	(0243) 237-7410	10915206	seguridadciudadana.aragua@gmail.com	COORDINAR ACCIONES QUE PERMITAN EL CUMPLIMIENTO DE LAS ACTIVIDADES DETERMINADAS EN LOS OBJETIVOS, LÍNEAS, POLÍTICAS ESTRATÉGICAS, PLANES, PROYECTOS Y PROGRAMAS ORIENTADOS A LA PROTECCIÓN DE LA COMUNIDAD ARAGÜEÑA Y SUS BIENES MEDIANTE REFORZAMIENTO EN LA COORDINACIÓN INTERINSTITUCIONAL Y LA PARTICIPACIÓN SOLIDARIA DE LOS DISTINTOS ACTORES A NIVEL REGIONAL COMPROMETIDOS EN LA LABOR DE LOGRAR LA PROTECCIÓN Y LA SEGURIDAD CIUDADANA.	4	58	2016-06-13	02-01-00-00	SIN OBSERVACION	58	1	2
35	4	000000035           	2016-04-21	2016	58	SECRETARIO                                                                                                                                                                	JUAN ERNESTO SULBARAN QUINTERO                                                                                                                                            	(0243) 237-7410	10915206	seguridadciudadana.aragua@gmail.com	EJECUCIÓN DE ONCE PROYECTOS POR PARTE DE LOS ORGANISMOS ADSCRITOS A LA SECRETARIA COMO LO SON POLICÍA DE ARAGUA, CUERPO DE BOMBEROS Y BOMBERAS DEL ESTADO ARAGUA, PROTECCIÓN CIVIL Y ADMINISTRACIÓN DE DESASTRES, EMERGENCIAS 911 Y LA DIRECCIÓN AÉREA DE LA POLICÍA DE ARAGUA.\t\t\t\t\t\t	2	58	2016-06-13	02-01-00-00	SIN OBSERVACIÓN	58	1	2
37	4	000000037           	2016-04-26	2016	57	SECRETARIO                                                                                                                                                                	CESAR OTERO DUNO                                                                                                                                                          	(0414) 455-6757	7174407	SPPPPCG@GMAIL.COM	LA POLITICA PRESUPUESTARIA DE LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA  PLANIFICACION, PRESUPUESTO Y CONTROL DE GESTION PARA EL EJERCICIO FISCAL 2016 ESTA ORIENTADA A BRINDAR EL SOPORTE TECNICO GERENCIAL NECESARIO PARA EL DESARROLLO DE LOS DIFERENTES PLANES Y PROYECTOS, SEGUIMIENTO Y CONTROL A NIVEL PRESUPUESTARIO Y EL ANALISIS DE LOGROS Y METAS ALCANZADAS. 	2	57	2016-06-14	01-06-00-00	SIN OBSERVACIONES	57	1	2
38	1	000000038           	2016-04-26	2016	47	SECRETARIO                                                                                                                                                                	YSMEL ROMER SERRANO FLOREZ                                                                                                                                                	(0426) 445-8206	13148780	sedec.aragua@gmail.com	PROMOVER, COORDINAR E IMPULSAR LAS POLÍTICAS ECONÓMICAS Y COMERCIALES PARA CONSOLIDAR AL ESTADO ARAGUA COMO UN TERRITORIO SEGURO, INCLUYENTE, COMPETITIVO Y SUSTENTABLE, CON DESARROLLO HUMANO E INTEGRACIÓN REGIONAL, IDÓNEO PARA FORTALECER EL SECTOR EMPRESARIAL SUSTENTADO EN EL APROVECHAMIENTO DE SUS POTENCIALIDADES GENERANDO OPORTUNIDADES DE DESARROLLO A ESCALA HUMANA, PROCESO DE INCLUSIÓN SOCIAL Y GOBERNABILIDAD EN	4	\N	\N			47	1	2
41	1	000000041           	2016-04-26	2016	56	SECRETARIO                                                                                                                                                                	REINALDO HIDALGO                                                                                                                                                          	(0424) 010-4780	9513609	secretariatecnica.reynaldo@gmail.com	PARA EL EJERCICIO FISCAL 2016 A TODA VIDA ARAGUA IMPLEMENTARA Y DARA SEGUIMIENTO A PLANES Y PROGRAMAS DE PREVENCIÓN INTEGRAL Y DE PROMOCIÓN DE LA CONVIVENCIA SOLIDARIA, FORTALECIENDO LAS ACCIONES DE LOS ÓRGANOS DE LA SEGURIDAD CIUDADANA. 	2	\N	\N	\N	\N	56	1	1
44	1	000000044           	2016-04-26	2016	55	SECRETARIO                                                                                                                                                                	JESUS PEREZ                                                                                                                                                               	(0243) 232-1431	16537822	chuyvzla4f@gmail.com	 LOS RECURSOS PRESUPUESTARIOS ASIGNADOS DURANTE EL EJERCICIO FISCAL 2016 A LA SECRETARÍA VAN DIRIGIDOS A CONTRIBUIR CON LAS POLÍTICAS DEL ESTADO ORIENTADAS A PROPICIAR EL DESARROLLO INTEGRAL DE LAS Y LOS JÓVENES EN EDADES PRODUCTIVAS, AUMENTANDO EN UN 100% LA ATENCIÓN EN LA COBERTURA A LA POBLACIÓN MATERIA DE SALUD, DEPORTE, CAPACITACIÓN TECNOLÓGICA BÁSICA Y AVANZADA, CULTURA TRADICIONAL, CULTURA DEL ARTE URBANO, AYUDAS SOCIALES (BECAS ESTUDIANTILES Y DE CRECIMIENTO PROFESIONAL INTENSIVO A ESTUDIANTES)Y CUMPLIENDO ASÍ CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA RELACIONADO CON LA SATISF	2	\N	\N			55	1	2
43	1	000000043           	2016-04-26	2016	55	SECRETARIO                                                                                                                                                                	JESUS PEREZ                                                                                                                                                               	(0243) 232-1431	16537822	chuyvzla4f@gmail.com	 LOS RECURSOS PRESUPUESTARIOS ASIGNADOS DURANTE EL EJERCICIO FISCAL 2016 A LA SECRETARÍA VAN DIRIGIDOS A CONTRIBUIR CON LAS POLÍTICAS DEL ESTADO ORIENTADAS A PROPICIAR EL DESARROLLO INTEGRAL DE LAS Y LOS JÓVENES EN EDADES PRODUCTIVAS, AUMENTANDO EN UN 100% LA ATENCIÓN EN LA COBERTURA A LA POBLACIÓN MATERIA DE SALUD, DEPORTE, CAPACITACIÓN TECNOLÓGICA BÁSICA Y AVANZADA, CULTURA TRADICIONAL, CULTURA DEL ARTE URBANO, AYUDAS SOCIALES (BECAS ESTUDIANTILES Y DE CRECIMIENTO PROFESIONAL INTENSIVO A ESTUDIANTES)Y CUMPLIENDO ASÍ CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA RELACIONADO CON LA SATISF	4	\N	\N			55	1	2
46	1	000000046           	2016-04-27	2016	54	SECRETARIO                                                                                                                                                                	ADNAN EL MAAZ EL MAAZ                                                                                                                                                     	(0243) 233-6576	10786509	controldegestiona.c@gmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA INFRAESTRUCTURA Y EL DESARROLLO URBANÍSTICO ES UN ÓRGANO QUE SE ENCARGA DE LA  PLANIFICACIÓN, PROYECCIÓN, CONSTRUCCIÓN Y EL MANTENIMIENTO DE TODA LA INFRAESTRUCTURA FÍSICA Y LOS PATRIMONIOS DEL ESTADO ARAGUA  PARA EL EJERCICIO FISCAL 2016, EL GASTO SE SUSTENTA EN LOS PRINCIPIOS DE EFICIENCIA,  ORIENTÁNDOSE A CUBRIR GASTOS DE OPERACIÓN, PARA GARANTIZAR LOS BENEFICIOS SOCIO-ECONÓMICOS DEL PERSONAL QUE LABORA EN EL ÓRGANO, LOGRANDO MOTIVACIÓN Y CAPACITACIÓN EN LOS TRABAJADORES, LO QUE INDUCE A LA REALIZACIÓN DE SUS ACTIVIDADES ENMARCADAS DENTRO DE	2	\N	\N			54	1	2
45	1	000000045           	2016-04-27	2016	54	SECRETARIO                                                                                                                                                                	JESUS PEREZ                                                                                                                                                               	(0243) 232-1431	16537822	chuyvzla4f@gmail.com	 LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA INFRAESTRUCTURA Y EL DESARROLLO URBANÍSTICO ES UN ÓRGANO QUE SE ENCARGA DE LA  PLANIFICACIÓN, PROYECCIÓN, CONSTRUCCIÓN Y EL MANTENIMIENTO DE TODA LA INFRAESTRUCTURA FÍSICA Y LOS PATRIMONIOS DEL ESTADO ARAGUA  PARA EL EJERCICIO FISCAL 2016, EL GASTO SE SUSTENTA EN LOS PRINCIPIOS DE EFICIENCIA,  ORIENTÁNDOSE A CUBRIR GASTOS DE OPERACIÓN, PARA GARANTIZAR LOS BENEFICIOS SOCIO-ECONÓMICOS DEL PERSONAL QUE LABORA EN EL ÓRGANO, LOGRANDO MOTIVACIÓN Y CAPACITACIÓN EN LOS TRABAJADORES, LO QUE INDUCE A LA REALIZACIÓN DE SUS ACTIVIDADES ENMARCADAS DENTRO D	4	\N	\N			54	1	2
48	4	000000048           	2016-04-27	2016	53	SECRETARIA                                                                                                                                                                	NEUDY FIGUERA                                                                                                                                                             	(0243) 233-0802	14327652	neudynanezka@hotmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA HACIENDA, ADMINISTRACIÓN Y FINANZAS TIENE COMO POLÍTICA PRESUPUESTARIA DE DESARROLLAR DE MANERA EFICIENTE LOS PROCESOS RELACIONADOS CON LA CONTABILIDAD PÚBLICA, TESORERÍA, ADMINISTRACIÓN TRIBUTARIA, SERVICIOS GENERALES Y DEMÁS PROCESOS ADMINISTRATIVOS Y FINANCIEROS DEL GOBIERNO BOLIVARIANO DE ARAGUA.	2	53	2016-05-02	01-07-00-00	SIN OBSERVACIONES	53	1	2
47	4	000000047           	2016-04-27	2016	53	SECRETARIA                                                                                                                                                                	NEUDY FIGUERA                                                                                                                                                             	(0243) 233-0802	14327652	neudynanezka@hotmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA HACIENDA, ADMINISTRACIÓN Y FINANZAS TIENE COMO POLÍTICA PRESUPUESTARIA DE DESARROLLAR DE MANERA EFICIENTE LOS PROCESOS RELACIONADOS CON LA CONTABILIDAD PÚBLICA, TESORERÍA, ADMINISTRACIÓN TRIBUTARIA, SERVICIOS GENERALES Y DEMÁS PROCESOS ADMINISTRATIVOS Y FINANCIEROS DEL GOBIERNO BOLIVARIANO DE ARAGUA.	4	53	2016-05-02	01-07-00-00	SIN OBSERVACIONES	53	1	2
51	1	000000051           	2016-05-02	2016	50	SECRETARIA                                                                                                                                                                	BERENICE BERNAL IRIBARREN                                                                                                                                                 	(0416) 646-2112	13991764	bernal.berenice@gmail.com	DISEÑAR E IMPARTIR  LAS POLÍTICAS EN MATERIA TURÍSTICAS DEL ESTADO, A TRAVÉS DE PLANES QUE PERMITAN ALCANZAR EL DESARROLLO SUSTENTABLE DE LA REGIÓN, A TRAVÉS DE TODO LO QUE ENGLOBA EL TURISMO	4	\N	\N			50	1	2
49	1	000000049           	2016-05-02	2016	51	SECRETARIA SECTORIAL DE CULTURA                                                                                                                                           	GUAIQUIRIMA CASTRO                                                                                                                                                        	(0243) 233-3954	17366198	plancultura2013@gmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA CULTURA PROMUEVE EL DESARROLLO INTEGRAL CULTURAL, ARTISTICO-CREATIVO DE LA CIUDADANIA ARAGUEÑA,  ORIENTA LAS POLITICAS PRESUPUESTARIAS HACIA LA CONSECUSION DE  PROGRAMAS Y PROYECTOS QUE EN MATERIA CULTURAL  DESARROLLA EN LAS COMUNIDADES DEL ESTADO, LAS CUALES SON EJECUTADAS POR   LAS COORDINACIONES Y UNIDADES QUE DESARROLLAN LOS PROCESOS ADMINISTRATIVOS Y FINANCIEROS PARA EL EJECUTE   DEL PLAN OPERATIVO Y LOS PROYECTOS QUE VAN DIRIGIDOS A LAS  COMUNIDADES MAS DESASISTIDAS, COMO ENTE RECTOR DEL EJECUTIVO REGIONAL DISEÑA Y ADMINISTRA LAS POLÍTICA	4	\N	\N			51	1	2
50	1	000000050           	2016-05-02	2016	51	SECRETARIA SECTORIAL DE CULTURA                                                                                                                                           	GUAIQUIRIMA CASTRO                                                                                                                                                        	(0243) 233-3954	17366198	plancultura2013@gmail.com	LA SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA CULTURA PROMUEVE EL DESARROLLO INTEGRAL CULTURAL, ARTÍSTICO  CREATIVO DE LA CIUDADANÍA ARAGÜEÑA, ORIENTA LAS POLÍTICAS PRESUPUESTARIAS HACIA LA CONSECUCIÓN DE PROGRAMAS Y PROYECTOS QUE EN MATERIA CULTURAL DESARROLLA EN LAS COMUNIDADES DEL ESTADO, LAS CUALES SON EJECUTADAS POR LAS COORDINACIONES Y UNIDADES QUE DESARROLLAN LOS PROCESOS ADMINISTRATIVOS Y FINANCIEROS PARA EL EJECUTE DEL PLAN OPERATIVO Y LOS PROYECTOS QUE VAN DIRIGIDOS A LAS COMUNIDADES MAS DESASISTIDAS, COMO ENTE RECTOR DEL EJECUTIVO REGIONAL DISEÑA Y ADMINISTRA LAS POLÍTICAS CULTU	2	\N	\N			51	1	2
52	1	000000052           	2016-05-02	2016	49	SECRETARIO                                                                                                                                                                	PABLO JOSÉ GUZMAN                                                                                                                                                         	(0412) 241-1737	9682691	pmguzman@gmail.com	EL PRESUPUESTO ASIGNADO PARA EL EJERCICIO FISCAL 2016, PROPICIARA EL CRECIMIENTO Y FORTALECIMIENTO DEL DESARROLLO CIENTÍFICO Y TECNOLÓGICO DIRIGIDO A LA POBLACIÓN ARAGÜEÑA, A TRAVÉS DE LAS DIFERENTES ACTIVIDADES Y JORNADAS QUE CONSOLIDAN LAS POLÍTICAS PUBLICAS CIENTÍFICAS, TÉCNICAS Y EDUCATIVAS ORIENTADAS HACIA LAS AÉREAS PRIORITARIAS, QUE SATISFAGAN LAS NECESIDADES DE LA POBLACIÓN Y FORTALEZCAN LAS ACCIONES ESTRATÉGICAS DE ARAGUA POTENCIA. 	2	\N	\N			49	1	2
53	1	000000053           	2016-05-02	2016	48	SECRETARIA DE DESARROLLO AGRARIO                                                                                                                                          	LUISIANA JOSEFINA PALACIOS PAREDES                                                                                                                                        	(0426) 531-1761	12928053	secretaria.agrario@gmail.com	ESTABLECIMIENTO DE POLÍTICAS AGRARIAS QUE CONTRIBUYAN AL DESARROLLO SOCIAL INTEGRAL DEL POTENCIAL PRODUCTIVO ARAGUEÑO, CONVIRTIENDO  AL ESTADO EN UNA POTENCIA AGRARIA QUE SUPERE LA POBREZA ESTRUCTURAL DE LA VIDA EN EL CAMPO Y TRIBUTE EXITOSAMENTE A LA SOBERANIA Y SEGURIDAD AGROALIMENTARIA DEL PAÍS.	4	\N	\N			48	1	2
54	1	000000054           	2016-05-02	2016	48	SECRETARIA DE DESARROLLO AGRARIO                                                                                                                                          	LUISIANA JOSEFINA PALACIOS PAREDES                                                                                                                                        	(0426) 531-1761	12928053	secretaria.agrario@gmail.com	ESTABLECIMIENTO DE POLÍTICAS AGRARIAS QUE CONTRIBUYAN AL DESARROLLO SOCIAL INTEGRAL DEL POTENCIAL PRODUCTIVO ARAGUEÑO, CONVIRTIENDO AL ESTADO EN UNA POTENCIA AGRARIA QUE SUPERE LA POBREZA ESTRUCTURAL DE LA VIDA EN EL CAMPO Y TRIBUTE EXITOSAMENTE A LA SOBERANÍA Y SEGURIDAD AGROALIMENTARIA DEL PAÍS.	2	\N	\N			48	1	2
55	1	000000055           	2016-05-02	2016	48	SECRETARIA DE GOBIERNO                                                                                                                                                    	CARYL LYNN BERTHO DE ACOSTA                                                                                                                                               	(0243) 246-1492	8943716	gobiernodeAragua@gmail.com	LA SECRETARIA GENERAL DE GOBIERNO CENTRA SU POLITICA PRESUPUESTARIA 2016 ,EN LA DIRECCION Y COORDINACION DE LOS GASTOS DE LOS TRABAJADORES, GESTION ADMINISTRATIVA PREVENCION Y PROTECCION SOCIAL. EN FUNCION DE HACER DE HACER CUMPLIR EFICIENTEMENTE TODOS LOS COMPROMISOS Y TAREAS ESTABLECIDAS PARA ESTE ORGANISMO CUYAS FUNCIONES SON: DIRIGIR, COORDINAR, SUPERVISAR, ASESORAR Y CONTROLAR LAS ACTIVIDADES DE LA SECRETARIA SECTORIAL, UNIDADES DE APOYO Y DEPENDENCIA DEL EJECUTIVO REGIONAL, TENIENDO LA RESPONSABILIDAD DE CONDUCIR LA POLITICA INTERNA, ACTUANDO COMO PUENTE INTERINSTITUCIONAL CON LOS DIVERS	4	\N	\N			48	1	2
56	1	000000056           	2016-05-03	2016	46	SECRETARIA DE GOBIERNO                                                                                                                                                    	CARYL LYNN BERTHO DE ACOSTA                                                                                                                                               	(0243) 246-1492	8943716	gobiernodeAragua@gmail.com	LA SECRETARIA GENERAL DE GOBIERNO CENTRA SU POLÍTICA PRESUPUESTARIA 2016,EN LA DIRECCIÓN Y COORDINACIÓN DE LOS GASTOS DE LOS TRABAJADORES, GESTIÓN ADMINISTRATIVA, PREVENCIÓN Y PROTECCIÓN SOCIAL. EN FUNCIÓN DE HACER CUMPLIR EFICIENTEMENTE TODOS LOS COMPROMISOS Y TAREAS ESTABLECIDAS PARA ESTE ORGANISMO CUYAS FUNCIONES SON: DIRIGIR, COORDINAR, SUPERVISAR, ASESORAR Y CONTROLAR LAS ACTIVIDADES DE LAS SECRETARIAS SECTORIALES, UNIDADES DE APOYO Y DEPENDENCIAS DEL EJECUTIVO REGIONAL, TENIENDO LA RESPONSABILIDAD DE CONDUCIR LA POLÍTICA INTERNA, ACTUANDO COMO PUENTE INTERINSTITUCIONAL CON LOS DIVERSOS A	2	\N	\N			46	1	2
57	1	000000057           	2016-05-03	2016	44	PROCURADORA GENERAL DEL ESTADO BOLIVARIANO DE ARAG                                                                                                                        	CLELIA PEREZ                                                                                                                                                              	(0243) 232-7103	14959441	procuraduriaaragua@hotmail.com	EN ARMONÍA CON  LOS LINEAMIENTOS ESTABLECIDOS EN EL PLAN DE LA PATRIA,  2013-2019, EL PLAN DE GOBIERNO DEL ESTADO PARA EL PERÍODO 2013-2017, LA PROCURADURÍA GENERAL DEL ESTADO BOLIVARIANO DE  ARAGUA, DISEÑÓ UNA SERIE DE ACCIONES CENTRALIZADAS A DESARROLLAR DURANTE EL EJERCICIO ECONÓMICO 2016, ENMARCADO DENTRO DE LA LINEAS ESTRATÉGICAS DE ACCIÓN POTENCIA HUMANISTA Y SOCIALISTA PARA PRODUCIR SERVICIOS EN EL MARCO DEL MODELO SOCIALISTA, DESTINADO A SATISFACER LAS NECESIDADES DEL PUEBLO ARAGUEÑO. EL ESCENARIO EN EL CUAL SE FORMULO EL PRESUPUESTO PARA EL EJERCICIO FISCAL 2016, ESTA ORIENTADO POR LA	2	\N	\N			44	1	2
58	1	000000058           	2016-05-03	2016	44	PROCURADORA GENERAL DEL ESTADO BOLIVARIANO DE ARAG                                                                                                                        	CLELIA PEREZ                                                                                                                                                              	(0243) 232-7103	14959441	procuraduriaaragua@hotmail.com	EN ARMONÍA CON  LOS LINEAMIENTOS ESTABLECIDOS EN EL PLAN DE LA PATRIA,  2013-2019, EL PLAN DE GOBIERNO DEL ESTADO PARA EL PERÍODO 2013-2017, LA PROCURADURÍA GENERAL DEL ESTADO BOLIVARIANO DE  ARAGUA, DISEÑÓ UNA SERIE DE ACCIONES CENTRALIZADAS A DESARROLLAR DURANTE EL EJERCICIO ECONÓMICO 2016, ENMARCADO DENTRO DE LA LINEAS ESTRATÉGICAS DE ACCIÓN POTENCIA HUMANISTA Y SOCIALISTA PARA PRODUCIR SERVICIOS EN EL MARCO DEL MODELO SOCIALISTA, DESTINADO A SATISFACER LAS NECESIDADES DEL PUEBLO ARAGUEÑO. EL ESCENARIO EN EL CUAL SE FORMULO EL PRESUPUESTO PARA EL EJERCICIO FISCAL 2016, ESTA ORIENTADO POR LA	4	\N	\N			44	1	2
59	1	000000059           	2016-05-09	2016	43	DIRECTOR (E)                                                                                                                                                              	TULIO FEBRES CARBONELL                                                                                                                                                    	(0243) 233-3268	16201356	tep.transferencia@gmail.com	LA POLITICA PRESUPUESTARIA SE FUNDAMENTA, EN LA VISIÓN DE LA PATRIA Y EL PLAN ESTRATEGICO REGIONAL, ESTÁ ORIENTADA A CREAR O REFORZAR LOS PROYECTOS PARA EL MEJORAMIENTO DE LAS CONDICIONES DE VIDA EN LA COMUNIDADES Y OTROS PROYECTOS BIEN SEAN DE; INFRAESTRUCTURA, SALUD, EDUCACIÓN, DEPORTE, TURISMO, CULTURA,SEGURIDAD, ALIMENTACIÓN, ENTRE OTROS QUE SEAN NECESARIOS, BASANDONOS EN SUSTENTAR LA AUSTERIDAD Y RACIONALIZACIÓN DEL GASTO PÚBLICO, SEGÚN LAS PRIORIDADES, Y ESTIMACIONES DE LA DISPONIBILIDAD GLOBAL DE RECURSOS PRESUPUESTARIOS Y CRITERIOS BÁSICOS PARA LA ASIGNACIÓN DE RECURSOS, CUMPLIENDO CON	2	\N	\N			43	1	2
7	4	000000007           	2016-04-12	2016	75	DIRECTOR                                                                                                                                                                  	OSCAR BRICEÑO                                                                                                                                                             	(0416) 642-6818	10626152	araguapotenciamisiones@gmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL 2016 DE LA UNIDAD DE ENLACE Y COORDINACIÓN CON EL SISTEMA DE MISIONES SE FUNDAMENTA EN COORDINAR, PROGRAMAR Y EJECUTAR ACTIVIDADES EN LAS DIFERENTES ÁREAS DEL SISTEMA DE MISIONES A NIVEL REGIONAL Y NACIONAL, COMO; TALLERES, CHARLAS, FOROS Y VIDEOS CONFERENCIAS DE PARTICIPACIÓN SOCIAL, REUNIONES PERMANENTES CON LOS EQUIPOS DE TRABAJOS; REGIONALES, MUNICIPALES, PARROQUIALES, PERSONAL OPERATIVO Y TRABAJOS VOLUNTARIOS EN LA BASES DE MISIONES SOCIALES Y DIFERENTES COMUNIDADES. 	4	75	2016-05-10	01-17-00-00	SIN OBSERVACIONES	75	1	2
60	1	000000060           	2016-05-09	2016	43	DIRECTOR (E)                                                                                                                                                              	TULIO FEBRES CARBONELL                                                                                                                                                    	(0243) 233-3268	16201356	tep.transferencia@gmail.com	LA POLITICA PRESUPUESTARIA SE FUNDAMENTA, EN LA VISIÓN DE LA PATRIA Y EL PLAN ESTRATEGICO REGIONAL, ESTÁ ORIENTADA A CREAR O REFORZAR LOS PROYECTOS PARA EL MEJORAMIENTO DE LAS CONDICIONES DE VIDA EN LA COMUNIDADES Y OTROS PROYECTOS BIEN SEAN DE; INFRAESTRUCTURA, SALUD, EDUCACIÓN, DEPORTE, TURISMO, CULTURA,SEGURIDAD, ALIMENTACIÓN, ENTRE OTROS QUE SEAN NECESARIOS, BASANDONOS EN SUSTENTAR LA AUSTERIDAD Y RACIONALIZACIÓN DEL GASTO PÚBLICO, SEGÚN LAS PRIORIDADES, Y ESTIMACIONES DE LA DISPONIBILIDAD GLOBAL DE RECURSOS PRESUPUESTARIOS Y CRITERIOS BÁSICOS PARA LA ASIGNACIÓN DE RECURSOS, CUMPLIENDO CON	4	\N	\N			43	1	2
63	1	000000063           	2016-05-30	2016	40	PRESIDENTE                                                                                                                                                                	G/D RAMÓN VIÑAS                                                                                                                                                           	(0424) 334-0901	7011445	vidaplanificacion@hotmail.com	EL PRESUPUESTO ASIGNADO DURANTE EL EJERCICIO FISCAL 2016 AL  ORGANISMO, VAN DIRIGIDOS A CONTRIBUIR AL FUNCIONAMIENTO GENERAL DE LAS GERENCIAS QUE CONTRIBUYAN A SATISFACER LAS NECESIDADES DE VIVIENDA DE LA COMUNIDAD ARAGUEÑA,A SI COMO TAMBIEN LOS PLANES GENERALES, PROGRAMAS Y PROYECTOS QUE EN MATERIA DE VIVIENDA Y HÁBITAT LE COMPETEN A EL ESTADO ARAGUA. Y CUMPLIENDO CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA Y EL PLA DE LA PATRIA 2013-2019, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS DE LA POBLACIÓN.	2	\N	\N			40	1	2
61	1	000000061           	2016-05-23	2016	42	PRESIDENTE                                                                                                                                                                	CARLOS GUILLEN                                                                                                                                                            	(0243) 554-1368	11989851	planificacionypresupuestoirda@gmail.com	EN VIRTUD DE LAS COMPETENCIAS DEL INSTITUTO REGIONAL DEL DEPORTE DE ARAGUA, CUALES SON DIRIGIR, COORDINAR, SUPERVISAR Y EVALUAR LAS ACTIVIDADES DEPORTIVAS EN EL ESTADO, FOMENTAR LOS DEPORTES PRACTICADOS Y FOMENTAR NUEVOS, ASÍ COMO COORDINAR CON LOS DISTINTOS ENTES DEPORTIVOS Y DIRECCIONES MUNICIPALES, CUMPLIENDO CON LO ESTABLECIDO EN EL PLAN DE LA PATRIA 2013-2019, EN EL SEGUNDO OBJETIVO HISTÓRICO CONTINUAR CONSTRUYENDO EL SOCIALISMO BOLIVARIANO DEL SIGLO XXI, EN CONCORDANCIA CON EL PLAN REGIONAL DE ARAGUA EN MATERIA DEPORTIVA, SE PRESENTA LA POLÍTICA PRESUPUESTARIA QUE SE REGIRÁ DURANTE EL EJ	4	\N	\N			42	1	2
62	4	000000062           	2016-05-30	2016	42	PRESIDENTE                                                                                                                                                                	CARLOS GUILLEN                                                                                                                                                            	(0243) 554-1368	11989851	planificacionypresupuestoirda@gmail.com	EN CONCORDANCIA CON LAS COMPETENCIAS DEL INSTITUTO REGIONAL DEL DEPORTE DE ARAGUA (I.R.D.A), CUALES SON DIRIGIR, COORDINAR, SUPERVISAR Y EVALUAR LAS ACTIVIDADES DEPORTIVAS EN EL ESTADO, FOMENTAR LOS DEPORTES PRACTICADOS Y FOMENTAR NUEVAS DISCIPLINAS, ASÍ COMO COORDINAR CON LOS DISTINTOS ENTES DEPORTIVOS Y DIRECCIONES MUNICIPALES, CUMPLIENDO CON LO ESTABLECIDO EN EL PLAN DE LA PATRIA 2013-2019, ASÍ COMO EL PLAN REGIONAL DE ARAGUA EN MATERIA DEPORTIVA, LA ESTRUCTURA PRESUPUESTARIA PARA CUBRIR LOS GASTOS DE FUNCIONAMIENTO Y LAS ACTIVIDADES MEDULARES DE LA INSTITUCIÓN, DURANTE EL EJERCICIO FISCAL 	2	42	2016-06-16	01-04-01-00	SIN OBSERVACIONES	42	1	2
64	1	000000064           	2016-05-30	2016	39	DIRECTOR GENERAL                                                                                                                                                          	COMISIONADO JEFE (CPNB) EULISES MANUEL FARIAS VALDERRAMA                                                                                                                  	(0412) 670-0986	6293224	directorgeneral.2011@gmail.com	EL INSTITUTO DE LA POLICÍA DEL ESTADO BOLIVARIANO DE ARAGUA TENDRÁ POR OBJETO LA ADMINISTRACIÓN, DE LOS RECURSOS DESTINADOS A LOS SERVICIOS DE POLICÍA; ASÍ COMO LA FORMULACIÓN, EJECUCIÓN, EVALUACIÓN Y CONTROL PRESUPUESTARIO DE LAS ACTIVIDADES POLICIALES, DE CONFORMIDAD CON LA NORMATIVA ESTADAL APLICABLE A LA MATERIA.	4	\N	\N			39	1	2
65	1	000000065           	2016-05-30	2016	39	DIRECTOR GENERAL                                                                                                                                                          	COMISIONADO JEFE (CPNB) EULISES MANUEL FARIAS VALDERRAMA                                                                                                                  	(0412) 670-0986	6293224	directorgeneral.2011@gmail.com	EL INSTITUTO DE LA POLICÍA DEL ESTADO BOLIVARIANO DE ARAGUA TENDRÁ POR OBJETO LA ADMINISTRACIÓN, DE LOS RECURSOS DESTINADOS A LOS SERVICIOS DE POLICÍA; ASÍ COMO LA FORMULACIÓN, EJECUCIÓN, EVALUACIÓN Y CONTROL PRESUPUESTARIO DE LAS ACTIVIDADES POLICIALES, DE CONFORMIDAD CON LA NORMATIVA ESTADAL APLICABLE A LA MATERIA.	2	\N	\N			39	1	2
66	1	000000066           	2016-05-30	2016	38	PRESIDENTA                                                                                                                                                                	MAIGUALIDA GUTIÉRREZ                                                                                                                                                      	(0243) 247-4722	7191862	institutodelamujeraragua@gmail.com	   EL PRESUPUESTO ASIGNADO PARA EL EJERCICIO FISCAL 2016 AL ORGANISMO,VA DIRIGIDO A LA ADQUISICIÓN DE MATERIALES Y SUMINISTROS PARA EL LOGRO DE LA ATENCION Y SEGUIMENTOS A LAS MUJERES VICTIMAS DE VIOLENCIA DE GÉNERO DEL ESTADO ARAGUA,ASI COMO LA DIFUSION DEL DERECHO A ALA MUJER A UNA VIDA LIBRE DE VIOLENCIA. 	2	\N	\N			38	1	2
67	1	000000067           	2016-05-30	2016	37	PRESIDENTA                                                                                                                                                                	GUAQUIRIMA CASTRO                                                                                                                                                         	(0243) 233-3423	17366198	plancultura2013@gmail.com	EL INSTITUTO DE CULTURA DE ARAGUA, ENTE CREADO EL 14 DE MARZO DEL 2011, SEGÚN GACETA DEL ESTADO ARAGUA, ORDINARIA,  Nº 1793, PARA GARANTIZAR Y ENRIQUECIMIENTO, DEL PATRIMONIO CULTURAL Y LA MEMORIA DEL ESTADO ARAGUA, ADMINISTRA Y COORDINA LOS RECURSOS DESTINADOS POR EL EJECUTIVO ESTADAL PARA EL CRECIMIENTO Y DESARROLLO DE LA GESTIÓN CULTURAL, EN ESE SENTIDO PRESTA ATENCIÓN DE FORMA INTEGRAL AL PERSONAL ADMINISTRATIVO Y OBRERO, COORDINA LOS PROCESOS DE CAPTACIÓN, RECLUTAMIENTO Y SELECCIÓN DE PERSONAL, GENERA PLANIFICACIÓN DE CAPACITACIÓN, ACTUALIZA EXPEDIENTES, ELABORA NÓMINAS ASÍ COMO LOS CÁLCU	2	\N	\N			37	1	2
69	1	000000069           	2016-05-31	2016	30	PRESIDENTE                                                                                                                                                                	JESUS ESTEBAN TRAPIELLO                                                                                                                                                   	(0243) 233-3250	416907	telearagua@gmail.com	GARANTIZAR LA COMUNICACIÓN A TRAVÉS DE LA TELEVISIÓN, DEL NUEVO MODELO COMUNICACIONAL PERMITIENDO LA PARTICIPACIÓN, PROTAGONISMO Y DE CONTROL SOCIAL RESPONSABLE DE LA GESTIÓN PÚBLICA. GENERAR Y DIFUNDIR CONTENIDOS BASADOS EN LOS VALORES NACIONALES, MULTIÉTNICOS Y PLURICULTURALES; ASÍ COMO LA CREACIÓN Y APROPIACIÓN DEL CONOCIMIENTO PARA EL DESARROLLO, PRODUCCIÓN Y BUEN USO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE INFORMACIÓN	2	\N	\N			30	1	2
68	1	000000068           	2016-05-31	2016	55	SECRETARIO                                                                                                                                                                	JESUS PEREZ                                                                                                                                                               	(0243) 232-1431	16537822	chuyvzla4f@gmail.com	EL PRESUPUESTO ASIGNADO AL ORGANISMO EN  EL EJERCICIO FISCAL 2016  , VAN DIRECCIONADOS  A CONTRIBUIR AL FORTALECIMIENTO  DE LOS PROGRAMAS SOCIO-ECONOMICOS DIRIGIDOS A LOS ESTUDIANTES ARAGUEÑOS  DE BAJOS RECURSOS ECONOMICOS Y AL JOVEN COMUNITARIO  EN CUANTO A SU FORMACIÓN ACADÉMICA, EN CUMPLIMIENTO CON EL   OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS DE LA POBLACIÓN ESTUDIANTIL ASISTIDA .	2	\N	\N			55	1	2
70	1	000000070           	2016-05-31	2016	29	PRESIDENTE                                                                                                                                                                	JESUS ESTEBAN TRAPIELLO                                                                                                                                                   	(0243) 247-4943	416907	telearagua@gmail.com	GARANTIZAR LA COMUNICACIÓN A TRAVÉS DE LA RADIO DIFUSIÓN, DEL NUEVO MODELO COMUNICACIONAL PERMITIENDO LA PARTICIPACIÓN, PROTAGONISMO Y DE CONTROL SOCIAL RESPONSABLE DE LA GESTIÓN PÚBLICA. GENERAR Y DIFUNDIR CONTENIDOS BASADOS EN LOS VALORES NACIONALES, MULTIÉTNICOS Y PLURICULTURALES; ASÍ COMO LA CREACIÓN Y APROPIACIÓN DEL CONOCIMIENTO PARA EL DESARROLLO, PRODUCCIÓN Y BUEN USO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE INFORMACIÓN.	2	\N	\N			29	1	2
71	1	000000071           	2016-05-31	2016	28	PRESIDENTA                                                                                                                                                                	RODAINA AAMER                                                                                                                                                             	(0243) 234-7477	16512363	comunicacionesfrnsa@gmail.com	GARANTIZAR LA COMUNICACIÓN A TRAVÉS DE LA RADIO DIFUSIÓN, DEL NUEVO MODELO COMUNICACIONAL PERMITIENDO LA PARTICIPACIÓN, PROTAGONISMO Y DE CONTROL SOCIAL RESPONSABLE DE LA GESTIÓN PÚBLICA. GENERAR Y DIFUNDIR CONTENIDOS BASADOS EN LOS VALORES NACIONALES, MULTIÉTNICOS Y PLURICULTURALES; ASÍ COMO LA CREACIÓN Y APROPIACIÓN DEL CONOCIMIENTO PARA EL DESARROLLO, PRODUCCIÓN Y BUEN USO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE INFORMACIÓN.	2	\N	\N			28	1	2
72	1	000000072           	2016-05-31	2016	27	PRESIDENTE                                                                                                                                                                	ROMMER CONDERO                                                                                                                                                            	(0243) 711-0671	9679472	fundaragua@gmail.com	SE PRETENDE CONTRIBUIR CON EL MANTENIMIENTO PREVENTIVO Y CORRECTIVO, LA PRESERVACIÓN URBANÍSTICA INTEGRAL, CONSERVACIÓN, REHABILITACIÓN, REPARACIÓN, EQUIPAMIENTO Y MEJORAS, DEMARCACIÓN Y SEÑALIZACIÓN DE CALLES, AVENIDAS, AUTOPISTAS, PUENTES, DRENAJES, LA VIALIDAD EN GENERAL, MOBILIARIO URBANO, FACHADAS, ESPACIOS PÚBLICOS, PLAZAS, PARQUES, ÁREAS VERDES, EL ORNATO PÚBLICO, OBRAS DE ARTE Y LA INFRAESTRUCTURA URBANA, HISTÓRICA Y PATRIMONIAL, LA PROMOCIÓN Y DESARROLLO DE PROGRAMAS Y ACTIVIDADES DIRIGIDAS A LOS SERVICIOS PÚBLICOS, EL TURISMO, LA VIVIENDA, LA EDUCACIÓN, EL DESARROLLO ECONÓMICO Y LA A	2	\N	\N			27	1	2
73	1	000000073           	2016-05-31	2016	26	PRESIDENTE JUNTA DIRECTIVA                                                                                                                                                	PROF. WILFREDO ANGULO                                                                                                                                                     	(0424) 314-7130	10110306	villamizarcontreras@gmail.com	 EL PRESUPUESTO ASIGNADO A LA FUNDACIÓN ORQUESTA SINFÓNICA DE ARAGUA, DURANTE EL EJERCICIO FISCAL 2016, SERAN DIRIGIDOS A FORTALECEREL CABAL CUMPLIMIENTO DE LA MISIÓN Y VISIÓN INSTITUCIONAL, Y A COADYUVAR A LA EJECUCIÓN DEL PLAN DE LA PATRIA 2013-2017 Y EL PLAN ARAGUA POTENCIA, A TRAVÉS DEL DESARROLLO DE ACCIONES ARTÍSTICAS, ESPECÍFICAMENTE LOS CONCIERTOS DIRIGIDOS A LOS DIFERENTES ESPECTADORES DEL ESTADO ARAGUA  Y CUMPLIENDO CON EL OBJETIVO DEL GOBIERNO BOLIVARIANO DE ARAGUA, RELACIONADO CON LA SATISFACCIÓN DE LAS NECESIDADES BÁSICAS DE LA POBLACIÓN.	2	\N	\N			26	1	2
75	1	000000075           	2016-05-31	2016	23	PRESIDENTA                                                                                                                                                                	BERENICE BERNAL                                                                                                                                                           	(0243) 237-7609	13991764	s.proteccionambientalaragua@gmail.com	ORIENTAR LOS RECURSOS ASIGNADOS PARA LA MANUTENCIÓN DE LA COLECCIÓN DE FAUNA SILVESTRE EN CAUTIVERIO UBICADA EN EL ZOOLÓGICO LAS DELICIAS DE MARACAY, DE LA MANO CON LA ADECUACIÓN DE LOS CENTROS DE MANEJO DE FAUNA SILVESTRE Y SU CONVERSIÓN EN CENTROS DE CONSERVACIÓN DE ESPECIES 	2	\N	\N			23	1	2
74	1	000000074           	2016-05-31	2016	24	PRESIDENTE                                                                                                                                                                	YOMAR MELÉNDEZ                                                                                                                                                            	(0426) 515-8923	11089872	ffeletrasdearagua@gmail.com	LA POLÍTICA PRESUPUESTARIA PARA EL 2016 DE LA FUNDACIÓN FONDO EDITORIAL LETRAS DE ARAGUA ESTÁ DIRIGIDA MEJORAR Y OBTENER UNA ADECUADA REPRODUCCIÓN Y DISTRIBUCIÓN DEL PERIÓDICO CIUDAD MCY, CON UN TIRAJE DIARIO DE 10.000 EJEMPLARES DE LUNES A VIERNES, Y 5.000 EJEMPLARES SÁBADOS Y DOMINGOS; TODO ESTO CON EL FIRME PROPÓSITO DE ASUMIR CON RESPONSABILIDAD LA TAREA DE DAR LA BATALLA POR LA VERDAD, DE VISIBILIZAR A LOS INVISIBLES, DÁNDOLES EL ESPACIO Y TRATAMIENTO QUE SE MERECEN.	4	\N	\N			24	1	2
76	1	000000076           	2016-06-06	2016	22	PRESIDENTE                                                                                                                                                                	REINALDO HIDALGO                                                                                                                                                          	(0424) 101-4780	9513609	jfatodavida@gmail.com	PARA EL 2016, DANDO CONTINUIDAD A LAS ACTIVIDADES DESARROLLADAS DE MANERA EXITOSA, LA MISIÓN A TODA VIDA ARAGUA ESTABLECE LOS SIGUIENTES OBJETIVOS ESTRATÉGICOS QUE A SU VEZ SE INSCRIBEN EN EL MARCO DE LOS GRANDES VÉRTICES ESTRATÉGICOS DE LA GRAN MISIÓN A TODA VIDA VENEZUELA, LLEVANDO LA ACCIÓN Y CONTENIDO DE AQUELLOS CON TRASCENDENCIA Y COMPETENCIA REGIONAL Y LOCAL, FORMULADOS EN DOS GRANDES PROGRAMAS:\r\n1. INCLUSIÓN, PARTICIPACIÓN JUVENIL Y CAPACITACIÓN. SOCIO-PRODUCTIVA\r\n2. CONVIVENCIA, ORGANIZACIÓN COMUNAL Y RECUPERACIÓN DE ESPACIOS PÚBLICOS CON LA FINALIDAD DE PROMOVER SU USO Y DISFRUTE SOLID	2	\N	\N			22	1	2
77	1	000000077           	2016-06-06	2016	19	DIRECTOR                                                                                                                                                                  	LUIS MEDINA                                                                                                                                                               	(0243) 233-6655	14712283	wvargas@aragua.gob.ve	LA POLÍTICA PRESUPUESTARIA ESTÁ DIRIGIDA A SER UNA UNIDAD DE APOYO REFERIDA A LOS SERVICIOS TECNOLÓGICOS A TRAVÉS DE LAS DISTINTAS COORDINACIONES DE LA DIRECCIÓN, COMO LO SON: GOBIERNO ELECTRÓNICO, DESARROLLO DE SISTEMAS, ADMINISTRACIÓN DE SERVIDORES, REDES Y TELECOMUNICACIONES Y SOPORTE TÉCNICO.	4	\N	\N			19	1	2
84	1	000000084           	2016-06-13	2016	14	SECRETARIO DE DESPACHO                                                                                                                                                    	JOSELIT RAMIREZ                                                                                                                                                           	(0416) 646-2126	17664322	ramirezjoselit@gmail.com	LA POLÍTICA PRESUPUESTARIA DE LA SECRETARIA DEL DESPACHO DEL GOBERNADOR ESTA DIRIGIDA A OPTIMIZAR LOS PROCESOS CON EFICIENCIA Y EFICACIA DE LA ASISTENCIA INTEGRAL AL DESPACHO DEL GOBERNADOR Y COORDINACIÓN DE LOS PROCESOS ASOCIADOS A LA ATENCIÓN A LOS CIUDADANOS Y CIUDADANAS DEL ESTADO ARAGUA, PROTOCOLO, SEGURIDAD Y GESTIÓN ESTRATÉGICA,. AL MISMO TIEMPO ,LA PROMOCIÓN, LA PARTICIPACIÓN CIUDADANA A OBJETO DE IMPLEMENTAR MECANISMOS DE CORRESPONSABILIDAD CON LA POBLACIÓN EN EL CONTROL DE LA GESTIÓN PÚBLICA DE LOS SERVICIOS PRESTADOS POR E GOBIERNO BOLIVARIANO DE ARAGUA.\t\t\t\t\t\t	2	\N	\N			14	1	2
79	1	000000079           	2016-06-06	2016	18	DIRECTORA PLANIFICACIÓN Y PRESUPUESTO                                                                                                                                     	MERQUISEDEC PEREZ                                                                                                                                                         	(0412) 757-2458	12854535	dppcorposaludaragua@hotmail.com	LA POLÍTICA PRESUPUESTARIA 2016, SE FUNDAMENTA EN LA VISIÓN DEL PROGRAMA DE GOBIERNO 2013-2017  Y EN EL PLAN DE LA PATRIA “2013-2019”. LA POLÍTICA PRESUPUESTARIA PARA EL EJERCICIO 2016, ESTARÁ ORIENTADA A DISMINUIR EL IMPACTO DE LA CRISIS ECONÓMICA EN LA POBLACIÓN, SOBRE TODO LA POBLACIÓN POBRE Y EXCLUIDA. A EFECTO DE CONTRARRESTAR LOS EFECTOS NEGATIVOS. EL GOBIERNO DE LA REPÚBLICA BOLIVARIANO DE ARAGUA EN ESE SENTIDO IMPULSARÁ MEDIDAS TENDIENTES A PROTEGER EL EMPLEO, CREANDO O REFORZANDO LOS PROGRAMAS DE SALUD Y LAS JORNADAS INTEGRALES DE SALUD, A TRAVES DE LAS CONSULTAS DE ATENCIÓN INTEGRAL 	4	\N	\N			18	1	2
78	1	000000078           	2016-06-06	2016	18	DIRECTORA PLANIFICACIÓN Y PRESUPUESTO                                                                                                                                     	MERQUISEDEC PEREZ                                                                                                                                                         	(0412) 757-2458	12854535	dppcorposaludaragua@hotmail.com	LA POLÍTICA  PRESUPUESTARIA PARA EL 2016, ESTÁ ORIENTADA HACIA LOS LINEAMIENTOS EMANADOS POR EL EJECUTIVO REGIONAL REFERIDOS A LA TRANSFORMACIÓN DE UNA VISIÓN TRADICIONAL DE PLANIFICACIÓN Y PRESUPUESTO EN EL ÁREA DE LA SALUD, CON  VISIÓN PARA MEJORAR LOS PROCEDIMIENTOS ADMINISTRATIVOS BASADOS EN LA MAXIMIZACIÓN DE TODOS LOS RECURSOS DISPONIBLES; GENERANDO DATOS ESTADÍSTICOS MAS PRECISOS A TRAVÉS DE LA VERIFICACIÓN, AUDITORIA Y VALIDACIÓN DE LA INFORMACIÓN RECOLECTADA, PARA ASÍ LOGRAR LOS OBJETIVOS ESTRATÉGICOS ESTABLECIDOS EN EL PROGRAMA DE GOBIERNO DEL CIUDADANO TARECK, EN CONCORDANCIA CON LA	2	\N	\N			18	1	2
81	1	000000081           	2016-06-07	2016	15	DIRECTORA                                                                                                                                                                 	MARBELLIS LINARES                                                                                                                                                         	(0243) 233-6413	16203831	cherilobrien@hotmail.com	LA DIRECCIÓN DE INFORMACIÓN, PRENSA Y RELACIONES PÚBLICAS FORTALECE Y CONSOLIDA LOS PROCESOS DE COMUNICACIÓN DE LA GESTIÓN DEL GOBIERNO BOLIVARIANO, OPTIMIZANDO LAS ESTRATEGIAS COMUNICACIONES, ANALIZANDO PERMANENTEMENTE EN EL ENTORNO REGIONAL Y NACIONAL, COORDINANDO LAS ACTIVIDADES PROTOCOLARES DE LOS DIFERENTES EVENTOS GUBERNAMENTALES Y DIFUNDIENDO MATERIAL INFORMATIVO Y PUBICITARIO SOBRE LAS ACCIONES Y LOGROS DE LA GESTIÓN DE GOBIERNO.	4	\N	\N			15	1	2
80	1	000000080           	2016-06-07	2016	17	PRESIDENTE                                                                                                                                                                	ADNAN EL MAAZ- EL MAAZ                                                                                                                                                    	(0424) 309-8012	10786509	construaragua13@gmail.com	EN FUNCIÓN DE LAS POLÍTICAS Y OBJETIVOS ESTRATÉGICOS DEL PLAN DE LA NACIÓN Y DEL ESTADO ARAGUA, SE PLANIFICO NUESTRO PRESUPUESTO POR PROYECTO EN CONJUNTO DE LAS ACCIONES CENTRALIZADAS, PARA SATISFACER NECESIDADES DE LA POBLACIÓN ARAGUEÑA Y DE ESTA MANERA CONTRIBUIR EN LA INDEPENDENCIA Y LA PATRIA SOCIALISTA. EN ESTE SENTIDO LA POLITICA PRESUPUESTARIA DE CONSTRUCCIONES ARAGUA, S.A., CONSISTE EN APOYAR AL MEJORAMIENTO, CONSTRUCCIÓN Y MANTENIMIENTO DE LA INFRAESTRUCTURA EN EL ESTADO ARAGUA, CON UNA PLANIFICACION EN EL GASTO, BASADA EN PRINCIPIOS DE EFICACIA, ORIENTANDOSE PRINCIPALMENTE A PLAGAR L	2	\N	\N			17	1	2
83	1	000000083           	2016-06-07	2016	14	SECRETARIO DE DESPACHO                                                                                                                                                    	JOSELIT RAMIREZ                                                                                                                                                           	(0416) 646-2126	17664322	ramirezjoselit@gmail.com	LA POLÍTICA PRESUPUESTARIA DE LA SECRETARIA DEL DESPACHO DEL GOBERNADOR ESTA DIRIGIDA A OPTIMIZAR LOS PROCESOS CON EFICIENCIA Y EFICACIA DE LA ASISTENCIA INTEGRAL AL DESPACHO DEL GOBERNADOR Y COORDINACIÓN DE LOS PROCESOS ASOCIADOS A LA ATENCIÓN A LOS CIUDADANOS Y CIUDADANAS DEL ESTADO ARAGUA, PROTOCOLO, SEGURIDAD Y GESTIÓN ESTRATÉGICA,. AL MISMO TIEMPO ,LA PROMOCIÓN, LA PARTICIPACIÓN CIUDADANA A OBJETO DE IMPLEMENTAR MECANISMOS DE CORRESPONSABILIDAD CON LA POBLACIÓN EN EL CONTROL DE LA GESTIÓN PÚBLICA DE LOS SERVICIOS PRESTADOS POR EL GOBIERNO BOLIVARIANO DE ARAGUA. SEGUIMIENTO Y SUPERVISIÓN D	4	\N	\N			14	1	2
82	1	000000082           	2016-06-07	2016	15	DIRECTORA                                                                                                                                                                 	MARBELLIS LINARES                                                                                                                                                         	(0243) 233-6413	16203831	cherilobrien@hotmail.com	LA DIRECCIÓN DE INFORMACIÓN, PRENSA Y RELACIONES PÚBLICAS FORTALECE Y CONSOLIDA LOS PROCESOS DE COMUNICACIÓN DE LA GESTIÓN DEL GOBIERNO BOLIVARIANO, OPTIMIZANDO LAS ESTRATEGIAS COMUNICACIONES , ANALIZANDO PERMANENTEMENTE EN EL ENTORNO REGIONAL Y NACIONAL, COORDINANDO LAS ACTIVIDADES PROTOCOLARES DE LOS DIFERENTES EVENTOS GUBERNAMENTALES Y DIFUNDIENDO MATERIAL INFORMATIVO Y PUBLICITARIO SOBRE LAS ACCIONES Y LOGROS DE LA GESTIÓN DE GOBIERNO.	2	\N	\N			15	1	2
94	1	000000094           	2016-06-13	2016	5	PRESIDENTE                                                                                                                                                                	G/B DOUGLAS BALLESTERO                                                                                                                                                    	(0243) 553-1562	9148203	dangonzalezm12@gmail.com	FALTA POR REALIZAR	4	\N	\N			5	1	2
85	1	000000085           	2016-06-13	2016	13	PRIMER COMANDANTE                                                                                                                                                         	OSCAR ROMERO                                                                                                                                                              	(0243) 235-9687	9686251	BOMBEROSARAGUA@HOTMAIL.COM	EN VIRTUD DEL ALTO CRECIMIENTO DEL ÍNDICE POBLACIONAL, ESTADAL PROGRESIVAMENTE SE INCREMENTA LA PROBABILIDAD DE OCURRENCIAS DE EVENTOS ADVERSOS, POR LO QUE EL CUERPO DE BOMBEROS Y BOMBERAS DEL ESTADO ARAGUA ESTABLECE NECESIDADES PARA LA EFICACIA Y LA EFICIENCIA EN CUANTO AL ÍNDICE DE  OPERATIVIDAD QUE PERMITA LA ATENCIÓN INMEDIATA Y OPORTUNA DE LAS EMERGENCIAS Y AUMENTAR LA CALIDAD DE VIDA  DE LA COMUNIDAD ARAGÜEÑA, SALVAGUARDANDO SUS VIDAS Y BIENES PARA ELLOS DISPONDRÁ DE LOS RECURSOS PRESUPUESTARIOS Y FINANCIEROS ASIGNADOS A TRAVÉS DE LA LEY DE PRESUPUESTO. POR EL EJECUTIVO REGIONAL MANTENIE	4	\N	\N			13	1	2
88	1	000000088           	2016-06-13	2016	11	CONSULTOR JURÍDICO                                                                                                                                                        	FELIPE CONTRERAS                                                                                                                                                          	(0243) 233-6320	11314203	consultoriajuridica.gobaragua@hotmail.com	LA POLÍTICA PRESUPUESTARIA DE LA CONSULTORÍA JURÍDICA DEL GOBIERNO BOLIVARIANO DE ARAGUA PARA EL EJERCICIO FISCAL 2016 CORRESPONDE A LOS GASTOS DE LOS TRABAJADORES, SIENDO ESTOS LOS PRESTADORES DE SERVICIO CON EL PRÓPOSITO DE BRINDAR SOPORTE EN MATERIA JURÍDICA A LAS INSTITUCIONES DEL ESTADO Y AL PÚBLICO EN GENERAL, A TRAVÉS DE LAS ACTIVIDADES PROPIAS DE LA MISMA, RELACIONADAS CON EL DERECHO CIVIL, FAMILIA, LABORAL, NO CONTENCIOSOS, Y REDACCIÓN DE DOCUMENTOS SIMPLES.	2	\N	\N			11	1	2
86	1	000000086           	2016-06-13	2016	13	PRIMER COMANDANTE                                                                                                                                                         	OSCAR ROMERO                                                                                                                                                              	(0243) 235-9687	9686251	BOMBEROSARAGUA@HOTMAIL.COM	EN VIRTUD DEL ALTO CRECIMIENTO DEL ÍNDICE POBLACIONAL, ESTADAL PROGRESIVAMENTE SE INCREMENTA LA PROBABILIDAD DE OCURRENCIAS DE EVENTOS ADVERSOS, POR LO QUE EL CUERPO DE BOMBEROS Y BOMBERAS DEL ESTADO ARAGUA ESTABLECE NECESIDADES PARA LA EFICACIA Y LA EFICIENCIA EN CUANTO AL ÍNDICE DE  OPERATIVIDAD QUE PERMITA LA ATENCIÓN INMEDIATA Y OPORTUNA DE LAS EMERGENCIAS Y AUMENTAR LA CALIDAD DE VIDA  DE LA COMUNIDAD ARAGÜEÑA, SALVAGUARDANDO SUS VIDAS Y BIENES PARA ELLOS DISPONDRÁ DE LOS RECURSOS PRESUPUESTARIOS Y FINANCIEROS ASIGNADOS A TRAVÉS DE LA LEY DE PRESUPUESTO. POR EL EJECUTIVO REGIONAL MANTENIE	2	\N	\N			13	1	2
87	1	000000087           	2016-06-13	2016	11	CONSULTOR JURÍDICO                                                                                                                                                        	FELIPE CONTRERAS                                                                                                                                                          	(0243) 233-6320	11314203	consultoriajuridica.gobaragua@hotmail.com	LA CONTRALORÍA DEL ESTADO ARAGUA, ES EL ÓRGANO DE CONTROL EXTERNO INTEGRANTE DEL SISTEMA NACIONAL DE CONTROL, RESPONSABLE DEL CONTROL, VIGILANCIA Y FISCALIZACIÓN DE LOS INGRESOS, GASTOS Y BIENES DEL ESTADO, DOTADO DE AUTONOMÍA ORGÁNICA Y FUNCIONAL PARA COMBATIR LA CORRUPCIÓN ADMINISTRATIVA Y PARA FOMENTAR LA EFICACIA, ÉTICA, PROBIDAD, TRANSPARENCIA, LEGALIDAD Y PARTICIPACIÓN CIUDADANA EN LA SALVAGUARDA DEL PATRIMONIO PÚBLICO Y ORIENTA SU POLÍTICA PRESUPUESTARIA A LA CONSECUCIÓN DE LOS OBJETIVOS INSTITUCIONALES DEFINIDOS EN CORCONDANCIA CON SU MISIÓN. 	4	\N	\N			11	1	2
89	1	000000089           	2016-06-13	2016	10	PRESIDENTA                                                                                                                                                                	SUMIRE FERRARA                                                                                                                                                            	(0243) 232-4921	11182340	despachoclea@gmail.com	EL CONSEJO LEGISLATIVO DEL ESTADO ARAGUA, EN COHERENCIA CON LAS LÍNEAS CONSTITUCIONALES Y LEGALES DE LA REPÚBLICA, DIRIGE SUS ESFUERZOS EN GARANTIZAR  UN MARCO JURÍDICO ESTADAL BASADOS EN UNA JUSTICIA SOCIAL Y DE DERECHO, ORGANIZANDO Y PROMOVIENDO LA PARTICIPACIÓN POPULAR EN PRO DEL BIENESTAR GENERAL.  EL PARLAMENTO REGIONAL TIENE COMO FUNCIÓN PRODUCIR ENMIENDAS O REFORMAS A LA CONSTITUCIÓN DEL ESTADO ARAGUA, SANCIONAR LEYES RELATIVAS AL ESTADO ARAGUA, APROBAR EL PRESUPUESTO DEL ESTADO, DESIGNAR O DESTITUIR AL CONTRALOR DEL ESTADO, EVALUAR EL INFORME ANUAL DEL GOBERNADOR Y CONTROLAR LOS ÓRGANO	2	\N	\N			10	1	2
90	1	000000090           	2016-06-13	2016	10	PRESIDENTA                                                                                                                                                                	SUMIRE FERRARA                                                                                                                                                            	(0243) 232-4921	11182340	despachoclea@gmail.com	EL CONSEJO LEGISLATIVO DEL ESTADO ARAGUA, EN COHERENCIA CON LAS LINEAS CONSTITUCIONALES Y LEGALES DE LA REPÚBLICA DIRIGE SUS ESFUERZOS EN GARANTIZAR UN MARCO JURÍDICO ESTADAL BASADOS EN UNA JUSTICIA SOCIAL Y DE DERECHO, ORGANIZANDO Y PROMOVIENDO LA PARTICIPACIÓN POPULAR EN PRO DEL BIENESTAR GENERAL. EL PARLAMENTO REGIONAL TIENE COMO FUNCIÓN PRODUCIR ENMIENDAS O REFORMAS A LA CONSTITUCIÓN DEL ESTADO ARAGUA, SANCIONAR LEYES RELATIVAS AL ESTADO ARAGUA, APROBAR EL PRESUPUESTO DEL ESTADO, DESIGNAR O DESTITUIR AL CONTRALOR DEL ESTADO, EVALUAR EL INFORME ANUAL DEL GOBERNADOR Y CONTROLAR LOS ÓRGANOS D	4	\N	\N			10	1	2
91	1	000000091           	2016-06-13	2016	10	PRESIDENTA                                                                                                                                                                	SUMIRE FERRARA                                                                                                                                                            	(0243) 232-4921	11182340	despachoclea@gmail.com	FALTA POR REALIZAR	7	\N	\N			10	1	2
93	1	000000093           	2016-06-13	2016	6	PRESIDENTE                                                                                                                                                                	PABLO JOSE GUZMAN                                                                                                                                                         	(0412) 241-1737	9682691	pmguzman@gmail.com	EL PRESUPUESTO ASIGNADO PARA EL EJERCICIO FISCAL 2016, VA DIRIGIDO AL LOGRÓ POSITIVO DE BENEFICIOS PARA EL PUEBLO, GENERADO CON LA INCLUSIÓN SOCIAL AL ACCESO DE LAS TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓN (TIC) PARA EL DESARROLLO DE LA NACIÓN, EN EL MARCO DE LA REVOLUCIÓN DEL CONOCIMIENTOS, ESTO A TRAVÉS DE LOS DIFERENTES SERVICIOS QUE PRESTAN LA A.C. BIBLIOTECAS VIRTUALES DE ARAGUA, DIRIGIDOS ATENDER LAS NECESIDADES SOCIALES Y TECNOLÓGICAS DE LA POBLACIÓN ARAGÜEÑA. 	2	\N	\N			6	1	2
\.


--
-- Name: acciones_registro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('acciones_registro_id_seq', 95, true);


--
-- Data for Name: actividad_ejecutada; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY actividad_ejecutada (id, id_act, trimestre_i, porcentaje_i, observacion_i, trimestre_ii, porcentaje_ii, observacion_ii, trimestre_iii, porcentaje_iii, observacion_iii, trimestre_iv, porcentaje_iv, observacion_iv) FROM stdin;
\.


--
-- Name: actividad_ejecutada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('actividad_ejecutada_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY auth_group (name, id) FROM stdin;
Administrador	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY auth_user (password, is_superuser, username, first_name, last_name, cedula, is_staff, is_active, group_id, agregar, modificar, eliminar, ver, reporte, id) FROM stdin;
pbkdf2_sha256$12000$8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	t	admin	ADMIN	ADMIN	12345678	f	t	1	t	t	f	f	t	1
\.


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY bitacora (modulo, accion, id_usuario, fecha_registro, fecha_actualizacion, hora_registro, hora_actualizacion, id, ip) FROM stdin;
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	10:06 am	\N	1	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	10:15 am	\N	2	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	10:37 am	\N	3	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	10:39 am	\N	4	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-07	\N	10:41 am	\N	5	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-07	\N	10:45 am	\N	6	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	10:53 am	\N	7	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:02 am	8	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:08 am	9	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:15 am	10	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:16 am	11	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:19 am	12	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:22 am	13	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:22 am	14	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:24 am	15	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:25 am	16	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:25 am	17	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:26 am	18	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:28 am	19	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:29 am	20	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:31 am	21	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:32 am	22	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:33 am	23	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:35 am	24	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	11:36 am	25	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	01:11 pm	\N	26	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:14 pm	\N	27	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:17 pm	\N	28	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:27 pm	\N	29	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:31 pm	\N	30	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:33 pm	\N	31	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:35 pm	\N	32	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:37 pm	\N	33	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:40 pm	\N	34	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:42 pm	\N	35	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:47 pm	\N	36	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	01:48 pm	37	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:50 pm	\N	38	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:53 pm	\N	39	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	01:55 pm	\N	40	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:02 pm	\N	41	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:04 pm	\N	42	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:07 pm	\N	43	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:09 pm	\N	44	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:10 pm	\N	45	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:12 pm	\N	46	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:14 pm	\N	47	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:16 pm	\N	48	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:17 pm	\N	49	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:21 pm	\N	50	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:23 pm	\N	51	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:34 pm	\N	52	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:38 pm	\N	53	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:39 pm	\N	54	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:41 pm	\N	55	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:43 pm	\N	56	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:47 pm	\N	57	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:49 pm	\N	58	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:51 pm	\N	59	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:52 pm	\N	60	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-07	\N	02:54 pm	\N	61	190.202.87.180      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:55 pm	\N	62	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-07	\N	02:55 pm	\N	63	190.202.87.180      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:56 pm	\N	64	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	02:58 pm	\N	65	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:00 pm	\N	66	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:07 pm	\N	67	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:10 pm	\N	68	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:12 pm	\N	69	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:13 pm	\N	70	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:21 pm	\N	71	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	03:22 pm	72	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-07	\N	03:23 pm	73	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:26 pm	\N	74	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-07	\N	03:28 pm	\N	75	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-07	\N	03:37 pm	\N	76	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	08:04 am	\N	77	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-11	\N	08:05 am	\N	78	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	10:00 am	\N	79	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:11 am	\N	80	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:14 am	\N	81	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:20 am	\N	82	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:26 am	\N	83	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:29 am	\N	84	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:33 am	\N	85	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	10:35 am	86	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:38 am	\N	87	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:41 am	\N	88	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:41 am	\N	89	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	10:43 am	\N	90	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:03 am	\N	91	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:08 am	\N	92	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:11 am	\N	93	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	11:12 am	94	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:21 am	\N	95	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:23 am	\N	96	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:25 am	\N	97	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:27 am	\N	98	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVO INGRESO DE ORGANO ENTE                                                                        	1	2016-04-11	\N	11:29 am	\N	99	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	11:29 am	100	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-11	\N	11:37 am	\N	101	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	01:38 pm	\N	102	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	01:46 pm	\N	103	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	01:47 pm	\N	104	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-11	\N	01:47 pm	\N	105	190.202.87.180      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	02:03 pm	106	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-11	\N	02:09 pm	\N	107	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-11	\N	02:10 pm	\N	108	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	02:23 pm	109	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	02:24 pm	110	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-11	\N	02:28 pm	111	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-04-11	\N	03:11 pm	\N	112	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-04-11	\N	03:11 pm	\N	113	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	08:43 am	\N	114	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-12	\N	08:46 am	\N	115	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	09:27 am	\N	116	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	10:07 am	\N	117	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	10:28 am	\N	118	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	10:42 am	\N	119	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	10:58 am	\N	120	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	11:00 am	\N	121	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-12	\N	11:12 am	122	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	11:45 am	\N	123	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	01:43 pm	\N	124	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	01:50 pm	\N	125	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	02:01 pm	\N	126	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:08 pm	127	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	02:12 pm	\N	128	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	02:13 pm	\N	129	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:14 pm	130	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-12	\N	02:17 pm	131	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:17 pm	132	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	02:24 pm	\N	133	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:25 pm	134	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-04-12	\N	02:27 pm	135	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	02:28 pm	\N	136	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:33 pm	137	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	02:38 pm	\N	138	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:38 pm	139	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-12	\N	02:38 pm	\N	140	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-12	\N	02:42 pm	\N	141	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:46 pm	142	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:46 pm	143	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	02:46 pm	144	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:04 pm	145	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:27 pm	146	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:32 pm	147	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:33 pm	148	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-12	\N	03:36 pm	\N	149	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:39 pm	150	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:51 pm	151	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-12	\N	03:55 pm	152	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-13	\N	08:16 am	\N	153	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-13	\N	08:17 am	\N	154	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	08:21 am	\N	155	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-13	\N	08:25 am	\N	156	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:26 am	157	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:27 am	158	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-13	\N	08:27 am	\N	159	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:29 am	160	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:30 am	161	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	08:32 am	\N	162	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	08:44 am	\N	163	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:44 am	164	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	08:44 am	165	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	09:38 am	166	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	09:58 am	167	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:03 am	168	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:09 am	169	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:09 am	170	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:09 am	171	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:09 am	172	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:12 am	173	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:12 am	174	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:12 am	175	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:12 am	176	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:20 am	177	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	10:20 am	178	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	10:29 am	\N	179	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:04 am	180	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:13 am	181	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:16 am	182	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	11:18 am	\N	183	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:28 am	184	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:30 am	185	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	11:30 am	186	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-13	\N	11:50 am	\N	187	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-13	\N	12:08 pm	188	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-13	\N	12:08 pm	\N	189	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	08:36 am	\N	190	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-14	\N	09:11 am	191	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-14	\N	09:33 am	192	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-14	\N	09:42 am	\N	193	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	09:45 am	\N	194	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-14	\N	09:52 am	\N	195	190.202.87.180      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-14	\N	10:16 am	196	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-14	\N	10:23 am	\N	197	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	10:26 am	\N	198	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-14	\N	11:17 am	199	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-14	\N	11:36 am	\N	200	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	01:27 pm	\N	201	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	01:30 pm	\N	202	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-14	\N	02:31 pm	\N	203	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-14	\N	03:07 pm	204	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-20	\N	08:34 am	\N	205	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-20	\N	08:56 am	\N	206	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-20	\N	08:58 am	\N	207	190.202.87.180      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:33 am	208	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:33 am	209	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:33 am	210	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	09:36 am	\N	211	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:41 am	212	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:55 am	213	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	09:57 am	214	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:02 am	215	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:03 am	216	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	10:07 am	\N	217	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:14 am	218	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:19 am	219	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	10:22 am	\N	220	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:31 am	221	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	10:36 am	\N	222	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:50 am	223	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	10:50 am	224	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	10:56 am	\N	225	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	\N	\N	2016-04-20	\N	01:32 pm	226	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-20	\N	01:32 pm	\N	227	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	01:35 pm	\N	228	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	01:58 pm	229	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	02:01 pm	230	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	02:05 pm	231	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	02:08 pm	\N	232	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	02:34 pm	233	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-20	\N	02:41 pm	\N	234	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-20	\N	03:36 pm	235	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-20	\N	03:37 pm	\N	236	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-20	\N	03:41 pm	\N	237	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-21	\N	08:51 am	\N	238	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:06 am	239	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:10 am	240	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	09:13 am	\N	241	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:29 am	242	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	09:32 am	\N	243	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:39 am	244	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:40 am	245	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:41 am	246	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	09:42 am	\N	247	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:47 am	248	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	09:49 am	249	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	09:51 am	\N	250	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	09:51 am	\N	251	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	10:01 am	252	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	10:01 am	253	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	10:04 am	254	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	10:08 am	\N	255	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	10:26 am	256	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	10:27 am	\N	257	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	10:59 am	258	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	11:01 am	\N	259	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-21	\N	01:17 pm	\N	260	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	01:41 pm	261	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	01:43 pm	262	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	01:44 pm	\N	263	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	02:07 pm	264	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-21	\N	02:27 pm	265	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	02:30 pm	\N	266	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-21	\N	02:31 pm	\N	267	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-04-21	\N	03:31 pm	\N	268	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-25	\N	08:45 am	\N	269	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-25	\N	08:50 am	\N	270	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-25	\N	08:51 am	\N	271	190.202.87.180      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-25	\N	11:01 am	272	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-25	\N	11:16 am	273	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-25	\N	01:26 pm	\N	274	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-25	\N	01:44 pm	275	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-25	\N	01:47 pm	276	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-25	\N	01:57 pm	\N	277	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-25	\N	03:05 pm	\N	278	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-25	\N	03:50 pm	\N	279	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-25	\N	03:51 pm	\N	280	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-26	\N	08:38 am	\N	281	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	08:49 am	282	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-26	\N	08:54 am	\N	283	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	08:59 am	284	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	09:06 am	285	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	10:04 am	\N	286	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-26	\N	10:14 am	\N	287	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-26	\N	10:26 am	\N	288	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	10:58 am	289	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	11:00 am	\N	290	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	11:47 am	291	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	11:52 am	292	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-26	\N	12:44 pm	\N	293	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	12:47 pm	\N	294	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	02:19 pm	295	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	02:31 pm	\N	296	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	02:38 pm	297	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	02:50 pm	\N	298	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	02:50 pm	\N	299	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	02:58 pm	300	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	03:03 pm	\N	301	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-26	\N	03:03 pm	\N	302	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:04 pm	303	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:05 pm	304	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:10 pm	305	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:14 pm	306	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:16 pm	307	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:30 pm	308	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-26	\N	03:32 pm	309	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-26	\N	03:40 pm	\N	310	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-27	\N	08:51 am	\N	311	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-27	\N	09:00 am	\N	312	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:13 am	313	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:13 am	314	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:14 am	315	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-27	\N	09:26 am	\N	316	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:39 am	317	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:54 am	318	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:56 am	319	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	09:56 am	320	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-27	\N	10:02 am	\N	321	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	10:42 am	322	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	10:42 am	323	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	10:46 am	324	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	10:47 am	325	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-04-27	\N	10:48 am	\N	326	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	10:48 am	327	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	11:05 am	328	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-04-27	\N	11:10 am	329	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-27	\N	11:10 am	\N	330	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-04-27	\N	02:34 pm	\N	331	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-04-27	\N	02:36 pm	\N	332	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-02	\N	08:39 am	\N	333	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-02	\N	08:39 am	\N	334	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-02	\N	08:43 am	\N	335	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	08:57 am	\N	336	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	09:30 am	337	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	09:44 am	338	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	09:44 am	339	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	09:48 am	\N	340	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	10:29 am	341	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	10:32 am	342	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	10:43 am	\N	343	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	10:52 am	344	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	10:57 am	\N	345	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-02	\N	11:44 am	\N	346	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	11:53 am	347	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-02	\N	01:28 pm	\N	348	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	01:38 pm	\N	349	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	01:46 pm	350	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	01:47 pm	351	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	01:49 pm	\N	352	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	02:09 pm	353	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	02:11 pm	354	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	02:12 pm	355	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-02	\N	02:26 pm	\N	356	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-02	\N	03:41 pm	\N	357	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-02	\N	04:43 pm	\N	358	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-02	\N	04:45 pm	\N	359	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	04:47 pm	360	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-02	\N	04:50 pm	\N	361	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	04:52 pm	362	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	05:00 pm	363	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-02	\N	05:03 pm	364	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	05:06 pm	365	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-02	\N	05:15 pm	\N	366	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	05:16 pm	367	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-02	\N	05:17 pm	\N	368	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-02	\N	05:18 pm	369	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-03	\N	08:23 am	\N	370	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	08:42 am	371	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-05-03	\N	08:52 am	372	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	08:53 am	373	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	08:54 am	374	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	09:09 am	375	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	09:23 am	376	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	09:24 am	377	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-03	\N	09:45 am	\N	378	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	09:51 am	379	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-03	\N	09:54 am	\N	380	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-03	\N	10:47 am	381	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-03	\N	10:50 am	\N	382	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-03	\N	02:28 pm	\N	383	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-03	\N	03:32 pm	\N	384	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-05	\N	08:59 am	\N	385	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-05	\N	09:45 am	\N	386	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-05	\N	11:08 am	\N	387	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-05	\N	11:13 am	\N	388	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-05	\N	11:41 am	\N	389	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-05-05	\N	01:08 pm	\N	390	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	08:20 am	\N	391	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-09	\N	08:23 am	\N	392	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	08:23 am	\N	393	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-09	\N	08:34 am	\N	394	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	08:45 am	\N	395	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	09:05 am	\N	396	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:18 am	397	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:27 am	398	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:31 am	399	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	09:49 am	\N	400	190.202.87.180      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:54 am	401	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:55 am	402	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	09:59 am	403	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:09 am	404	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:10 am	405	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:14 am	406	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:19 am	407	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:20 am	408	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:22 am	409	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:25 am	410	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:29 am	411	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:31 am	412	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:36 am	413	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:37 am	414	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:38 am	415	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:41 am	416	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:47 am	417	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:47 am	418	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	10:51 am	419	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:02 am	420	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:07 am	421	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:13 am	422	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:14 am	423	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:16 am	424	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:16 am	425	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:17 am	426	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:18 am	427	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:19 am	428	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:20 am	429	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:24 am	430	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	11:25 am	431	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-05-09	\N	11:58 am	\N	432	190.202.87.180      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	\N	\N	2016-05-09	\N	01:26 pm	433	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	01:27 pm	\N	434	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-09	\N	01:56 pm	\N	435	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:01 pm	436	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:03 pm	437	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:06 pm	438	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-09	\N	02:07 pm	\N	439	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:13 pm	440	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:14 pm	441	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-09	\N	02:15 pm	442	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-09	\N	02:36 pm	\N	443	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-10	\N	08:21 am	\N	444	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-10	\N	08:24 am	\N	445	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-10	\N	08:25 am	446	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-10	\N	08:27 am	\N	447	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-10	\N	08:53 am	\N	448	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-10	\N	08:54 am	\N	449	190.202.87.180      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	\N	\N	2016-05-10	\N	09:30 am	450	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-10	\N	09:42 am	\N	451	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-10	\N	10:52 am	\N	452	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-05-10	\N	03:33 pm	\N	453	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-11	\N	11:20 am	\N	454	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-11	\N	11:20 am	\N	455	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-16	\N	08:57 am	\N	456	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-16	\N	08:59 am	\N	457	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-16	\N	08:59 am	458	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-16	\N	09:00 am	\N	459	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-16	\N	09:02 am	460	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-16	\N	09:03 am	\N	461	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-16	\N	09:04 am	462	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-16	\N	09:05 am	\N	463	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-16	\N	09:06 am	464	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	\N	2016-05-16	\N	11:08 am	\N	465	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	\N	2016-05-16	\N	11:08 am	\N	466	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-16	\N	11:08 am	\N	467	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-16	\N	11:09 am	\N	468	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-16	\N	11:27 am	469	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-16	\N	11:50 am	\N	470	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-17	\N	01:54 pm	\N	471	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-17	\N	02:00 pm	\N	472	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-17	\N	02:11 pm	\N	473	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-17	\N	02:14 pm	\N	474	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-23	\N	08:38 am	\N	475	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-23	\N	08:55 am	\N	476	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-23	\N	09:00 am	\N	477	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-23	\N	09:17 am	478	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	\N	\N	2016-05-23	\N	01:22 pm	479	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-23	\N	01:23 pm	\N	480	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-23	\N	01:23 pm	481	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-23	\N	02:15 pm	\N	482	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-25	\N	08:25 am	\N	483	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-25	\N	09:34 am	\N	484	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-25	\N	03:02 pm	\N	485	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-26	\N	10:08 am	\N	486	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-30	\N	09:02 am	\N	487	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	09:30 am	\N	488	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:07 am	489	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:29 am	490	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:32 am	491	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	10:39 am	\N	492	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:49 am	493	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:56 am	494	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	10:59 am	495	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	11:07 am	496	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	11:14 am	\N	497	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	11:32 am	498	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	\N	\N	2016-05-30	\N	01:19 pm	499	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-30	\N	01:21 pm	\N	500	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	01:36 pm	501	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	01:38 pm	\N	502	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	02:01 pm	503	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	02:04 pm	504	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	02:08 pm	\N	505	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	02:22 pm	506	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	02:28 pm	507	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	02:29 pm	508	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-30	\N	02:33 pm	\N	509	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-30	\N	03:03 pm	510	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-30	\N	04:13 pm	\N	511	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-30	\N	04:16 pm	\N	512	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-30	\N	04:17 pm	513	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-30	\N	04:18 pm	\N	514	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-30	\N	04:23 pm	515	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-31	\N	09:23 am	\N	516	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-31	\N	10:41 am	\N	517	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	10:55 am	\N	518	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:06 am	519	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:07 am	520	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:08 am	521	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:11 am	522	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	11:16 am	\N	523	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:22 am	524	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:32 am	525	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	11:40 am	\N	526	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	11:40 am	\N	527	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-05-31	\N	11:57 am	528	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:58 am	529	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	11:59 am	530	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	12:12 pm	531	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-31	\N	01:20 pm	\N	532	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	01:22 pm	533	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	01:27 pm	\N	534	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	01:33 pm	535	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	01:37 pm	536	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	01:44 pm	\N	537	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	01:49 pm	538	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	01:52 pm	539	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	01:56 pm	\N	540	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	02:18 pm	541	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-05-31	\N	02:20 pm	\N	542	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-05-31	\N	02:21 pm	543	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-31	\N	02:25 pm	\N	544	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-31	\N	02:27 pm	545	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-05-31	\N	02:29 pm	\N	546	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-31	\N	02:31 pm	\N	547	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-31	\N	02:37 pm	\N	548	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-31	\N	02:38 pm	549	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-05-31	\N	02:40 pm	\N	550	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-05-31	\N	02:41 pm	\N	551	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-31	\N	02:41 pm	\N	552	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-31	\N	02:43 pm	553	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-05-31	\N	02:45 pm	\N	554	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-05-31	\N	02:47 pm	555	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-06	\N	09:08 am	\N	556	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:16 am	557	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:28 am	558	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:28 am	559	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:31 am	560	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:31 am	561	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:42 am	562	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	09:46 am	563	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-06	\N	09:52 am	\N	564	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	10:16 am	565	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	10:25 am	566	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	10:32 am	567	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-06	\N	11:21 am	\N	568	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-06	\N	01:31 pm	\N	569	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	01:57 pm	570	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	02:11 pm	571	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-06	\N	02:16 pm	\N	572	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	02:20 pm	573	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	02:21 pm	574	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	02:22 pm	575	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	02:56 pm	576	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-06	\N	03:02 pm	\N	577	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	03:06 pm	578	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	03:13 pm	579	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-06	\N	03:23 pm	580	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-07	\N	09:38 am	\N	581	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-07	\N	09:45 am	\N	582	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	09:53 am	583	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	10:27 am	584	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	10:37 am	585	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-07	\N	10:53 am	\N	586	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:06 am	587	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:13 am	588	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-07	\N	11:15 am	\N	589	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:41 am	590	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:42 am	591	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:44 am	592	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-07	\N	11:45 am	593	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-07	\N	11:46 am	\N	594	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-07	\N	01:46 pm	\N	595	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-07	\N	03:06 pm	\N	596	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	\N	2016-06-07	\N	03:49 pm	\N	597	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-13	\N	08:36 am	\N	598	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	08:47 am	599	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	08:49 am	600	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	08:56 am	\N	601	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:09 am	602	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:11 am	603	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:13 am	604	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	09:21 am	\N	605	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:29 am	606	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	09:30 am	\N	607	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:36 am	608	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:37 am	609	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	09:39 am	610	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	09:42 am	\N	611	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-06-13	\N	10:33 am	612	190.202.82.236      
ORGANOS ENTES (TABLA organos_entes)                                                                                                                                                                     	NUEVA ACTUALIZACIÓN DE ORGANO ENTE                                                                  	1	\N	2016-06-13	\N	10:35 am	613	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	10:42 am	614	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	10:44 am	\N	615	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	10:54 am	616	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	10:56 am	\N	617	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	11:08 am	618	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	11:26 am	619	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	11:27 am	\N	620	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	11:30 am	621	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	11:31 am	622	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-13	\N	01:42 pm	\N	623	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	01:54 pm	\N	624	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	01:59 pm	625	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-13	\N	02:01 pm	\N	626	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	02:02 pm	\N	627	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	02:23 pm	628	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	02:25 pm	629	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	02:26 pm	\N	630	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:37 pm	\N	631	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:38 pm	632	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:41 pm	\N	633	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:42 pm	634	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:43 pm	\N	635	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:44 pm	636	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:45 pm	\N	637	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	02:45 pm	638	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:45 pm	639	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:48 pm	\N	640	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:50 pm	641	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	02:52 pm	\N	642	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	02:53 pm	643	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	02:54 pm	644	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	02:58 pm	\N	645	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	03:01 pm	646	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVO INGRESO DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                                 	1	2016-06-13	\N	03:02 pm	\N	647	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	03:02 pm	\N	648	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	03:03 pm	649	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	03:04 pm	\N	650	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	03:05 pm	651	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	03:06 pm	\N	652	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	03:07 pm	653	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	03:07 pm	654	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-13	\N	03:08 pm	\N	655	190.202.82.236      
REGISTRO DE ACCIÓNES CENTRALIZADAS (TABLA acciones_registro)                                                                                                                                            	NUEVA ACTUALIZACIÓN DE REGISTRO DE ACCIÓNES CENTRALIZADAS                                           	1	\N	2016-06-13	\N	03:09 pm	656	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-13	\N	03:10 pm	657	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-13	\N	03:30 pm	\N	658	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	09:12 am	\N	659	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	09:12 am	\N	660	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	09:12 am	\N	661	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	10:13 am	\N	662	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-14	\N	10:16 am	\N	663	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-14	\N	10:17 am	664	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-14	\N	10:18 am	\N	665	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-14	\N	10:19 am	666	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-14	\N	10:22 am	\N	667	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-14	\N	10:23 am	668	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-14	\N	10:25 am	\N	669	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	10:57 am	\N	670	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	11:25 am	\N	671	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	01:06 pm	\N	672	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-14	\N	01:09 pm	\N	673	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-16	\N	08:08 am	\N	674	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-16	\N	08:36 am	\N	675	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-16	\N	09:17 am	\N	676	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVO INGRESO DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                           	1	2016-06-16	\N	09:19 am	\N	677	190.202.82.236      
OBSERVACIÓN DE REGISTRO DE ACCIONES CENTRALIZADAS (TABLA observaciones_acciones)                                                                                                                        	NUEVA ACTUALIZACIÓN DE OBSERVACIONES PARA EL REGISTRO DE ACCIONES CENTRALIZADAS                     	1	\N	2016-06-16	\N	09:21 am	678	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-16	\N	10:23 am	\N	679	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-06-16	\N	10:58 am	\N	680	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-16	\N	12:08 pm	\N	681	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-17	\N	10:32 am	\N	682	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-17	\N	10:32 am	\N	683	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-06-27	\N	08:41 am	\N	684	190.202.82.236      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO INGRESO DE SESIÓN                                                                             	1	2016-07-01	\N	08:41 am	\N	685	190.202.87.180      
USUARIO  (TABLA auth_user)                                                                                                                                                                              	NUEVO CIERRE DE SESIÓN                                                                              	1	2016-07-01	\N	09:05 am	\N	686	190.202.87.180      
\.


--
-- Name: bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('bitacora_id_seq', 686, true);


--
-- Data for Name: distribucion_acc_especifica; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_acc_especifica (id, pk, acc_esp, unidad_medida, medio_verificacion, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, total) FROM stdin;
\.


--
-- Name: distribucion_acc_especifica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_acc_especifica_id_seq', 1, false);


--
-- Data for Name: distribucion_actividad; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_actividad (id, id_acc_reg, actividad, unidad_medida, medio_verificacion, cantidad, indicador_actividad, programado) FROM stdin;
1	2	INSPECCIONES DE OBRAS	INSPECCIONES	FICHA DE REGISTRO DE INSPECCIONES	70	Nº DE INSPECCIONES EJECUTADAS	t
2	3	 RECIBIR TRAMITAR DOCUMENTOS PARA LA ADQUISICIÓN DE VIVIENDA	 TRAMITES	HOJA DE RESUMEN DE TRAMITE	7500	CANTIDAD DE TAMITES REALIZADOS	t
3	4	CONSTRUCCION DE OBRAS DE VIALIDAD TALES COMO CARRETERAS	EJECUCIÓN DE OBRAS 	VALUACIONES	3	NUMERO DE VALUACIONES POR REALIZAR EN EL	t
4	2	REPAVIMENTACIÓN DE CALLES, AVENIDAS, PUENTES Y AUTOPISTAS	EJECUCIÓN DE OBRAS	VALUACIONES	30	NÚMERO DE VALUACIONES POR REALIZAR EN EL	t
5	2	DEMARCACIÓN DE LAS ACERAS, Y SEÑALAMIENTO DE LAS VÍAS 	KILOMETROS DEMARCADOS 	VALUACIONES	76	NÚMERO DE VALUACIONES A REALIZAR EN EL A	t
6	5	GARANTIZAR LA COBERTURA DE SEGURIDAD A TRAVÉS DE OPERATIVOS	OPERATIVOS 	OPERATIVOS 	199	N° DE OPERATIVOS REALIZADOS EN EL AÑO	t
7	6	GARANTIZAR LA COBERTURA DE SEGURIDAD A TRAVES DE OPERATIVOS	N° OPERATIVOS EN EL AÑO	N° OPERATIVOS EN EL AÑO	199	N° DE OPERATIVOS REALIZADOS EN EL AÑO	t
8	7	PROGRAMAR ENTREVISTAS CON MEDIOS  DE COMUNICACION	ENTREVISTAS CON MEDIOS	INFORMES	45	N° DE ENTREVISTAS REALIZADAS	t
9	7	REALIZAR: TALLERES, CHARLAS, FOROS Y VIDEOCONFERENCIAS	TALLERES, CHARLAS,VIDEOCONFERENCIAS	LISTADO DE ASISTENCIA	24	N° DE TALLERES, CHARLAS REALIZADAS	t
10	6	DISMINUCIÓN DE LA INCIDENCIA DELICTIVA A TRAVÉS DEL PATRULLA	INCIDENCIAS DELICTIVAS	COMPARATIVO	20	Nº DE INCIDENCIAS DELICTIVAS 	t
11	6	INCREMENTO DE LAS  ACCIONES POLICIALES POSITIVAS / RECUPERAC	ACCIONES 	COMPARATIVO 	20	Nº DE ACCIONES REALIZADAS	t
12	7	ORGANIZAR Y REALIZAR REUNIONES PERMANENTES CON LOS  EQUIPOS	REUNIONES	MINUTA ARCHIVO FOTOGRAFICO	74	N° DE REUNIONES REALIZADAS	t
13	6	ACCIONES DE ORIENTACIÓN, ASISTENCIA Y ACOMPAÑAMIENTO COMUNAL	ACCIONES	IMFORME	30	Nº DE ACCIONES REALIZADAS	t
14	6	MANTENIMIENTO DEL ORDEN PÚBLICO  Y APOYO DE SEGURIDAD 	ACTIVIDADES 	IMFORME	9600	N° DE ACCIONES REALIZADAS	t
15	7	EJECUTAR ACTIVIDADES DE PARTICIPACIÓN COMUNITARIA	ACTIVIDADES COMUNITARIAS	MINUTA ARCHIVO FOTOGRAFICO	97	N° DE ACTIVIDADES COMUNITARIAS REALIZADA	t
16	7	ESTABLECER ESTRATEGIAS PARA EL FORTALECIMIENTO DE LAS MISION	MESAS DE TRABAJO Y REUNIONES	INFORMES	47	N° DE MESAS DE TRABAJOS  Y REUNIONES	t
17	7	APOYAR TRABAJOS VOLUNTARIOS  EN LAS BASES DE MISIONES	TRABAJO VOLUNTARIO A LAS BASES DE M	MINUTA ARCHIVO FOTOGRAFICO	40	TRABAJO VOLUNTARIO	t
18	7	ORIENTAR Y SUPERVISAR A LOS  COORDINADORES  DE LAS 13 BASES	VISITAS 	INFORMES ARCHIVO FOTOGRAFICO 	63	N° DE VISITAS	t
19	7	REFORSAR TRABAJOS SOCIO- POLITICOS A TRAVEZ DE MESAS DE TRA	MESAS DE TRABAJO SOCIO - POLITICOS	MINUTA ARCHIVO FOTOGRAFICO	64	Nº DE MESAS DE TRABAJO REALIZADAS	t
20	7	PROGRAMAS, REALIZAR Y ASISTIR A EVENTOS DE ACTOS PUBLICOS	EVENTOS Y ACTOS  PUBLICOS	MINUTA ARCHIVO FOTOGRAFICO	20	Nº DE EVENTOS ACTOS	t
21	7	PAÑAR EN DIFERENTES ACTIVIDADES AL GOBERNADOR DEL ESTADO	ACOMPAÑAMIENTO DEL GOBERNADOR	ARCHIVO FOTOGRAFICO	15	N° DE ACOMPAÑAMIENTO	t
22	7	ORGANIZAR Y REALIZAR OPERATIVOS (SALUD, EDUCACION, CULTURA)	ORGANIZAR Y REALIZAR OPERATIVO SA	MINUTA ARCHIVO FOTOGRAFICO	136	N° DE OPERATIVOS	t
23	7	GESTIONAR Y TRAMITAR CASOS  DE SALUD, VIVIENDA Y AYUDAS TECN	 TRAMITAR CASOS  DE SALUD, VIVIENDA	OFICIOS  Y ANEXOS DEL SOLICITANTE	121	N° DE CASOS TRAMITADOS	t
24	7	DIAGNOSTICAR Y PLANIFICAR LAS POTENCIALIDADES GEOGRAFICAS 	REUNIONES Y ASAMBLEAS DE CIUDADANOS	MINUTAS, ARCHIVO FOGRAFICO Y PROYECTOS	103	N° DE REUNIONES Y ASAMBLEAS	t
25	5	 DISMINUCIÓN LA INCIDENCIA DELICTIVA A TRAVES DEL PATRULLA	DISMINUCIÒN DEL DELITO 	COMPARATIVO	20	COMPARAT INCIDENCIAS DELICTIVAS 	t
26	5	 INCREMENTO DE LAS ACCIONES POLICIALES POSITIVAS / RECUPERA	INCREMENTO ACCIONES POSITIVAS 	COMPARATIVO	30	ACCIONES POSITIVAS	t
27	5	 ACCIONES DE ORIENTACIÓN, ASISTENCIA Y ACOMPAÑAMIENTO COMUNA	N° ACCIONES	IMFORME	9600	ACCIONES CENTRALIZADAS 	t
28	5	 MANTENIMIENTO DEL ORDEN PÚBLICO Y APOYO DE SEGURIDAD A OTR	N° DE ACTIVIDADES	INFORME	1800	ACTIVIDADES REALIZADAS	t
29	8	ATENCIÓN A LA MUJER Y SU FAMILIA	 ASESORÍAS LEGALES Y PSICOLÓGICAS	IMFORME ASESORIA	4000	N° PERSONAS ATENDIDAS	t
30	8	 DIFUSIÓN DEL DERECHO DE LA MUJER A VIVIR LIBRE DE VIOLENCIA	PROGRAM AUDIOVISUAL Y PUBLICACIONES	RELACION DE ASISTENCIA 	6000	PERSONAS IMFORMADAS	t
31	9	DEASROLLARACTIVIDADES DE ORALIDAD Y EL PENSAMIENTO ESCRITO	ACTIVIDADES LITERARIAS	IMFORME REGISTRO FOTOGRAFICOS 	87	ACTIVADES LITERARIAS	t
32	9	DESARROLLAR ACTIVIDADES RED DE BIBLIOTECAS PUBLICAS	ACTIVIDADES BIBLOTECARIAS	IMFORMES Y REGISTROS FOTOGRAFICOS 	11947	ACTIVIDADES BIBLIOTECARIAS 	t
33	9	DESARROLLAR ACTIVIDADES BIBLIOTECA AGUSTIN CODAZZI	ACTIVIDADES BIBLOTECARIAS	IMFORMES REGISTROS FOTOGRAFICOS 	86311	ACTIVIDADES BIBLIOTECARIAS 	t
34	9	DESARROLLAR ACTIVIDADES DANZAS ARAGUA	ACTIVIDADES DANCISTICAS	INFORMES Y REGISTROS FOTOGRAFICOS	41	ACTIVIDADES DANCISTICA	t
35	10	REFORSAR TRABAJOS SOCIO- POLITICOS A TRAVEZ DE MESAS DE TRAB	MESAS DE TRABAJO SOCIO - POLITICOS	MINUTAR ARCHIVO FOTOGRAFICO	64	Nº DE MESAS DE TRABAJO REALIZADAS	t
36	9	DESARROLLAR ACTIVIDADES DE LA CASA DE LA CULTURA	ACTIVIDADES CULTURALES	INFORME Y REGISTROS FOTOGRAFICOS	44	ACTIVIDADES CULTURALES 	t
37	10	REALIZAR: TALLERES, CHARLAS, FOROS Y VIDEO CONFERENCIAS	TALLERES, CHARLAS,VIDEOCONFERENCIAS	LISTADO DE ASISTENCIA	24	N° DE TALLERES, CHARLAS REALIZADAS	t
38	9	DESARROLLAR ACTIVIDADES TEATRO ATENEO DE MARACAY	ACTIVIDADES TEATRALES	INFORMES Y REGISTROS FOTOGRAFICOS	313	ACTIVIDADES TREATALES 	t
39	9	DEASRROLAR ACTIVIDADES TEATRO ESTABLE	ACTIVIDADES TEATRALES	INFORMES Y REGISTROS FOTOGRAFICOS	59	ACTIVIDADES TEATRALES 	t
40	9	DESARROLLAR ACTIVIDADES MUSEO ANTROPOLOGICO	ACTIVIDADES MUSEOGRAFICAS	INFORMES Y REGISTROS FOTOGRAFICOS	11975	ACTIVIDADES MUSEOGRAFICAS 	t
41	10	PROGRAMAS, REALIZAR Y ASISTIR A EVENTOS DE ACTOS PUBLICOS AA	EVENTOS Y ACTOS PUBLICOS	MINUTA ARCHIVO FOTOGRAFICO	20	Nº DE EVENTOS ACTOS	t
42	10	PROGRAMAR ENTREVISTAS CON MEDIOS DE COMUNICACION	ENTREVISTAS CON MEDIOS	INFORMES	45	N° DE ENTREVISTAS REALIZADAS	t
43	9	DESARROLLAR ACTIVIDADES MUSO MARIO ABREU	ACTIVIDADES MUSEOGRAFICAS	INFORMES Y REGISTROS FOTOGRAFICOS	55	ACTIVIDADES MUSEOGRAFICAS	t
44	10	ORIENTAR Y SUPERVISAR A LOS COORDINADORES DE LAS 13 BASES	VISITAS	INFORME ARCHIVO FOTOGRAFICO	63	N° DE VISITAS	t
45	10	ORGANIZAR Y REALIZAR REUNIONES PERMANENTES CON LOS EQUIPO	REUNIONES	INFORME ARCHIVO FOTOGRAFICO	74	N° DE REUNIONES REALIZADAS	t
47	9	DESARROLLAR ACTIVIDADES DE SISTEMAS	SISTEMAS Y REDES	REG MANTENIMIENTOS, MINUTAS, IN	171	MANTENIMEITOS	t
46	9	DESAROLLAR LA COMUNICACIÓN Y EL DISEÑO	COMUNICACIÓN Y DISEÑO	REGISTROS, INFORMES	1426	COMUNICACIÓN Y DISEÑO	t
48	10	ORGANIZAR Y REALIZAR OPERATIVOS  SALUD, EDUCACION, CULTURA	ORGANIZAR Y REALIZAR OPERATIVO SA 	MINUTO ARCHIVO FOTOGRAFICO	136	N° DE OPERATIVOS	t
49	10	GESTIONAR Y TRAMITAR CASOS DE SALUD, VIVIENDA Y AYUDAS TECN	TRAMITAR CASOS DE SALUD, VIVIENDA	OFICIOS Y ANEXOS DEL SOLICITANTE	127	N° DE CASOS TRAMITADOS	t
50	9	DESARROLLO DE LA GESTIÓN DE RECURSOS HUMANOS	GESTIONES	REGISTROS, INFORMES, MINUTAS	114	GESTIONES DE RRHH	t
51	10	ESTABLECER ESTRATEGIAS PARA EL FORTALECIMIENTO DE LAS MISIONES	MESAS DE TRABAJO Y REUNIONES	INFORMES	74	N° DE REUNIONES REALIZADAS	t
52	9	DESARROLLO GESTIÓN ADMINISTRATIVA	GESTIÓN ADMINISTRATIVA	EJECUCIONES, INFORMES, 	157	GESTIONES ADMINISTRATIVAS	t
53	9	DESARROLLAR ACTIVIDADES DANZAS EXPRESIÓN CRIOLLA	ACTIVIDADES DANCISTICAS	INFORMES Y REGISTROS FOTOGRAFICOS	91	ACTIVIDADES DANCISTICAS	t
54	9	DESARROLO DE LA GESTIÓN DE DIRECCIÓ OPERTAIVA	GESTIÓN OPERATIVA	INFORMES	161	GESTIONES OPERTAIVAS	t
55	10	DIAGNOSTICAR Y PLANIFICAR LAS POTENCIALIDADES GEOGRAFICAS	REUNIONES Y ASAMBLEAS DE CIUDADANOS	MINUTO ARCHIVO 	103	N° DE REUNIONES Y ASAMBLEAS	t
56	10	REALIZAR: TALLERES, CHARLAS, FOROS Y VIDEO DE CONFERENCIAS	TALLERES, CHARLAS,VIDEOCONFERENCIAS	LISTADO DE ASISTENCIA	24	N° DE TALLERES, CHARLAS REALIZADAS	t
58	10	APOYAR TRABAJOS VOLUNTARIOS EN LAS BASES DE MISIONES	TRABAJO VOLUNTARIO A LAS BASES DE M	MINUTA ARCHIVO FOTOGRAFICO	40	TRABAJO VOLUNTARIO	t
57	10	ACOMPAÑAR EN DIFERENTES ACTIVIDADES AL GOBERNADOR DEL ESTADO	ACOMPAÑAMIENTO DEL GOBERNADOR	ARCHIVO FOTOGRAFICO	15	N° DE ACOMPAÑAMIENTO	t
59	11	AUDITORIA OPERATIVA, ADMINISTRATIVA Y DE SEGUIMIENTO.	NÚMERO DE INFORMES	INFORMES	51	NÚMERO DE ACTUACIONES REALIZADAS EN EL A	t
60	11	VALORACIONES PRELIMINARES	NÚMERO DE INFORMES	INFORMES	30	NUMERO DE VALORACIONES REALIZADAS EN EL 	t
61	11	CURSOS EN MATERIA DE CONTROL FISCAL Y PARTICIPATIVA	NÚMERO DE CURSOS	LISTADO DE ASISTENCIA	2	NUMERO DE CURSO REALIZADO 	t
62	11	ASESORÍAS EN MATERIA DE CONTROL FISCAL	NÚMERO DE ASESORIAS	PLANILLA DE ASESORIAS	32	NUMERO DE ASESORIAS REALIZADA	t
63	12	AUDITORIA OPERATIVA, ADMINISTRATIVA Y DE SEGUIMIENTO	NÚMERO DE INFORMES	INFORME	51	NUMERO DE VALORACIONES REALIZADAS EN EL 	t
64	12	VALORACIONES PRELIMINARES.	NÚMERO DE INFORMES	INFORMES	30	NUMERO DE VALORACIONES REALIZADAS EN EL 	t
65	12	CURSOS EN MATERIA DE CONTROL FISCAL Y PARTICIPATIVA..	NÚMERO DE CURSOS	LISTADO DE ASISTENCIA	2	NUMERO DE CURSO REALIZADO 	t
66	12	ASESORÍAS, EN MATERIA DE CONTROL FISCAL	NÚMERO DE ASESORIAS	PLANILLA DE ASESORIAS	32	NÚMERO DE ASESORÍAS REALIZADAS 	t
67	13	TRASLADO DE AMBULANCIA	TRASLADO	CANTIDAD DE TRASLADO ESTADÍSTICAS	658	N° TRASLADOS	t
68	13	ENTREGA DE MEDICAMENTOS	MEDICAMENTOS	ORDEN PARA MEDICAMENTOS  ESTADÍSTICAS	27350	N° SOLICITUD DE MEDICAMENTOS  OTORGADAS	t
69	13	ENTREGA DE MATERIAL DE SINTESIS	MATERIAL DE SINTESIS	ENTREGA DE MATERIAL DE SINTESIS  ESTADÍS	15	N° MATERIAL DE SINTESIS ENTREGADOS	t
70	13	ENTREGA DE ORDEN PARA EXAMENES Y CONSULTAS	EXAMENES Y CONSULTAS	ORDEN PARA EXAMENES  ESTADÍSTICAS	56311	N° EXAMENES OTORGADAS	t
71	13	COMPRAS Y SUMINISTROS	COMPRAS	ORDEN DE COMPRAS Y SERVICIOS ESTADÍSTIC	4	N°  ORDENES COMPRA Y  SERVICIOS 	t
72	13	SERVICIOS FUNERARIOS	CASOS	CASOS FUNERARIOS  ESTADÍSTICAS	240	N° CASOS GESTIONADOS	t
73	13	ENTREGA DE CARTA DE GARANTIA 	CARTA GARANTIA	CARTA GARANTIA  ESTADÍSTICAS	1916	N° CARTAS GARANTIA ENTREGADAS	t
74	14	RECAUDACIÓN POR INGRESOS TRIBUTARIOS	OPERATIVOS DE COBRANZAS	ACTA DE RECEPCIÓN, INFORMES 	10000	NÚMEROS DE OPERATIVOS REALIZADOS POR SET	t
75	14	FISCALIZAR Y CONTROLAR LOS TRIBUTOS ESTADALES 	OPERATIVOS DE FISCALIZACIÓN	EXPEDIENTES	985	NÚMEROS DE OPERATIVOS REALIZADOS POR SET	t
76	14	FOMENTAR LA CULTURA TRIBUTARIA 	OPERATIVOS DE DIVULGACIÓN	HOJAS DE ASISTENCIAS 	2766	NÚMEROS DE OPERATIVOS REALIZADOS POR SET	t
77	15	RECAUDACIÓN POR. INGRESOS TRIBUTARIOS	MONTO RECAUDADO	REPORTE DE RECAUDACIÓN 	10000	MONTO TOTAL RECAUDADO	t
78	15	VERIFICACIÓN DE LAS OBLIGACIONES TRIBUTARIA	FISCALIZACIONES 	EXPEDIENTES	985	FISCALIZACIONES REALIZADAS	t
79	15	EVACUAR CONSULTAS	RESOLUCIONES	INFORMES JURIDICOS	48	TOTAL DE PROCEDIMIENTOS EVACUADOS	t
80	15	FOMENTAR LA CULTURA TRIBUTARIA	DIVULGACIONES	TALLERES, OPERATIVOS, LISTADO DE VISITAS	2766	OPERATIVOS DE DIVULGACIONES REALIZADOS 	t
81	15	INFORMES ADMINISTRATIVO Y CONTABLES 	REPORTES	REPORTES FINANCIEROS	189	REPORTES ADMINISTRATIVOS CULMINADOS 	t
82	15	VERIFICAR EL CUMPLIMIENTO DE LAS NORMAS ESTABLECIDAS	AUDITORIAS	INFORMES DE AUDITORIAS 	186	TOTAL DE AUDITORIAS REALIZADAS	t
83	15	PLANIFICACIÓN Y SEGUIMIENTO DE LA GESTIÓN	SEGUIMIENTO	REPORTES DEL POA	78	TOTAL DE SEGUIMIENTO DE GESTIÓN 	t
84	15	SOPORTE Y APOYO TÉCNICO A LAS GERENCIAS Y OFICINAS	REPORTES	ACTIVIDADES REALIZADAS	36120	SOPOETES Y APOYO TÉCNICOS REALIZADOS 	t
85	16	REALIZAR OPERATIVO CARNAVAL	INSTALACIÓN DE PUESTOS	INFORMES	95	N° DE PUESTOS INSTALADOS	t
86	16	REALIZAR OPERATIVO SEMANA SANTA	INSTALACIÓN DE PUESTOS	INFORMES	95	N° DE PUESTOS INSTALADOS	t
87	16	REALIZAR OPERATIVO SAN JUAN	INSTALACIÓN DE PUESTOS	INFORMES	8	N° DE PUESTOS INSTALADOS	t
88	16	ATENDER Y PREVENIR EN ESPECTACULOS PÚBLICOS	INSTALACIÓN DE PUESTOS	INSFORMES	60	N° DE PUESTOS INSTALADOS	t
89	16	CAPACITAR A LAS COMUNIDADES	CURSOS,TALLERES,CHARLAS,SIMULACROS	REGISTRO DE ASISTENCIA	56	N° DE CURSOS,TALLERES,CHARLAS,SIMULACROS	t
90	16	CAPACITAR A LOS CENTROS EDUCATIVOS	CURSOS,TALLERES,CHARLAS,SIMULACROS	REGISTRO DE ASISTENCIA	40	N° DE CURSOS,TALLERES,CHARLAS,SIMULACROS	t
91	16	FORMAR A LOS FUNCIONARIOS DE PROTECCIÓN CIVIL	CURSOS, TALLERES, CHARLAS	REGISTRO DE ASISTENCIA	28	N° DE CURSOS,TALLERES, CHARLAS REALIZADO	t
92	16	FORMAR A LAS ORGANIZACIONES VOLUNTARIAS	CURSOS, TALLERES	REGISTRO DE ASISTENCIA	14	N° DE CURSOS,TALLERES REALIZADOS	t
93	16	REALIZAR MANTENIMIENTO A LA SEDE DE P. C.A.	MANTENIMIENTO A LA SEDE	INFORMES	4	N° DE MANTENIMIENTOS REALIZADOS	t
94	16	REALIZAR MANTENIMIENTO AL PARQUE AUTOMOTOR DE P.C.A.	REPARACIÓN Y MANTENIMIENTO	INFORMES	12	N° DE MANTENIMIENTOS REALIZADOS	t
95	16	REALIZAR MANTENIMIENTO AL SISTEMA DE COMUNICACIÓN DE	REPARACIÓN Y MANTENIMIENTO DE EQUIP	INFORMES	137	N° DE MANTENIMIENTOS O REPARACIONES REAL	t
96	16	BRINDAR ATENCIÓN A LOS USUARIOS SOBRE EVENTOS ADVERSOS 	USUARIO ATENDIDO	REGISTRO DE ATENCIÓN	10	N° DE PERSONAS ATENDIDAS	t
97	16	ADECUADO FUNCIONAMIENTO DE LA U.DE TECNOLOGÍA,INFORMACI	UNIDADES ATENDIDAS	INFORMES	282	N° DE UNIDADES ATENDIDAS	t
98	16	ATENDER Y MONITOREAR LAS SITUACIONES GENERADAS POR EVENTOS  	REPORTES	INFORMES, CONSTANCIAS, REPORTES	649	N° DE INFORMES,REPORTES Y CONSTANCIAS RE	t
99	17	REALIZAR OPERATIVO CARNAVALL	INSTALACIÓN DE PUESTOS	INFORMES	95	NO DE PUESTOS INSTALADOS	t
100	17	REALIZAR OPERATICO SEMANA SANTE	INSTALACIÒN DE PUESTO	INFORME	95	NO DE PUESTO INSTALADO	t
101	17	REALIZAR OPERATIVO SAN JUANN	INSTALACIÓN DE PUESTOS	INFORMES	8	NO DE PUESTOS INSTALADOS	t
102	17	ATENDER Y PREVENIR EN ESPECTACULOS PÚBLICOSS	INSTALACIÓN DE PUESTOS	INFORMES	60	NO DE PUESTOS INSTALADOS	t
103	17	CAPACITAR A LAS COMUNIDADESS	CURSOS,TALLERES,CHARLAS,SIMULACROS	REGISTRO DE ASISTENCIA	56	NO DE CURSOS,TALLERES,CHARLAS,SIMULACROS	t
104	18	PLANIFICAR Y COORDINAR EL PROGRAMA DE CAPACITACIÓN	N° CAPACITACIONES	INFORME DE CAPACITACIONES	12	NUMERO DE TALLERES REALIZADOS	t
105	18	SUPERVISAR LAS DIFERENTES UNIDADES EJECUTORAS DEL SERVICIO	N° SUPERVISIONES 	INFORMES DE SUPERVISION	121	NUMERO DE INFORMES DE SUPERVISIÓN PRESEN	t
106	18	FORTALECER EL PROGRAMA APOYO Y ORIENTACIÓN	NIÑOS NIÑAS Y ADOLESCENTES ASISTIDO	INFORMES DE GESTION	4081	CANTIDAD DE NIÑOS NIÑAS Y ADOLESCENTES A	t
107	18	FORTALECER EL PROGRAMA ABRIGO	NIÑOS  NIÑAS Y ADOLESCENTES ASIST.	INFORMES DE GESTIÓN	792	CANTIDAD DE NIÑOS NIÑAS Y ADOLESCENTES A	t
108	18	FORTALECER EL PROGRAMA SOCIO EDUCATIVO	ADOLESCENTES ASISTIDOS	INFORMES DE GESTIÓN	6180	CANTIDAD DE ADOLESCENTES ASISTIDOS	t
109	19	PROPORCIONAR LOS INSUMOS ALIMENTICIOS REQUERIDOS	N-E DE INSIMO ALIMENTICOS	NOTAS DE ENTREGAS RECIBIDAS	624	CANTIDAD DE INUSMOS ALIMENTICIOS DESPACH	t
110	19	COADYUDAR AL MANTENIMIENTO DE LOS CENTROS DE ATENCIÓN	N-E DE  MATERIALES DE LIMPIEZA	NOTAS DE ENTREGA RECIBIDA	12	CANTIDAD DE MATERIALES DE LIMPIEZA ENTRE	t
111	19	SUMINISTRAR DE LOS DEMAS MATERIALES Y SERVICIOS A LOS C/A	N-E DE MATERIAQLES Y SERVICIO	NOTAS DE ENTREGAS RECIBIDAS	12	CANTIDAD DE MATERIALES Y SERVICIOS SUMIN	t
112	20	CONSULTA MEDICA ESPECIALIZADAS A LOS ADULTOS MAYORES 	CONSULTAS	HOJA DE MORBILIDAD	25250	Nª DE ADULTOS MAYORES ATENDIDOS	t
113	20	SERVICIOS MEDICOS A LOS ADULTOS MAYORES	USUARIO	CUADERNO DE REGISTRO	19500	Nª DE USUARIOS ATENDIDOS	t
114	20	ATENCIÓN ASISTENCIAL RESIDENCIAL 	ATENCIONES 	HISTORIA CLINICA	44750	Nª DE ATENCIONES	t
115	20	ATENCION GERONTO-SOCIAL AL ADULTO MAYOR	ATENCIONES 	CUADERNO DE REGISTRO	21500	Nª DE ATENCIONES 	t
116	20	ATENCION GERONTO-SOCIAL AL ADULTO MAYORR	ATENCIONES 	CUADERNO DE REGISTRO	21500	Nª DE ATENCIONES 	t
117	20	 GARANTIZAR LA NUTRICION AL ADULTO MAYOR	PLATOS SERVIDOS	CUADERNO DE REGISTRO	17520	Nª DE PLATOS SERVIDOS	t
118	20	PROGRAMA ADA 	VISITAS DOMICILIARIAS 	CUADERNO DE REGISTRO	500	Nª DE VISITAS 	t
119	20	PROGRAMA GEROCENTRO	ACTIVIDADES	CUADERNO DE REGISTRO	960	Nª DE ACTIVIDADES	t
120	21	CONSULTAS MEDICAS Y ESPECIALIZADAS	CONSULTAS	HOJA DE MORBILIDAD	25250	N° DE ADULTOS MAYORES ATENDIDOS	t
121	21	SERVICIOS MEDICOS	USUARIOS	CUADERNO DE REGISTRO	19500	N° DE USUARIOS ATENDIDOS	t
122	21	ATENCION ASISTENCIAL RESIDENCIAL	ATENCIONES	HISTORIAS CLINICAS	44750	N° DE ATENCIONES	t
123	21	ATENCIÓN GERONTO-SOCIAL AL ADULTO MAYOR	ATENCIONES	CUADERNO DE REGISTRO	21500	N° DE ATENCIONES	t
124	21	GARANTIZAR LA NUTRICION AL ADULTO MAYOR	PLATOS SERVIDOS	CUADERNO DE REGISTRO	17520	CANTIDAD  DE PLATOS SERVIDOS	t
125	21	JORNADAS INTEGRALES 	ATENCIONES	CUADERNO DE REGISTRO	10000	Nª DE ATENCIONES	t
126	21	PROGRAMA ADA	VISITAS DOMICILIARIAS 	CUADERNO DE REGISTRO	500	Nª DE VISITAS REALIZADAS	t
127	21	PROGRAMA DE GEROCENTRO	ACTIVIDADES	CUADERNO DE REGISTRO	960	Nª DE ACTIVIDADES REALIZADAS	t
128	22	RECAUDAR EL RECURSO FINANCIERO POR LOS SERVICIOS PRESTADOS	RECAUDACIONES	TASA.FACTURA.TICKETS.COMPROBANTES	12000	CANTIDAD DE RECAUDACIONES EFECTUADAS	t
129	22	CONTROLAR EL MOV AERONAVES EN PLATAFORMA COMERCIAL	CONTROL AERONAVES	REPORTE DE MOV DIARIO DE AERONAVES	7500	MOVIMIENTO DE AERONAVES REGISTRADAS	t
130	22	PROMOCIÓN DE LA PARTICIPACIÓN CIUDADANA	EVENTOS PROMOCIONADOS	LISTADO DE ASISTENCIA	12	CANTIDAD DE EVENTOS PROMOCIONADOS	t
131	22	CONTROLAR EL INGR Y EGRE DE PASAJEROS DESDE Y HACIA EL TERMI	CONTROL PASAJEROS	GUIA DE MOV. DIARIO DE AERON Y PASAJE	14000	CANTIDAD DE PASAJEROS CHEQUEADOS	t
132	22	ATENCIÓN AL USUARIO	MEDIOS DE CAPTURA	ENCUESTAS EN PAPEL Y WEB	36	REGISTRO DE USUARIOS ENCUESTADOS	t
133	23	IMPULSAR ASAMBLEAS COMUNITARIAS	ASAMBLEAS	ACTAS Y REGISTRO DE ASISTENCIA	60	TOTAL DE ASAMBLEAS COMUNITARIAS IMPULSAD	t
134	23	ATENDER PERSONAS DE LAS DIFERENTES COMUNIDADES	PERSONAS	PLANILLA DE REGISTRO DE ATENCIONES	2500	Nº PERSONAS ATENDIDASDE LAS DIFERENTES C	t
135	23	REALIZAR REUNIONES COMUNITARIAS	REUNIONES	MINUTA DE LA REUNION	800	CANTIDAD DE REUNIONES COMUNITARIAS REALI	t
136	23	REALIZAR MESAS DE TRABAJO COMUNITARIAS	MESAS	MINUTA DE LA MESA	120	Nº DE MESAS DE TRABAJO COMUNITARIO REALI	t
137	23	IMPARTIR TALLERES DE FORMACIÓN INTEGRAL EN LAS COMUNIDADES	TALLERES	REGISTRO DE ASISTENCIA	120	Nº DE TALLERES DE FORMACION INTEGRAL IMP	t
138	24	IMPULSAR  ASAMBLEAS COMUNITARIAS	ASAMBLEAS	ACTAS Y REGISTRO DE ASISTENCIA	60	TOTAL DE ASAMBLEAS COMUNITARIAS IMPULSAD	t
139	24	ATENDER PERSONAS DE LAS DIFERENTES  COMUNIDADES	BENEFICIARIOS	PLANILLA DE REGISTRO DE ATENCIONES	2500	PERSONAS ATENDIDAS DE LAS DIFERENTES COM	t
140	24	REALIZAR REUNIONES  COMUNITARIAS	REUNIONES	MINUTA DE LA REUNION	800	REUNIONES COMUNITARIAS REALIZADAS	t
141	24	REALIZAR MESAS DE TRABAJO  COMUNITARIAS	MESAS DE TRABAJO	MINUTA DE LA MESA	120	MESAS DE TRABAJO COMUNITARIO REALIZADAS	t
142	24	ASESORAR INTEGRALMENTE A LAS DIFERENTES COMUNIDADES	ASESORIAS	MINUTA DE LA ASESORIA	240	ASESORIAS INTEGRALES REALIZADASA LAS COM	t
143	24	IMPARTIR TALLERES DE FORMACIÓN  INTEGRAL EN LAS COMUNIDADES	TALLERES	REGISTRO DE ASISTENCIA	120	TALLERES DE FORMACION INTEGRAL IMPARTIDO	t
144	24	ACOMPAÑAR CONSEJOS COMUNALES EN DIFERENTES ACTIVIDADES	ACOMPAÑAMIENTOS	MINUTA DE ACOMPAÑAMIENTOS	1200	ACOMPAÑAMIENTOS A CONSEJOS COMUNALES REA	t
145	24	REALIZAR ABORDAJES COMUNITARIOS	ABORDAJES	INFORMES	12	ABORDAJES REALIZADOS EN LAS COMUNIDADES	t
146	24	CARACTERIZAR A LOS CONSEJOS COMUNALES	CARACTERIZACIONES	PLANILLAS DE CARACTERIZACION	300	CARACTERIZACIONES REALIZADAS EN LAS COMU	t
147	24	APLICAR Y SISTEMATIZAR CENSO DEMOGRAFICO COMUNITARIO	CENSO	PLANILLAS DE CENSO	600	APLICACION DE CENSOS REALIZADOS EN LAS C	t
148	25	VERIFICAR EL CUMPLIMIENTO DE LAS POLITICAS DE USO RACIONAL D	INSPECCIÓN A LAS U.T.P.	INFORME TRIMESTRAL	24	N° DE INSPECCIONES REALIZADAS	t
149	25	VISITAR E INSPECCIONAR LAS OBRAS RELACIONAS A LOS PROYECTOS 	INSPECCIONES	INFORME TRIMESTRAL	24	N° DE INSPECCIONES REALIZADAS	t
150	25	ELABORAR Y PRESENTAR EL PLAN OPERATIVO ANUAL	MESA DE TRABAJO	P.O.A.	3	N° MESAS DE TRABAJO	t
151	26	ESTABLECIMIENTO DE ALIANZAS ESTRATÉGICAS	REUNIONES	ALIANZAS, MINUTAS, INFORMES, CONVENIOS	12	N° DE REUNIONES PROGRAMADAS	t
152	26	EJECUTAR PROGRAMAS DE CAPACITACIÓN Y FORMACIÓN EN GÉNERO	PROGRAMAS DE CAPACITACIÓN	TALLERES, DIPLOMADOS, CURSOS, LISTADOS	12	N° DE PROGRAMAS REALIZADOS	t
153	26	IMPULSAR CRACIÓN DE LEYES, REFORMAS CON PERSPECTIVA DEGÉNERO	ASAMBLEAS DE CIUDADANAS	ACTAS, MINUTAS, INFORMES, LISTADO	4	N° DE ASAMBLEAS REALIZADAS	t
154	26	DESARROLLAR POLÍTICAS PÚB EN ATENCIÓN INTEGRAL A LA LMUJER	PROGRAMA DE ATENCIÓN INTEGRAL	MINUTA, ARTICULACIONES, JORNADSA, LISTAS	12	N° DE PROGRAMAS REALIZADOS	t
155	26	CONTROL, SEGUIMIENTO POLÍT PÚB REGIONAL, MUNICIP EN GÉNERO	REUNIONES	MINUTAS, INFORMES	12	N° DE REUNIONES PROGRAMADAS	t
156	27	 IMPULSAR CRACIÓN DE LEYES, REFORMAS DE GÉNERO.	LEYES	DOCUMENTOS LEY,ACTAS.	4	N° DE LEYES  REALIZADAS	t
157	27	EJECUTAR PROGRAMAS DE CAPACITACIÓN 	CAPACITACIONES	REGISTROS DE ASISTENCIAS	12	CANTIDAD DE CAPACITACIONES REALIZADAS	t
158	27	DESARROLLAR POLÍTICAS PÚB EN ATENCIÓN INTEGRAL A LA MUJER	PROGRAMAS	INFORMES DE GESTION	12	N° DE PROGRAMAS REALIZADOS	t
159	27	ESTABLECIMIENTO DE ALIANZAS  ESTRATÉGICAS	REUNIONES	REGISTROS DE ASISTENCIAS	12	N° DE REUNIONES PROGRAMADAS	t
160	28	SEGUIMIENTO Y CONTROL DE PROYECTOS EN EJECUCION 	INFORMES	AVANCE DE OBRAS	4	INFORMES	t
161	28	SUPERVISION Y CONTROL DE CONSULTAS DE ATENCION INTEGRAL	CONSULTAS	SISOCUATRO-MOVIMIENTO HOSPITALARIO	30577	Nº DE CONSUTAS REALIZADAS	t
162	28	SEGUIMIENTO Y CONTROL DE LUCHA CONTRA EL DENGUE,CHIKUNGUNYA	FUMIGACIONES	CONTRO DE FAUNA NOCIVA	43579	CANTIDAD DE FUMIGACIONES REALIZADAS	t
163	28	PLANIFICAR, SUPERVISAR Y CONTROLAR LAS JORNADAS DE SUALUD	JORNADAS  	INFORMES	1552	Nº DE JORNADAS REALIZADAS	t
164	29	SEGUIMIENTO Y CONTROL DE PROYECTOS EN  EJECUCION 	INFORMES	AVANCE DE OBRAS	4	Nº DE INFORMES	t
165	30	OTORGAR AYUDAS ECONÓMICAS PERMANENTES	AYUDAS ECONÓMICAS PERMANENTES	FORMATOS, NÓMINAS, ÓRDENES DE PAGO	1500	N° DE BENEFICIARIOS	t
166	30	OTORGAR AYUDAS SOCIALES NO PERMANENTES 	AYUDAS SOCIALES NO PERMANENTES	FORMATOS ESTADÍSTICOS, REGISTROS 	50	N° DE AYUDAS SOCIALES	t
167	30	ACOMPAÑAMIENTO PARA LA CALIFICACIÒN Y CERTIFICACIÓN A PCD	PERSONAS CALIFICADAS Y CERTIFICADAS	REPORTES ESTADÍSTICOS, FOTOS	7700	N° DE PERSONAS  ASISTIDAS	t
168	30	FORMACIÓN A PERSONAS CON DISCAPACIDAD Y PERSONAL TÈCNICO	 PERSONAS FORMADAS	LISTAS DE ASISTENCIA, FOTOS, REPORTES	1500	Nº DE PERSONAS FORMADAS	t
169	30	 ARTICULACIÓN INTERINSTITUCIONAL PARA GESTIONAR AYUDAS	AYUDAS SOCIALES CANALIZADAS	REPORTES ESTADÌSTICOS, FOTOS	5000	Nª DE AYUDAS 	t
170	30	ABORDAJES A PERSONAS EN SITUACIÓN DE VULNERABILIDAD SOCIAL	AYUDAS SOCIALES CANALIZADAS	REPORTES ESTADÌSTICOS, FOTOS	5000	Nª DE AYUDAS 	t
171	30	PROMOVER JORNADAS PREVENTIVAS INTEGRAL COMUNITARIAS	JORNADAS COMUNITARIAS	REPORTES ESTADÍSTICOS, FOTOS	8	Nº DE JORNADAS	t
172	30	REALIZAR JORNADAS FORMATIVAS INTEGRALES	JORNADAS  FORMATIVAS	LISTA DE ASISTENCIA, FOTOS	4	Nº DE JORNADAS	t
173	31	OTORGAR AYUDAS ECONÓMICAS  PERMANENTES	AYUDAS ECONÓMICAS PERMANENTES	FORMATOS, NÓMINAS, ÓRDENES DE PAGO	1500	Nª DE BENEFICIARIOS	t
174	31	OTORGAR AYUDAS SOCIALES NO PERMANENTES	AYUDAS SOCIALES NO PERMANENTES	FORMATOS ESTADÍSTICOS, REGISTROS	50	Nª DE AYUDAS SOCIALES	t
175	31	ACOMPAÑAMIENTO PARA LA  CALIFICACIÒN Y CERTIFICACIÓN A PCD	PERSONAS CALIFICADAS Y CERTIFICADAS	REPORTES ESTADÍSTICAS, FOTOS	7700	Nª DE PERSONAS ASISTIDAS	t
176	31	FORMACIÓN A PERSONAS CON DISCAPACIDAD Y PERSONAL TÉCNICO	PERSONAS FORMADAS	 LISTA DE ASISTENCIA, FOTOS, REPORTES	1500	Nº DE PERSONAS FORMADAS	t
177	31	ARTICULACIÓN INTERINSTITUCIONAL PARA GESTIONAR AYUDAS	AYUDAS SOCIALES CANALIZADAS	REPORTES ESTADÍSTICAS, FOTOS	1500	Nº DE AYUDAS CANALIZADAS	t
178	31	ABORDAJES A PERSONAS  EN SITUACIÓN DE VULNERABILIDAD SOCIAL	ABORDAJES REALIZADOS	REPORTES ESTADÍSTICAS, FOTOS	4	Nº DE ABORDAJES	t
179	31	PROMOVER JORNADAS PREVENTIVAS INTEGRAL  COMUNITARIAS	JORNADAS COMUNITARIAS	REPORTES ESTADÍSTICAS, FOTOS	8	Nº DE JORNADAS	t
180	31	REALIZAR JORNADAS FORMATIVAS  INTEGRALES	JORNADAS FORMATIVAS	LISTAS DE ASISTENCIA, FOTOS	4	Nº DE JORNADAS	t
181	32	REALIZAR TALLERES EN COMUNIDADES 	TALLERES REALIZADOS	LISTA DE ASISTENCIAS	3	CANTIDAD DE TALLER RAELIZADOS	t
182	32	REALIZAR INSPECCIONES EN COMUNIDADES	INSPECCIONES REALIZADAS	FICHA DE INSPECCION O INFORME	64	CANTIDAD DE INSPECCIONES REALIZADAS	t
183	32	JORNADAS DE REFORESTACION	JORNADAS REALIZADAS	MEMORIA FOTOGRAFICA	3	NUMERO DE JORNADAS	t
184	32	REUNIONES Y EVENTOS EN COMUNIDADES	REUNIONES REALIZADAS	LISTA DE ASISTENCIA	61	CANTIDAD DE REUNIONES Y EVENTOS	t
185	32	REALIZAR INSPECCIONES DE DENUNCIAS DE CONTAMINACION	INSPECCIONES REALIZADAS	FICHA DE INSPECCIONES	12	CANTIDAD DE INSPECCIONES REALIZADAS	t
186	32	GESTION DE SOLICITUD Y GESTION DEL TERRITORIO	REVISIONES REALIZADAS	INFORMES	22	CANTIDAD DE SOLICITUDES	t
187	32	CURSO DE CONTRALORIA AMBIENTAL	TALLERES REALIZADOS	LISTA DE ASISTENCIA	6	CANTIDAD DE REALIZADOS  CURSO PROGRAMAD	t
188	32	MESAS AMBIENTALES 	MESAS REALIZADAS	INFORME IMPRESO	10	CANTIDAD DE MESAS AMBIENTALES	t
189	32	FOROS DE EDUCACION AMBIENTAL	FOROS REALIZADOS 	FICHAS O INFORME	6	CANTIDAD DE FOROS	t
190	32	TALLERES SOCIO-AMBIENTAL DE EDUCACION	TALLERES REALIZADOS	LISTA DE ASISTENCIA	12	CANTIDAD DE TALLERES REALIZADOS O PROG	t
191	32	ACTIVIDAD PARTICIPATIVA (VIDEOS, CHARLAS, EVENTOS, OTROS)	FICHA DE ACTIVIDADES	FICHAS O INFORME	10	CANTIDAD REALIZADAS  CANTIDAD PROGRAMAD	t
192	32	ELABORACION DE MAPAS	MAPA DIGITAL	ARCHIVOS DIGITALES	3	MAPA PLANIFICADO MAPA ELABORADO	t
193	32	PUBLICAR CAPAS ABRAE	CAPAS SHAPEFILE	ARCHIVOS DIGITALES	3	PUBLICACION PLANIFACADA  PUBLICACION EL	t
194	33	REALIZAR TALLERES EN COMUNIDADES	INSPECCIONES REALIZADAS	FICHA DE INSPECCION O INFORME	64	CANTIDAD DE INSPECCIONES REAKIZADAS	t
195	33	REUNIONES Y EVENTOS  EN COMUNIDADES	REUNIONES REALIZADAS	LISTA DE ASISITENCIA	61	CANTIDAD DE REUNIONES	t
196	33	GESTION DE SOLICITUD Y GESTION DEL  TERRITORIO	REVISIONES REALIZADAS	INFORMES	22	CANTIDAD DE SOLICITUDES	t
197	33	TALLERES SOCIO- AMBIENTAL DE EDUCACION	TALLERES REALIZADOS	LISTA DE ASISTENCIA	12	CANTIDAD DE TALLERES REALIZADOS Y PROG	t
198	33	REALIZAR INSPECCIONES  DE DENUNCIAS DE CONTAMINACION	INSPECCIONES REALIZADAS	FICHAS DE INSPECCIONES	12	CANTIDAD DE INSPECCIONES REALIZADAS	t
199	33	MESAS AMBIENTALES	MESAS REALIZADAS	INFORME IMPRESO	10	CANTIDAD DE MESAS AMBIENTALES	t
200	33	ACTIVIDAD PARTICIPATIVA (VIDEOS, CHARLAS, EVENTOS , OTROS)	FICHAS DE ACTIVIDADES	FICHAS O INFORME	10	CANTIDAD REALIZADAS  CANTIDAD PROGRAMAD	t
201	33	CURSO DE CONTRALORIA   AMBIENTAL	FICHAS DE ACTIVIDADES	LISTA DE ASISTENCIA	6	CANTIDAD DE REALIZADAS  CURSO PROGRAMAD	t
202	33	FOROS DE EDUCACION  AMBIENTAL	LISTA DE ASISTENCIA	FICHAS O INFORME	6	CANTIDAD DE FOROS	t
203	33	JORNADAS DE  REFORESTACION	JORNADAS REALIZADAS	MEMORIA FOTOGRAFICA	3	NUMERO DE JORNADAS	t
204	33	REALIZAR TALLERES  EN COMUNIDADES	TALLERES REALIZADOS	LISTA DE ASISTENCIA	3	CANTIDAD DE TALLER REALIZADOS	t
205	33	ELABORACION  DE MAPAS	MAPA DIGITAL	ARCHIVOS DIGITALES	3	MAPA PLANIFICADO  MAPA ELEBORADO	t
206	33	PUBLICAR  CAPAS ABRAE	CAPAS SHAPEFILE	ARCHIVOS DIGITALES	3	PUBLICACION PLANIFICADA  ELABORADA	t
207	34	INSPECCIONES A LOS ORGANISMOS ADSCRITOS	INSPECCIONES	ACTAS DE SUPERVISIÓN	60	NUMERO DE INSPECCIONES	t
208	34	SUPERVICIONES A OPERATIVOS DE TEMPORADAS	INSPECCIONES	ACTAS DE SUPERVISION	40	NÚMERO DE INSPECCIONES	t
209	34	SEGUIMIENTO A LOS INDICES DE INCIDENCIA SINIESTRAL 	INFORMES	INFORMES	24	NUMERO DE INFORMES DE INCIDENCIA	t
210	34	SEGUIMIENTO A LOS INDICES DE INCIDENCIAS DELICTIVA	INFORMES	INFORMES	48	NUMERO DE INFORMES DE INCIDENCIA	t
211	34	ACTUACIONES DEL GABINETE DE PREVENCIÓN 	REUNIONES	LISTADO DE ASISTENCIA	24	NUMERO DE REUNIONES	t
212	34	CONTROL Y SEGUIMIENTO A ORGANISMOS ADSCRITOS  	REUNIONES	LISTADO DE ASISTENCIA	4	NUMERO DE REUNIONES	t
213	34	ATENCION AL CIUDADANO MEDIANTE DENUNCIAS	DENUNCIAS	LISTADO DE PARTICIPANTES	150	NUMERO DE DENUNCIAS	t
214	34	 OPERATIVOS DE CONTROL Y SUPERVISIÓN DE LICORERÍAS	OPERATIVOS	ACTAS DE CIERRE DE OPERATIVOS	600	NUMEROS DE ACTA DE CIERRE	t
215	34	SUPERVISIONES A LAS DIFERENTES PREFECTURAS DEL ESTADO  	VISITAS	ACTAS DE VISITAS	12	NUMEROS DE ACTAS DE VISITA	t
216	34	ACTIVIDADES DE CAPACITACIÓN PARA LOS PREFECTOS O PERSONAL 	ACTIVIDADES	LISTADO DE ASISTENCIA	5	Nº DE CAPACITACIONES REALIZADAS 	t
217	34	OTORGAMIENTO DE CONSTANCIAS, PERMISOS Y AUTORIZACIONES	CONSTANCIAS,PERMISOS, AUTORIZACION	SOPORTE DE LIBRO	10000	NUMEROS DE CONSTANCIAS,PERMISOS, AUTORIZ	t
218	34	PARTICIPACION DE LOS PREFECTOS EN ACCIONES COMUNITARIAS	ACCIONES	ACTAS	220	N º DE ACCIONES COMUNITARIAS REALIZADAS	t
219	34	OPERATIVOS DE PROFILAXIA	OPERATIVOS	ACTAS DE CIERRE DE OPERATIVO	8	NUMEROS DE ACTAS DE CIERRE	t
220	34	OPERATIVOS  DE PROFILAXIA	OPERATIVOS	ACTAS DE CIERRE DE OPERATIVO	8	NUMEROS DE ACTAS DE CIERRE	t
221	34	CONTROL SANITARIO A LAS MERETRICES	VISITAS	LISTADO DE ASISTENCIA	390	Nº DE VISITAS REALIZADASDE VISITAS	t
222	35	INSPECCIONES A LOS  ORGANISMOS ADSCRITOS	INSPECCIONES	ACTAS DE SUPERVISIÓN	60	Nº DE INSPECCIONES REALIZADAS	t
223	35	SUPERVISIONES A OPERATIVOS DE TEMPORADAS	INSPECCIONES	ACTAS DE SUPERVISIÓN	40	Nº DE SUPERVISIONES REALIZADAS	t
224	35	SEGUIMIENTO A LOS ÍNDICES DE INCIDENCIA SINIESTRAL	INFORMES	INFORMES	24	Nº DE INFORMES DE INCIDENCIA	t
225	35	SEGUIMIENTO A LOS ÍNDICES DE INCIDENCIAS DELICTIVA	DENUNCIAS	LISTADO DE PARTICIPANTES	48	Nº DE INFORMES DE INCIDENCIA	t
226	35	ACTUACIONES DEL GABINETE DE PREVENCIÓN	REUNIONES	LISTADO DE ASISTENCIA	24	Nº DE REUNIONES REALIZADAS	t
227	35	CONTROL Y SEGUIMIENTO A ORGANISMOS ADSCRITOS	REUNIONES	LISTADO DE ASISTENCIA	4	Nº DE REUNIONES REALIZADAS	t
228	35	ATENCIÓN AL CIUDADANO MEDIANTE DENUNCIAS	DENUNCIAS	LISTADO DE PARTICIPANTES	150	Nº DE DENUNCIAS RECIBIDAS	t
229	35	OPERATIVOS DE CONTROL Y SUPERVISIÓN DE LICORERÍAS	OPERATIVOS	ACTAS DE CIERRE DE OPERATIVOS	600	Nº DE ACTAS DE CIERRE	t
230	35	SUPERVISIONES A LAS DIFERENTES PREFECTURAS DEL ESTADO	VISITAS	ACTAS DE VISITA	12	Nº DE VISITAS REALIZADAS	t
231	35	ACTIVIDADES DE CAPACITACIÓN PARA LOS PREFECTOS Y PERSONAL	ACTIVIDADES	LISTADO DE ASISTENCIA 	5	Nº DE CAPACITACIONES REALIZADAS	t
232	35	OTORGAMIENTO DE CONSTANCIAS , PERMISOS Y AUTORIZACIONES	CONSTANCIAS.  PERMISOS.  AUTORIZACIÓN	SOPORTE	10000	Nº DE CONSTANCIAS, PERMISOS Y AUTORIZACI	t
233	35	PARTICIPACIÓN DE LOS PREFECTOS EN ACCIONES COMUNITARIAS	ACCIONES 	ACTAS	220	Nº DE ACCIONES COMUNITARIAS REALIZADAS	t
234	36	ELABORAR EL INFORME DE GESTIÓN DEL GOBERNADOR AÑO 2015	INFORME	DOCUMENTO 	1	DOCUMENTO MEMORIA Y CUENTA	t
235	36	REALIZAR EL AJUSTE DE LAS METAS FÍSICAS DEL POAE 2016	PLANES OPERATIVOS INSTITUCIONALES	FICHA DE REGISTRO EN EL SISTEMA 	62	PLANES OPERATIVOS AJUSTADOS	t
236	36	ELABORAR EL PLAN OPERATIVO ESTADAL DEL EJERCICIO FISCAL 2016	PLANES OPERATIVOS INSTITUCIONALES	FICHA EN EL REGISTRO DE SISTEMAS 	1	DOCUMENTOS POAE	t
237	36	HACER SEGUIMIENTO  DEL POAE ARMONIZÁNDOLO CON EL PRESUPUESTO	INFORME DE SEGUIMIENTO POAE 	FICHA EN EL REGISTRO DE SISTEMAS 	12	INFORME DE SEGUIMIENTO POAE	t
238	36	ASESORAR EN MATERIA DE PLANIFICACIÓN  LOS ORGANISMOS DEL GBA	ASESORÍAS	MINUTAS DE ASESORÍAS	62	ORGANISMOS ASISTENTES	t
239	36	ELABORAR EL ANTEPROYECTO DEL POAE 2017 	DOCUMENTO  DEL ANTEPROYECTO DEL POA	FICHAS DEL SISTEMA	1	  DOCUMENTO ANTEPROYECTO DEL POAE  	t
240	36	DISEÑAR LOS SISTEMAS DE PLANIFICACIÓN, PRESUPUESTO Y CONTROL	SISTEMA 	 PLANTILLA DE DISEÑO 	1	SISTEMA DESARROLLADO	t
241	29	SUPERVISION Y CONTROL DE CONSULTAS DE  ATENCION INTEGRAL	CONSULTAS	MOVIMIENTO HOSPITALARIO	30577	Nº DE CONSUTAS REALIZADAS	t
242	29	SIS04/MOVIMIENTO HOSPITALARIO	FUMIGACIONES	CONTRO DE FAUNA NOCIVA	43579	CANTIDAD DE FUMIGACIONES REALIZADAS	t
243	29	PLANIFICAR, SUPERVISAR  Y CONTROLAR LAS JORNADAS DE SUALUD	JORNADAS  	INFORMES	1552	Nº DE JORNADAS REALIZADAS	t
244	37	ELABORAR EL INFORME DE GESTIÓN 2016	INFORME	DOCUMENTO 	1	DOCUMENTO MEMORIA Y CUENTA	t
245	37	REALIZAR EL AJUSTE DE LAS METAS POAE 2016	PLANES OPERATIVOS INSTITUCIONALES	FICHA DE REGISTRO EN EL SISTEMA 	62	PLANES OPERATIVOS AJUSTADOS	t
246	37	ELABORAR EL PLAN OPERATIVO ESTADAL  DEL EJERCICIO FISCAL 2016	PLANES OPERATIVOS INSTITUCIONALES	FICHA DE REGISTRO EN EL SISTEMA 	1	DOCUMENTO POAE	t
247	37	HACER SEGUIMIENTO  DEL POAE, ARMONIZÁNDOLO CON EL PRESUPUEST	INFORME DE SEGUIMIENTO POAE 	FICHA DE REGISTRO EN EL SISTEMA 	12	INFORME DE SEGUIMIENTO POAE	t
248	37	ASESORAR EN MATERIA DE PLANIFICACIÓN  LOS ORGANISMOS GBA	ASESORÍAS	MINUTAS DE ASESORÍAS	62	ASESORÍAS REALIZADAS	t
249	37	REALIZAR JORNADAS SOBRE LOS LINEAMIENTOS PARA LA FORMULACIÓN	ORGANISMOS CONVOCADOS	MINUTAS DE ASESORÍAS	62	ORGANISMOS ASISTENTES	t
250	37	REVISAR LOS  PLANES OPERATIVOS INSTITUCIONALES GBA	PLANES OPERATIVOS INSTITUCIONALES	REGISTRO DE OBSERVACIÓN DEL SISTEMA 	62	PLANES OPERATIVO REVISADOS	t
251	37	ELABORAR EL ANTEPROYECTO DEL POAE 2017 DEL GBA	DOCUMENTO  DEL ANTEPROYECTO DEL POA	FICHAS DEL SISTEMA	1	DOCUMENTO ANTEPROYECTO DEL POAE  	t
252	37	DISEÑAR LOS SISTEMAS DE PLANIFICACIÓN , PRESUPUESTO Y CONTROL	SISTEMA 	PLANTILLA DE DISEÑO 	1	SISTEMA DESARROLLADO	t
253	37	COMPILAR LAS OPERACIONES ESTADÍSTICAS 	CUADROS ESTADÍSTICOS	INFORME DE ESTADÍSTICAS	100	OPERACIONES ESTADÍSTICAS PROCESADAS 	t
254	37	TRAMITAR LOS CRÉDITOS ADICIONALES	CRÉDITOS ADICIONALES	REPORTE DE CRÉDITOS ADICIONALES	160	MODIFICACIONES PRESUPUESTARIAS REALIZADA	t
255	37	TRAMITAR LOS CRÉDITOS  ADICIONALES	CRÉDITOS ADICIONALES	REPORTE DE CRÉDITOS ADICIONALES	160	CRÉDITOS ADICIONALES PROCESADOS	t
256	37	TRAMITAR  LOS CRÉDITOS  ADICIONALES	CRÉDITOS ADICIONALES	REPORTE DE CRÉDITOS ADICIONALES	160	CRÉDITOS ADICIONALES PROCESADOS	t
257	37	PROCESAR LAS MODIFICACIONES PRESUPUESTARIAS 	MODIFICACIONES PRESUPUESTARIAS	REPORTE DEL SISTEMA	280	MODIFICACIONES PRESUPUESTARIAS REALIZADA	t
258	37	SEGUIMIENTO DE LA EJECUCIÓN PRESUPUESTARIA DE LOS ENTES 	DOCUMENTO DEL PROYECTO	FICHAS DE ACCIÓN CENTRALIZADAS	300	DOCUMENTO DEL PROYECTO DE  LEY DE PRESUP	t
259	38	REDACTAR DOCUMENTOS LEGALES 	DOCUEMNTOS LEGALES 	DOCUMENTO ORIGINAL COPIA FOTOSTAICA	32	N° DE DOCUMENTOS LEGALES 	t
260	38	ASISTIR AL REGISTRO MERCANTIL A PROTOCOLIZAR DOCUMENTOS 	REUNIONES REALIZADAS 	INFORMES DE VISITAS	21	N° DE REUNIONES REALIZADAS	t
261	38	PRESTAR ASESORIAS JURIDOCAS A LOS ARAGUEÑOS 	ASESORIAS REALIZADAS	REGISTRO DE ASESORIAS	57	N° DE ASESORIAS	t
262	38	REDACCION DE OTROS DOCUMENTOS DE CARACTER LEGAL	DOCUMENTOS DE CARACTER LEGAL 	RESPALDO FISICO .DIGITAL	34	N° DE DOCUMENTOS REALIZADOS	t
263	38	DESARROLLAR PROPUESTAS DE ASOCIACIONES PRODUCTIVAS 	PROPUESTAS DESARROLLADAS 	REGISTRO FISICO.DIGITAL	18	N° DE PROPUESTAS DESARROLLADAS 	t
264	38	FOMENTAR ALIANZAS ESTRATEGICAS ENTRE EL S. PUBLICO Y PRIVADO	ENLACES FORMALIZADOS 	REGISTRO FISICO. DIGITAL	14	N° DE ENLACES FORMALIZADOS 	t
265	38	ESTABLECER METODOS DE CONTROL Y SEGUIMIENTO A LAS EMPRESAS 	SEGUIMIENTOS REALIZADOS 	INFORMES DE SEGUIMIENTOS 	42	N° DE SEGUIMIENTOS REALIZADOS 	t
266	38	IDENTIFICAR EL POTENCIAL DE ENCADENAMIENTO PRODUCTIVO 	EMPRESAS EVALUADAS 	INSTRUMENTOS APLICADOS	34	N° DE EMPRESAS EVALUADAS	t
267	38	CONFORMACION DE CADENAS LOCALES 	REUNIONES 	REGISTRO DE ASISTENCIA 	22	N° DE REUNIONES REALIZADAS	t
268	38	ACOMPAÑAMIENTO INTEGRAL A FONDESA 	ACOMPAÑAMIENTOS REALIZADOS 	INFORME DE SEGUIMIENTO	46	N° DE INFORMES PRESENTADOS 	t
269	38	PROMOCION Y DESARROLLO DE ESTRATEGIAS DE COMERCIALIZACION 	EVENTOS 	MEMORIA FOTOGRAFICA	26	N° DE EVENTOS REALIZADOS 	t
270	38	ASESORIAS ECONOMICAS TECNICAS Y FINACIERAS DE PROYECTO	ASESORIAS REALIZADAS 	REGISTRO DE ASISTENCIA 	50	N° DE ASESORIAS REALIZADAS 	t
271	38	ESTUDIOS TECNICOS E INSPECCIONES DE INGENIERIA 	ESTUDIOS REALIZADOS 	INFORMES TECNICOS	30	N° DE INFORMES TECNICOS 	t
272	38	SEGUIMIENTO DE LOS PROYECTOS PLANIFICADOS Y EJECUTADOS 	SEGUIMIENTOS REALIZADOS 	INFORMES TECNICOS	30	N° DE SEGUMIENTOS REALIZADOS 	t
273	38	SEGUIMIENTO DE LOS PROYECTOS  PLANIFICADOS Y EJECUTADOS 	SEGUIMIENTO DE LOS PROYECTOS PLANIFICADO	INFORMES DE SEGUIMIENTO	66	N° DE SEGUMIENTOS REALIZADOS 	t
274	38	INFORMES DE SEGUIMIENTO0	INFORMES REALIZADOS 	REGISTRO FISICO DIGITAL	14	N° DE INFORMES REALIZADOS 	t
275	39	CONSTRUCCION Y PUESTA EN MARCHA DE LA EMPRESA ARACAFE S.A	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
276	39	CONSTRUCCION Y PUESTA EN MARCHA DE FABRICA DE HELADOS 4F 	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
277	39	INSTALACION Y PUESTA EN MARCHA  PROVEEDURIA DE LOS PESCADORE	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
278	39	REHABILITACION Y ADECUACION DE EMPRESA MIXTA COLORES ARAGUA 	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
279	39	SEGUIMIENTO CONSTRUCCION DEL PASEO ARTESANAL MAGDALENO 	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
280	39	SEGUIMIENTO INSTALACION DELA EMPRESA DE PRODUCCION SOCIAL CH	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
281	39	SEGUIMIENTO DE INSTALACION Y PUESTA EN MARCHA DE LA EMPRESA 	AVANCE DE PROYECTO	INFORMES, FOTOGRAFIAS	4	PROYECTO REALIZADO	t
282	40	ELABORAR OBSERVACIONES A LAS ACTIVIDADES DE LA SECRETARIA	OBSERVACIONES	INFORMES  DE OBSERVACIONES 	40	NÚMERO DE OBSERVACIONES REALIZADAS 	t
283	40	COORDINACION DE PLANES Y PROGRAMAS DE LA FATVA	PLANES Y PROGRAMAS	INFORMES, FOTOGRAFÍA Y VIDEOS 	12	N°. DE PLANES Y PROGRAMAS COORDINADOS	t
284	40	REALIZAR REUNIONES INSTITUCIONALES EN PREVENCION Y SEGURIDAD	REUNIONES 	ASISTENCIAS  Y ACUERDOS	16	NÚMERO DE REUNIONES REALIZADAS	t
285	42	ELABORAR OBSERVACIONES A LAS  ACTIVIDADES DE LA SECRETARIA	OBSERVACIONES	INFORMES  DE OBSERVACIONES 	40	NÚMERO DE OBSERVACIONES REALIZADAS 	t
286	42	COORDINACION  DE PLANES Y PROGRAMAS DE LA FATVA	PLANES Y PROGRAMAS	INFORMES, FOTOGRAFÍA Y VIDEOS 	12	N°. DE PLANES Y PROGRAMAS COORDINADOS	t
287	42	REALIZAR REUNIONES INSTITUCIONALES EN  PREVENCION Y SEGURIDAD	REUNIONES 	ASISTENCIAS  Y ACUERDOS	16	NÚMERO DE REUNIONES REALIZADAS	t
288	43	DESARROLLAR TALENTOS JUVENILES EN EL ÁREA CULTURAL	FORMACIÓN	INFORME DE GESTIÓN  	4000	N° DE PERSONAS BENEFICIADAS	t
289	43	CAPACITACIÓN A COLECTIVOS EN EL ÁREA DE INFORMÁTICA	FORMACIÓN	INFORME DE GESTIÓN  	5000	N° DE PERSONAS BENEFICIADAS	t
290	43	ISEÑAR PLANES DE SALUD PARA EL COLECTIVO	COLECTIVO ASISTIDO	INFORME DE GESTIÓN  	4500	N° DE PERSONAS BENEFICIADAS	t
291	43	APOYAR LOS COLECTIVOS ESTUDIANTES EN ACTIVIDADES DEPORTIVAS	ACTIVIDAD DEPORTIVA	INFORME DE GESTIÓN  	6000	CANTIDAD DE ESTUDIANTES BENEFICIADOS	t
292	43	ULSAR LA PARTICIPACIÓN JUVENIL EN ARAGUA	TALLER APOYO	INFORME DE GESTIÓN  	7500	N° DE PERSONAS BENEFICIADAS	t
293	44	ELABORAR OBSERVACIONES A LAS ACTIVIDADES DE LA SECRETARIA 	OBSERVACIONES	INFORMES  DE LAS OBSERVACIONES 	40	NÚMERO DE OBSERVACIONES REALIZADAS 	t
294	44	COORDINACIÓN DE PLANES Y PROGRAMAS DE FATVA	PLANES Y PROGRAMAS	INFORMES, FOTOGRAFIAS Y VIDEOS	12	N°. DE PLANES Y PROGRAMAS COORDINADOS	t
295	44	REALIZAR REUNIONES  INSTITUCIONALE EN PREVENCIÓN Y SEGURIDAD	REUNIONES 	ASISTENCIAS Y ACUERDOS	16	NÚMERO DE REUNIONES REALIZADAS	t
296	46	REALIZAR INSPECCIONES DE OBRAS Y DEL PATRIMONIO	INSPECCIONES	FICHAS TECNICAS E INFORMES	177	N° DE INSPECCIONES 	t
297	46	REVISION Y SEGUIMIENTO DE VALUACIONES 	ACTIVIDADES	FICHAS TECNICAS E INFORMES	22	CANTIDAD DE ACTIVIDADES REALIZADAS	t
298	46	CONTROL Y REVISION DE PRESUPUESTOS 	PRESUPUESTOS	FICHAS TECNICAS E INFORMES	87	N° DE PRESUPUESTOS	t
299	46	ELABORACION DE PROYECTOS	PROYECTOS	FICHAS TECNICAS E INFORMES	41	N° DE PROYECTOS	t
300	46	SUPERVISIONES A LOS MONUMENTOS, PATRIMONIOS HISTORICOS	SUPERVISIONES	FICHAS TECNICAS E INFORMES	10	N° DE SUPERVISIONES	t
301	46	CHARLAS A COMUNIDADES PARA EL CONOCIMIENTO DEL PATRIMONIO HI	CHARLAS	FICHAS TECNICAS E INFORMES	4	N° DE CHARLAS	t
302	45	REALIZAR INSPECCIONES  DE OBRAS Y DEL PATRIMONIO	INSPECCIONES 	FICHAS TECNICAS E INFORMES	177	N° DE INSPECCIONES REALIZADAS	t
303	45	REVISION Y SEGUIMIENTO  DE VALUACIONES 	ACTIVIDADES 	FICHAS TECNICAS E INFORMES	22	N° DE ACTIVIDAES REALIZADAS	t
304	45	CONTROL Y REVISION DE PRESUPUESTOS	PRESUPUESTOS	FICHAS TECNICAS E INFORMES	87	N° DE PRESUPUESTOS REALIZAD	t
305	45	ELABORACION DE PROYECTOS 	PROYECTOS	FICHAS TECNICAS E INFORMES	41	N° DE PROYECTOS REALIZADOS	t
306	45	SUPERVISIONES A LOS MONUMENTOS,  PATRIMONIOS HISTORICOS	SUPERVISIONES	FICHAS TECNICAS E INFORMES	10	N° DE SUPERVISIONES REALIZADAS	t
307	45	CHARLAS A COMUNIDADES PARA EL CONOCIMIENTO DEL  PATRIMONIO HI 	CHARLAS	FICHAS TECNICAS E INFORMES	4	N° DE CHARLAS REALIZADAS	t
308	47	INCORPORACIÓN DE BIENES MUEBLES.	INCORPORACIÓN	REGISTROS DE INCORPORACIÓN	24	BIENES INMUEBLES INCORPORADOS	t
309	47	ACTUALIZACIÓN DE BIENES	ACTUALIZACIÓN	REGISTRO DE ACTUALIZACIÓN	51	ACTUALIZACIONES DE BIENES REALIZADAS	t
310	47	REALIZACIÓN DE FISCALIZACIONES A INMUEBLES	FISCALIZACIÓN	REGISTRO DE FISCALIZACIÓN	108	FISCALIZACIONES A INMUEBLES REALIZADAS	t
311	47	REALIZACIÓN DE INVENTARIOS 	INVENTARIOS	REGISTRO DE INVENTARIOS	72	INVENTARIOS REALIZADOS	t
312	47	REALIZAR FISCALIZACIONES DE BIENES A DESINCORPORAR	FISCALIZACIÓN	REGISTRO DE FISCALIZACIÓN 	36	FISCALIZACIONES DE INMUEBLES A DESINCORP	t
313	47	ENVÍO DE REPORTES AL DEPARTAMENTO DE REGISTROS CONTABLES	REPORTES	REGISTRO DE ENVÍOS 	12	REGISTROS MENSUALES	t
314	47	REALIZACIÓN DEL CIERRE ANUAL 2015	BALANCES	CIERRE	1	CIERRES CONTABLES REALIZADOS	t
315	47	REALIZACIÓN DE CUADRE MENSUAL	BALANCES	CIERRES MENSUALES	12	CIERRES CONTABLES REALIZADOS	t
316	47	CONCILIACIÓN BANCARIA	CONCILIACIONES	ESTADOS DE CUENTAS Y LIBROS DE BANCO	372	CONCILIACIONES REALIZADAS	t
317	47	REALIZAR SOLICITUD DE ORDEN DE PAGO DE COMISIÓN BANCARIA	SOLICITUDES	REGISTRO DE ORDEN DE PAGO	96	SOLICITUDES DE ORDEN DE PAGO DE COMISIÓN	t
318	47	REALIZAR SOLICITUD DE REGISTRO CONTABLE DE INTERÉS BANCARIO	SOLICITUDES	REGISTRO CONTABLE	48	SOLICITUDES DE REGISTRO CONTABLE DEINTER	t
319	47	REALIZAR SOLICITUD DE REGISTRO CONTABLE DE COMISIÓN BANCARIA	SOLICITUDES	REGISTRO CONTABLE	96	SOLICITUDES DE REGISTRO CONTABLE DE COMI	t
320	47	ELABORAR SOLICITUDES DE PAGOS	SOLICITUDES	ORDEN DE PAGO	8700	SOLICITUDES REALIZADAS	t
321	47	REVISIÓN DE SOLICITUDES DE PAGO	SOLICITUDES	ORDEN DE PAGO	8700	SOLICITUDES REALIZADAS	t
322	48	ELABORACIÓN DE PROGRAMACIÓN DE COMPRAS	DOCUMENTO	FICHAS	1	DOCUMENTOS ELABORADOS	t
323	48	EMITIR ORDEN DE SERVICIOS	EMITIR ORDEN DE SERVICIOS	REGISTROS	600	ORDEN DE SERVICIO	t
324	48	EMITIR ORDEN DE COMPRA	ORDEN DE COMPRA	REGISTROS 	550	ORDEN DE COMPRAS	t
325	48	MANTENIMIENTO GENERAL DE LAS ÁREAS VERDES	MANTENIMIENTO	REGISTROS	48	MANTENIMIENTOS REALIZADOS	t
326	48	REFACCIÓN DE LA PINTURA DE OFICINAS	REFACCIONES	REGISTROS	4	REFACCIONES REALIZADAS	t
327	48	REPARACIONES ELÉCTRICAS VARIAS	REPARACIONES	REGISTROS	80	REPARACIONES ELÉCTRICAS REALIZADAS	t
328	48	REPARACIONES ELÉCTRICAS REALIZADAS	REPARACIONES	REGISTROS	80	REPARACIONES REALIZADAS	t
329	48	MANTENIMIENTO GENERAL DE LA INFRAESTRUCTURA	MANTENIMIENTO	REGISTROS	20	MANTENIMIENTOS REALIZADOS	t
330	48	MANTENIMIENTO DE VEHÍCULOS	MANTENIMIENTO	REGISTROS	200	MANTENIMIENTOS REALIZADOS	t
331	48	REPARACIONES DE VEHÍCULOS	REPARACIONES	REGISTROS	200	REPARACIONES REALIZADAS	t
332	48	SERVICIO DE TRANSPORTES	SERVICIOS	SERVICIOS	200	SERVICIOS REALIZADOS	t
333	48	SERVICIO DE TRANSPORTE NOCTURNO	SERVICIOS	REGISTROS	100	SERVICIOS REALIZADOS	t
334	49	ATENCIÓN INTEGRAL A LOS COLECTIVOS CULTURALES DEL ESTADO	ATENCIÓN.REUNIONES	INFORME MENSUALES Y TRIMESTRALES	636	Nº DE TENCIONES A LOS COLECTIVOS REALIZA	t
335	49	PROMOCIÓN Y DIFUSIÓN DE PROGRAMAS, PROYECTOS Y ACTIV CULTURA	PROMOCIONES.DIFUSIONES	INFORME MENSUALES Y TRIMESTRALES, FOTOS,	177	Nº DE PROMOCIONES Y Nº DE DIFUSIONES REA	t
336	49	ELABORAR LOS PROYECTOS Y PLANES DEL SECTOR CULTURAL	PROYECTOS.PLANES.CONTROL	INFORME TRIMESTRALES, PLANES, PROYECTOS	69	Nº DE PROYECTOS, Nº DE PLANES, Nº DE CON	t
337	49	MANTENIMIENTO A LAS INFRESTRUCTURAS FISICA CULTURALESS	MANTENIMIESTOS	INFORME MENSU- TRIMESTRALES, MINUTA, FOT	1094	Nº DE MANTENIMENTO REALIZADOS 	t
338	49	ASESORÍAS LEGALES PARA RESPALDAR LOS PROCESO CULTURALES	ASESORIAS.REGISTROS	INFORMES TRIMEST, DOCUMENTOS, REGISTROS	274	Nº DE ASESORIA, Nº DE REGISATROS	t
339	49	DISPOSICIÓN DE BIENES PARA RESPALDAR LOS PROCESOS CULTURALES	BIENES.REGISTROS	REGISTRO DE BIENES	348	Nº DE SUPERVISIONE REALIZADAS, Nº DE PRO	t
340	49	ORTALECIMIENTO CULTURAL A TRAVES DE LA INVESTIGACIÓN Y FORMA	INVESTIGACIONES.FORMACIONES	INFORME, INVESTIGACIONES, TALLERES	219	Nº DE INVESTIGACIONES, Nº DE FORMACIONES	t
341	50	ATENCIÓN INTEGRAL A LOS COLECTIVOS  CULTURALES DEL ESTADO	ACTIVIDADES	INFORME MENSUALES Y TRIMESTRALES	636	NUMERO DE ACTIVIDADES\t	t
342	50	ELABORAR LOS PROYECTOS Y PLANES  DEL SECTOR CULTURAL	PROYECTOS, PLANES, INFORMES	INFORME TRIMESTRALES, PROYECTOS, PLANES	69	Nº DE PROYECTOS Y PLANES	t
343	50	CAPACITACIÓN, FORMACIÓN A LOS COLECTIVOS CULTURALES	CAPACITACIÓN.INVESTIGACION	TALLERES DIDACTICOS, REGISTROS INV	219	Nº DE TALLERES DE CAPACITACIÓN REALIZADO	t
344	50	SUPERVISIÓN Y SEGUIMIENTO DE LOS PROCESOS CULTURALES	SUPERVISIONES Y SEGUIMI	INFORMES TRIMESTRALES, REPORTES, ACTAS	2410	Nº DE SUPERVISIONE REALIZADAS	t
345	50	MANTENIMIENTO A LAS INFRESTRUCTURAS CULTURALES	MANTENIMIENTOS	INFORMES TRIMESTRALES, MINUTAS, FOTOGRAF	1094	Nº DE MANTENIMENTO REALIZADOS A LOS ESPA	t
346	50	PROMOCIÓN Y DIFUSIÓN DE PROGRAMAS, PROYECTOS Y ACTIVIDADES C	PROMOCIÓN Y DIFUSIÓN	INFORM GESTIÓ, REGIST HEMEROG, FOTO	177	Nº DE PROMOCIONES Y DIFUSIONES REALIZADA	t
347	50	DISPOSICIÓN DE BIENES PARA RESPALDAR LOS  PROCESOS CULTURALES	BIENES	REGISTRO DE BIENES	348	Nº DE REGISTROS REALIZADOS	t
348	50	ASESORÍAS LEGALES PARA RESPALDAR LOS PROCESO  CULTURALES	ASESORIAS LEGALES	INFORMES TRIMEST, DOCUMENTOS, REGISTROS	274	Nº DE ASESORIA, Nº DE REGISATROS	t
349	51	COORDINAR JORNADAS DE CONCIENTIZACIÓN DE CUIDADO SITIOS     	INFORMACION IMPRESA	MEDIOS IMPRESOS	500	NO.MEDIOS IMPRESOS ENTREGADOS	t
350	51	COORDINAR REUNIONES CON LAS MÁXIMAS AUTORIDADES MUNICIPALES	REUNIONES	INFORMES Y ASISTENCIAS	4	NO. DE REUNIONES REALIZADAS	t
351	51	COORDINAR  JORNADAS DE CONSERV Y CUIDADO DEL AMBIENTE(ECOLG)	JORNADAS	INFORMES	2	N° DE JORNADAS REALIZADAS	t
352	51	PROMOVER EL OTORGAMT DE PERMISOS A LOS PREST DE SERV TURISTC	PERMISOS	REVISION DE DOCUMENTOS	50	NO. DE EMPRESAS DE SERV TURISTICOS	t
353	52	REALIZAR JORNADAS DE INVESTIGACIÓN EN CIENCIA Y TECNOLOGÍA	JORNADAS	INFORME, REGISTRO FOTOGRÁFICO	2	CANTIDAD DE JORNADAS REALIZADAS	t
354	52	REALIZAR MESAS DE TRABAJO EN ÁREAS PRIORITARIAS DEL ESTADO	MESAS DE TRABAJO	INFORME, REGISTRO FOTOGRÁFICO	4	CANTIDAD DE MESAS DE TRABAJOS REALIZADAS	t
355	52	ARTICULAR SOPORTE TECNOLÓGICO A ÓRGANOS Y ENTES DEL ESTADO	ACTIVIDADES	INFORME, REGISTRO FOTOGRÁFICO 	15	CANTIDAD DE ACTIVIDADES REALIZADAS	t
356	52	REALIZAR MESAS DE DISCUSIÓN DE POLÍTICAS PÚB. TECNOLÓGICAS	MESAS DE TRABAJO	INFORME, REGISTRO FOTOGRÁFICO	4	CANTIDAD DE MESAS DE TECNOLOGÌAS REALIZA	t
357	53	ARTICULACIÓN PARA EL FINANCIAMIENTO DEL SECTOR AGRARIO	CRÉDITOS	LISTA DE CREDITOS GESTIONADOS	15	Nº DE CRÉDITOS GESTIONADOS	t
358	53	ARTICULACIÓN INTRA E INTERINSTITUCIONAL CON ENTES AGRARIOS.	ACTIVIDADES	MINUTAS, ACTAS, LISTADOS DE ASISTENCIA	30	Nº DE ACTIVIDADES REALIZADAS	t
359	53	ATENCIÓN AGRARIA INTEGRAL A LOS PRODUCTORES Y PRODUCTORAS	CASOS ATENDIDOS	FORMATO DE ATENC. INTEGRAL AL PRODUCTOR	50	Nº DE CASOS ATENDIDOS	t
360	53	ACOMPAÑAMIENTO A ORGANIZACIONES DEL PODER POPULAR	ACTIVIDADES	MINUTAS, ACTAS DE CAMPO,  LISTA DE ASIST	10	Nº DE ACOMPAÑAMIENTOS REALIZADOS	t
361	54	CONSOLIDACIÓN DE LA INFRAESTRUCTURA AGRÍCOLA EN LA BECERRINA	INSPECCIONES	INFORMES Y FOTOGRAFÍAS	4	Nº DE INSPECCIONES REALIZADAS	t
362	54	CONSOLIDACIÓN DE LA INFRAESTRUCTURA AGRÍCOLA LOS AGUACATALES	INSPECCIONES	INFORMES Y FOTOGRAFÍAS	4	Nº DE INSPECCIONES REALIZADAS	t
363	54	ARTICULACIÓN PARA EL FINANCIAMIENTO DEL SECTOR  AGRARIO	CRÉDITOS	LISTA DE CRÉDITOS GESTIONADOS	15	Nº DE CRÉDITOS GESTIONADOS	t
364	54	ARTICULACIÓN INTRA E INTERINSTITUCIONAL CON ENTES AGRARIOS	ACTIVIDADES	MINUTAS, LISTADOS DE ASISTENCIA	30	Nº DE ACTIVIDADES REALIZADAS	t
365	54	ATENCIÓN AGRARIA INTEGRAL A LOS PRODUCTORES  Y PRODUCTORAS	CASOS ATENDIDOS	FORMATO DE ATENCIÓN INTEGRAL AL PRODUCTO	50	Nº DE CASOS ATENDIDOS	t
366	54	ACOMPAÑAMIENTO A ORGANIZACIONES DEL PODER  POPULAR	ACTIVIDADES	MINUTAS, ACTAS DE CAMPO, LISTAS DE ASIST	10	Nº DE ACOMPAÑAMIENTOS REALIZADOS	t
374	55	BRINDAR APOYO INSTITUCIONAL A LOS CIUDADANOS (AS)	AYUDAS SOCIALES 	ESTADISTICAS 	750	NUMERO DE AYUDAS OTORGADAS EN EL AÑO	t
375	55	AUDIENCIAS ATENDIDAS POR LA SECRETARIA GENERAL DE GOBIERNO	AUDIENCIAS 	REGISTRO DE ASISTENCIA 	300	NUMERO DE AUDIENCIAS REALIZADAS EN EL AÑ	t
376	55	REUNIONES DE LA SGG CON ENTES PUBLICOS Y PRIVADOS 	REUNIONES 	REGISTRO DE ASISTENCIA	150	NUMERO DE REUNIONES ASIGNADAS EN EL AÑO	t
377	56	BRINDAR APOYO INSTITUCIONAL  A LOS CIUDADANOS (AS)	AYUDAS SOCIALES	ESTADÍSTICAS	750	NÚMERO DE AYUDAS OTORGADAS EN EL AÑO	t
378	56	AUDIENCIAS ATENDIDAS POR LA SECRETARIA  GENERAL DE GOBIERNO	AUDIENCIAS	REGISTRO DE ASISTENCIA	300	NÚMERO DE AUDIENCIAS REALIZADAS EN EL AÑ	t
379	56	REUNIONES DE LA SGG CON ENTES PÚBLICOS Y PRIVADOS	REUNIONES 	REGISTRO DE ASISTENCIA 	150	NÚMERO DE REUNIONES REALIZADAS EN EL AÑO	t
380	57	PRESENTAR ANTECEDENTES, CONTESTACIONES, PRUEBAS Y OPISICIONE	CONSIGNACIÓN DE DOCUMENTOS	ARCHIVOS DE REGISTROS	1765	NºDE CONSIGANTC REALZ.NºDE CONSIG D ANT	t
381	57	CUMPLIR CON EL PROCESO DE DISTRIBUCION DE LA  GACETA OFICIAL	DISTRIBUCIÓN	OFICIOS ARCHIVADOS	1265	NºDE DISTR  GACT REALZ. Nº DISTR DE GACT	t
382	57	ELABORAR DE OFICIOS, A LOS FINES DE REALIZAR SOLICITUDES 	OFICIOS	OFICIOS REALIZADOS	953	NºDE OFICIOS REALZ. NºDE OFICIOS PROGRAM	t
383	57	CUMPLIR CON EL PROCESO DE  PUBLICACIONES DE LOS DOCUMENTOS 	PUBLICACIÓN	LIBRO DE ACTAS	440	NºDE PUBLIC D DOCT REALZ, Nº PUBLIC PROG	t
384	57	 ATENDER LAS SOLICITUDES DE ELABORACIONES DE ACTOS ADM.	ACTOS ADMINISTRATIVOS	ARCHIVOS DE ACTOS ADMINISTRATIVOS	285	NºDE RESOL REALZ .Nº RESOL PROG	t
385	57	ELABORACIÓN, REVISIÓN Y ADECUACIÓN DE CONTRATOS Y DOCUMENTOS	CONTRATOS Y DOCUMENTOS	ARCHIVO DE CONTRATOS	125	NºDE CONTR REALZ. Nº CONTR. PROG 	t
386	57	RECIBIR NOTIFICACIONES DE DEMANDAS INCOADAS CONTRA EL ESTADO	DEMANDAS	LIBRO DE CONTROL	47	NºDE DEMAN REALZ. NºDE DEMAN PROGRAMAD X	t
387	57	ORIENTAR Y APOYAR EL CUMPLIMIENTO DE ACTUACIONES EN JUICIOS 	ASESORIAS	LIBRO DE CONTROL	39	NºDE ASES REALZ.  Nº ASES.  PRO GX...	t
388	57	PROCEDIMIENTOS	PROCEDIMIENTOS	ESTADISTICAS	31	N°DE PROCD. REALIZ. N° PROCD  PROGRAM X 	t
389	57	ELABORACIÓN DE DICTAMES  O OPINIONES	DICTAMENES Y OPINIONES	ACTAS DE DICTAMENES	12	N°DE DICT REALIZ.N° DICT  PROGRAMD 	t
390	57	 PRESIDIR LAS NEGOCIACIONES  	CONVENCIONES 	ESTADISTICAS MENSUALES	2	N° DE CONV DISCT . N° CONV PROGRAM 	t
391	57	 REVISIÓN DE LOS PROYECTOS DE  LEYES Y/O REFORMAS DE LEYES 	LEYES Y REGLAMENTOS	OFICIOS DE SALIDAS ARCHIVADOS 	2	NºDE REVS LEYES REALZ. Nº LEYES PROGX 	t
392	58	PRESENTAR ANTECEDENTES,  CONTESTACIONES, PRUEBAS Y OPISICIONE	CONSIGNACIÓN DE DOCUMENTOS	ARCHIVOS DE REGISTROS	1765	NªDECONSIGANTC. REALIZ. NºD CONSIG D ANT	t
393	58	CUMPLIR CON EL PROCESO DE DISTRIBUCIÓN DE LA GACETA OFICIAL	DISTRIBUCIÓN 	OFICIOS ARCHIVADOS	1265	Nº DE DISTR GACT REALIZ. Nº DISTR DE GAC	t
394	58	ELABORAR DE OFICIOS, A LOS FINES DE REALIZAR  SOLICITUDES 	OFICIOS	OFICIOS REALIZADOS	953	NªDE OFICIOS. REALIZ. NºDE OFICIOS PROGR	t
395	1	FOTOGRAFÍAS CAPTURADAS EN LA GESTIÓN DE GOBIERNO	Nº DE FOTOGRAFÍA	RESEÑA FOTOGRAFICA	7000	Nº DE FOTOGRAFIAS	t
396	1	VIDEOS REFERENTES A LA GESTIÓN DE GOBIERNO	Nº DE VIDEOS	VIDEOS REALIZADOS	75	Nº DE VIDEOS	t
397	1	ELABORACIÓN DE DISEÑOS ALUSIVOS A LA GESTIÓN DE GOBIERNO	DISEÑOS	ARCHIVO DIGITAL	477	Nº DE DISEÑOS	t
398	1	SEGUIMIENTO Y ANÁLISIS DEL ENTRONO 	INFORME	INFORME TÉCNICO DIGITAL	577	Nº DE INFORMES	t
399	1	REDACCIÓN DE NOTAS DE PRENSA Y TRABAJOS ESPECIALES	NOTAS DE PRENSA	ARCHIVO DIGITAL	746	Nº DE NOTAS DE PRENSA	t
400	1	AMB.  ESPACIOS PARA  PAUTAS DEL GOBIERNO DE ARAGUA	PAUTAS	ARCHIVO DIGITAL	75	Nº DE PAUTAS	t
401	1	DIFUSIÓN DE ANUNCIOS PUBLICITARIOS DE LA GESTIÓN DE GOBIERNO	ANUNCIOS	ARCHIVO DIGITAL	68	Nº DE ANUNCIOS	t
402	1	VISITA INSTITUCIONAL A LOS MEDIOS ALTERNATIVOS COMUNITARIOS 	VISITAS	ACTA DE VISITAS	4	Nº DE VISITAS	t
403	1	REUNIÓN CON LOS MEDIOS ALTERNATIVOS COMUNITARIOS 	REUNIONES	LISTADO DE ASISTENCIA	4	Nº DE REUNIONES	t
404	1	ENTREGA DEL PREMIO REGIONAL ALTERNATIVO "HUGO CHAVÉZ"	ACTIVIDAD	PUBLICACIÓN DE LOS GANADORES	1	PUBLICACIÓN DE LOS GANADORES	t
405	59	TRANSFERENCIA DE RECURSOS A PROYECTOS MUNICIPALES.	PROYECTOS	INSPECCIONES	18	Nº DE TRANSFERENCIAS REALIZADAS.	t
406	59	ASES.REVISI.RENDIC. FISICO-FINANC.PROY. APROB. AÑOS ANTERIO 	N° DE ASESORÍAS Y REVISIONES	INFORMES-ACTAS DE CONFORMIDAD	50	CANTIDAD DE INFORMES Y ACTAS DE CONFORMI	t
407	60	BRINDAR A. TÉCNICA ELABORACIÓN DE PROY. A LOS BENEFICIARIOS 	Nº DE ASESORÍAS	CONTROL DE VISITAS	100	CANTIDAD DE ASESORÍAS REALIZADAS	t
408	60	BRINDAR A. TÉCNICA ELABORACIÓN DE PROY. MUNICIPALES.	Nº DE ASESORÍAS	CONTROL DE VISITAS	18	CANTIDAD DE ASESORÍAS REALIZADAS	t
409	60	SUPERVIS-CONTROL A PROYECTOS AÑOS ANTERIORES	N° DE INSPECCIONES	INFORMES-MINUTAS-FICHAS	60	CANTIDAD DE INSPECCIONES	t
410	60	SOLICITUDES DE PAGO PARA FINANCIAMIENTO A PROYECTOS.	N° DE SOLICITUDES DE PAGO.	REPORTES DE SISTEMA	30	CANTIDAD DE SOLICITUDES DE PAGO ELABORAD	t
411	61	ORGANIZACIÓN DE EVENTOS DEPORTIVOS (ALTO RENDIMIENTO)	BENEFICIOS OTORGADOS	NÓMINA DE ALTO RENDIMIENTO	256	HONORARIOS Y BENEFICIOS CONTRACTUALES	t
412	61	FORTALECER LA ACTIVIDAD FÍSICA Y DEPORTIVA (MASIFICACIÓN)	BENEFICIOS OTORGADOS	NÓMINA DE MASIFICACIÓN	52	HONORARIOS Y BENEFICIOS CONTRACTUALES	t
413	61	MANTENIMIENTO DE LAS INSTALACIONES DEPORTIVAS	BENEFICIOS OTORGADOS	NÓMINA DE LAS INSTALACIONES DEPORTIVAS	252	HONORARIOS Y BENEFICIOS CONTRACTUALES	t
414	61	PROPORCIONAR ATENCIÓN MÉDICA INTEGRAL	BENEFICIOS OTORGADOS	NÓMINA DE ATENCIÓN INTEGRAL	76	HONORARIOS Y BENEFICIOS CONTRACTUALES	t
415	61	OTORGAMIENTO DE BECAS PARA ATLETAS Y GLORIAS DEPORTIVAS	BENEFICIOS OTORGADOS	NÓMINA DE ATENCIÓN INTEGRAL	76	HONORARIOS Y BENEFICIOS CONTRACTUALES	t
416	62	PROPORCIONAR ATENCIÓN MÉDICA  INTEGRAL 	ATENCIONES REALIZADAS	INFORME DE GESTIÓN	3136	MORBILIDAD	t
417	62	PARTICIPACIÓN Y ORGANIZACIÓN DE EVENTOS DEPORTIVOS 	EVENTOS REALIZADOS	INFORME DE GESTIÓN	86	ALTO RENDIMIENTO DEPORTIVO	t
418	62	OTORGAMIENTO DE BECAS PARA ATLETAS Y GLORIAS  DEPORTIVAS	BECAS ENTREGADAS	ORDENES DE PAGO	149	SERVICIOS DE MANTENIMIENTO	t
419	62	FORTALECER LA ACTIVIDAD FÍSICA  Y DEPORTIVA (MASIFICACIÓN)	ACTIVIDADES REALIZADAS	INFORME DE GESTIÓN	224	ACTIVIDADES DEPORTIVAS DE MASIFICACIÓN  	t
420	63	INSPECCIÓN DE URBANISMOS	INSPECCIONES	INFORMES DE INSPECCIONES	3840	 CANTIDAD DE INSPECCIONES REALIOZADAS	t
421	63	ENTREGA DETITULOS DE PROPIEDAD	TITULOS DE PROPIEDAD	RESUMEN  TITULOS DE PROPIEDAD ENTREGADOS	1200	CANTIDAD DE TITULOS DE PROPIEDAD  ENTREG	t
422	63	ELABORACIÓN DE PROYECTOS 	  PROYECTOS	INFORMES Y PROYECTOS	11	CANTIDAD DE PROYECTOS REALIZADOS	t
423	63	ELABORACIÓN DE CONTRATOS	CONTRATOS	HOJA RESUMEN DE CONTRATOS	26	CANTIDAD DE CONTRATOS REALIZADOS	t
424	64	MANTENIMIENTO DEL ORDEN PÚBLICO   Y APOYO DE SEGURIDAD 	ACTIVIDADES 	INFORME\t	1800	N° ACTIVIDADES REALIZADAS 	t
425	64	INCREMENTO DE LAS  ACCIONES  POLICIALES POSITIVAS / RECUPERAC	ACCIONES 	COMPARATIVO DEL  DOMIL QUINCE	30	Nº DE ACCIONES REALIZADAS	t
426	64	GARANTIZAR LA COBERTURA  DE SEGURIDAD A TRAVÉS DE OPERATIVOS	OPERATIVOS 	INFORME\t 	199	Nº DE INCIDENCIAS DELICTIVAS  	t
427	64	ACCIONES DE ORIENTACIÓN, ASISTENCIA Y  ACOMPAÑAMIENTO COMUNAL	INCIDENCIAS DELICTIVAS 	COMPARATIVO DEL DOSMIL QUINCE	20	Nº DE INCIDENCIAS DELICTIVAS  	t
428	64	ACCIONES DE ORIENTACIÓN , ASISTENCIA Y ACOMPAÑAMIENTO COMUNAL	ACCIONES	INFORME\t	9600	N° DE ACCIONES REALIZADAS	t
429	65	 MANTENIMIENTO DEL ORDEN PÚBLICO  Y APOYO DE SEGURIDAD A OTR	N° DE ACTIVIDADES	INFORME	1800	N° ACTIVIDADES REALIZ	t
430	65	 INCREMENTO DPOSITIVAS E LAS  ACCIONES POLICIALES	 INCREMENTO ACCIONES POSITIVAS	COMPARATIVO DEL DOSMIL QUINCE 	30	ACCIONES POSITIVA DEL AÑO DOSMIL QUINCE	t
431	65	 GARANTIZAR LA COBERTURA DE SEGURIDAD A TRAVES DE OPERATIVOS	N° OPERATIVOS EN EL AÑO	INFORME	199	Nª DE ACCIONES REALIZADO	t
432	65	 DISMINUCIÓN   LA INCIDENCIA DELICTIVA A TRAVES DEL PATRULLA	DISMINUCION DEL DELITO	COMPARATIVO DEL AÑO DOSMILQUINCE	20	COMPARAT INCIDENCIAS DELICTIVAS AÑO	t
433	66	ATENCIÓN A LA MUJER  Y SU FAMILIA	 ASESORÍAS LEGALES Y PSICOLÓGICAS	 INFORMES ASESORÍAS	4000	N° PERSONAS ATENDIDAS	t
434	66	 DIFUSIÓN DEL DERECHO DE LA MUJER A  VIVIR LIBRE DE VIOLENCIA	PROGRAM AUDIOVISUAL Y PUBLICACIONES	RELACION DE ASISTENCIA FOTO DE ARCHIVO	6000	N° PERSONAS INFORMADAS	t
435	67	DESARROLO DE LA GESTIÓN DE  DIRECCIÓ OPERTAIVA	GESTIÓN OPERATIVA	INFORMES	161	Nº DE GESTIONES OPERTAIVAS	t
436	67	DESARROLLO DE LA GESTIÓN DE  RECURSOS HUMANOS	GESTIONES	REGISTROS, INFORMES, MINUTAS	114	Nº DE GESTIONES DE RRHH	t
437	67	DESARROLLO GESTIÓN  ADMINISTRATIVA	GESTIÓN ADMINISTRATIVA	EJECUCIONES, INFORMES, 	157	Nº DE GESTIONES ADMINISTRATIVAS	t
438	67	DESARROLLAR ACTIVIDADES  DE SISTEMAS	DESARROLLAR ACTIVIDADES DE SISTEMAS	REG MANTENIMIENTOS, MINUTAS, IN	171	Nº DE MANTENIMEITOS 	t
439	67	DESARROLLAR ACTIVIDADES TEATRO ATENEOM DE MARACAY	ACTIVIDADES TEATRALES	INFORMES Y REGISTROS FOTOGRAFICOS	313	Nº DE ACTIVIDADES TEATRALES	t
440	67	DESARROLLAR ACTIVIDADES DANZAS  EXPRESIÓN CRIOLLA	ACTIVIDADES DANCISTICAS	INFORMES Y REGISTROS FOTOGRAFICOS	91	Nº DE ACTIVIDADES DANCISTICAS	t
441	67	DESARROLLAR ACTIVIDADES DE LA CASA  DE LA CULTURA	ACTIVIDADES CULTURALES	INFORME Y REGISTROS FOTOGRAFICOS	44	Nº DE ACTIVIADDES CULTURALES	t
442	67	DESARROLLAR ACTIVIDADES RED DE BIBLIOTECAS  PUBLICAS	ACTIVIDADES BIBLOTECARIAS	INFOREMES Y REGSITROSFOTOGRAFICS	11947	Nº DE ACTIVIDADES BIBLIOTECARIAS	t
443	67	DESARROLLAR ACTIVIDADES MUSO  MARIO ABREU	ACTIVIDADES MUSEOGRAFICAS	INFORMES Y REGISTROS FOTOGRAFICOS	55	Nº DE ACTIVIDADES MUSEOGRAFICAS	t
444	67	DESARROLLAR ACTIVIDADES MUSEO  ANTROPOLOGICO	ACTIVIDADES MUSEOGRAFICAS	INFORMES Y REGISTROS FOTOGRAFICOS	11975	Nº DE ACTIVIDADES MUSEOGRAFICAS	t
445	67	DESARROLLAR ACTIVIDADES DANZAS  ARAGUA	ACTIVIDADES DANCISTICAS	INFORMES Y REGISTROS FOTOGRAFICOS	41	Nº DE ACTIVIDADES DANCISTICAS	t
446	67	DESARROLLAR ACTIVIDADES BIBLIOTECA  AGUSTIN CODAZZI	ACTIVIDADES BIBLOTECARIAS	INFOREMES Y REGSITROSFOTOGRAFICS	86311	Nº DE ACTIVIDADES BIBLIOTECARIAS	t
447	67	DESARROLAR ACTIVIDADES DANZAS GUICAIPURO	ACTIVIDADES DANCISTICAS	INFORMES Y REGISTROS FOTOGRAFICOS	318	Nº DE ACTIVIDADES DANCISTICAS	t
448	67	DESAROLLAR LA COMUNICACIÓN  Y EL DISEÑO	COMUNICACIÓN Y DISEÑO	REGISTROS, INFORMES	1426	Nº DE COMUNICACIÓN Y DISEÑO	t
449	67	DEASRROLAR ACTIVIDADES TEATRO  ESTABLE	ACTIVIDADES TEATRALES	INFORMES Y REGISTROS FOTOGRAFICOS	59	Nº DE ACTIVIDADES TEATRALES	t
450	67	DEASROLLARACTIVIDADES DE  ORALIDAD Y EL PENSAMIENTO ESCRITO	ACTIVIDADES LITERARIAS	INFORMES, REGISTROS FOTOGRAFICOS	87	Nº DE ACTIVIDADES LITERARIAS	t
451	68	DISENAR Y DESARROLLAR PLANES DE COMUNALES DE SALUD	USUARIOS ATENDIDOS  	INFORME DE GESTION	3600	 NUMEROS DE USUARIOS ATENDIDOS	t
452	68	MANTENIMIENTO DE 35 AREAS ESTRUCTURALES DEL SERV	 MANTENIMIENTOS ESTRUCTURALES	INFORME DE GESTION	480	NUMERO DE MANTENIMIENTOS REALIZADOS	t
453	68	MANTENIMIENTO GENERAL DE 6 VEHICULOS PERTENECIENTES A INSTIT	MANTENIMIENTOS DE VEHICULOS	INFORME DE GESTION	6	NUMERO DE MANTENIMIENTOS REALIZADOS	t
454	68	DESARROLLAR TALENTOS JUVENILES EN EL AREA DEPORTIVA	USUARIOS ATENDIDOS 	INFORME DE GESTION	4300	 NUMEROS DE USUARIOS ATENDIDOS	t
455	68	BRINDAR HERRAMIENTAS EN EL MANEJO Y CAPACIITACION EN INFORMA	USUARIOS ASISTIDOS 	INFORME DE GESTION	4800	 NUMEROS DE USUARIOS ATENDIDOS	t
456	68	DESARROLLAR CAPACIDADES Y TALENTOS EN MATERIA CULTURAL	USUARIOS ATENDIDOS 	DE INFORME DE GESTION	3400	 NUMEROS DE USUARIOS ATENDIDOS	t
457	68	FORTALECER EL APOYO INSTITUCIONAL EN LOS PROG SOCIALES	USUARIOS ATENDIDOS 	INFORME DE GESTION 	4000	 NUMEROS DE USUARIOS ATENDIDOS	t
458	69	PROGRAMACION VARIAS	PROGRAMA	PRODUCCIÓN DE PROGRAMA	300	N° DE PROGRAMAS	t
459	69	TRANSMISIONES Y PROGRAMAS	TRANSMISIONES EN VIVO	TRANSMISIONES EN VIVO	780	TRANSMISIÓN EN VIVO	t
460	69	COMERCIALES, PROMOCIONES, MICROS Y CAMPAÑAS	PUBLICIDAD	PUBLICIDAD	50	N° ESPACIOS PUBLICITARIOS	t
461	69	INFORMAR ACONTECIMIENTOS	NOTICIAS	COMPACTOS INFORMATIVOS Y CULTURALES.	365	N° DE NOTICIAS	t
462	69	TRANSMISIONES DEPORTIVAS	TRANSMISIONES	COMPACTOS INFORMATIVOS DEPORTIVOS	1125	N° DE NOTICIAS DEPORTIVAS	t
463	70	DOCUMENTAR A LA AUDIENCIA A TRAVÉS DE MICROS INFORMATIVOS	MICROS INFORMATIVOS	TRANSMISIONES EN VIVO	1400	NÚMERO DE MICROS	t
464	70	INSTRUIR A LA AUDIENCIA A TRAVÉS DE CAMPAÑAS RADIALES	CAMPAÑAS INFORMATIVAS	TRANSMISIONES GRABADAS	10	NÚMERO DE CAMPAÑAS	t
465	70	TRANSMISIÓN DE PROGRAMAS EN VIVO	PROGRAMAS	TRANSMISIONES EN VIVO	864	CANTIDAD DE PROGRAMAS	t
466	70	TRANSMIONES DE PROGRAMAS GRABADOS	PROGRAMAS	TRANSMISIÓN GRABADAS	288	CANTIDAD DE PROGRAMAS	t
467	70	TRANSMISIONES  DEPORTIVAS 	PROGRAMAS	TRANSMISIONES EN VIVO	170	NUMERO DE TRANSMISIONES	t
468	70	TRANSMISIONES GUBERNAMENTALES	TRANSMISIONES GUBERNAMENTALES	TRANSMISIONES EN VIVO	50	NUMERO DE TRANSMISIONES	t
469	71	APOYO A LAS ACTIVIDADES SOCIALES, CULTURALES Y RECREATIVAS	ACTIVIDADES	INFORME	32	NUMERO DE ACTIVIDADES REALIZADAS	t
470	71	DESARROLLAR ESTRATEGIAS PARA EL DERECHO SOCIAL Y CULTURAL	 NIÑOS Y NIÑAS	LISTADO NIÑOS ATENDIDOS	54000	CANTIDAD DE NIÑOS Y NIÑAS ATENDIDOS	t
471	71	PROMOVER LA ASISTENCIA INTEGRAL EN SALUD Y AYUDAS TECNICAS	  NIÑOS Y NIÑAS	LISTADO NIÑOS ATENDIDOS	33000	CANTIDAD DE NIÑOS Y NIÑAS ATENDIDOS	t
472	71	INTEGRACION A LAS NUEVAS TECNOLOGIAS DE INFORMACION Y COMUNI	  NIÑOS Y NIÑAS	LISTADO NIÑOS ATENDIDOS	13000	CANTIDAD DE NIÑOS Y NIÑAS ATENDIDOS	t
473	72	REALIZAR MANTENIMIENTO A LOS ESPACIOS PUBLICOS	Nº DE MANTENIMIENTOS	INFORMES DE INSPECCIONES	1096	MANTENIMIENTOS REALIZADOS	t
474	72	MANEJO Y DISPOSICION DE LOS DESECHOS SOLIDOS	Nº DE RECOLECCIONES	INFORMES DE INSPECCIONES	4020	RECOLECCIONES REALIZADAS	t
475	72	MANTENER EL PAISAJISMO DE LAS DIFERENTES PLAZAS Y ESPACIOS P	Nº DE MANTENIMIENTOS	INFORME DE INSPECCIONES	1820	MANTENIMIENTOS REALIZADOS	t
476	72	REHABILITAR AREAS DE ESPARCIMIENTO PUBLICAS/COMUNIDADES	Nº DE REHABILITACIONES	INFORMES DE INSPECCIONES	363	REHABILITACIONES REALIZADAS	t
477	72	SUMINISTRO Y COLOCACION DE AGUA POTABLE EN LA ENTIDAD ARAGUE	Nº DE SUMINISTROS	INFORMES DE INSPECCIONES	3285	SUMINISTROS REALIZADOS	t
478	73	CONCIERTOS I  TEMPORADA 2016 ENERO - JULIO	CONCIERTO ORQUESTAL	MEDIOS IMPRESOS, FOTOGRAFÍAS, VIDEOS	23	CONCIERTOS REALIZADOS	t
479	73	CONCIERTO XXVI ANIVERSARIO DE LA OSA	CONCIERTO ORQUESTAL	MEDIOS IMPRESOS, FOTOGRAFÍAS, VIDEOS	1	CONCIERTO REALIZADO	t
480	73	CONCIERTOS NAVIDEÑOS	CONCIERTO ORQUESTAL	MEDIOS IMPRESOS, FOTOGRAFIAS, VIDEOS	6	CONCIERTOS REALIZADOS	t
481	74	TRABAJO ESPECIAL (REPORTAJES,CRÓNICAS,PERFIL)	PUBLICACIONES	TRABAJO ESPECIAL	118	Nº DE TRABAJO ESPECIAL PUBLICADO	t
482	74	ELABORACIÓN Y PUBLICACIÓN DE ENCARTADOS Y REVISTA ESPECIALES	PUBLICACIONES	ENCARTADOS	36	Nº DE ENCARTADOS PUBLICACDOS	t
483	74	ELABORACIÓN Y PUBLICACIÓN DEL DIARIO CIUDAD MCY	PUBLICACIONES	DIARIO	345	Nº DE DIARIOS PUBLICADOS	t
484	74	ELABORACIÓN Y PUBLICACIÓN DE LA MEMORIA Y CUENTA 2015	PUBLICACIONES	MEMORIA Y CUENTA	1	Nº DE ENCARTADOS PUBLICADOS	t
485	74	DIFUSIÓN DE LAS EDICIONES DIGITALES DEL DIARIO CIUDAD MCY	PUBLICACIONES	ARCHIVO DIGITAL	345	Nº DE EDICIONES DIGITALES	t
486	74	DIFUSIÓN VIA WEB DE CAMPAÑAS ESPECIALES	PUBLICACIONES	ARCHIVO DIGITAL	4	Nº DE PROMOCIONES	t
487	74	DIAGRAMACIÓN DEL DIARIO CIUDAD MCY	PUBLICACIONES	DIARIO DIAGRAMADO	345	Nº DE DIARIOS DIAGRAMADO	t
488	74	DIAGRAMACIÓN DE ENCARTADOS,TRABAJOS Y REVISTAS ESPECIALES	PUBLICACIONES	ENCARTADOS Y REVISTAS DIAGRAMADOS	59	Nº DE ENCARTADOS DIAGRAMADOS	t
489	74	FOTOGRAFÍAS CAPTURADAS PARA EL DIARIO CIUDAD MCY	PUBLICACIONES	ARCHIVO DIGITAL	3110	Nº DE FOTOGRAFÍAS CAPTURADAS	t
490	74	CORRECCIÓN DE LAS PUBLICACIONES DEL DIARIO CIUDAD MCY	PUBLICACIONES	DIARIO	345	Nº DE DIARIO CORREGIDO	t
491	74	CORRECCIÓN DE LAS PUBLICACIONES DE ENCARTADOS Y REVISTAS ESP	PUBLICACIONES	ENCARTADOS	59	Nº DE ENCARTADOS CORREGIDOS	t
492	74	ELABORACIÓN Y PUBLICACIÓN DE TRABAJOS ESPECIALES	PUBLICACIONES	TRABAJOS ESPECIALES	22	Nº DE TRABAJOS ESPECIALES	t
493	74	ELABORACIÓN Y PUBLICACIÓN  DE LA EDICIÓN INFANTÍL "PIRUETAS"	PUBLICACIONES	PUBLICACIONES	39	Nº DE PUBLICACIONES	t
494	74	DIAGRAMACIÓN DE PIRUETAS	PUBLICACIONES	REVISTA DIAGRAMADA	39	Nª DE REVISTA DIAGRAMADA	t
495	75	ALIMENTACIÓN DE LA FAUNA SILVESTRE DEL ZOOLÓGICO	CANTIDAD DE ANIMALES	INVENTARIO DE ANIMALES MENSUAL	900	N° DE ANIMALES BENEFICIADOS	t
496	75	SUMINISTROS DE MATERIALES Y CONSERVACIÓN DE EQUIPOS 	MATERIALES E IMPLEMENTOS	REQUISICIONES 	12	N° DE REQUISICIONES	t
497	75	ATENCIÓN MÉDICA  VETERINARIA PREVENTIVA 	CONSULTAS	INFORMES	24	CONSULTAS PREVENTIVAS REALIZADAS	t
498	75	DIVULGACIÓN Y PROMOSIÓN DEL ZOOLÓGICO LAS DELICIAS	PERSONAS	MEDIOS IMPRESOS	20000	N° DE PERSONAS QUE VISITAN EL ZOOLOGICO	t
499	75	PROMOCIONAR EL CUIDADO DE ANIMALES E INSTALACIONES 	CHARLAS INFORMATIVAS 	INFORMES	4	N° DE PERSONAS QUE VISITAN EL ZOOLOGICO	t
500	76	APOYAR LA INCLUSIÓN Y PARTICIPACIÓN JUVENIL SOCIO-PRODUCTIVA	JÓVENES 	INFORMES Y ASISTENCIAS	12	JÓVENES CAPACITADOS	t
501	76	APOYAR CONVIVENCIA Y ORGANIZACIÓN COMUNAL	CONVIVENCIAS Y ORGANIZACIONES	FOTOS,VIDEOS Y NOTAS DE PRENSA	168	N°.DE CONVIVENCIAS Y ORGANIZACIONES	t
502	76	FACILITAR TALLERES ESCOLARES Y ESCUELA PARA PADRES Y MADRES	TALLERES Y REUNIONES 	INFORMES Y ASISTENCIAS	12	N°. TALLERES Y REUNIONES REALIZADAS	t
503	77	DISEÑO DE PORTALES WEB 	PORTALES Y MANTENIMIENTO	INFORMES MINUTA	400	ACTIVIDADES DE DICEÑO	t
504	77	DESARROLLO Y MANTENIMIENTO DE SISTEMAS	DESARROLLOS DE SISTEMAS	CORREO ELECTRONICO	1258	N° DE ACTIVIDADES	t
505	77	ADMINISTRACIÓNDE SERVIDORES Y SERVICIOS WEB	SEGUIMIENTO	CORREO ELECTRONICO	1258	N° DE ACTIVIDADES	t
506	77	SOPORTE Y MANTENIMIENTO DE REDES Y TELECOMUNICACIONES	ASISTENCIA TECNICA	RESPORTE ASISTENCIA	982	Nº DE ASISTECIA TECNICA	t
507	77	SOPORTE TÉCNICO A INFRAESTRUCTURA TECNOLÓGICA	ASISTENCIAS TÉCNICAS	REPORTES DE ASISTENCIA TÉCNICA	1200	N° DE ASISTENCIAS TÉCNICAS	t
508	78	ATENCION INTEGRAL EN SALUD 	CONSULTAS	INFORME HOSPITALARIO	30577	Nº DE CONSULTAS REALIZADAS	t
509	79	ATENCION INTEGRAL EN SALUD	BENEFICIARIOS	HOSPITALARIO	16493	CANTIDAD DE BENEFICIARIOS	t
510	80	ADMINISTRACIÓN E INSPECCION DE OBRAS	INSPECCIONES	INFORMES	850	CANTIDAD DE INSPECCIONES REALIZADAS	t
511	80	SERVICIOS LOGISTICOS A LA COMUNIDAD	SERVICIOS	INFORMES	1486	CANTIDAD DE SERVICIOS REALIZADOS	t
512	80	ATENCION A LA COMUNIDAD A TRAVES DE INFORMACIÓN, TALLERES	 TALLERES	INFORMES	137	CANTIDAD DE TALLERES REALIZADOS	t
513	80	SOPORTE TECNICO-ADMINISTRATIVO A LAS ACTIVIDADES MEDULARES 	REPORTES	ACTIVIDADES REALIZADAS	12307	CANTIDAD DE REPORTES REALIZADOS	t
514	81	FOTOGRAFÍAS CAPTURADAS EN LA GESTIÓN DE   GOBIERNO	Nº DE FOTOGRAFÍA	RESEÑA FOTOGRAFICA	7000	Nº DE FOTOGRAFIAS	t
515	81	VIDEOS REFERENTES A LA GESTIÓN  DE GOBIERNO	Nº DE VIDEOS	VIDEOS REALIZADOS	75	Nº DE VIDEOS	t
516	81	ELABORACIÓN DE DISEÑOS ALUSIVOS A LA  GESTIÓN DE GOBIERNO	DISEÑOS	ARCHIVO DIGITAL	477	Nº DE DISEÑOS	t
517	81	SEGUIMIENTO Y ANÁLISIS DEL  ENTRONO 	INFORME	INFORME TÉCNICO DIGITAL	577	Nº DE INFORMES	t
518	81	REDACCIÓN DE NOTAS DE PRENSA Y TRABAJOS  ESPECIALES	NOTAS DE PRENSA	ARCHIVO DIGITAL	746	Nº DE NOTAS DE PRENSA	t
519	81	AMB.  ESPACIOS PARA   PAUTAS DEL GOBIERNO DE ARAGUA	PAUTAS	ARCHIVO DIGITAL	75	Nº DE PAUTAS	t
520	81	DIFUSIÓN DE ANUNCIOS PUBLICITARIOS DE LA  GESTIÓN DE GOBIERNO	ANUNCIOS	ARCHIVO DIGITAL	68	Nº DE ANUNCIOS	t
521	81	VISITA INSTITUCIONAL A LOS MEDIOS ALTERNATIVOS  COMUNITARIOS 	VISITAS	ACTA DE VISITAS	4	Nº DE VISITAS	t
522	81	REUNIÓN CON LOS MEDIOS ALTERNATIVOS  COMUNITARIOS 	REUNIONES	LISTADO DE ASISTENCIA	4	Nº DE REUNIONES	t
523	82	FOTOGRAFIAS CAPTURADAS EN LA GESTIÓN DE GOBIERNO	Nº DE FOTOGRAFIAS	RESEÑA FOTOGRAFICA	7000	Nº DE FOTOGRAFIAS	t
524	82	VIDEOS REFERENTES  A LA GESTIÓN DE GOBIERNO	Nº DE VIDEOS	VIDEOS REALIZADOS 	75	Nº DE VIDEOS	t
525	82	ELABORACIÓN DE DISEÑOS ALUSIVOS A LA GESTIÓN  DE GOBIERNO	DISEÑOS	ARCHIVO DIGITAL	477	Nº DE DISEÑOS	t
526	82	SEGUIMIENTO Y ANÁLISIS DEL ENTORNO	INFORME	INFORME TÉCNICO DIGITAL	577	Nº DE INFORMES	t
527	82	REDACCIÓN DE NOTAS DE PRENSA Y TRABAJOS   ESPECIALES	NOTAS DE PRENSA	ARCHIVO DIGITAL	746	Nº DE NOTAS DE PRENSA	t
528	82	AMB. ESPACIOS PARA PAUTAS DEL GOBIERNO DE ARAGUA 	PAUTAS	ARCHIVO DIGITAL	75	ANUNCIOS	t
529	82	DIFUSIÓN DE ANUNCIOS PUBLICITARIOS DE LA GESTIÓN DE GOBIRENO	ANUNCIOS	ARCHIVO DIGITAL	68	Nº DE ANUNCIOS	t
530	83	REVISIÓN DE PUNTOS DE CUENTAS E INFORMACIÓN DE LOS ÓRGANOS	PUNTOS DE CUENTAS	DOCUMENTO	450	Nº DE PUNTOS DE CUENTAS REVISADOS	t
531	83	REDACCIÓN DE PROPUESTAS DE PROYECTOS, DECRETOS Y NOTIFICACIO	DECRETOS,  NOTIFICACIONES, CONVENIO	DOCUMENTO	280	Nº DE DOCUMENTOS REDACTADOS	t
532	83	REDACCIONES DE OFICIOS AL CLEBA Y AL GOBERNADOR	OFICIOS	DOCUMENTO	465	Nº DE OFICIOS AL CLEBA Y AL GOBERNADOR R	t
533	84	REVISIÓN DE PUNTOS DE CUENTAS E INFORMACIÓN DE LOS  ÓRGANOS	PUNTOS DE CUENTAS	DOCUMENTOS	480	Nº DE PUNTOS DE CUENTA REVISADOS	t
534	84	REDACCIÓN DE PROPUESTA DE PROYECTO, DECRETOS, NOTIFICACIONES	DECRETOS, NOTIFICACIONES, CONVENIOS	DOCUMENTOS	280	Nº DE DECRETOS Y NOTIFICACIONES REDACTAD	t
535	84	REDACCIONES DE OFICIOS AL CLEBA Y AL  GOBERNADOR	OFICIOS	DOCUMENTO	465	Nº DE OFICIOS AL CLEBA Y AL GOBERNADOR R	t
536	84	REDACCIONES DE PUNTOS DE CUENTA AL EJECUTIVO NACIONAL	PUNTOS DE CUENTA	DOCUMENTO	60	Nº DE PUNTOS DE CUENTA AL EJECUTIVO NACI	t
537	84	SUPERVISIONES DE LAS ACTIVIDADES DE TODOS LOS ÓRGANOS	ACTIVIDADES	AGENDA	104	Nº DE SUPERVISIONES DE LAS ACTIVIDADES D	t
538	84	REMISIÓN DE PUNTOS DE CUENTA APROBADOS A LA COMISIÓN	PERSONAS ATENDIDAS	REPORTES DE ATENCIÓN AL PUEBLO	11000	Nº DE PERSONAS ATENDIDAS	t
539	84	REVISIÓN DE METODOLOGÍA DE LOS PROYECTOS EL FCI	PROYECTOS APROBADOS	REPORTES DEL SISTEMA	30	Nº DE PROYECTOS APROBADOS Y CARGADOS AL 	t
540	84	SUPERVISIÓN DE CUSTODIA DEL PALACIO DE GOBIERNO	ACTA SEMANAL	LIBRO DE ACTAS	55	Nº DE ACTAS SUPERVISADAS	t
541	85	ATENCION DE EMERGENCIAS	SERVICIOS 	ESTADISTICAS	12000	Nº DE EMERGENCIAS ATENDIDAS 	t
542	85	INSPECCIONES PREVENTIVAS	INSPECCIONES	ESTADISTICAS	16000	Nº DE INSPECCIONES REALIZADAS	t
543	85	ACTIVIDAD DE CAPACITACIÓN	CAPACITACIÓN 	ESTADISTICAS	200	Nº DE CAPACITACIONES REALIZADAS	t
544	86	ATENCION INTEGRAL PARA LA PRESERVACION DE LA SALUD	NUMERO DE PERSONAS ASISTIDAS	INFORME DE GESTION	6000	INFORME GESTION	t
545	87	POTESTAD INVESTIGATIVA	INFORME  AUTOS NOTIFICADOS	INFORME  AUTOS NOTIFICADOS	364	NUMERO DE INFORME REALIZADOS	t
546	87	OPTIMIZAR LOS PROCEDIMIENTOS, NORMAS Y SISTEMAS INFORMATICOS	INFORMES Y MANUALES	DOCUMENTOS	43	PROCEDIMIENTOS Y SISTEMAS ACTUALIZADOS	t
547	87	EVALUAR EL PROCESO DE PLANIFICACIÓN Y PRESUPUESTO	INFORMES	DOCUMENTOS	259	NÚMERO DE INFORMES REALIZADOS	t
548	87	EVALUAR EL CONTROL INTERNO DEL ORGANISMO	REVISIÓN FISCAL	INFORMES	8	NÚMERO DE ACTUACIONES FISCALES REALIZADA	t
549	87	DETERMINACIÓN DE RESPONSABILIDAD 	INFORME,AUTOS,ANALISIS,AUDIENCIA,MULTAS	EXPEDIENTES	129	NÚMEROS DE DETERMINACIÓN DE RESPONSABILI	t
550	87	CONTROL Y EJECUCIÓN DEL PRESUPUESTO DE GASTOS	REPORTES, EJECUCIÓN PRESUPUESTARIA	ESTADOS FINANCIERON, REPORTADO	95	COMPROMETER, CAUSAR Y PAGAR EL PPTO. ASI	t
551	87	ATENDER, ORIENTAR Y CAPACITAR LAS COMUNID. EN CONTROL FISCAL	CAPACITACIONES,DENUNCIA,ASESORIAS	REGISTRO DE ASISTENCIA,ACTAS,OFICIO	1125	LAS CAPACITADAS O ATENDIDAS	t
552	87	ASESORÍA Y APOYO EN MATERIA JURÍDICA	CONSULTAS, CONTRATOS, RESOLUCIONES	CONSULTAS, CONTRATOS, RESOLUCIONES	203	NÚMERO DE ASESORÍAS REALIZADAS	t
553	87	APOYO A LA RELACIÓN LABORAL DE LOS TRABAJADORES	NÓMINA, REPORTES E INFORMES	NÓMINA, REPORTES E INFORMES	660	NÚMERO DE TRABAJADORES BENEFICIADOS	t
554	87	ACTUACIONES FISCALES A LOS ENTES DESCENTRALIZADOS	REVISIÓN FISCAL	INFORMES	30	NÚMEROS DE ACTUACIONES FISCALES REALIZAD	t
555	88	TALLERES DIRIGIDOS A COLECTIVOS ORGANIZADOS	TALLERES	PUNTO DE INFORMACIÓN	24	N° DE TALLERES EFECTUADOS	t
556	88	OPERATIVO DE ASESORÍA JURÍDICA Y REDACCIÓN DE DOCUMENTOS 	OPERATIVOS Y DOCUMENTOS SIMPLES	 PUNTO DE INFORMACIÓN	24	N° DE OPERATIVOS EFECTUADOS	t
557	88	OBSERVAR LOS PROCESOS DE CONTRATACIONES PÚBLICAS	PROCESOS	INVITACIONES Y CREDENCIALES	60	N° DE PROCESOS REALIZADOS	t
558	88	ASESORAR Y REPRESENTAR JURÍDICAMENTE AL PÚBLICO EN GENERAL	ASESORIAS	PLANILLA DE RECEPCIÓN DE SOLICITUD	2000	N° DE ASESORÍAS REALIZADAS	t
559	88	APOYO LEGAL A LAS INSTITUCIONES ESTADAL Y NACIONAL	OFICIOS Y MEMORÁNDUM	COMUNICACIONES ENVIADAS Y RECIBIDAS	60	N° DE COMUNICACIONES ENVIADAS	t
560	88	ANÁLISIS DE LEYES 	INFORMES	INFORMES TÉCNICO-LEGAL	24	N° DE LEYES ANALIZADAS	t
561	89	SESIONES DE CÁMARA	PROPUESTAS 	INFORMES	96	 ASAMBLEAS REALIZADAS	t
562	89	PARLAMENTARISMO DE CALLE	AUDIENCIAS	INFORMES Y MINUTAS	150	AUDIENCIAS REALIZADAS	t
563	89	EVALUACIÓN DE CRÉDITOS ADICIONALES	SOLICITUDES DE CRÉDITOS ADICIONALES	INFORMES	165	CRÉDITOS ADICIONALES APROBADOS	t
564	89	ELABORAR Y DISCUTIR PROYECTOS DE LEY	LEYES	INFORMES	4	LEYES APROBADAS	t
565	89	EJERCER CONTROL LEGISLATIVO	INVESTIGACIONES 	INFORMES Y MINUTAS	12	INVESTIGACIONES REALIZADAS	t
566	90	TRABAJO DE APOYO A LAS ACTIVIDADES PARLAMENTARIAS	TRABAJOS	INFORMES	364	NÚMERO DE TRABAJOS REALIZADOS EN EL AÑO	t
567	91	BENEFICIOS CONTRACTUALES A JUBILADOS Y PENSIONADOS	NOMINA	ORDEN DE PAGO	12	NUMERO DE NOMINAS DE PAGO REALIZADAS	t
568	92	IMPARTIR TALLER DE: ELECTRICIDAD	TALLER	INFORME DE LA DIRECCION DE ACADEMICO	7	CANTIDAD DE TALLERES  IMPARTIDOS	t
569	92	IMPARTIR TALLER DE: DESARROLLO DE PROYECTOS COMUNITARIOS	TALLER	INFORME DE LA DIRECCION DE PROYECTOS	5	CANTIDAD DE TALLERES  IMPARTIDOS	t
570	92	IMPARTIR TALLER DE: INFORMATICA BASICA APLICADA	TALLER	INFORME DE LA DIRECCION DE ACADEMICO	4	CANTIDAD DE TALLERES  IMPARTIDOS	t
571	92	IMPARTIR TALLER DE: HERRERIA	TALLER	INFORME DE LA DIRECCION DE ACADEMICO	4	CANTIDAD DE TALLERES  IMPARTIDOS	t
572	92	IMPARTIR TALLER DE: FABRICACION DE BATEAS	TALLER	INFORME DE LA DIRECCION DE ACADEMICO	4	CANTIDAD DE TALLERES  IMPARTIDOS	t
573	92	IMPARTIR TALLER DE: INSTALACIONES SANITARIAS	TALLER	DIRECCION 	2	CANTIDAD DE TALLERES  IMPARTIDOS	t
574	92	IMPARTIR TALLER DE: INSTALACION DE COLECTORES - INDUCCION	TALLER	INFORME DE LA DIRECCION DE ACADEMICO	2	CANTIDAD DE TALLERES  IMPARTIDOS	t
575	92	IMPARTIR CURSO DE: EL CONSTRUCTOR POPULAR	CURSO	INFORME DE LA DIRECCION DE ACADEMICO	2	CANTIDAD DE CURSOS IMPARTIDOS	t
576	93	ATENDER USUARIOS EN EL USO DE LAS TIC´S	USUARIO	REPORTE DEL SISTEMA	11000	NRO DE USUARIOS ATENDIDOS 	t
577	93	CAPACITAR AL PUEBLO EN TECNOLOGÍAS LIBRES	USUARIO	REGISTRO DE ASISTENCIA Y CERTIFICADOS 	5500	NRO. DE USUARIOS FORMADOS.	t
578	93	PROPORCIONAR APOYO A LOS CONSEJOS COMUNALES EN LAS TIC´S	APOYO 	REGISTRO DE ASISTENCIA Y FOTOGRÁFICO 	500	NRO. DE APOYOS BRINDADOS	t
579	93	PROPORCIONAR FORTALECIMIENTO TECNOLÓGICO A LAS INST. DEL EST	ACTIVIDAD	MINUTA Y REGISTRO FOTOGRÁFICO 	100	NRO. DE ACTIVIDADES REALIZADAS 	t
580	93	ORGANIZAR PLANES RECREACIONALES COMUNITARIOS 	ACTIVIDAD	REGISTRO DE ASISTENCIA Y FOTOGRÁFICO 	4	NRO. DE ACTIVIDADES RECREACIONALES REALI	t
581	94	INGRESAR	MEDIDA	MEDIOS	1	INDIADORE	t
582	95	REPROGRAFÍA Y DIGITALIZACIÓN DE DOCUMENTOS	DOCUMENTOS	REGISTROS Y SOPORTES FISICOS Y DIGITALES	175	NÚMERO DE DOCUMENTOS  DIGITALIZADOS	t
583	95	RECEPCIÓN Y ORGANIZACIÓN DE DOCUMENTOS	DOCUMENTOS	REGISTROS Y SOPORTES FISICOS Y DIGITALES	175	NÚMEROS DE DOCUMENTOS ORGANIZADOS	t
584	95	CUSTODIA Y CONSERVACIÓN DE DOCUMENTOS	DOCUMENTOS	REGISTROS Y SOPORTES FISICOS Y DIGITALES	175	NÚMEROS DE DOCUMENTOS CUSTODIADOS 	t
\.


--
-- Name: distribucion_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_actividad_id_seq', 584, true);


--
-- Data for Name: distribucion_trimestral_acc_especifica; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_trimestral_acc_especifica (id, pk, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, total, id_acc) FROM stdin;
\.


--
-- Name: distribucion_trimestral_acc_especifica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_trimestral_acc_especifica_id_seq', 1, false);


--
-- Data for Name: distribucion_trimestral_actividad; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_trimestral_actividad (id, id_acc_reg, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, total, id_actividad) FROM stdin;
20	7	4	5	5	6	20	20
53	9	6	50	51	50	157	53
34	9	11	0	0	0	11	34
1	2	11	25	17	17	70	1
21	7	1	6	3	5	15	21
2	3	1875	1875	1875	1875	7500	2
3	4	0	1	2	0	3	3
48	10	12	29	44	51	136	48
36	9	77	84	89	68	318	36
6	5	55	4	46	94	199	6
25	5	5	5	5	5	20	25
54	9	40	41	40	40	161	54
72	13	60	60	60	60	240	72
7	6	55	4	46	94	199	7
26	5	7	7	7	7	28	26
49	10	12	24	38	47	121	49
38	9	9	13	11	11	44	38
10	6	5	5	5	5	20	10
78	15	125	376	328	156	985	78
27	5	2400	2400	2400	2400	9600	27
75	14	125	376	328	156	985	75
11	6	7	7	7	7	28	11
73	13	479	479	479	479	1916	73
39	9	56	100	82	75	313	39
28	5	450	450	450	450	1800	28
13	6	2400	2400	2400	2400	9600	13
51	10	10	11	12	14	47	51
37	10	5	8	6	5	24	37
14	6	450	450	450	450	1800	14
63	12	14	13	12	12	51	63
29	8	1000	1000	1000	1000	4000	29
40	9	7	19	17	16	59	40
8	7	10	10	15	5	40	8
82	15	44	45	46	51	186	82
67	13	164	164	165	165	658	67
30	8	1500	1500	1500	1500	6000	30
9	7	5	8	6	5	24	9
12	7	5	19	33	17	74	12
15	7	22	34	24	17	97	15
22	7	\N	\N	\N	\N	\N	22
23	7	\N	\N	\N	\N	\N	23
24	7	\N	\N	\N	\N	\N	24
16	7	10	11	12	14	47	16
17	7	7	16	10	7	40	17
18	7	10	25	15	13	63	18
19	7	9	21	21	13	64	19
41	10	4	5	5	6	20	41
55	10	5	46	0	0	51	55
43	9	1944	2746	3441	3844	11975	43
56	10	\N	\N	\N	\N	\N	56
31	9	18	30	24	15	87	31
57	10	\N	\N	\N	\N	\N	58
58	10	\N	\N	\N	\N	\N	57
46	9	13	19	14	15	61	47
32	9	29780	29909	29909	29881	119479	32
47	9	303	399	392	332	1426	46
35	10	9	21	21	13	64	35
64	12	8	8	7	7	30	64
50	9	51	20	51	49	171	50
42	10	10	15	15	5	45	42
33	9	21532	21625	21573	21581	86311	33
69	13	4	4	4	3	15	69
59	11	14	13	12	12	51	59
52	9	29	28	29	28	114	52
44	10	10	25	15	13	63	44
65	12	1	0	1	0	2	65
60	11	8	8	7	7	30	60
83	15	20	18	22	18	78	83
45	10	5	19	33	17	74	45
68	13	6840	6840	6840	6840	27360	68
81	15	48	46	48	47	189	81
66	12	8	8	8	8	32	66
61	11	1	0	1	0	2	61
62	11	8	8	8	8	32	62
76	14	1111	664	613	378	2766	76
70	13	14077	14078	14078	14078	56311	70
71	13	1	1	1	1	4	71
74	14	22689553	21020294	28406752	27883399	99999998	74
77	15	22689553	21020294	28406752	27883399	99999998	77
79	15	9	15	15	9	48	79
80	15	1111	664	613	378	2766	80
84	15	90302	90302	90302	90302	361208	84
95	16	\N	\N	\N	\N	\N	95
96	16	\N	\N	\N	\N	\N	96
97	16	\N	\N	\N	\N	\N	97
98	16	\N	\N	\N	\N	\N	98
86	16	95	0	0	0	95	86
93	16	0	1	0	1	2	93
85	16	95	0	0	0	95	85
87	16	0	8	0	0	8	87
88	16	15	15	15	15	60	88
89	16	6	18	18	14	56	89
90	16	7	17	6	10	40	90
91	16	6	10	5	7	28	91
92	16	3	3	3	5	14	92
4	2	0	0	0	0	0	4
131	22	9	9	9	9	36	131
94	16	1	1	1	1	4	94
142	24	60	60	60	60	240	142
117	20	2500	2500	2500	2500	10000	117
99	17	95	0	0	0	95	99
132	22	3	3	3	3	12	132
118	20	125	125	125	125	500	118
100	17	95	0	0	0	95	100
101	17	0	8	0	0	8	101
119	20	240	240	240	240	960	119
102	17	15	15	15	15	60	102
103	17	6	18	18	14	56	103
104	18	3	3	0	0	6	104
143	24	30	30	30	30	120	143
105	18	22	33	33	33	121	105
120	21	6312	6313	6312	6313	25250	120
133	23	15	15	15	15	60	133
106	18	1156	1094	877	0	3127	106
121	21	4875	4875	4875	4875	19500	121
167	30	1200	2250	2250	200	5900	167
107	18	198	198	198	198	792	107
144	24	300	300	300	300	1200	144
134	23	625	625	625	625	2500	134
122	21	11187	11187	11187	11187	44748	122
108	18	1545	1545	1545	1545	6180	108
158	27	3	3	3	3	12	158
151	26	3	3	3	3	12	151
170	30	1	1	1	1	4	170
109	19	156	156	156	156	624	109
123	21	5375	5375	5375	5375	21500	123
135	23	200	200	200	200	800	135
145	24	3	0	0	0	3	145
110	19	3	3	0	0	6	110
163	28	388	388	388	388	1552	163
124	21	43800	43800	43800	43800	175200	124
164	29	\N	\N	\N	\N	\N	164
111	19	3	3	3	3	12	111
136	23	30	30	30	30	120	136
159	27	3	3	3	3	12	159
125	21	2500	2500	2500	2500	10000	125
112	20	6312	6313	6312	6313	25250	112
146	24	75	75	75	75	300	146
137	23	30	30	30	0	90	137
113	20	4875	4875	4875	4875	19500	113
126	21	125	125	125	125	500	126
114	20	11188	11187	11188	11187	44750	114
127	21	240	240	240	240	960	127
115	20	5375	5375	5375	5375	21500	115
116	20	43800	43800	43800	43800	175200	116
128	22	300	300	300	300	1200	128
129	22	1875	1875	1875	1875	7500	129
152	26	3	3	3	3	12	152
153	26	1	1	1	1	4	153
130	22	3500	3500	3500	3500	14000	130
138	24	15	15	15	15	60	138
147	24	150	150	150	150	600	147
139	24	625	625	625	625	2500	139
140	24	200	200	200	200	800	140
154	26	3	3	3	3	12	154
141	24	30	30	30	30	120	141
155	26	3	3	3	0	9	155
160	28	1	1	1	1	4	160
150	25	0	0	2	1	3	150
148	25	6	6	6	6	24	148
149	25	6	6	6	6	24	149
156	27	1	1	1	1	4	156
161	28	764437	764437	764437	764437	3057748	161
157	27	3	3	3	3	12	157
168	30	200	300	450	550	1500	168
165	30	1500	0	0	0	1500	165
162	28	108949	108949	108949	108949	435796	162
171	30	2	2	2	2	8	171
166	30	5	15	20	10	50	166
169	30	500	1500	1500	1500	5000	169
180	31	\N	\N	\N	\N	\N	180
172	30	1	1	1	1	4	172
175	31	12000	2250	2250	2250	18750	175
174	31	5	15	20	10	50	174
176	31	500	1500	1500	1500	5000	176
173	31	1500	0	0	0	1500	173
177	31	1	1	1	1	4	177
179	31	1	1	1	1	4	179
178	31	2	2	2	2	8	178
191	32	\N	\N	\N	\N	\N	191
192	32	\N	\N	\N	\N	\N	192
193	32	\N	\N	\N	\N	\N	193
185	32	3	3	0	0	6	185
181	32	0	1	1	1	3	181
182	32	15	17	18	14	64	182
183	32	0	1	2	0	3	183
184	32	17	16	15	13	61	184
186	32	6	6	5	5	22	186
188	32	3	3	3	1	10	188
190	32	3	3	3	0	9	190
212	34	1	1	0	0	2	212
187	32	2	2	2	0	6	187
251	37	0	1	0	0	1	251
189	32	1	2	2	1	6	189
204	33	\N	\N	\N	\N	\N	204
205	33	\N	\N	\N	\N	\N	205
206	33	\N	\N	\N	\N	\N	206
265	38	10	11	10	11	42	265
223	35	7	3	15	15	40	223
213	34	37	37	37	39	150	213
194	33	0	1	1	1	3	194
234	36	1	0	0	0	1	234
245	37	62	0	0	0	62	245
257	37	0	96	96	96	288	257
195	33	15	17	18	14	64	195
224	35	6	6	6	0	18	224
260	38	5	6	5	6	22	260
215	34	3	3	3	3	12	215
196	33	0	1	2	0	3	196
235	36	62	0	0	0	62	235
252	37	0	0	100	0	100	252
225	35	12	12	12	12	48	225
197	33	17	16	15	13	61	197
228	35	37	37	37	39	150	228
214	34	150	0	0	0	150	214
216	34	1	0	0	0	1	216
198	33	3	3	0	0	6	198
246	37	1	0	0	0	1	246
236	36	1	0	0	0	1	236
199	33	1	3	3	1	8	199
229	35	150	150	150	150	600	229
263	38	5	5	4	4	18	263
200	33	1	2	2	0	5	200
247	37	3	3	3	3	12	247
230	35	3	3	0	0	6	230
237	36	3	3	3	3	12	237
201	33	3	3	3	3	12	201
253	37	40	40	40	40	160	253
258	37	0	96	96	96	288	258
202	33	1	3	3	3	10	202
238	36	16	15	16	15	62	238
226	35	6	6	6	6	24	226
254	37	70	70	70	70	280	254
248	37	16	16	15	15	62	248
227	35	1	1	1	1	4	227
217	34	30000	25000	25000	20000	100000	217
203	33	0	2	1	0	3	203
239	36	0	0	72	0	72	239
207	34	15	15	15	0	45	207
240	36	0	1	0	0	1	240
231	35	1	2	1	1	5	231
208	34	7	3	15	0	25	208
220	34	100	100	100	90	390	220
209	34	6	6	6	0	18	209
218	34	55	55	0	0	110	218
219	34	2	2	0	0	4	219
210	34	12	12	12	12	48	210
233	35	55	55	55	55	220	233
211	34	6	6	6	6	24	211
221	34	1300	1300	1300	12000	15900	221
232	35	30000	25000	25000	20000	100000	232
222	35	15	15	15	15	60	222
241	29	\N	\N	\N	\N	\N	241
242	29	\N	\N	\N	\N	\N	242
243	29	\N	\N	\N	\N	\N	243
249	37	0	62	0	0	62	249
255	37	75	75	75	75	300	255
244	37	1	0	0	0	1	244
266	38	\N	\N	\N	\N	\N	266
250	37	0	0	0	1	1	250
269	38	\N	\N	\N	\N	\N	269
256	37	0	96	96	96	288	256
270	38	\N	\N	\N	\N	\N	270
261	38	15	14	14	0	43	261
271	38	\N	\N	\N	\N	\N	271
272	38	\N	\N	\N	\N	\N	272
273	38	\N	\N	\N	\N	\N	273
274	38	\N	\N	\N	\N	\N	274
267	38	6	5	6	5	22	267
264	38	4	3	4	3	14	264
259	38	8	8	8	0	24	259
262	38	8	9	8	9	34	262
268	38	11	12	11	12	46	268
275	39	1	1	1	0	3	275
278	39	1	1	0	0	2	278
277	39	1	1	1	1	4	277
279	39	1	1	1	1	4	279
276	39	1	1	1	1	4	276
281	39	1	1	1	0	3	281
280	39	1	1	1	1	4	280
282	40	10	10	10	10	40	282
283	40	3	3	3	3	12	283
284	40	4	4	4	4	16	284
285	42	10	10	10	10	40	285
286	42	3	3	0	0	6	286
287	42	4	4	4	4	16	287
290	43	1100	1500	12000	700	15300	290
292	43	1900	1950	1850	18000	23700	292
346	50	44	45	0	0	89	346
353	52	0	1	1	0	2	353
288	43	800	1350	1000	850	4000	288
308	47	6	6	6	6	24	308
289	43	1200	1650	1300	850	5000	289
370	56	187	187	188	188	750	377
291	43	1400	1850	1600	1150	6000	291
326	48	1	1	1	1	4	326
339	49	247	759	579	825	2410	339
309	47	15	15	9	12	51	309
293	44	10	10	10	10	40	293
358	53	5	10	10	5	30	358
367	55	181	181	181	182	725	374
327	48	20	20	20	20	80	327
294	44	3	3	3	3	12	294
310	47	30	30	23	25	108	310
347	50	83	81	0	0	164	347
340	49	42	55	74	48	219	340
295	44	4	4	4	4	16	295
311	47	18	18	18	18	72	311
328	48	20	20	20	20	80	328
296	46	40	45	40	35	160	296
312	47	9	9	9	9	36	312
297	46	6	6	5	6	23	297
329	48	5	5	5	5	20	329
298	46	20	21	21	19	81	298
313	47	3	3	3	3	12	313
299	46	8	10	11	9	38	299
330	48	50	50	50	50	200	330
314	47	1	0	0	0	1	314
300	46	3	2	3	2	10	300
348	50	60	0	0	0	60	348
315	47	3	3	3	3	12	315
301	46	1	1	1	1	4	301
331	48	50	50	50	50	200	331
316	47	93	0	0	0	93	316
302	45	40	45	40	35	160	302
317	47	24	0	0	0	24	317
303	45	6	6	5	5	22	303
304	45	20	21	21	19	81	304
305	45	8	10	11	9	38	305
306	45	3	2	3	2	10	306
332	48	\N	\N	\N	\N	\N	332
333	48	\N	\N	\N	\N	\N	333
307	45	1	1	1	1	4	307
318	47	\N	\N	\N	\N	\N	318
319	47	\N	\N	\N	\N	\N	319
320	47	\N	\N	\N	\N	\N	320
321	47	\N	\N	\N	\N	\N	321
341	50	162	160	157	157	636	341
322	48	1	0	0	0	1	322
334	49	162	160	157	157	636	334
323	48	150	150	150	150	600	323
354	52	1	1	1	1	4	354
342	50	18	17	17	17	69	342
335	49	44	45	44	0	133	335
324	48	100	150	150	150	550	324
362	54	1	1	1	1	4	362
365	54	5	15	25	5	50	365
349	51	125	125	125	125	500	349
325	48	12	12	12	12	48	325
336	49	18	17	17	17	69	336
343	50	42	55	74	48	219	343
359	53	5	15	25	5	50	359
355	52	3	4	4	4	15	355
337	49	60	74	75	65	274	337
369	55	75	75	75	75	300	376
350	51	1	1	1	1	4	350
344	50	247	759	579	825	2410	344
338	49	83	81	103	81	348	338
363	54	0	7	6	2	15	363
356	52	1	1	1	1	4	356
351	51	0	1	1	0	2	351
345	50	272	272	272	278	1094	345
360	53	1	4	3	2	10	360
352	51	10	10	15	15	50	352
357	53	0	7	6	2	15	357
366	54	1	4	3	2	10	366
361	54	1	1	1	1	4	361
364	54	5	10	10	5	30	364
368	55	37	37	37	39	150	375
371	56	37	37	38	38	150	378
372	56	75	75	75	75	300	379
383	57	\N	\N	\N	\N	\N	390
384	57	\N	\N	\N	\N	\N	391
375	57	5	8	8	10	31	382
373	57	3	3	3	3	12	380
374	57	0	1	1	0	2	381
376	57	225	223	234	261	943	383
377	57	50	85	80	70	285	384
378	57	30	25	35	35	125	385
379	57	13	14	10	10	47	386
380	57	10	12	8	9	39	387
381	57	5	8	10	0	23	388
382	57	3	3	3	3	12	389
438	67	\N	\N	\N	\N	\N	445
439	67	\N	\N	\N	\N	\N	446
385	58	473	445	407	440	1765	392
404	61	40	78	78	60	256	411
440	67	\N	\N	\N	\N	\N	447
386	58	80	100	120	140	440	393
418	64	5	5	0	0	10	425
441	67	\N	\N	\N	\N	\N	448
387	58	225	233	234	261	953	394
397	1	\N	\N	\N	\N	\N	404
405	61	13	13	13	13	52	412
442	67	\N	\N	\N	\N	\N	449
443	67	\N	\N	\N	\N	\N	450
388	1	1750	1750	1750	1750	7000	395
419	64	7	7	7	7	28	426
459	70	72	72	72	72	288	466
406	61	63	63	63	63	252	413
389	1	15	20	20	20	75	396
449	68	850	850	850	850	3400	456
453	69	15	11	12	12	50	460
420	64	2400	2400	2400	2400	9600	427
390	1	120	119	119	119	477	397
407	61	19	19	19	19	76	414
428	67	40	41	40	40	161	435
391	1	145	144	144	0	433	398
456	70	350	350	350	350	1400	463
408	61	19	19	19	19	76	415
392	1	187	187	186	0	560	399
393	1	20	15	20	20	75	400
421	64	2400	2400	2400	2400	9600	428
394	1	18	15	15	20	68	401
409	62	784	784	784	784	3136	416
464	71	7000	7000	7000	7000	28000	471
429	67	29	28	29	0	86	436
410	62	22	21	22	21	86	417
395	1	1	0	0	0	1	402
445	68	120	120	120	120	480	452
396	1	0	0	0	0	0	403
422	65	450	450	450	450	1800	429
5	2	0	0	0	0	0	5
454	69	91	90	92	92	365	461
411	62	22	44	52	31	149	418
398	59	0	0	9	9	18	405
461	70	12	12	13	13	50	468
423	65	7	7	7	7	28	430
412	62	36	66	66	58	226	419
399	59	30	10	5	5	50	406
400	60	35	20	25	20	100	407
430	67	6	50	51	50	157	437
446	68	1	2	0	0	3	453
401	60	0	0	9	0	9	408
444	68	900	900	900	900	3600	451
413	63	1875	1875	1875	1875	7500	420
402	60	15	20	15	10	60	409
424	65	55	4	46	94	199	431
431	67	51	20	51	0	122	438
403	60	8	4	9	9	30	410
447	68	1075	1075	1075	1075	4300	454
414	63	600	650	600	650	2500	421
425	65	5	5	5	5	20	432
415	63	2	3	3	3	11	422
432	67	56	100	82	75	313	439
416	63	6	4	7	9	26	423
426	66	15000	15000	15000	15000	60000	433
417	64	55	4	46	94	199	424
433	67	37	8	39	7	91	440
448	68	1200	1200	1200	1200	4800	455
427	66	1000	1000	1000	1000	4000	434
435	67	\N	\N	\N	\N	\N	442
436	67	\N	\N	\N	\N	\N	443
437	67	\N	\N	\N	\N	\N	444
455	69	284	280	281	280	1125	462
434	67	9	13	11	11	44	441
451	69	75	75	75	75	300	458
450	68	1000	1000	1000	1000	4000	457
452	69	195	195	195	195	780	459
457	70	2	2	3	3	10	464
460	70	42	42	43	43	170	467
458	70	216	216	216	216	864	465
469	72	90	89	92	92	363	476
470	72	822	823	820	820	3285	477
463	71	8000	8000	8000	8000	32000	470
465	71	3500	3500	3500	3500	14000	472
462	71	8	8	8	8	32	469
467	72	1005	1005	1005	1005	4020	474
466	72	274	274	274	274	1096	473
468	72	455	455	455	455	1820	475
471	73	9	9	5	0	23	478
472	73	1	0	0	0	1	479
473	73	0	0	0	0	0	480
484	74	\N	\N	\N	\N	\N	491
485	74	\N	\N	\N	\N	\N	492
486	74	\N	\N	\N	\N	\N	493
487	74	\N	\N	\N	\N	\N	494
476	74	81	88	90	86	345	483
478	74	81	88	90	86	345	485
480	74	81	88	90	86	345	487
482	74	81	88	90	86	345	489
513	81	18	15	15	20	68	520
549	88	6	6	0	0	12	556
474	74	30	30	30	29	119	481
500	77	235	365	360	240	1200	507
475	74	4	10	11	11	36	482
477	74	1	0	0	0	1	484
540	87	62	61	75	61	259	547
479	74	9	16	17	0	42	486
525	83	105	120	120	0	345	532
481	74	4	6	6	6	22	488
514	81	1	1	1	1	4	521
483	74	81	88	90	86	345	490
501	78	764437	764437	764437	764437	3057748	508
488	75	225	225	225	0	675	495
515	81	0	0	0	0	0	522
489	75	3	3	3	3	12	496
502	79	412344	412343	412343	412343	1649373	509
503	80	162	237	213	238	850	510
490	75	6	6	6	6	24	497
504	80	360	409	409	308	1486	511
491	75	50000	500000	50000	50000	650000	498
516	82	1750	1750	1750	1750	7000	523
492	75	1	1	1	1	4	499
505	80	34	34	34	35	137	512
534	85	3000	3000	3000	3000	12000	541
517	82	15	20	20	0	55	524
493	76	3	3	3	3	12	500
545	87	18	55	65	65	203	552
506	80	2859	3187	3135	3126	12307	513
494	76	42	42	42	42	168	501
495	76	3	3	3	3	12	502
496	77	76	124	124	76	400	503
555	89	30	60	45	15	150	562
526	84	90	120	120	120	450	533
518	82	120	119	119	119	477	525
497	77	100	100	100	100	400	504
507	81	1750	1750	1750	1750	7000	514
557	89	1	1	1	1	4	564
535	85	50	50	50	50	200	542
498	77	213	464	242	339	1258	505
553	88	6	6	6	6	24	560
508	81	15	20	0	0	35	515
519	82	145	144	144	144	577	526
499	77	290	227	238	227	982	506
527	84	40	80	808	80	1008	534
541	87	2	0	0	0	2	548
546	87	125	180	182	173	660	553
536	85	4000	400	0	0	4400	543
509	81	120	119	119	119	477	516
520	82	187	187	186	186	746	527
528	84	105	120	120	120	465	535
510	81	145	144	144	144	577	517
550	88	15	15	15	0	45	557
521	82	20	15	20	20	75	528
511	81	187	186	186	186	745	518
529	84	0	20	20	0	40	536
537	86	1500	1500	1500	1500	6000	544
512	81	20	15	20	20	75	519
522	82	18	15	15	20	68	529
530	84	14	30	30	30	104	537
523	83	90	120	0	0	210	530
531	84	1700	3100	3100	3100	11000	538
524	83	40	80	80	0	200	531
532	84	0	10	10	10	30	539
547	87	6	9	9	6	30	554
533	84	10	15	15	15	55	540
542	87	13	44	43	29	129	549
538	87	86	85	96	0	267	545
543	87	23	23	23	26	95	550
544	87	215	285	369	256	1125	551
539	87	11	11	11	11	44	546
551	88	500	500	500	500	2000	558
548	88	6	6	6	6	24	555
559	90	86	106	66	106	364	566
552	88	10	20	20	10	60	559
556	89	30	60	60	45	195	563
554	89	24	24	24	0	72	561
558	89	1	4	4	3	12	565
560	91	3	3	3	3	12	567
564	92	1	1	0	0	2	571
562	92	1	1	2	1	5	569
566	92	1	0	1	0	2	573
563	92	1	1	1	1	4	570
561	92	1	2	2	2	7	568
565	92	1	1	1	1	4	572
567	92	0	1	0	1	2	574
568	92	0	1	1	0	2	575
569	93	25	25	25	25	100	576
570	93	125	125	125	125	500	577
571	93	0	0	4	4	8	578
572	93	1350	1350	1350	1350	5400	579
573	93	27550	27550	27550	27550	110200	580
574	94	0	0	0	0	0	581
575	95	43	44	44	45	176	582
576	95	43	44	44	44	175	583
577	95	43	44	44	44	175	584
\.


--
-- Name: distribucion_trimestral_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_trimestral_actividad_id_seq', 577, true);


--
-- Data for Name: distribucion_trimestral_financiera; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_trimestral_financiera (id, id_acc_reg, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, total, id_actividad) FROM stdin;
35	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	35
70	13	17146325	17146325	17146325	17146325	68585300	70
83	15	31038.869999999999	201703.059999999998	69810.6499999999942	51285.239999999998	353837.819999999949	83
30	8	25000000	25000000	25000000	25000000	100000000	30
8	7	4694.64999999999964	4694.64999999999964	4694.64999999999964	4694.64999999999964	18778.5999999999985	8
2	3	\N	\N	\N	\N	\N	2
3	4	\N	\N	\N	\N	\N	3
13	6	3005612850	3182683870	3035747070	462249440	9686293230	13
9	7	4694.64999999999964	4694.64999999999964	4694.64999999999964	4694.64999999999964	18778.5999999999985	9
7	6	5510290220	424357850	4654812170	1448381590	12037841830	7
12	7	4694.64999999999964	4694.64999999999964	4694.64999999999964	4694.64999999999964	18778.5999999999985	12
15	7	4694.64999999999964	4694.64999999999964	4694.64999999999964	4694.64999999999964	18778.5999999999985	15
40	9	5000000	5000000	5000000	5000000	20000000	40
51	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	51
71	13	6173616	6173616	6173616	6173614	24694462	71
31	9	3000000	3000000	3000000	3000000	12000000	31
59	11	96709.9400000000023	96709.9400000000023	96709.9400000000023	96709.9400000000023	386839.760000000009	59
16	7	4694.64999999999964	4694.64999999999964	4694.64999999999964	4694.64999999999964	18778.5999999999985	16
37	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	37
32	9	6750000	6750000	6750000	6750000	27000000	32
14	6	13525257830	14481211610	13964436520	2126347440	44097253400	14
26	5	\N	\N	\N	\N	\N	26
27	5	\N	\N	\N	\N	\N	27
28	5	\N	\N	\N	\N	\N	28
55	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	55
43	9	5250000	5250000	5250000	5250000	21000000	43
79	15	77845.2200000000012	75241.0599999999977	56761.0599999999977	35369.0400000000009	245216.380000000005	79
82	15	66970.1300000000047	14757.0599999999995	129872	21992.2400000000016	233591.429999999993	82
72	13	7500000	7500000	7500000	7500000	30000000	72
63	12	125000	125000	125000	125000	500000	63
17	7	\N	\N	\N	\N	\N	17
18	7	\N	\N	\N	\N	\N	18
19	7	\N	\N	\N	\N	\N	19
20	7	\N	\N	\N	\N	\N	20
21	7	\N	\N	\N	\N	\N	21
22	7	\N	\N	\N	\N	\N	22
23	7	\N	\N	\N	\N	\N	23
24	7	\N	\N	\N	\N	\N	24
6	5	126848300	1592647	978459	0	129419406	6
47	9	3750000	3750000	3750000	0	11250000	46
41	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	41
10	6	15779467450	16894746880	16291842610	2480738680	51446795620	10
33	9	6000000	6000000	6000000	0	18000000	33
73	13	10069074	10069074	10069074	10069075	40276297	73
11	6	15779467450	16894746880	16291842610	2480738680	51446795620	11
50	9	3750000	3750000	3750000	3750000	15000000	50
46	9	6750000	6750000	6750000	6750000	27000000	47
64	12	125000	125000	125000	125000	500000	64
25	5	363250270	63407254	3424608	0	430082132	25
34	9	5000000	5000000	5000000	0	15000000	34
42	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	0	288461.550000000047	42
85	16	1000000	0	0	0	1000000	85
44	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	44
52	9	3750000	3750000	3750000	3750000	15000000	52
29	8	25000000	25000000	25000000	25000000	100000000	29
36	9	4250000	4250000	4250000	4250000	17000000	36
78	15	408070.770000000019	349897.169999999984	358677.969999999972	404873.130000000005	1521519.04000000004	78
65	12	125000	125000	125000	125000	500000	65
45	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	45
81	15	386291.059999999998	568840.670000000042	300777.270000000019	494245.679999999993	1750154.67999999993	81
38	9	6750000	6750000	6750000	6750000	27000000	38
53	9	3750000	3750000	3750000	3750000	15000000	53
69	13	8432478	8432478	8432478	8432478	33729912	69
54	9	19254825	0	0	0	19254825	54
39	9	6000000	6000000	6000000	0	18000000	39
48	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	48
56	10	\N	\N	\N	\N	\N	56
57	10	\N	\N	\N	\N	\N	58
58	10	\N	\N	\N	\N	\N	57
49	10	96153.8500000000058	96153.8500000000058	96153.8500000000058	96153.8500000000058	384615.400000000023	49
60	11	96709.9499999999971	96709.9499999999971	96709.9499999999971	96709.9499999999971	386839.799999999988	60
84	15	80450.5099999999948	189414.149999999994	228016.510000000009	95296.8600000000006	593178.030000000028	84
66	12	125000	125000	125000	125000	500000	66
67	13	\N	\N	\N	\N	\N	67
61	11	96709.9499999999971	96709.9499999999971	96709.9499999999971	96709.9499999999971	386839.799999999988	61
62	11	96709.9400000000023	96709.9400000000023	96709.9499999999971	96709.9400000000023	386839.770000000019	62
77	15	314507.75	155969.130000000005	220705.880000000005	226683.670000000013	917866.430000000051	77
80	15	267325.690000000002	257677.700000000012	267878.659999999974	302754.140000000014	1095636.18999999994	80
68	13	11172037	11172037	11172037	11172036	44688147	68
76	14	2540651.25999999978	2596523.95999999996	2925366.02000000002	119486.559999999998	8182027.79999999981	76
74	14	3810976.89000000013	3894785.93999999994	4388049.03000000026	179229.839999999997	12273041.6999999993	74
75	14	6351628.15000000037	6491309.91000000015	7313415.05999999959	298716.400000000023	20455069.5199999996	75
86	16	2352679	0	0	0	2352679	86
95	16	\N	\N	\N	\N	\N	95
96	16	\N	\N	\N	\N	\N	96
97	16	\N	\N	\N	\N	\N	97
98	16	\N	\N	\N	\N	\N	98
87	16	0	40000	0	0	40000	87
88	16	25000	25000	25000	0	75000	88
89	16	183136.799999999988	103936.800000000003	103936.800000000003	54645.5999999999985	445655.999999999942	89
90	16	20000	20000	20000	20000	80000	90
91	16	20000	20000	20000	20000	80000	91
92	16	20000	20000	20000	20000	80000	92
93	16	0	200000	0	300000	500000	93
94	16	200000	200000	200000	200000	800000	94
102	17	1073665.10000000009	990064.550000000047	993447.439999999944	98427.6699999999983	3155604.75999999978	102
100	17	1073665.10000000009	990064.550000000047	993447.439999999944	98427.6699999999983	3155604.75999999978	100
99	17	1073665.19999999995	990064.550000000047	993447.439999999944	98427.6499999999942	3155604.83999999985	99
101	17	1073665.10000000009	990064.550000000047	993447.439999999944	98427.6699999999983	3155604.75999999978	101
103	17	1073665.10000000009	990064.550000000047	993447.439999999944	98427.6699999999983	3155604.75999999978	103
4	2	0	0	0	0	0	4
5	2	0	0	0	0	0	5
167	30	25915.8300000000017	25915.8300000000017	25915.8300000000017	51831.6800000000003	129579.170000000013	167
121	21	613014.849999999977	613014.849999999977	613014.849999999977	613014.849999999977	2452059.39999999991	121
104	18	1053828.30000000005	1053828.30000000005	1053828.30000000005	1053828.30000000005	4215313.20000000019	104
144	24	60000	60000	60000	120000	300000	144
163	28	15693.5300000000007	15693.5300000000007	15693.5300000000007	15693.5300000000007	62774.1200000000026	163
105	18	1053828.25	1053828.25	1053828.25	1053828.25	4215313	105
133	23	12896.2000000000007	128896.199999999997	128896.199999999997	257792.700000000012	528481.300000000047	133
164	29	\N	\N	\N	\N	\N	164
106	18	6322969.63999999966	6322969.63999999966	6322969.63999999966	6322969.63999999966	25291878.5599999987	106
145	24	60000	60000	60000	120000	300000	145
122	21	5219834	0	0	0	5219834	122
107	18	6322969.63999999966	0	0	0	6322969.63999999966	107
154	26	0	0	0	0	0	154
135	23	128896.199999999997	128896.199999999997	128896.199999999997	257792.399999999994	644481	135
155	26	0	0	0	0	0	155
108	18	6322969.63999999966	6322969.63999999966	0	0	12645939.2799999993	108
146	24	60000	60000	60000	120000	300000	146
123	21	818165.920000000042	818165.920000000042	818165.920000000042	818165.920000000042	3272663.68000000017	123
109	19	975961.969999999972	975961.969999999972	975961.969999999972	975961.969999999972	3903847.87999999989	109
147	24	30000	30000	30000	60000	150000	147
124	21	1412476.56000000006	1412476.56000000006	1412476.56000000006	1412476.56000000006	5649906.24000000022	124
110	19	336195.270000000019	336195.270000000019	336195.270000000019	0	1008585.81000000006	110
136	23	8590.79999999999927	8590.79999999999927	8590.79999999999927	171861.600000000006	197634	136
137	23	8590.79999999999927	8590.79999999999927	8590.79999999999927	171861.600000000006	197634	137
125	21	406213.979999999981	406213.979999999981	406213.979999999981	406213.979999999981	1624855.91999999993	125
111	19	336195.260000000009	336195.260000000009	336195.260000000009	336195.260000000009	1344781.04000000004	111
119	20	\N	\N	\N	\N	\N	119
112	20	0	0	0	0	0	112
126	21	658339.579999999958	658339.579999999958	658339.579999999958	658339.579999999958	2633358.31999999983	126
113	20	0	0	0	0	0	113
127	21	87762.4799999999959	87762.4799999999959	87762.4799999999959	87762.4799999999959	351049.919999999984	127
114	20	378712.460000000021	378712.460000000021	378712.460000000021	378712.460000000021	1514849.84000000008	114
115	20	0	0	0	0	0	115
116	20	699406.709999999963	699406.709999999963	699406.709999999963	699406.709999999963	2797626.83999999985	116
159	27	0	0	0	0	0	159
148	25	0	0	0	0	0	148
128	22	20312.5	20312.5	20312.5	20312.5	81250	128
138	24	90000	90000	90000	180000	450000	138
158	27	0	0	0	0	0	158
157	27	0	0	0	0	0	157
118	20	0	0	0	0	0	118
117	20	0	0	0	0	0	117
156	27	0	0	0	0	0	156
149	25	0	0	0	0	0	149
129	22	10156.25	10156.25	10156.25	10156.25	40625	129
120	21	524985.699999999953	524985.699999999953	524985.699999999953	524985.729999999981	2099942.83000000007	120
139	24	30000	30000	30000	60000	150000	139
130	22	10156.25	10156.25	10156.25	10156.25	40625	130
140	24	90000	90000	90000	180000	450000	140
150	25	0	0	0	0	0	150
131	22	12500	12500	12500	12500	50000	131
141	24	60000	60000	60000	120000	300000	141
132	22	12500	12500	12500	12500	50000	132
134	23	\N	\N	\N	\N	\N	134
142	24	60000	60000	60000	120000	300000	142
143	24	60000	60000	60000	120000	300000	143
160	28	7846.77000000000044	7846.77000000000044	0	0	15693.5400000000009	160
172	30	155495	155495	155495	310990.020000000019	777475.020000000019	172
151	26	0	0	0	0	0	151
168	30	25915.8300000000017	25915.8300000000017	25915.8300000000017	51831.6800000000003	129579.170000000013	168
153	26	0	0	0	0	0	153
152	26	0	0	0	0	0	152
161	28	31387.0699999999997	31387.0699999999997	31387.0699999999997	31387.0699999999997	125548.279999999999	161
169	30	207326.670000000013	207326.670000000013	207326.670000000013	414653.369999999995	1036633.38	169
162	28	23540.3100000000013	23540.3100000000013	23540.3100000000013	23540.3100000000013	94161.2400000000052	162
165	30	155495	155495	155495	310290.020000000019	776775.020000000019	165
166	30	155495	155495	155495	310290.020000000019	776775.020000000019	166
173	31	90000	90000	90000	180000	450000	173
176	31	15000	15000	15000	30000	75000	176
170	30	155495	155495	155495	310990.020000000019	777475.020000000019	170
171	30	155495	155495	155495	310990.020000000019	777475.020000000019	171
174	31	90000	90000	90000	180000	450000	174
177	31	120000	120000	120000	240000	600000	177
178	31	90000	90000	90000	180000	450000	178
175	31	15000	15000	0	30000	60000	175
179	31	90000	90000	90000	180000	450000	179
180	31	90000	90000	90000	180000	450000	180
191	32	\N	\N	\N	\N	\N	191
192	32	\N	\N	\N	\N	\N	192
193	32	\N	\N	\N	\N	\N	193
183	32	0	1	2	0	3	183
182	32	15	17	18	14	64	182
181	32	0	1	1	1	3	181
184	32	17	16	15	13	61	184
185	32	3	3	3	3	12	185
186	32	6	6	5	5	22	186
187	32	2	2	2	0	6	187
188	32	3	3	3	1	10	188
189	32	3	3	3	3	12	189
190	32	3	3	3	3	12	190
204	33	\N	\N	\N	\N	\N	204
201	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	201
197	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	197
199	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	199
203	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	203
205	33	\N	\N	\N	\N	\N	205
206	33	\N	\N	\N	\N	\N	206
223	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	223
262	38	0	0	0	0	0	262
251	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	251
268	38	0	0	0	0	0	268
194	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	194
224	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	224
239	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	91510.2400000000052	366040.960000000021	239
195	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	195
196	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	196
198	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	198
225	35	33333.3300000000017	33333.3300000000017	0	0	66666.6600000000035	225
200	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	200
252	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	252
202	33	57692.3000000000029	57692.3000000000029	57692.3000000000029	57692.3000000000029	230769.200000000012	202
217	34	\N	\N	\N	\N	\N	217
218	34	\N	\N	\N	\N	\N	218
219	34	\N	\N	\N	\N	\N	219
220	34	\N	\N	\N	\N	\N	220
221	34	\N	\N	\N	\N	\N	221
240	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	91510.2400000000052	366040.960000000021	240
226	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	226
207	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	207
227	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	227
208	34	196607.369999999995	196607.369999999995	196607.369999999995	0	589822.109999999986	208
228	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	228
209	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	209
229	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	229
210	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	210
254	37	\N	\N	\N	\N	\N	254
255	37	\N	\N	\N	\N	\N	255
256	37	\N	\N	\N	\N	\N	256
230	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	230
211	34	196607.369999999995	0	0	0	196607.369999999995	211
257	37	\N	\N	\N	\N	\N	257
258	37	\N	\N	\N	\N	\N	258
212	34	196607.369999999995	0	0	0	196607.369999999995	212
263	38	0	0	0	0	0	263
231	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	231
213	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	213
214	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	214
215	34	196607.369999999995	196607.369999999995	196607.369999999995	196607.369999999995	786429.479999999981	215
241	29	\N	\N	\N	\N	\N	241
242	29	\N	\N	\N	\N	\N	242
243	29	\N	\N	\N	\N	\N	243
216	34	196607.359999999986	196607.359999999986	196607.359999999986	196607.350000000006	786429.429999999935	216
232	35	\N	\N	\N	\N	\N	232
233	35	\N	\N	\N	\N	\N	233
253	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	253
244	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	244
222	35	33333.3300000000017	33333.3300000000017	33333.3300000000017	33333.3300000000017	133333.320000000007	222
234	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	91510.2400000000052	366040.960000000021	234
245	37	105263.149999999994	105263.149999999994	105263.149999999994	0	315789.449999999953	245
235	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	91510.2400000000052	366040.960000000021	235
236	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	91510.2400000000052	366040.960000000021	236
246	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	246
237	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	0	274530.72000000003	237
247	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	247
269	38	\N	\N	\N	\N	\N	269
238	36	91510.2400000000052	91510.2400000000052	91510.2400000000052	0	274530.72000000003	238
270	38	\N	\N	\N	\N	\N	270
271	38	\N	\N	\N	\N	\N	271
248	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	248
272	38	\N	\N	\N	\N	\N	272
273	38	\N	\N	\N	\N	\N	273
274	38	\N	\N	\N	\N	\N	274
249	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	249
264	38	0	0	0	0	0	264
250	37	105263.149999999994	105263.149999999994	105263.149999999994	105263.149999999994	421052.599999999977	250
284	40	0	0	0	0	0	284
265	38	0	0	0	0	0	265
259	38	0	0	0	0	0	259
275	39	17500000	17500000	17500000	17500000	70000000	275
260	38	0	0	0	0	0	260
266	38	0	0	0	0	0	266
282	40	78467.6699999999983	78467.6699999999983	78467.6699999999983	78467.6699999999983	313870.679999999993	282
280	39	3769458	3769458	3769458	3769458	15077832	280
261	38	0	0	0	0	0	261
278	39	23750000	23750000	23750000	23750000	95000000	278
267	38	0	0	0	0	0	267
276	39	286200	286200	286200	0	858600	276
286	42	0	0	0	0	0	286
283	40	0	0	0	0	0	283
281	39	2340212	2340212	0	0	4680424	281
279	39	3670247.39000000013	3670247.39000000013	3670247.39000000013	3670247.39000000013	14680989.5600000005	279
277	39	20912500	286200	286200	286200	21771100	277
285	42	78467.6699999999983	78467.6699999999983	78467.6699999999983	78467.6699999999983	313870.679999999993	285
288	43	9808.45000000000073	9808.45000000000073	9808.45000000000073	9808.45000000000073	39233.8000000000029	288
287	42	0	0	0	0	0	287
289	43	9808.45000000000073	9808.45000000000073	9808.45000000000073	9808.45000000000073	39233.8000000000029	289
291	43	9808.45000000000073	9808.45000000000073	9808.45000000000073	9808.45000000000073	39233.8000000000029	291
292	43	9808.45000000000073	9808.45000000000073	9808.45000000000073	0	29425.3500000000022	292
290	43	9808.45000000000073	9808.45000000000073	9808.45000000000073	0	29425.3500000000022	290
294	44	223214.279999999999	223214.279999999999	223214.279999999999	223214.279999999999	892857.119999999995	294
295	44	223214.299999999988	223214.299999999988	223214.299999999988	223214.299999999988	892857.199999999953	295
293	44	223214.26999999999	223214.279999999999	223214.279999999999	223214.279999999999	892857.109999999986	293
299	46	375000	375000	375000	375000	1500000	299
296	46	450000	450000	450000	450000	1800000	296
297	46	150000	150000	150000	150000	600000	297
298	46	300000	300000	300000	300000	1200000	298
301	46	75000	75000	75000	75000	300000	301
300	46	150000	150000	150000	150000	600000	300
332	48	\N	\N	\N	\N	\N	332
302	45	354101.809999999998	354101.809999999998	354101.809999999998	354101.809999999998	1416407.23999999999	302
333	48	\N	\N	\N	\N	\N	333
303	45	118033.940000000002	118033.940000000002	0	0	236067.880000000005	303
322	48	0	0	0	0	0	322
338	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	338
363	54	\N	\N	\N	\N	\N	363
354	52	767315.339999999967	81457.5399999999936	203427.23000000001	81457.5500000000029	1133657.66000000015	354
323	48	0	0	0	0	0	323
304	45	236067.880000000005	236067.880000000005	236067.880000000005	236067.880000000005	944271.520000000019	304
364	54	\N	\N	\N	\N	\N	364
339	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	339
349	51	196162.920000000013	196162.920000000013	196162.920000000013	196162.910000000003	784651.670000000042	349
324	48	0	0	0	0	0	324
365	54	\N	\N	\N	\N	\N	365
305	45	295084.849999999977	295084.849999999977	295084.849999999977	295084.849999999977	1180339.39999999991	305
366	54	\N	\N	\N	\N	\N	366
340	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	340
325	48	0	0	0	0	0	325
306	45	118033.940000000002	118033.940000000002	118033.940000000002	118033.940000000002	472135.760000000009	306
326	48	0	0	0	0	0	326
307	45	59016.9599999999991	59016.9599999999991	59016.9599999999991	59016.9599999999991	236067.839999999997	307
318	47	\N	\N	\N	\N	\N	318
319	47	\N	\N	\N	\N	\N	319
320	47	\N	\N	\N	\N	\N	320
321	47	\N	\N	\N	\N	\N	321
308	47	0	0	0	0	0	308
327	48	0	0	0	0	0	327
368	55	349472.679999999993	0	0	0	349472.679999999993	375
328	48	0	0	0	0	0	328
309	47	0	0	0	0	0	309
369	55	349472.679999999993	349472.679999999993	349472.679999999993	349472.679999999993	1397890.71999999997	376
350	51	196162.920000000013	196162.920000000013	196162.920000000013	196162.910000000003	784651.670000000042	350
310	47	0	0	0	0	0	310
329	48	0	0	0	0	0	329
341	50	156250	156250	156250	0	468750	341
355	52	363657.679999999993	81457.5500000000029	203427.23000000001	81457.5500000000029	730000.010000000009	355
330	48	0	0	0	0	0	330
351	51	196162.920000000013	196162.920000000013	196162.920000000013	196162.920000000013	784651.680000000051	351
311	47	0	0	0	0	0	311
312	47	0	0	0	0	0	312
342	50	156250	156250	156250	156250	625000	342
331	48	0	0	0	0	0	331
313	47	0	0	0	0	0	313
314	47	0	0	0	0	0	314
315	47	0	0	0	0	0	315
316	47	0	0	0	0	0	316
352	51	196162.920000000013	196162.920000000013	196162.920000000013	196162.920000000013	784651.680000000051	352
343	50	156250	156250	156250	156250	625000	343
317	47	0	0	0	0	0	317
334	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	334
356	52	\N	\N	\N	\N	\N	356
344	50	156250	156250	156250	156250	625000	344
335	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	335
384	57	\N	\N	\N	\N	\N	391
336	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	336
376	57	319596.640000000014	399495.799999999988	479394.960000000021	559294.119999999995	1757781.52000000002	383
377	57	199747.899999999994	339571.429999999993	319596.640000000014	279647.059999999998	1138563.03000000003	384
345	50	156250	156250	156250	0	468750	345
337	49	1173478.20999999996	1173478.20999999996	1173478.20999999996	1173478.20999999996	4693912.83999999985	337
346	50	156250	156250	156250	156250	625000	346
378	57	119848.740000000005	998773.949999999953	139823.529999999999	139823.529999999999	1398269.75	385
361	54	10276034.7799999993	10276034.7799999993	10276034.7799999993	10276034.7799999993	41104139.1199999973	361
370	56	349472.679999999993	349472.679999999993	349472.679999999993	349472.679999999993	1397890.71999999997	377
347	50	156250	156250	156250	156250	625000	347
357	53	19616.9099999999999	19616.9199999999983	19616.9199999999983	19616.9199999999983	78467.6699999999983	357
353	52	0	81457.5500000000029	203427.23000000001	0	284884.780000000028	353
348	50	156250	156250	156250	156250	625000	348
387	58	898865.550000000047	930825.219999999972	934820.170000000042	1042684.04000000004	3807194.97999999998	394
362	54	10276034.7799999993	10276034.7799999993	10276034.7799999993	10276034.7799999993	41104139.1199999973	362
358	53	19616.9099999999999	19616.9199999999983	19616.9199999999983	19616.9199999999983	78467.6699999999983	358
359	53	19616.9199999999983	19616.9199999999983	19616.9199999999983	19616.9199999999983	78467.679999999993	359
382	57	11984.8700000000008	11984.8700000000008	11984.8700000000008	11984.8899999999994	47939.5	389
371	56	349472.659999999974	349472.659999999974	349472.659999999974	349472.659999999974	1397890.6399999999	378
380	57	39949.5800000000017	47939.5	139823.529999999999	35954.6200000000026	263667.229999999981	387
373	57	11984.8700000000008	11984.8700000000008	11984.8700000000008	11984.8899999999994	47939.5	380
360	53	19616.9199999999983	19616.9199999999983	19616.9199999999983	19616.9199999999983	78467.679999999993	360
367	55	349472.679999999993	349472.679999999993	349472.679999999993	349472.679999999993	1397890.71999999997	374
372	56	349472.659999999974	349472.659999999974	349472.659999999974	349472.659999999974	1397890.6399999999	379
381	57	19974.7900000000009	31959.6599999999999	31959.6599999999999	39949.5899999999965	123843.699999999997	388
383	57	\N	\N	\N	\N	\N	390
375	57	898865.550000000047	930825.219999999972	934840.170000000042	1042684.04000000004	3807214.97999999998	382
374	57	0	3994.96000000000004	3994.96000000000004	0	7989.92000000000007	381
379	57	51934.4499999999971	55929.4100000000035	39944.5800000000017	39949.5899999999965	187758.029999999999	386
386	58	1278386.56000000006	1138563.03000000003	1238436.97999999998	1398235.31000000006	5053621.87999999989	393
385	58	1889615.1399999999	1777756.32000000007	1625947.90999999992	0	5293319.37000000011	392
1	2	1250000	1250000	1250000	1250000	5000000	1
388	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	395
389	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	396
390	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	397
391	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	398
392	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	399
393	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	400
394	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	401
395	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	402
396	1	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	403
397	1	60080.7200000000012	60080.7200000000012	0	0	120161.440000000002	404
399	59	500000	500000	0	0	1000000	406
398	59	0	0	10000000	10000000	20000000	405
469	72	0	50000	50000	50000	150000	476
400	60	0	0	0	0	0	407
456	70	208333	208333	208333	208333	833332	463
474	74	\N	\N	\N	\N	\N	481
401	60	0	0	0	0	0	408
417	64	1342956621.3499999	143388508.060000002	139615011.669999987	21163474.5100000016	1647123615.58999991	424
464	71	298089.940000000002	298089.940000000002	298089.940000000002	298089.940000000002	1192359.76000000001	471
463	71	298089.940000000002	298089.940000000002	0	0	596179.880000000005	470
402	60	0	0	0	0	0	409
457	70	208333	208333	208333	208333	833332	464
418	64	156678224.909999996	167286592.729999989	162884180.280000001	24807386.9299999997	511656384.849999964	425
475	74	\N	\N	\N	\N	\N	482
403	60	0	0	0	0	0	410
470	72	50000	50000	50000	50000	200000	477
425	65	3632502.70999999996	166876.760000000009	6381.26000000000022	0	3805760.72999999952	432
419	64	54713030.9200000018	4201861.04000000004	465338337.220000029	14483815.9700000007	538737045.149999976	426
404	61	25034999.8500000015	50006999.799999997	3337999.79999999981	5841999.65000000037	84221999.1000000089	411
445	68	26094.7000000000007	26094.7000000000007	26094.7000000000007	26094.7000000000007	104378.800000000003	452
420	64	156678224.909999996	167286592.729999989	162884180.280000001	24807386.4299999997	511656384.349999964	427
458	70	208333	208333	208333	208333	833332	465
426	66	250000	250000	250000	250000	1000000	433
405	61	2340614.43999999994	4701228.79999999981	3134152	6004386.15000000037	16180381.3900000006	412
465	71	298089.940000000002	298089.940000000002	298089.940000000002	298089.940000000002	1192359.76000000001	472
446	68	26094.7000000000007	26094.7000000000007	26094.7000000000007	26094.7000000000007	104378.800000000003	453
406	61	1899602.25	3799204.5	2532803	4432405.25	12664015	413
427	66	250000	250000	250000	250000	1000000	434
428	67	\N	\N	\N	\N	\N	435
429	67	\N	\N	\N	\N	\N	436
430	67	\N	\N	\N	\N	\N	437
407	61	244234.570000000007	488469.150000000023	323646.099999999977	569880.670000000042	1626230.48999999976	414
431	67	\N	\N	\N	\N	\N	438
432	67	\N	\N	\N	\N	\N	439
433	67	\N	\N	\N	\N	\N	440
408	61	569880.670000000042	113976.350000000006	759840.900000000023	132974.589999999997	1576672.51000000001	415
434	67	\N	\N	\N	\N	\N	441
435	67	\N	\N	\N	\N	\N	442
421	64	29843471.4200000018	31513957.8099999987	30351089.4899999984	4622494.45999999996	96331013.1799999923	428
409	62	44475	88950	103775	59300	296500	416
410	62	414004.5	828509	966010.800000000047	552006	2760530.29999999981	417
436	67	\N	\N	\N	\N	\N	443
437	67	\N	\N	\N	\N	\N	444
411	62	124495.5	248991	290489.5	165994	829970	418
438	67	\N	\N	\N	\N	\N	445
439	67	\N	\N	\N	\N	\N	446
440	67	\N	\N	\N	\N	\N	447
412	62	196275	392550	457975	261700	1308500	419
441	67	\N	\N	\N	\N	\N	448
442	67	\N	\N	\N	\N	\N	449
443	67	\N	\N	\N	\N	\N	450
413	63	43750	43750	43750	43750	175000	420
422	65	3113573.70999999996	1423608.09000000008	29353.7799999999988	0	4566535.58000000007	429
414	63	43750	43750	43750	43750	175000	421
415	63	43750	43750	43750	43750	175000	422
416	63	43750	43750	43750	0	131250	423
444	68	52189.4100000000035	52189.4100000000035	52189.4100000000035	52189.4100000000035	208757.640000000014	451
423	65	3632502.70999999996	1660876.09000000008	34246.0800000000017	0	5327624.87999999989	430
459	70	208333	208333	208333	208333	833332	466
451	69	1250000	1250000	1250000	1250000	5000000	458
424	65	1268493	41717.4300000000003	9784.57999999999993	0	1319995.01000000001	431
460	70	208335	208335	208335	208334	833339	467
452	69	0	1250000	1250000	1250000	3750000	459
476	74	\N	\N	\N	\N	\N	483
447	68	52189.4100000000035	52189.4100000000035	52189.4100000000035	52189.4100000000035	208757.640000000014	454
453	69	1250000	1250000	1250000	1250000	5000000	460
461	70	208333	208333	208333	208333	833332	468
448	68	52189.4100000000035	52189.4100000000035	52189.4100000000035	52189.4100000000035	208757.640000000014	455
454	69	1250000	1250000	1250000	1250000	5000000	461
449	68	52189.4100000000035	52189.4100000000035	52189.4100000000035	52189.4100000000035	208757.640000000014	456
466	72	50000	50000	50000	50000	200000	473
455	69	1250000	1250000	1250000	1250000	5000000	462
450	68	52189.4100000000035	52189.4100000000035	52189.4100000000035	52189.4100000000035	208757.640000000014	457
477	74	\N	\N	\N	\N	\N	484
478	74	\N	\N	\N	\N	\N	485
479	74	\N	\N	\N	\N	\N	486
467	72	50000	50000	50000	50000	200000	474
462	71	298089.940000000002	298089.940000000002	298089.940000000002	298089.940000000002	1192359.76000000001	469
471	73	78750	78750	0	0	157500	478
480	74	\N	\N	\N	\N	\N	487
481	74	\N	\N	\N	\N	\N	488
482	74	\N	\N	\N	\N	\N	489
483	74	\N	\N	\N	\N	\N	490
468	72	50000	50000	50000	50000	200000	475
472	73	8750	0	0	0	8750	479
484	74	\N	\N	\N	\N	\N	491
485	74	\N	\N	\N	\N	\N	492
486	74	\N	\N	\N	\N	\N	493
487	74	\N	\N	\N	\N	\N	494
473	73	0	0	0	52500	52500	480
489	75	160000	160000	160000	160000	640000	496
492	75	86885.1699999999983	86885.1699999999983	86885.1699999999983	86885.1699999999983	347540.679999999993	499
490	75	86885.1600000000035	86885.1600000000035	86885.1600000000035	86885.1600000000035	347540.640000000014	497
488	75	160000	160000	160000	160000	640000	495
491	75	86885.1699999999983	86885.1699999999983	86885.1699999999983	86885.1699999999983	347540.679999999993	498
493	76	62500	62500	62500	62500	250000	500
494	76	31250	31250	31250	31250	125000	501
495	76	31250	31250	31250	31250	125000	502
496	77	44233.3399999999965	44233.3399999999965	44233.3399999999965	44233.3399999999965	176933.359999999986	503
497	77	44233.3399999999965	44233.3399999999965	44233.3399999999965	44233.3399999999965	176933.359999999986	504
498	77	44233.3399999999965	44233.3399999999965	44233.3399999999965	44233.3399999999965	176933.359999999986	505
499	77	44233.3399999999965	44233.3399999999965	44233.3399999999965	44233.3399999999965	176933.359999999986	506
500	77	44233.3399999999965	44233.3399999999965	44233.3399999999965	44233.3399999999965	176933.359999999986	507
501	78	55805754	55805754	55805754	55805754	223223016	508
502	79	312596862.389999986	274776876.389999986	190469260.379999995	266405819.379999995	1044248818.53999996	509
505	80	13580	13580	13580	13580	54320	512
503	80	95503	95503	95503	95503	382012	510
522	82	500000	500000	500000	500000	2000000	529
519	82	500000	500000	500000	500000	2000000	526
504	80	145048	145048	145048	145049	580193	511
536	85	9453812.21000000089	9453812.21000000089	9453812.21000000089	9453812.21000000089	37815248.8400000036	543
558	89	109668.320000000007	438673.280000000028	438673.280000000028	329004.960000000021	1316019.84000000008	565
523	83	0	0	0	0	0	530
506	80	135908	135908	135831	135828	543475	513
537	86	2644375	2644375	2644375	2644375	10577500	544
524	83	0	0	0	0	0	531
507	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	514
508	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	515
525	83	0	0	0	0	0	532
509	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	516
510	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	517
511	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	518
512	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	519
526	84	0	0	0	0	0	533
513	81	60080.7200000000012	60080.7200000000012	60080.7200000000012	60080.7200000000012	240322.880000000005	520
527	84	0	0	0	0	0	534
547	87	\N	\N	\N	\N	\N	554
543	87	554760.369999999995	554760.369999999995	554760.369999999995	627120.410000000033	2291401.52000000002	550
548	88	22840.630000000001	22840.630000000001	22840.630000000001	22840.630000000001	91362.5200000000041	555
528	84	0	0	0	0	0	535
514	81	60080.7099999999991	60080.7099999999991	0	0	120161.419999999998	521
515	81	60080.7099999999991	60080.7099999999991	60080.7099999999991	60080.7099999999991	240322.839999999997	522
564	92	150000	10000	10000	40000	210000	571
576	95	23280.8300000000017	23280.8300000000017	23280.8300000000017	23280.8300000000017	93123.320000000007	583
516	82	500000	500000	500000	500000	2000000	523
529	84	0	0	0	0	0	536
538	87	2074321.37000000011	2074321.37000000011	2074321.37000000011	2074321.37000000011	8297285.48000000045	545
549	88	22840.630000000001	22840.630000000001	22840.630000000001	22840.630000000001	91362.5200000000041	556
517	82	500000	500000	500000	500000	2000000	524
559	90	2337004.24000000022	2337004.24000000022	2337004.24000000022	2337004.24000000022	9348016.96000000089	566
530	84	0	0	0	0	0	537
555	89	3290049.60000000009	6580099.20000000019	4935074.40000000037	1645024.80000000005	16450248.0000000019	562
518	82	500000	500000	500000	0	1500000	525
550	88	22840.630000000001	22840.630000000001	22840.630000000001	22840.630000000001	91362.5200000000041	557
531	84	0	0	0	0	0	538
539	87	265320.179999999993	265320.179999999993	265320.179999999993	265320.179999999993	1061280.71999999997	546
572	93	170958.600000000006	153068	150523.799999999988	151983.600000000006	626534	579
569	93	256437.899999999994	229602	150523.799999999988	227975.399999999994	864539.099999999977	576
544	87	5185803.4299999997	6874204.54999999981	8900285.8900000006	6174724.08000000007	27135017.950000003	551
520	82	500000	500000	500000	500000	2000000	527
532	84	0	0	0	0	0	539
565	92	50000	10000	10000	20000	90000	572
551	88	22840.630000000001	22840.630000000001	22840.630000000001	22840.630000000001	91362.5200000000041	558
521	82	500000	500000	500000	500000	2000000	528
560	91	0	0	0	0	0	567
533	84	0	0	0	0	0	540
556	89	3290049.60000000009	6580099.21999999974	3290049.60000000009	4935074.40000000037	18095272.8200000003	563
552	88	22840.630000000001	22840.630000000001	22840.630000000001	22840.630000000001	91362.5200000000041	559
540	87	1495440.98999999999	1471320.96999999997	1809001.19999999995	1471320.96999999997	6247084.12999999989	547
545	87	434160.289999999979	1326600.87999999989	1567801.04000000004	1567801.04000000004	4896363.25	552
534	85	9453812.21000000089	9453812.21000000089	9453812.21000000089	9453812.21000000089	37815248.8400000036	541
553	88	22840.630000000001	22840.630000000001	22840.630000000001	0	68521.8899999999994	560
535	85	9453812.21000000089	9453812.21000000089	9453812.21000000089	9453812.21000000089	37815248.8400000036	542
541	87	48240.0299999999988	48240.0299999999988	48240.0299999999988	48240.0299999999988	192960.119999999995	548
554	89	2632039.68000000017	2632039.68000000017	2632039.68000000017	2632039.68000000017	10528158.7200000007	561
546	87	3015001.99000000022	4341602.87000000011	4389842.90000000037	4172762.75999999978	15919210.5200000014	553
542	87	313560.210000000021	1061280.69999999995	1037160.68999999994	6994	2418995.59999999963	549
557	89	109668.309999999998	109668.309999999998	109668.309999999998	109668.309999999998	438673.239999999991	564
566	92	50000	0	10000	0	60000	573
561	92	50000	0	10000	0	60000	568
571	93	170958.600000000006	153068	150523.799999999988	151983.600000000006	626534	578
577	95	23280.8300000000017	23280.8300000000017	23280.8300000000017	23280.8300000000017	93123.320000000007	584
574	94	0	0	0	0	0	581
567	92	8000	20000	20000	30000	78000	574
562	92	0	2000	0	20000	22000	569
568	92	0	120000	120000	120000	360000	575
563	92	35000	10000	10000	30000	85000	570
570	93	256437.899999999994	229602	150523.799999999988	227975.899999999994	864539.599999999977	577
573	93	\N	\N	\N	\N	\N	580
575	95	23280.8300000000017	23280.8300000000017	23280.8300000000017	23280.8300000000017	93123.320000000007	582
\.


--
-- Name: distribucion_trimestral_financiera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_trimestral_financiera_id_seq', 577, true);


--
-- Data for Name: distribucion_trimestral_imp_pre; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY distribucion_trimestral_imp_pre (id, pk, denominacion, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, cantidad, asignacion, s_cons, g_fiscal, fci, ticr, m_asig) FROM stdin;
\.


--
-- Name: distribucion_trimestral_imp_pre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('distribucion_trimestral_imp_pre_id_seq', 1, false);


--
-- Data for Name: estructura; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY estructura (estructura, codigo, id) FROM stdin;
PODER PUBLICO	01	1
DIRECCION SUPERIOR DE GOBIERNO	02	2
ORGANO	03	3
UNIDAD DE APOYO	04	4
ENTE DESCONCENTRADO	05	5
ENTE DESCENTRALIZADO	06	6
EMPRESA DE PROPIEDAD SOCIAL	07	7
\.


--
-- Name: estructura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('estructura_id_seq', 7, true);


--
-- Data for Name: imp_presupuestaria; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY imp_presupuestaria (id, id_acc_reg, partida, trimestre_i, trimestre_ii, trimestre_iii, trimestre_iv, cantidad, monto, s_cons, g_fiscal, fci, ticr, m_asig, pk) FROM stdin;
12	3	5	0	0	0	0	0	0	\N	\N	\N	\N	\N	12
56	15	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	56
1	2	1	875000	875000	875000	875000	3500000	3500000	\N	\N	\N	\N	\N	1
13	3	6	0	0	0	0	0	0	\N	\N	\N	\N	\N	13
59	16	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	59
60	16	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60
2	2	2	375000	375000	375000	375000	1500000	1500000	\N	\N	\N	\N	\N	2
61	16	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	61
14	3	8	0	0	0	0	0	0	\N	\N	\N	\N	\N	14
62	16	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62
63	16	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	63
64	16	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	64
15	3	9	0	0	0	0	0	0	\N	\N	\N	\N	\N	15
66	17	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	66
16	3	10	0	0	0	0	0	0	\N	\N	\N	\N	\N	16
3	2	3	2451402.5	2451402.5	2451402.5	9805610	17159817.5	17159817.5	\N	\N	\N	\N	\N	3
18	4	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18
23	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23
24	10	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24
25	10	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25
26	10	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26
9	3	1	125000	125000	125000	125000	500000	500000	\N	\N	\N	\N	\N	9
27	10	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27
28	10	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28
68	18	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	68
22	10	2	1125000	1125000	1125000	1125000	4500000	4500000	4500000	0	0	0	4500000	22
71	20	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	71
72	20	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	72
73	20	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	73
74	20	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	74
10	3	2	13750000	13750000	13750000	13750000	55000000	55000000	\N	\N	\N	\N	\N	10
75	20	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75
76	20	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76
29	11	4	386839.770000000019	386839.770000000019	386839.770000000019	386839.789999999979	1547359.10000000009	1547359.10000000009	1547359.10000000009	0	0	0	1547359.10000000009	29
30	11	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30
79	21	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	79
80	21	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80
81	21	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	81
82	21	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	82
83	21	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	83
84	21	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	84
32	12	2	53571.4300000000003	53571.4300000000003	53571.4300000000003	0	160714.290000000008	160714.290000000008	214285.75	0	0	0	214285.75	32
11	3	3	0	0	0	0	0	0	\N	\N	\N	\N	\N	11
33	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33
34	12	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34
35	12	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35
36	12	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36
37	12	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37
38	12	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	38
41	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	41
42	13	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	42
43	13	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43
44	13	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	44
45	13	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45
46	13	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	46
48	14	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	48
51	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51
52	15	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	52
53	15	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	53
54	15	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54
55	15	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55
87	22	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87
88	22	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	88
89	22	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89
90	22	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90
91	22	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	91
92	22	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	92
97	24	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	97
98	24	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	98
99	24	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	99
100	24	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100
101	24	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	101
102	24	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102
103	25	4	78467.679999999993	78467.679999999993	78467.679999999993	78467.679999999993	313870.719999999972	313870.719999999972	313870.700000000012	0	0	0	313870.700000000012	103
105	26	4	78467.679999999993	78467.679999999993	78467.679999999993	78467.679999999993	313870.719999999972	313870.719999999972	313870.700000000012	0	0	0	313870.700000000012	105
93	23	4	859308	859308	859308	1718616.30000000005	4296540.29999999981	4296540.29999999981	4296540.29999999981	0	0	0	4296540.29999999981	93
107	27	1	6250000	6250000	6250000	6250000	25000000	25000000	2500000	0	0	0	2500000	107
109	27	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	109
110	27	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110
111	27	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	111
112	27	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	112
115	28	4	78467.6699999999983	78467.6699999999983	78467.679999999993	78467.679999999993	313870.699999999953	313870.699999999953	313870.700000000012	0	0	0	313870.700000000012	115
113	27	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	113
114	27	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	114
119	31	1	500000	500000	500000	500000	2000000	2000000	2000000	0	0	0	2000000	119
117	30	4	10366333.3499999996	10366333.3499999996	10366333.3499999996	2073266.82000000007	33172266.8699999973	33172266.8699999973	5183166.8200000003	0	0	0	5183166.8200000003	117
121	31	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	121
122	31	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	122
123	31	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	123
124	31	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	124
125	31	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	125
126	31	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	126
128	32	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	128
6	2	8	0	0	0	0	0	0	\N	\N	\N	\N	\N	6
4	2	5	0	0	0	0	0	0	\N	\N	\N	\N	\N	4
57	16	1	599583.75	599583.75	599583.75	599583.75	2398335	2398335	\N	\N	\N	\N	\N	57
8	2	10	0	0	0	0	0	0	\N	\N	\N	\N	\N	8
95	24	1	500000	500000	500000	500000	2000000	2000000	1000000	0	0	0	1000000	95
50	15	2	632500	632500	632500	632500	2530000	2530000	\N	\N	\N	\N	\N	50
70	20	2	24055.75	24055.75	24055.75	24055.75	96223	96223	\N	\N	\N	\N	\N	70
47	14	4	\N	\N	\N	\N	\N	\N	40910139.0200000033	0	0	0	40910139.0200000033	47
86	22	2	25000	25000	25000	25000	100000	100000	100000	0	0	0	100000	86
78	21	2	24055.75	24055.75	24055.75	24055.75	96223	96223	\N	\N	\N	\N	\N	78
104	25	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	104
118	30	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	118
154	37	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	154
155	37	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	155
156	37	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	156
130	33	2	178571.429999999993	178571.429999999993	178571.429999999993	178571.429999999993	714285.719999999972	714285.719999999972	714285.709999999963	0	0	0	714285.709999999963	130
131	33	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	131
132	33	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	132
133	33	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	133
134	33	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	134
135	33	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	135
136	33	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	136
198	48	8	9479148.77999999933	9479148.77999999933	9479148.77999999933	9479148.78999999911	37916595.1299999952	37916595.1299999952	37916595.1300000027	0	0	0	37916595.1300000027	198
189	45	4	1180339.37999999989	1180339.37999999989	1180339.37999999989	1180339.37999999989	4721357.51999999955	4721357.51999999955	\N	\N	\N	\N	\N	189
171	43	4	78467.6699999999983	78467.6699999999983	78467.6699999999983	78467.6699999999983	313870.679999999993	313870.679999999993	\N	\N	\N	\N	\N	171
149	37	1	1785714.28000000003	178514.279999999999	178514.290000000008	178514.290000000008	2321257.14000000013	2321257.14000000013	7142857.13999999966	0	0	0	7142857.13999999966	149
140	35	2	53571.4300000000003	53571.4300000000003	53571.4300000000003	53571.4300000000003	214285.720000000001	214285.720000000001	214285.720000000001	0	0	0	214285.720000000001	140
175	44	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	175
176	44	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	176
177	44	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	177
167	40	4	78467.6699999999983	78467.6699999999983	78467.6699999999983	78467.6699999999983	313870.679999999993	313870.679999999993	313870.700000000012	0	0	0	313870.700000000012	167
178	44	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	178
179	44	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	179
180	44	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	180
192	47	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	192
213	52	1	1370477.12999999989	290858.760000000009	726376.780000000028	290858.760000000009	2678571.4299999997	2678571.4299999997	\N	\N	\N	\N	\N	213
148	36	2	1825704.8600000001	1825704.8600000001	1825704.8600000001	1825704.8600000001	7302819.44000000041	7302819.44000000041	\N	\N	\N	\N	\N	148
195	48	3	1500000	1500000	1500000	1500000	6000000	6000000	6000000	0	0	0	6000000	195
137	34	4	2949110.54000000004	2949110.54000000004	2949110.54000000004	2949110.5299999998	11796442.1500000004	11796442.1500000004	11796442.1500000004	0	0	0	11796442.1500000004	137
138	34	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	138
157	38	4	78467.679999999993	78467.679999999993	78467.679999999993	78467.679999999993	313870.719999999972	313870.719999999972	\N	\N	\N	\N	\N	157
161	39	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	161
162	39	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162
163	39	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	163
147	36	4	0	0	0	0	0	0	7302819.46999999974	0	0	0	7302819.46999999974	147
141	35	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	141
142	35	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	142
143	35	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143
144	35	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	144
145	35	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	145
146	35	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	146
164	39	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	164
165	39	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	165
166	39	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	166
202	49	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	202
173	44	1	669642.849999999977	669642.849999999977	669642.849999999977	669642.880000000005	2678571.4299999997	2678571.4299999997	\N	\N	\N	\N	\N	173
193	48	1	20834495.3399999999	20834495.3500000015	20834495.3500000015	20834495.3500000015	83337981.3900000006	83337981.3900000006	83337981.3900000006	0	0	0	83337981.3900000006	193
159	39	1	52049816.7700000033	52049816.7700000033	52049816.7700000033	52049816.7700000033	208199267.080000013	208199267.080000013	\N	\N	\N	\N	\N	159
174	44	2	80357.1399999999994	80357.1399999999994	80357.1399999999994	80357.1499999999942	321428.569999999949	321428.569999999949	\N	\N	\N	\N	\N	174
183	46	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	183
160	39	2	52210531.049999997	52210531.049999997	52210531.049999997	52210531.049999997	208842124.199999988	208842124.199999988	\N	\N	\N	\N	\N	160
424	82	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	424
151	37	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	151
152	37	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	152
153	37	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	153
170	42	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	170
184	46	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	184
185	46	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	185
186	46	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	186
187	46	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	187
188	46	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	188
169	42	4	78467.6699999999983	78467.679999999993	78467.679999999993	78467.6699999999983	313870.699999999953	313870.699999999953	\N	\N	\N	\N	\N	169
172	43	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	172
182	46	2	1000000	1000000	1000000	1000000	4000000	4000000	\N	\N	\N	\N	\N	182
211	51	4	78467.6699999999983	78467.6699999999983	78467.679999999993	78467.679999999993	313870.699999999953	313870.699999999953	\N	\N	\N	\N	\N	211
200	48	10	30542627.1099999994	30542627.1099999994	30542627.1099999994	30542627.1099999994	122170508.439999998	122170508.439999998	122170508.439999998	0	0	0	122170508.439999998	200
181	46	1	500000	500000	500000	500000	2000000	2000000	\N	\N	\N	\N	\N	181
190	45	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	190
203	50	1	558035.709999999963	558035.709999999963	558035.709999999963	558035.709999999963	2232142.83999999985	2232142.83999999985	\N	\N	\N	\N	\N	203
196	48	5	0	0	0	0	0	0	\N	\N	\N	\N	\N	196
40	13	2	49692739	49692739	49692739	49692739	198770956	198770956	278700400	0	0	0	278700400	40
212	51	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	212
194	48	2	85361895.4200000018	85361895.4200000018	85361895.4300000072	85361895.4300000072	341447581.700000048	341447581.700000048	341447581.699999988	0	0	0	341447581.699999988	194
201	49	4	9387825.71000000089	9387825.71000000089	9387825.71000000089	9387825.71000000089	37551302.8400000036	37551302.8400000036	\N	\N	\N	\N	\N	201
199	48	9	0	0	0	0	0	0	\N	\N	\N	\N	\N	199
205	50	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	205
215	52	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	215
206	50	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	206
207	50	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	207
208	50	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	208
209	50	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	209
210	50	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	210
216	52	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	216
217	52	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	217
204	50	2	661964.290000000037	661964.290000000037	661964.290000000037	661964.290000000037	2647857.16000000015	2647857.16000000015	\N	\N	\N	\N	\N	204
222	53	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	222
218	52	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	218
219	52	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	219
220	52	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	220
214	52	2	164153.570000000007	34971.4300000000003	87332.1399999999994	34971.4300000000003	321428.570000000007	321428.570000000007	\N	\N	\N	\N	\N	214
221	53	4	78467.6699999999983	78467.6699999999983	78467.679999999993	78467.679999999993	313870.699999999953	313870.699999999953	\N	\N	\N	\N	\N	221
225	54	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	225
226	54	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	226
227	54	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	227
228	54	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	228
229	54	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	229
230	54	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	230
223	54	1	60359.75	60359.75	60359.75	60359.75	241439	241439	\N	\N	\N	\N	\N	223
224	54	2	10383177.6400000006	10383177.6400000006	10383177.6400000006	10383177.6400000006	41532710.5600000024	41532710.5600000024	\N	\N	\N	\N	\N	224
158	38	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	158
191	47	4	4487865.80999999959	4487865.80999999959	4487865.80999999959	4487865.80999999959	17951463.2399999984	17951463.2399999984	17951463.2399999984	0	0	0	17951463.2399999984	191
168	40	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	168
425	82	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	425
31	12	1	446428.570000000007	446428.570000000007	446428.570000000007	446428.570000000007	1785714.28000000003	1785714.28000000003	1785714.28000000003	0	0	0	1785714.28000000003	31
273	9	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	273
256	6	2	5338977.41000000015	1947010.81000000006	114011.779999999999	0	7400000.00000000093	7400000.00000000093	\N	\N	\N	\N	\N	256
17	4	4	3577401.89000000013	3577401.89000000013	3577401.89000000013	3577401.89000000013	14309607.5600000005	14309607.5600000005	14309607.5600000005	0	0	0	14309607.5600000005	17
197	48	6	337814061.199999988	337814061.209999979	337814061.209999979	337814061.209999979	1351256244.82999992	1351256244.82999992	1351256244.82999992	0	0	0	1351256244.82999992	197
232	55	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	232
274	9	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	274
49	15	1	1000000	1000000	1000000	1000000	4000000	4000000	4000000	0	0	0	4000000	49
20	7	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	20
275	9	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	275
231	55	4	375280.419999999984	375280.419999999984	375280.419999999984	375280.419999999984	1501121.67999999993	1501121.67999999993	\N	\N	\N	\N	\N	231
235	56	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	235
236	56	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	236
237	56	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	237
238	56	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	238
239	56	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	239
240	56	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	240
276	9	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	276
277	9	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	277
255	6	1	7000000	7000000	7000000	7000000	28000000	28000000	\N	\N	\N	\N	\N	255
233	56	1	223214.290000000008	223214.290000000008	223214.290000000008	223214.290000000008	892857.160000000033	892857.160000000033	\N	\N	\N	\N	\N	233
265	8	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	265
266	8	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	266
267	8	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	267
234	56	2	526785.709999999963	526785.709999999963	526785.709999999963	526785.709999999963	2107142.83999999985	2107142.83999999985	\N	\N	\N	\N	\N	234
241	57	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	241
242	57	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	242
243	57	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	243
244	57	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	244
245	57	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	245
246	57	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	246
247	57	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	247
248	57	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	248
250	58	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250
268	8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	268
269	8	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	269
270	8	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	270
249	58	4	4097060.10999999987	4097060.10999999987	4097060.10999999987	4097060.10999999987	16388240.4399999995	16388240.4399999995	\N	\N	\N	\N	\N	249
252	1	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	252
278	9	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	278
291	59	6	0	0	10000000	10000000	20000000	20000000	\N	\N	\N	\N	\N	291
77	21	1	1054063.42999999993	1054063.42999999993	1054063.42999999993	1054063.42999999993	4216253.71999999974	4216253.71999999974	\N	\N	\N	\N	\N	77
251	1	4	600807.180000000051	600807.180000000051	600807.180000000051	600807.180000000051	2403228.7200000002	2403228.7200000002	\N	\N	\N	\N	\N	251
263	8	1	250000	250000	250000	250000	1000000	1000000	\N	\N	\N	\N	\N	263
5	2	6	0	0	0	0	0	0	\N	\N	\N	\N	\N	5
7	2	9	0	0	0	0	0	0	\N	\N	\N	\N	\N	7
271	9	1	275499.25	275499.25	275499.25	275499.25	1101997	1101997	\N	\N	\N	\N	\N	271
287	59	1	250000	250000	250000	0	750000	750000	\N	\N	\N	\N	\N	287
264	8	2	250000	250000	250000	0	750000	750000	\N	\N	\N	\N	\N	264
253	5	4	532208573.50999999	516830460.170000017	542272798.940000057	1681296391.42000008	3272608224.03999996	3272608224.03999996	\N	\N	\N	\N	\N	253
426	82	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	426
254	5	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	254
257	6	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257
258	6	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258
259	6	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259
260	6	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	260
261	6	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	261
262	6	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	262
65	17	4	15031311.5	0	0	0	15031311.5	15031311.5	44178466.8200000003	0	0	0	44178466.8200000003	65
272	9	2	657050.5	657050.5	657050.5	657050.5	2628202	2628202	\N	\N	\N	\N	\N	272
281	19	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	281
282	19	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	282
58	16	2	3291232.04999999981	3291232.04999999981	3291232.04999999981	3291232.04999999981	13164928.1999999993	13164928.1999999993	\N	\N	\N	\N	\N	58
283	19	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	283
39	13	1	20676634	20676634	20676634	20676634	82706536	82706536	3488247	0	0	0	3488247	39
284	19	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	284
285	19	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	285
286	19	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	286
94	23	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	94
85	22	1	40625	40625	40625	40625	162500	162500	162500	0	0	0	162500	85
106	26	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	106
280	19	2	305571.419999999984	305571.419999999984	0	0	611142.839999999967	611142.839999999967	1214285.70999999996	0	0	0	1214285.70999999996	280
69	20	1	1054063.42999999993	0	0	0	1054063.42999999993	1054063.42999999993	4312477	0	0	0	4312477	69
116	28	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	116
298	61	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	298
289	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	289
290	59	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	290
292	59	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	292
293	59	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	293
294	59	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	294
288	59	2	250000	250000	250000	250000	1000000	1000000	\N	\N	\N	\N	\N	288
296	60	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	296
297	61	4	7644274.5700000003	15288549.1400000006	10192366.0899999999	50961830.4699999988	84087020.2699999958	84087020.2699999958	\N	\N	\N	\N	\N	297
19	7	4	61030.4499999999971	61030.4499999999971	0	0	122060.899999999994	122060.899999999994	244121.799999999988	0	0	0	244121.799999999988	19
21	10	1	100000	100000	200000	100000	500000	500000	500000	0	0	0	500000	21
295	60	4	310834.909999999974	310834.909999999974	310834.909999999974	310834.909999999974	1243339.6399999999	1243339.6399999999	\N	\N	\N	\N	\N	295
301	62	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	301
302	62	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	302
304	62	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304
305	62	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	305
306	62	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	306
303	62	6	\N	\N	\N	\N	\N	\N	3113000	0	0	0	3113000	303
309	63	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	309
310	63	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	310
311	63	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	311
312	63	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	312
313	63	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	313
314	63	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	314
427	82	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	427
308	63	2	137500	137500	137500	137500	550000	550000	\N	\N	\N	\N	\N	308
428	82	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	428
333	68	1	100637	100636	100636	100637	402546	402546	\N	\N	\N	\N	\N	333
307	63	1	125000	125000	125000	0	375000	375000	\N	\N	\N	\N	\N	307
316	64	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	316
357	71	1	1034860	10348060	10348060	10348060	32079040	32079040	\N	\N	\N	\N	\N	357
401	78	1	20141400	13427600	0	0	33569000	33569000	\N	\N	\N	\N	\N	401
399	77	4	221166.720000000001	221166.73000000001	221166.720000000001	221166.73000000001	884666.900000000023	884666.900000000023	\N	\N	\N	\N	\N	399
334	68	2	212500	212500	212500	212500	850000	850000	\N	\N	\N	\N	\N	334
392	76	2	62500	62500	62500	62500	250000	250000	\N	\N	\N	\N	\N	392
373	73	1	1125	10125	6750	16875	34875	34875	\N	\N	\N	\N	\N	373
400	77	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	400
336	68	5	2601250	2601250	2601250	2601250	10405000	10405000	\N	\N	\N	\N	\N	336
343	69	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	343
315	64	4	532208573.50999999	513677512.370000005	542272798.940000057	89984558.799999997	1678143443.62000012	1678143443.62000012	\N	\N	\N	\N	\N	315
319	65	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	319
320	65	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320
321	65	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	321
322	65	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	322
323	65	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	323
324	65	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	324
344	69	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	344
345	69	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	345
346	69	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	346
317	65	1	7000000	0	0	0	7000000	7000000	\N	\N	\N	\N	\N	317
347	69	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	347
348	69	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	348
381	74	4	2344112.81000000006	2494822.52000000002	2589489.52000000002	2571575.14999999991	10000000	10000000	\N	\N	\N	\N	\N	381
96	24	2	2500000	2500000	2500000	2500000	10000000	10000000	2000000	0	0	0	2000000	96
358	71	2	157500	157500	157500	157500	630000	630000	\N	\N	\N	\N	\N	358
341	69	1	1875000	1875000	1875000	1875000	7500000	7500000	\N	\N	\N	\N	\N	341
367	72	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	367
368	72	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	368
342	69	2	4375000	4375000	4375000	4375000	17500000	17500000	\N	\N	\N	\N	\N	342
318	65	2	5338977.41000000015	5099958.61000000034	114011.779999999999	0	10552947.7999999989	10552947.7999999989	\N	\N	\N	\N	\N	318
327	66	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	327
328	66	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	328
329	66	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	329
330	66	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	330
331	66	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	331
332	66	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	332
351	70	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	351
325	66	1	250000	250000	250000	250000	1000000	1000000	\N	\N	\N	\N	\N	325
352	70	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	352
353	70	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	353
354	70	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	354
326	66	2	250000	250000	250000	250000	1000000	1000000	\N	\N	\N	\N	\N	326
279	19	1	1344781.08000000007	1344781.08000000007	1344781.08000000007	0	4034343.24000000022	4034343.24000000022	5379124.29000000004	0	0	0	5379124.29000000004	279
355	70	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	355
67	18	4	21076565.4699999988	21076565.4699999988	21076565.4699999988	21076565.4699999988	84306261.8799999952	84306261.8799999952	84306261.8799999952	0	0	0	84306261.8799999952	67
335	68	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	335
337	68	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	337
338	68	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	338
339	68	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	339
340	68	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	340
356	70	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	356
369	72	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	369
370	72	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370
371	72	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	371
372	72	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	372
349	70	1	403874.5	403874.5	403874.5	403874.5	1615498	1615498	\N	\N	\N	\N	\N	349
385	75	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	385
386	75	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	386
387	75	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	387
365	72	1	125000	125000	125000	125000	500000	500000	\N	\N	\N	\N	\N	365
350	70	2	403874.5	403874.5	403874.5	0	1211623.5	1211623.5	\N	\N	\N	\N	\N	350
359	71	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	359
360	71	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	360
361	71	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	361
362	71	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	362
363	71	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	363
364	71	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	364
374	73	2	76250	68625	45750	114375	305000	305000	\N	\N	\N	\N	\N	374
382	74	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	382
366	72	2	125000	125000	125000	125000	500000	500000	\N	\N	\N	\N	\N	366
388	75	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	388
375	73	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	375
376	73	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	376
377	73	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	377
378	73	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	378
379	73	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	379
380	73	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	380
389	75	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	389
390	75	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	390
384	75	2	130328	130328	390983	390983	1042622	1042622	\N	\N	\N	\N	\N	384
393	76	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	393
394	76	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	394
395	76	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	395
396	76	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	396
397	76	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	397
383	75	1	497500	497500	142500	1425000	2562500	2562500	\N	\N	\N	\N	\N	383
398	76	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	398
404	78	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	404
391	76	1	62500	62500	62500	62500	250000	250000	\N	\N	\N	\N	\N	391
406	78	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406
402	78	2	8159729	5748137	1004956	924956	15837778	15837778	\N	\N	\N	\N	\N	402
407	78	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	407
408	78	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	408
410	79	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	410
403	78	3	1104000	736000	0	0	1840000	1840000	\N	\N	\N	\N	\N	403
405	78	6	26400625	17808750	62500	18621604	62893479	62893479	\N	\N	\N	\N	\N	405
409	79	4	312596862.389999986	274776876.389999986	190464260.379999995	1024248818.53999996	1802086817.69999981	1802086817.69999981	\N	\N	\N	\N	\N	409
413	80	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	413
414	80	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	414
415	80	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	415
416	80	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	416
417	80	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	417
418	80	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	418
411	80	1	200000	200000	200000	200000	800000	800000	\N	\N	\N	\N	\N	411
412	80	2	190000	200000	200000	200000	790000	790000	\N	\N	\N	\N	\N	412
420	81	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	420
419	81	4	600807.180000000051	600807.180000000051	600807.180000000051	600807.180000000051	2403228.7200000002	2403228.7200000002	\N	\N	\N	\N	\N	419
423	82	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	423
469	92	1	350000	150000	150000	150000	800000	800000	\N	\N	\N	\N	\N	469
421	82	1	125000	1250000	1250000	1250000	3875000	3875000	\N	\N	\N	\N	\N	421
487	95	4	69842.5	69842.5	69842.5	69842.5	279370	279370	\N	\N	\N	\N	\N	487
445	86	6	894375	894375	894375	894375	3577500	3577500	\N	\N	\N	\N	\N	445
422	82	2	3750000	3750000	3750000	3750000	15000000	15000000	\N	\N	\N	\N	\N	422
451	88	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	451
452	88	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	452
453	88	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	453
454	88	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	454
455	88	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	455
429	83	4	1270582.62999999989	1270582.62999999989	0	0	2541165.25999999978	2541165.25999999978	\N	\N	\N	\N	\N	429
456	88	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	456
459	89	3	305426.270000000019	305426.270000000019	305426.270000000019	305426.270000000019	1221705.08000000007	1221705.08000000007	\N	\N	\N	\N	\N	459
430	83	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	430
433	84	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	433
434	84	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	434
436	84	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	436
437	84	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	437
438	84	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	438
478	93	2	601509.119999999995	578544.920000000042	556981.949999999953	577964.010000000009	2315000	2315000	\N	\N	\N	\N	\N	478
470	92	2	50000	50000	50000	50000	200000	200000	\N	\N	\N	\N	\N	470
431	84	1	1250000	1250000	1250000	1250000	5000000	5000000	\N	\N	\N	\N	\N	431
108	27	2	6250000	6250000	6250000	6250000	25000000	25000000	2500000	0	0	0	2500000	108
465	90	4	23370049.2399999984	23370049.2399999984	23370049.2399999984	23370049.2399999984	93480196.9599999934	93480196.9599999934	\N	\N	\N	\N	\N	465
432	84	2	1750000	1750000	1750000	1750000	7000000	7000000	\N	\N	\N	\N	\N	432
479	93	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	479
480	93	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	480
481	93	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	481
466	90	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	466
435	84	6	208456734.629999995	208456734.629999995	208456734.629999995	208456734.629999995	833826938.519999981	833826938.519999981	\N	\N	\N	\N	\N	435
449	88	1	446428.570000000007	446428.570000000007	446428.570000000007	446428.570000000007	1785714.28000000003	1785714.28000000003	\N	\N	\N	\N	\N	449
482	93	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	482
483	93	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	483
484	93	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	484
450	88	2	53371.4300000000003	53371.4300000000003	53371.4300000000003	53371.4300000000003	213485.720000000001	213485.720000000001	\N	\N	\N	\N	\N	450
439	85	4	28361436.6400000006	28361436.6400000006	28361436.6400000006	28361436.6400000006	113445746.560000002	113445746.560000002	\N	\N	\N	\N	\N	439
440	85	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	440
443	86	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	443
444	86	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	444
446	86	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	446
447	86	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	447
448	86	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	448
460	89	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	460
461	89	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	461
462	89	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	462
463	89	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	463
441	86	1	1125000	1125000	1125000	1125000	4500000	4500000	\N	\N	\N	\N	\N	441
464	89	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	464
486	94	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	486
139	35	1	446428.570000000007	446428.570000000007	446428.570000000007	446428.570000000007	1785714.28000000003	1785714.28000000003	1785714.28000000003	0	0	0	1785714.28000000003	139
442	86	2	625000	625000	625000	0	1875000	1875000	\N	\N	\N	\N	\N	442
150	37	2	214285.709999999992	214285.709999999992	214285.709999999992	214285.709999999992	857142.839999999967	857142.839999999967	857142.859999999986	0	0	0	857142.859999999986	150
485	94	4	0	0	0	0	0	0	\N	\N	\N	\N	\N	485
468	91	6	8643717.03999999911	8643717.03999999911	8643717.05000000075	8643717.03999999911	34574868.1700000018	34574868.1700000018	\N	\N	\N	\N	\N	468
299	62	1	225000	450000	525000	0	1200000	1200000	1500000	0	0	0	1500000	299
457	89	1	4581394.0700000003	4581394.0700000003	4581394.0700000003	4581394.05999999959	18325576.2699999996	18325576.2699999996	\N	\N	\N	\N	\N	457
300	62	2	150000	300000	300	1000000	1450300	1450300	1000000	0	0	0	1000000	300
127	32	4	310056.289999999979	310056.289999999979	310056.289999999979	310056.289999999979	1240225.15999999992	1240225.15999999992	1240225.14999999991	0	0	0	1240225.14999999991	127
477	93	1	253283.470000000001	186765.149999999994	195637.059999999998	181954.320000000007	817640	817640	\N	\N	\N	\N	\N	477
467	91	2	0	0	0	0	0	0	\N	\N	\N	\N	\N	467
458	89	2	10384493.2100000009	10384493.2100000009	10384493.2100000009	10384493.2300000004	41537972.8599999994	41537972.8599999994	\N	\N	\N	\N	\N	458
471	92	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	471
472	92	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	472
473	92	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	473
474	92	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	474
475	92	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	475
476	92	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	476
129	33	1	571428.569999999949	571428.569999999949	571428.569999999949	571428.579999999958	2285714.29000000004	2285714.29000000004	2285714.29000000004	0	0	0	2285714.29000000004	129
488	95	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	488
120	31	2	250000	250000	250000	250000	1000000	1000000	1000000	0	0	0	1000000	120
\.


--
-- Name: imp_presupuestaria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('imp_presupuestaria_id_seq', 488, true);


--
-- Name: imp_presupuestaria_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('imp_presupuestaria_pk_seq', 488, true);


--
-- Data for Name: linea_estrategica; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY linea_estrategica (linea_estrategica, id, plan_gobierno) FROM stdin;
ARAGUA: POTENCIA AGRARIA	1	1
ARAGUA: POTENCIA EN SALUD Y VIDA	2	1
ARAGUA: POTENCIA HUMANISTICA Y SOCIAL	3	1
ARAGUA: INFRAESTRUCTURA Y VIALIDAD PARA EL DESARROLLO	4	1
ARAGUA: UNA POTENCIA HUMANISTA Y SOCIAL	5	1
ARAGUA: POTENCIA TURÍSTICA Y PRODUCTIVA	6	1
ARAGUA: POTENCIA CULTURAL Y DEPORTIVA	7	1
ARAGUA: PROTECTORA DEL AMBIENTE Y EL PLANETA	8	1
POTENCIA: A TODA VIDA ARAGUA	9	1
ARAGUA: POTENCIA EDUCATIVA	10	1
\.


--
-- Name: linea_estrategica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('linea_estrategica_id_seq', 10, true);


--
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY modulo (modulo, id, url, posicion, activo, desplegable, usuario_creado, usuario_actualizado, fecha_creado, fecha_actualizado) FROM stdin;
Acciones Centralizadas	1		2	t	f	\N	\N	\N	\N
Proyectos	2		3	t	f	\N	\N	\N	\N
Reportes	4		4	t	f	\N	\N	\N	\N
Configuraciones	5		5	t	f	\N	\N	\N	\N
Inicio	3	ControllersUser/home	1	t	t	\N	\N	\N	\N
Usuarios	6		6	t	f	\N	\N	\N	\N
\.


--
-- Name: modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('modulo_id_seq', 1, false);


--
-- Data for Name: objetivo_especifico; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY objetivo_especifico (objetivo_especifico, id, plan_gobierno, linea_estrategica) FROM stdin;
\nCREAR EL GABINETE MÓVIL, QUE PULSE LA INSTALACIÓN DE TODAS LAS MISIONES DEL GOBIERNO NACIONAL Y AQUELLAS INICIATIVAS DEL GOBIERNO REGIONAL EN CADA PARROQUIA Y SISTEMATICE LAS BUENAS PRÁCTICAS Y AQUELLAS QUE ESTÁN DESVIADAS.	80	1	5
\nSE ORGANIZARÁ UNA FERIA ARTESANAL CADA AÑO CON LA PARTICIPACIÓN DE TODOS LOS ARTESANOS DEL ESTADO ARAGUA PARA FOMENTAR LAS ARTESANÍAS LOCALES. TAMBIÉN SE GARANTIZARA DESDE EL GOBIERNO REGIONAL LAS CONDICIONES NECESARIAS PARA LA DISTRIBUCIÓN DE LAS ARTESANÍAS EN LUGARES DONDE SE PUEDAN COMERCIALIZAR. SE CREA UN FONDO ESPECIAL PARA APOYAR A LOS ARTESANOS EN SU ACTIVIDAD PRODUCTIVA. 	107	1	7
\nDESARROLLO DE UNA RED DE COMEDORES ESCOLARES, ARTICULADOS CON MERCAL Y LOS PRODUCTORES DEL ESTADO ARAGUA, PARA ABASTECER Y MANTENER EL SUMINISTRO ADECUADO. ESTOS COMEDORES CONTARÁN CON NUTRICIONISTAS CAPACES DE GENERAR NUEVAS FÓRMULAS PARA MEJORAR EL NIVEL NUTRICIONAL DE LOS NIÑOS, NIÑAS Y ADOLESCENTES.	1	1	3
\nAPOYAR AL GOBIERNO BOLIVARIANO EN SU POLÍTICA DE MASIFICAR LA DISTRIBUCIÓN DE LAS CANAIMITAS EN TODOS LOS CENTROS EDUCATIVOS, PARA LA PROMOCIÓN DEL USO DE LAS TECNOLOGÍAS.	2	1	3
\nORGANIZAR EL CLUB Y LAS OLIMPIADAS ESTADALES DE MATEMÁTICAS, FÍSICA Y QUÍMICA, PARA EL DESARROLLO DEL PENSAMIENTO LÓGICO – ABSTRACTO, Y FAVORECER LA OPCIÓN DE ESTUDIO POR CARRERAS CIENTÍFICAS.	3	1	3
\nCREAR UNA RED DE CONTRALORES SOBRE EL SISTEMA EDUCATIVO Y FAVORECER LA ORGANIZACIÓN DE LOS CONSEJOS ESTUDIANTILES.	4	1	3
\nAPADRINAR LAS ESCUELAS CON LA COOPERACIÓN DE LOS CONSEJOS COMUNALES, LA BANCA PÚBLICA Y LAS EMPRESAS PRIVADAS POR VÍA DE LA RESPONSABILIDAD SOCIAL, Y LOGRAR MANTENER LA INFRAESTRUCTURA EN CONDICIONES OPTIMAS EN COORDINACIÓN CON UN CENTRO DE REHABILITACIÓN\nPROPIO DEL GOBIERNO REGIONAL.	5	1	3
\nCREAR UNA RED DE ESCUELAS GRANJAS, PARA FAVORECER LA FORMACIÓN DE LOS JÓVENES CAMPESINOS EN EL ÁREA AGRÍCOLA Y PECUARIA.	6	1	3
\nCREAR UN PROGRAMA DE FORMACIÓN ESPECIAL PARA LOS JÓVENES PESCADORES, DE MODO QUE PUEDAN DESARROLLAR CON PERICIA EL TRABAJO Y TECNIFICARLO CON SENTIDO DE CUIDO DE LA NATURALEZA.	7	1	3
\nIMPULSAR UN PROGRAMA DE FORMACIÓN HISTÓRICA VINCULADO CON LA HISTORIA DE ARAGUA, PERSONAJES Y EPISODIOS DEL ESTADO VINCULADOS CON LA INDEPENDENCIA DE LA PATRIA.	8	1	3
\nDESARROLLAR LOS JUEGOS DEPORTIVOS INTERLICEOS, PARA FOMENTAR LA INTEGRACIÓN Y LA SANA COMPETENCIA.	9	1	3
\nIMPULSAR EL ENTRENAMIENTO DE ALTO DESEMPEÑO PARA LOS DEPORTISTAS CON FORMACIÓN INTEGRAL, DE MODO QUE NO DEJEN SUS ESTUDIOS, Y PARA ELLO UN PLAN DE SEGUIMIENTO Y ACOMPAÑAMIENTO CON UN EQUIPO INTERDISCIPLINARIO.	10	1	3
\nCREACIÓN DE CENTROS DE ATENCIÓN DE NIÑOS CON NECESIDADES ESPECIALES, CON PERSONAL ESPECIALIZADO QUE PUEDA BRINDAR ASESORÍA A LOS PADRES Y MADRES, ASÍ COMO A LOS PROPIOS NIÑOS, NIÑAS Y ADOLESCENTES.	11	1	3
\nCREACIÓN DE UNA RED DE EDUCADORES POPULARES Y CULTORES, QUE PUEDAN DESARROLLAR ACTIVIDADES RECREATIVAS Y DE TAREAS DIRIGIDAS, QUE PROMUEVA EL USO DEL TIEMPO LIBRE DE MANERA CREATIVA EN CADA PARROQUIA.	12	1	3
\nINSTITUCIONALIZAR UN ENCUENTRO ANUAL DE EDUCADORES, PARA PREMIAR LAS BUENAS PRÁCTICAS EDUCATIVAS Y GENERAR PROCESOS DE FORMACIÓN INTEGRAL PARA LOS PROFESORES DE TODAS LAS ESCUELAS Y LICEOS DE LA REGIÓN. ESTIMULAR Y VISIBILIZAR A LOS BUENOS MAESTROS Y PROFESORES ES UNA VIEJA COSTUMBRE DE LUIS BELTRÁN PRIETO FIGUEROA QUE HAY QUE RESCATAR.	13	1	3
\nCREAR LA RED DE BRIGADISTAS ECOLOGISTAS EN CADA CENTRO EDUCATIVO, ASÍ COMO LOS BRIGADISTAS DE RESCATE Y PROTECCIÓN CIVIL, PARA CREAR UNA CULTURA DEL CUIDO DEL AMBIENTE, EL VALOR POR LA VIDA HUMANA Y LA VIDA DEL PLANETA.	14	1	3
\nIMPULSAR LAS RUTAS DE TRANSPORTE ESCOLAR EN TODO EL ESTADO ARAGUA, PARA GARANTIZAR SEGURIDAD A LOS NIÑOS, NIÑAS Y ADOLESCENTES.	15	1	3
\nPROGRAMA ESCUELA PARA PADRES Y MADRES. CREACIÓN DE UNA ESCUELA PARA PADRES Y MADRES QUE EJECUTE UN PROGRAMA NACIONAL DE FORMACIÓN FAMILIAR, FACILITADO POR UNA ALIANZA DE INSTITUCIONES Y PRIORIZANDO LA CONVIVENCIA Y EL RESPETO A LOS DERECHOS.	16	1	3
\nPROGRAMA NACIONAL DE FORMACIÓN Y ESTÍMULO A LA ORGANIZACIÓN ESTUDIANTIL. DISEÑO Y APLICACIÓN DE UN PROGRAMA ESTADAL DE FORMACIÓN Y ESTÍMULO A LA ORGANIZACIÓN ESTUDIANTIL SOBRE SEGURIDAD CIUDADANA Y CONVIVENCIA SOLIDARIA, A FIN DE INCENTIVAR UNA CULTURA A FAVOR DE LA RESOLUCIÓN PACÍFICA DE CONFLICTOS EN EL ÁMBITO ESCOLAR, MEDIANTE LA CREACIÓN DE REDES ESCOLARES PARA LA VIDA.	17	1	3
\nPROGRAMA DE PROMOCIÓN DEL SERVICIO COMUNITARIO UNIVERSITARIO. DISEÑO Y APLICACIÓN DE UN PROGRAMA DE PROMOCIÓN DEL SERVICIO COMUNITARIO UNIVERSITARIO PARA LOS GRUPOS SOCIALES Y COMUNIDADES CON PROBLEMAS DE VIOLENCIA QUE PERMITA AMPLIAR SU ATENCIÓN, AL MISMO TIEMPO QUE SE PROPICIA LA INCORPORACIÓN DE ESTOS TEMAS EN LA FORMACIÓN DE NUEVOS Y NUEVAS PROFESIONALES.	18	1	3
\nPROGRAMA NACIONAL DE FORMACIÓN DOCENTE. DISEÑO DE UN PROGRAMA ESTADAL DE FORMACIÓN DOCENTE PARA LA INVESTIGACIÓN, PREVENCIÓN Y ABORDAJE DE LA VIOLENCIA, A FIN DE INCENTIVAR UNA CULTURA A FAVOR DE LA CONVIVENCIA, LA NO DISCRIMINACIÓN Y LA RESOLUCIÓN PACÍFICA DE CONFLICTOS EN EL ÁMBITO ESCOLAR, IMPULSADA POR LOS Y LAS DOCENTES.	19	1	3
\nPLAN PARA EL FORTALECIMIENTO DE DEFENSORÍAS ESCOLARES Y NORMA DE CONVIVENCIA: A FIN DE CONSOLIDAR MECANISMOS QUE FAVOREZCAN UNA CULTURA DE LA RESOLUCIÓN PACÍFICA DE CONFLICTOS EN EL ÁMBITO ESCOLAR.	20	1	3
\nPROGRAMA ESCOLAR PARA LA PREVENCIÓN VIAL, EMERGENCIAS Y DESASTRES: DISEÑO Y EJECUCIÓN DE UN PROGRAMA ESCOLAR CON TRES COMPONENTES: PREVENCIÓN DE ACCIDENTES DE TRÁNSITO, EMERGENCIAS Y DESASTRES, A FIN DE ASEGURAR QUE EXISTAN CONOCIMIENTOS ADECUADOS QUE PERMITAN DESARROLLAR CONDUCTAS RESPONSABLES FRENTE A ESTOS EVENTOS.	21	1	3
\nCREACIÓN CULTURAL Y MOVILIZACIÓN: INSTAURACIÓN Y FORTALECIMIENTO DE ESCUELAS Y PROGRAMAS DE CREACIÓN CULTURAL Y MOVILIZACIÓN PARA JÓVENES QUE PROBLEMATICEN Y SUPEREN LA CULTURA DEL CONSUMO MEDIANTE EL ACTIVISMO Y LA ELABORACIÓN DE PRODUCTOS CULTURALES. LAS ESCUELAS DEL HIP HOP Y OTRAS.	22	1	3
\nPLAN DE PROMOCIÓN DEL DEPORTE EN COMUNIDADES: PROMOCIÓN DE PRÁCTICAS DEPORTIVAS PERMANENTES EN COMUNIDADES, A TRAVÉS DE LA DOTACIÓN DE EQUIPOS, ENTRENADORES/AS Y ADECUACIÓN DE ESPACIOS CON EL FIN DE PROMOVER LA SANA RECREACIÓN.	23	1	3
\nPLANIFICAR DESDE EL GOBIERNO CENTRAL CON PROTAGONISMO POPULAR, EL DESARROLLO URBANO Y RURAL DE LAS CIUDADES EXISTENTES Y DE LAS NACIENTES A LO LARGO DE NUESTRO TERRITORIO NACIONAL.	24	1	4
\nPLAN NACIONAL DE RECREACIÓN PARA NIÑOS, NIÑAS Y ADOLESCENTES CON UN ENFOQUE LÚDICO SIMBÓLICO QUE PROMUEVA LA CONVIVENCIA SOLIDARIA Y LA RESOLUCIÓN PACÍFICA DE CONFLICTOS; ACOMPAÑADO DE PROYECTOS DE CREACIÓN DE ESPACIOS FORMATIVOS Y LÚDICO-RECREATIVOS PERMANENTES Y NO PERMANENTES PARA NIÑOS, NIÑAS Y ADOLESCENTES, PARA LA PROMOCIÓN DEL SANO USO DEL TIEMPO LIBRE.	25	1	3
\nGARANTIZAR EL USO DE LOS RECURSOS NATURALES DEL PAÍS, DE FORMA SOBERANA, PARA LA SATISFACCIÓN DE LAS DEMANDAS INTERNAS, ASÍ COMO EL USO EN FUNCIÓN DE LOS MÁS ALTOS INTERESES NACIONALES. SER VANGUARDIA EN LA PROTECCIÓN DEL AMBIENTE.	102	1	9
\nESTE CONSEJO SE DEDICARÁ A LA UBICACIÓN DE LOS TERRENOS URBANOS, EL ESTUDIO RELACIONADO CON LA FACTIBILIDAD DE CONSTRUCCIÓN, LA BÚSQUEDA DE FUENTE DE FINANCIAMIENTO, LA ORGANIZACIÓN DEL PODER POPULAR PARA LA CONSTRUCCIÓN DE LAS VIVIENDAS DIGNAS, LA SELECCIÓN DE LAS FAMILIAS BENEFICIARIAS Y LA ADJUDICACIÓN FINAL.	26	1	5
\nGENERAR UN PROCESO DE OTORGAMIENTO DE LA TITULARIDAD DE TIERRAS PARA LOS CAMPESINOS Y CAMPESINAS PRODUCTORES.	27	1	1
\nCREAR UNA RED DE AMBULANCIAS PARA LA ATENCIÓN DE EMERGENCIAS CON PERSONAL PARAMÉDICO ESPECIALIZADO EN EL ÁREA.	28	1	2
\nLOGRAR LA SOBERANÍA ALIMENTARIA PARA GARANTIZAR EL SAGRADO DERECHO A LA ALIMENTACIÓN DE NUESTRO PUEBLO, DESENCADENANDO NUESTRO POTENCIAL AGRO PRODUCTIVO.	29	1	1
\nERRADICAR EL LATIFUNDIO Y GARANTIZAR SEGURIDAD A LOS CAMPESINOS Y CAMPESINAS ASÍ COMO INVESTIGAR TODOS LOS CASOS DE VIOLENCIA CONTRA LOS CAMPESINOS DE MODO QUE NO QUEDEN IMPUNES.	30	1	1
\nOTORGAMIENTO DE CRÉDITOS AGRARIOS PARA EL FORTALECIMIENTO DEL SECTOR, ADEMÁS DEL MEJORAMIENTO DE LAS VÍAS Y UN SISTEMA DE DISTRIBUCIÓN QUE GARANTICE LA COLOCACIÓN DE LOS PRODUCTOS AGRARIOS Y UN SISTEMA DE MONITOREO DEL CRECIMIENTO DEL SECTOR.	31	1	1
\nGENERAR UNA RED MULTIAGENCIAL DEL ESTADO ARAGUA DE ASISTENCIA TÉCNICA A TODOS LOS PROCESOS AGRARIOS ADELANTADOS POR GRUPOS DE CAMPESINOS Y CAMPESINAS.	32	1	1
\nCONSTRUIR Y DESARROLLAR LA ESCUELA ESTADAL DEL CAMPESINO, PARA EL ESTUDIO DE NUEVAS TECNOLOGÍASDEL DESARROLLO AGRÍCOLA Y LA FORMACIÓN INTEGRAL DE LOS CAMPESINOS Y CAMPESINAS.\n	33	1	1
\nINSTALAR Y DESARROLLAR UN LABORATORIO ESPECIALIZADO PARA EL ESTUDIO DE LAS SEMILLAS, DE MODO QUE SE PUEDA MEJORAR LA PRODUCCIÓN.	34	1	1
\nFAVORECER EL CULTIVO Y DISTRIBUCIÓN DEL CACAO Y EL CAFÉ COMO RUBROS PRINCIPALES A TRAVÉS DEL MEJORAMIENTO DEL SUELO, LA ORGANIZACIÓN DE LOS TRABAJADORES EN EL ÁREA, LA ORGANIZACIÓN CONJUNTA DE LA COSECHA, DISTRIBUCIÓN Y COMERCIALIZACIÓN DEL CACAO.	35	1	1
\nINSTALAR LAS CASAS DE LA ALIMENTACIÓN CONJUNTAMENTE CON EL SECTOR AGRARIO, PARA GARANTIZAR QUE EN LOS LUGARES MÁS EMPOBRECIDOS PODAMOS SALIR DE LA POBREZA EXTREMA.	36	1	1
\nAPOYAR A LOS CAMPESINOS Y CAMPESINAS PARA DESARROLLAR LOS SISTEMAS DE RIEGO NECESARIOS CON TECNOLOGÍA DE PUNTA PARA FAVORECER LA PRODUCCIÓN.	37	1	1
\nCREAR UNA RED DIRECTA CON EL SISTEMA MERCAL, PARA QUE LOS PRODUCTORES PUEDAN COLOCAR SUS COSECHAS DE MANERA DIRECTA.	38	1	1
\nPROYECTO PRIORITARIOS: PLAN PILOTO PARA LOS VALLES DE TUCUTUNEMO. EL SECTOR AGRÍCOLA ARAGÜEÑO CLAMA POR LA NECESIDAD DE INCORPORAR AL SECTOR PRODUCTIVO EXPERIENCIAS QUE DESARROLLEN Y POTENCIEN LA PRODUCCIÓN AGRÍCOLA EN EL ESTADO.ES POR ESTO QUE EL REFORZAMIENTO A LOS PEQUEÑOS Y MEDIANOS PRODUCTORES DEL MUNICIPIO ZAMORA, ESPECÍFICAMENTE EN LOS VALLES DE TUCUTUNEMO Y EL SUR DE ARAGUA, A TRAVÉS DEL APOYO ECONÓMICO DEL ESTADO, ASÍ COMO EL INICIO DE CULTIVOS URBANOS, ESTIMULARÁN ESTE SECTOR Y COLOCARAN A ARAGUA EN LA VANGUARDIA DE LA PRODUCCIÓN AGRÍCOLA NACIONAL.	39	1	1
\nPROFUNDIZAR LAS CONDICIONES QUE ASEGUREN PARA LA FAMILIA VENEZOLANA, LA MAYOR SUMA DE SEGURIDAD SOCIAL Y SUPREMA FELICIDAD EN EL ÁMBITO DE LA SALUD, CON LOS VALORES Y PRINCIPIOS DE RESPETO, IGUALDAD, SOLIDARIDAD, CORRESPONSABILIDAD, ENMARCADA EN LA JUSTICIA SOCIAL\nCOMO ESENCIA DE LA CONSTRUCCIÓN AL SOCIALISMO.	40	1	2
\nORGANIZACIÓN DE LOS BRIGADISTAS DE SALUD, A TRAVÉS DE LA CREACIÓN DEL CONSEJO DE BRIGADISTAS DE SALUD, QUIENES TENDRÁN COMO FUNCIÓN NO SÓLO LA ATENCIÓN MÉDICA PREVENTIVA EN TÉRMINOS FÍSICOS Y PSICOLÓGICOS, SINO TAMBIÉN LA ATENCIÓN INTEGRAL Y SOCIAL DE DIVERSOS ELEMENTOS Y HECHOS QUE EN LA ACTUALIDAD SE CONSIDERAN PROBLEMAS DE SALUD PÚBLICA,COMO EL RUIDO, LA CONTAMINACIÓN, LA INSEGURIDAD, EL TRÁNSITO VEHICULAR, ENTRE OTROS.	41	1	2
\nLA CULMINACIÓN DE LA INFRAESTRUCTURA DE CENTROS ASISTENCIALES, TAL ES EL CASO DEL HOSPITAL DE LAS TEJERÍAS, EL HOSPITAL DE SAN VICENTE Y EL HOSPITAL DE TURMERO.	42	1	2
\nLA REHABILITACIÓN Y REACONDICIONAMIENTO DE LOS CENTROS DE SALUD DEL ESTADO ARAGUA, TALES COMO EL HOSPITAL CENTRAL DE MARACAY Y TODOS LOS AMBULATORIOS DEL ESTADO.	43	1	2
\nPROFUNDIZAR EL IMPULSO HACIA LA TRANSFORMACIÓN DE LAS RELACIONES ESENCIALES DEL PUEBLO CON LA NATURALEZA, CON EL ESTADO, CON LA SOCIEDAD, CON EL PROCESO DE TRABAJO Y CON EL PENSAMIENTO.	93	1	7
\nCON EL APOYO DEL GOBIERNO NACIONAL ARAGUA DEBE CONVERTIRSE EN UNA POTENCIA EN SALUD Y DESARROLLAR UN SISTEMA ESTADAL DE ATENCIÓN GENERAL Y ATENCIÓN ESPECIALIZADA DE MODO QUE EN CADA PARROQUIA HAYA TANTOS MÓDULOS DE LA MISIÓN BARRIO ADENTRO COMO SEAN NECESARIOS Y EN CADA MUNICIPIO UN CENTRO DE SALUD INTEGRAL, PARA QUE LA SALUD SE CONVIERTA EN PRIORITARIA.	44	1	2
\nINSTALAR EN TODO EL ESTADO LA RED DE FARMAPATRIA, PARA QUE NUESTRO PUEBLO TENGA ACCESO A LOS MEDICAMENTOS A MENOS COSTO.	45	1	2
\nORGANIZAR LA CONTRALORÍA SOCIAL EN CADA CENTRO DE SALUD, CON PARTICIPACIÓN DE PACIENTES Y COMUNIDAD EN GENERAL, PARA EL EJERCICIO DE LA VEEDURÍA VINCULADA CON LA ATENCIÓN PRIMARIA, EL EQUIPAMIENTO Y LOS SUMINISTROS.	46	1	2
\nORGANIZAR OPERATIVOS ESPECIALES DE VACUNACIÓN Y ATENCIÓN PRIMARIA PARA LOS NIÑOS, NIÑAS Y PERSONAS DE LA TERCERA EDAD CADA SEMESTRE EN CADA PARROQUIA DEL ESTADO ARAGUA.	47	1	2
\nINSTALAR, AL MENOS, SEIS (6) CENTROS ODONTOLÓGICOS EN EL ESTADO ARAGUA, PARA LA ATENCIÓN ESPECIALIZADA EN EL CAMPO DE LA SALUD BUCAL.	48	1	2
\nORGANIZAR UN SISTEMA DE RECOLECCIÓN Y PROCESAMIENTO DE LA BASURA QUE SEA ECOLÓGICO Y CONVERTIR LA BASURA EN MATERIAL ORGÁNICO E INORGÁNICO RECICLABLE, CON TECNOLOGÍA DE PUNTA, QUE PERMITA DISMINUIR LOS NIVELES DE INSALUBRIDAD EN EL ESTADO ARAGUA.	49	1	2
\nDOTACIÓN DE INSUMOS MÉDICOS Y DE AMBULANCIAS A NUESTROS AMBULATORIOS Y COMUNIDADES.	50	1	2
\nPROFUNDIZAR LAS CONDICIONES QUE ASEGUREN PARA LA FAMILIA VENEZOLANA LA MAYOR SUMA DE SEGURIDAD SOCIAL Y SUPREMA FELICIDAD, A PARTIR DE VALORES Y PRINCIPIOS DE LA EDUCACIÓN LIBERADORA, QUE RESALTEN RESPETO, IGUALDAD, SOLIDARIDAD, CORRESPONSABILIDAD, ENMARCADA EN\nLA JUSTICIA SOCIAL COMO ESENCIA DE LA CONSTRUCCIÓN AL SOCIALISMO.	51	1	3
\nCONSTRUIR Y SOSTENER TODOS LOS SIMONCITOS QUE HAGAN FALTA POR PARROQUIA, PARA LA ATENCIÓN DE LOS NIÑOS MÁS PEQUEÑOS Y GARANTIZAR QUE TENGAN EL VASO DE LECHE ESCOLAR.	52	1	3
\nARAGUA DEBE CONVERTIRSE EN UNA POTENCIA EDUCATIVA, Y POR ELLO SE PONDRÁ ESPECIAL ATENCIÓN A LAS ESCUELAS BÁSICAS, LOS INSTITUTOS UNIVERSITARIOS Y LAS UNIVERSIDADES, ASÍ COMO A LAS MISIONES EDUCATIVAS. CADA MUNICIPIO DEBE CONVERTIRSE EN UNA CIUDAD EDUCADORA, Y PARA ELLO EL GOBIERNO REGIONAL: A) REMODELARÁ LOS CENTROS EDUCATIVOS QUE LO REQUIERAN, B)CONSTRUIRÁ NUEVOS CENTROS PARA LOS NIÑOS, NIÑAS Y ADOLESCENTES, C) FORTALECERÁ EL INCES, PARA PROMOVER LA CULTURA DEL TRABAJO.	53	1	3
\nDESARROLLO DE UNA RED DE BIBLIOTECAS POPULARES, EN CONJUNTO CON LOS INFOCENTROS, PARA LA PROMOCIÓN DE LA LECTURA Y EL USO DE LA TECNOLOGÍA. CADA PARROQUIA DEBE TENER AL MENOS 2 SALAS DE LECTURA Y VARIOS INFOCENTROS.	54	1	3
\nDIAGNÓSTICO Y NORMAS DE INFRAESTRUCTURA VIAL: MEJORAMIENTO DE LA SEGURIDAD A TRAVÉS DE MEDIDAS ESTANDARIZADAS DE INFRAESTRUCTURA VIAL SOBRE LA BASE DE UN DIAGNÓSTICO PREVIO, PRIORIZANDO: LA COLOCACIÓN DE SEÑALES INFORMATIVAS PREVENTIVAS, DEMARCACIÓN DE LOS PAVIMENTOS CON LÍNEAS CENTRALES Y LATERALES; SEÑALIZACIÓN DE CURVAS, INTERSECCIONES Y SITIOS PELIGROSOS; DOTACIÓN DE SERVICIOS DE COMUNICACIÓN PARA EMERGENCIAS EN LAS PRINCIPALES VÍAS; COLOCACIÓN DE PINTURAS EN MUROS Y BARANDAS DE PUENTES; COLOCACIÓN DE BARRERAS DE CONTENCIÓN Y ABSORBEDORES DE IMPACTO; AMPLIACIÓN DE CARRILES; CONSTRUCCIÓN DE ZONAS DE ESTACIONAMIENTO; ÁREAS DE DESCANSO DE SERVICIO; MEDIDAS DE PROTECCIÓN CONTRA LA INESTABILIDAD DE TALUDES; ILUMINACIÓN DE INTERSECCIONES, PUENTES Y SITIOS IDENTIFICADOS COMO PELIGROSOS DURANTE LA NOCHE; DESCONTAMINACIÓN VISUAL DE LAS VÍAS Y RETIRO DE VALLAS COMERCIALES QUE NO CUMPLAN CON LOS ESTÁNDARES ESTABLECIDOS EN LA LEY, CARRILES PARA MOTOCICLETAS, ENTRE OTROS.	55	1	4
\nIMPULSO DE LAS MISIONES SOCIALES Y LAS GRANDES MISIONES: MADRES DEL BARRIO, EN AMOR MAYOR, HIJAS E HIJOS DE VENEZUELA, JOSÉ GREGORIO HERNÁNDEZ, MI CASA BIEN EQUIPADA, SABER Y TRABAJO AGRO VENEZUELA. LA PROPUESTA ES QUE TENGAN CUALQUIER EXPRESIÓN ARTÍSTICA EN CADA PARROQUIA.	79	1	5
\nVIALIDAD PARA EL DESARROLLO URBANO, TURÍSTICO Y AGRÍCOLA: LA REHABILITACIÓN INTEGRAL DE LAS VÍAS TROCALES, LOCALES Y RAMALES QUE PRESENTAN MAYOR DETERIORO EN EL ESTADO ES UNA ACCIÓN ESTRATÉGICA Y POR TANTO PRIORITARIA. SERÁN INCORPORADOS LOS CONSEJOS COMUNALES, EMPRESAS ESTADALES DE CONSTRUCCIÓN Y EMPRESAS PRIVADAS PARA LA EJECUCIÓN DE LAS OBRAS; ASÍ COMO LA “FIESTA DEL ASFALTO”, PARA QUE SEAN ATENDIDAS, DE MANERA PRIORITARIA, LAS PARROQUIAS MÁS URGIDAS, LAS ÁREAS AGRÍCOLAS Y ZONAS TURÍSTICAS PARA FAVORECER EL DESARROLLO\nPLENO DEL ESTADO ARAGUA COMO POTENCIA.	56	1	4
\nORGANIZACIÓN DE LOS CONTRALORES DE LOS ESPACIOS PÚBLICOS, PARA GARANTIZAR QUE LAS OBRAS SE EJECUTEN COMO CORRESPONDE, Y ADEMÁS TENGAN SU MANTENIMIENTO MENOR POR LAS COMUNIDADES ORGANIZADAS O EL MANTENIMIENTO MAYOR CON COOPERACIÓN DEL GOBIERNO REGIONAL.	57	1	4
\nEMBAULAMIENTO DE QUEBRADAS Y ORGANIZACIÓN DE LIMPIEZA PERMANENTE, ADEMÁS DE UN PROGRAMA EDUCATIVO SOBRE EL CUIDO DE LAS QUEBRADAS, PARA QUE NO HAYA DESBORDAMIENTOS POR ACUMULACIÓN DE DESECHOS.	58	1	4
\nLA INTERVENCIÓN Y RECUPERACIÓN DE CINCUENTA (50) CANCHAS DEPORTIVAS, A LOS FINES DE REFORZAR LA ACTIVIDAD DEPORTIVA Y FORTALECER LA PREVENCIÓN DE TODO TIPO DE CONDUCTAS PROBLEMÁTICAS (INCLUYENDO LA VIOLENTA – DELICTIVA) EN TODOS LOS MUNICIPIOS DEL ESTADO ARAGUA.	59	1	4
\nPROYECTO AUTOPISTA SUR DE ARAGUA: INTEGRAR EL NORTE Y EL SUR DEL ESTADO ARAGUA POR MEDIO DE INFRAESTRUCTURALES VIALES, A TRAVÉS DE DISTINTOS EJES VIALES, QUE ESTIMULE EL DESARROLLO E IMPULSE LA CONSOLIDACIÓN DE LOS CENTROS URBANOS CON EL SECTOR PRODUCTIVO.	60	1	4
\nPROYECTO SISTEMA DE MUELLES PARA LA ZONA COSTERA DEL ESTADO ARAGUA: EN VISTA DE LA IMPORTANCIA QUE REPRESENTA EL SECTOR PESQUERO EN ESTADO, ASÍ COMO EL ENORME POTENCIAL HUMANO EXISTENTE EN LA ZONA COSTERA, SE ESTABLECE LA CREACIÓN DE DISTINTOS MUELLES PARA EMBARCACIONES EN LOCALIDADES PRODUCTIVAS ESTRATÉGICAS COMO OCUMARE DE LA COSTA, CHORONÍ Y CHUAO, CON LA FINALIDAD DE ELEVAR AL MÁXIMO ESTE SECTOR PRODUCTIVO.	61	1	4
\nCONSTRUCCIÓN DEL AEROPUERTO INTERNACIONAL JOSÉ FÉLIX RIBAS: EL ESTADO ARAGUA CUENTA CON UN IMPORTANTE POTENCIAL INDUSTRIAL QUE LE CONFIERE CARACTERÍSTICAS POSITIVAS PARA CONVERTIRSE EN UNA DE LAS POTENCIAS ECONÓMICAS DEL PAÍS. PARA REPOTENCIAR ESTA FORTALEZA DEL ESTADO, UNA DE LAS ESTRATEGIAS QUE PREVÉ EL GOBIERNO REVOLUCIONARIO ES LA CONSTRUCCIÓN DE UN AEROPUERTO INTERNACIONAL EN LA CAPITAL DE LA ENTIDAD. ESTO, NO SÓLO CONVERTIRÍA AL ESTADO ARAGUA EN UN POTENCIAL DESTINO AÉREO PARA DIFERENTES PASAJEROS DEL PAÍS, SINO QUE TAMBIÉN FACILITARÍA EL ACCESO A SUS BELLAS COSTAS Y ATRACCIONES TURÍSTICAS. ADEMÁS, ESTE PROYECTO ESTRATÉGICO PERMITIRÁ TENER UN AEROPUERTO INTERNACIONAL ALTERNO AL A.I. SIMÓN BOLÍVAR DE MAIQUETIA. JUNTO CON LA INCLUSIÓN DE VENEZUELA EN EL MERCOSUR, UN AEROPUERTO INTERNACIONAL EN EL ESTADO ARAGUA FACILITARÍA EL INTERCAMBIO COMERCIAL CON OTROS PAÍSES DEL MUNDO Y, A SU VEZ, INCREMENTARÍA EL POTENCIAL INDUSTRIAL Y ECONÓMICO DEL ESTADO. ESTA ACCIÓN SE TRADUCIRÁ EN EL AUMENTO DE LAS FORTALEZAS ECONÓMICAS DEL ESTADO Y EN EL MEJORAMIENTO EN LA CALIDAD DE VIDA DEL ARAGÜEÑO.	62	1	4
\nLA RECUPERACIÓN DE ESPACIOS PÚBLICOS PARA LA SANA RECREACIÓN Y EL TRÁNSITO TRANQUILO. BULEVARES, PARQUES, PLAZAS, AVENIDAS DE MODO QUE TENGAN ALUMBRADO PÚBLICO Y CAPACIDAD PARA EL TRÁNSITO DE PEATONES, DONDE SE PUEDAN OCUPAR CON ACTIVIDADES DEPORTIVAS Y RECREATIVAS.	63	1	4
\nEL DISEÑO DE CICLO VÍAS PARA LOS CICLISTAS DE LA REGIÓN Y PARA FOMENTAR EL USO DE ESE MEDIO DE TRANSPORTE DONDE SEA FACTIBLE POR LA TOPOGRAFÍA DEL LUGAR.	64	1	4
\nCANALIZAR LAS AGUAS SERVIDAS ES UNA PRIORIDAD DE SALUD PÚBLICA Y REQUIERE DE UN ESFUERZO TANTO DEL GOBIERNO REGIONAL COMO NACIONAL, PARA LOGRAR EL CONTROL SANITARIO DE TODO EL ESTADO. 	65	1	4
\nIMPULSAR UN SISTEMA DE TRANSPORTE PÚBLICO INTEGRADO, SEGURO, RENOVADO EN SU PARQUE AUTOMOTOR, URBANO Y EXTRA URBANO, QUE CUBRA TODO EL ESTADO Y UN SISTEMA DE COMUNICACIÓN INTERNA QUE LOGRE INTEGRARLOS EN UNA RED DE TRANSPORTISTAS, CON CAPACIDAD DE RESPUESTA INMEDIATA EN CASO DE ACCIDENTES O DE EVENTOS QUE CONSTITUYAN RIESGO O VULNERABILIDAD.	66	1	4
\nCREAR, AL MENOS, TRES (3) CENTROS DE CONTROL E INSPECCIÓN DE TRANSPORTE PÚBLICO DE CARGA LIVIANA Y PESADA, CON EL PROPÓSITO DE TENER REGISTROS Y SEGUIMIENTO DEL MANTENIMIENTO Y LAS CONDICIONES DEL VEHÍCULO.	67	1	4
\nASEGURAR EL SERVICIO DE GAS DOMESTICO EN TODA LA REGIÓN Y ESPECIALMENTE EN ZONAS RURALES Y SECTORES VULNERADOS.	68	1	4
\nGARANTIZAR LA LUZ ELÉCTRICA EN TODOS LOS MUNICIPIOS DE LA REGIÓN Y CREAR SISTEMAS QUE ACTIVEN LUZ DE EMERGENCIA CUANDO SE REQUIERA.	69	1	4
CONTINUAR CONSTRUYENDO EL SOCIALISMO DEL SIGLO XXI EN VENEZUELA, COMO ALTERNATIVA AL SISTEMA DESTRUCTIVO Y SALVAJE DEL CAPITALISMO, Y CON ELLO ASEGURAR LA “MAYOR SUMA DE SEGURIDAD SOCIAL, MAYOR SUMA DE ESTABILIDAD POLÍTICA Y LA MAYOR SUMA DE FELICIDAD” PARA NUESTRO PUEBLO.	70	1	5
\nHAY ZONAS QUE AMERITAN UNA INTERVENCIÓN INTEGRAL INMEDIATA POR EL NIVEL DE POBREZA Y COMPLEJIDAD: FUNDO COROPO, OCUMARE DE LA COSTA DE ORO, SAN VICENTE, LA PEDRERA, LA COROMOTO, AGUACATAL, MAGDALENO, ROSARIO DE PAYA, SAN MATEO, SUR DE ARAGUA, ENTRE OTROS.	71	1	5
\nLA ATENCIÓN ESPECIAL PARA LAS FAMILIAS AFECTADAS POR LA CRECIDA DEL LAGO LOS TACARIGUAS Y LA RESOLUCIÓN ESTRUCTURAL DE ESE TEMA, A TRAVÉS DE LA CONFORMACIÓN DEL ESTADO MAYOR DEL LAGO LOS TACARIGUAS.	72	1	5
\nCON MOTIVO DE CONMEMORARSE EL BICENTENARIO DE LA BATALLA DE LA VICTORIA, SE TIENE PREVISTA LA CREACIÓN E INAUGURACIÓN DEL PASEO JOSÉ FÉLIX RIBAS, EN HONOR A TAN MEMORABLE FECHA PARA EL PUEBLO ARAGÜEÑO Y PARA EL PAÍS ENTERO.	73	1	7
\nES NECESARIO ENSEÑAR A LAS NUEVAS GENERACIONES A PROTEGER LA NATURALEZA, ASÍ COMO RESPETAR A LOS ANIMALES, A PROPICIAR EL RESPETO POR LA NATURALEZA Y POR EL RESPETO A LA VIDA. POR LO QUE LA CREACIÓN DE LA ESCUELA AMBIENTAL HENRI PITTIER, PASA A FORMAR PARTE DE LA DESEADA Y NECESARIA EDUCACIÓN AMBIENTAL.	103	1	9
\nVIVIENDAS DIGNAS PARA VIVIR VIVIENDO: LA CONSTRUCCIÓN DE VIVIENDAS NO ES TAREA DE UN FUNCIONARIO O UNA PERSONA, SE TRATA DE UNA TAREA COLECTIVA DEL PODER POPULAR, JUNTO A LAS INSTANCIAS GUBERNAMENTALES DESTINADAS A TAL FIN. EN CONSECUENCIA, LA CREACIÓN DE UN CONSEJO DE VOCEROS Y VOCERAS DE LOS POBLADORES Y POBLADORAS, QUE SE DERIVE DEL PROPIO PODER POPULAR ORGANIZADO, COMO INSTANCIA DE PARTICIPACIÓN COLECTIVA QUE, JUNTO AL GOBIERNO BOLIVARIANO DE ARAGUA, ATENDERÁ DE MANERA INTEGRAL LA POLÍTICA DE VIVIENDAS DIGNAS QUE ADELANTA LA REVOLUCIÓN.	74	1	5
\nLA CONSTRUCCIÓN DE UNA RED DE ATENCIÓN A LAS FAMILIAS AFECTADAS POR CUALQUIER CONTINGENCIA NATURAL Y LA ORGANIZACIÓN DEL VOLUNTARIADO ARAGÜEÑO, CON LA FINALIDAD DE ESTABILIZAR LAS PÉRDIDAS Y AFECTACIONES PRODUCIDAS POR DICHA CONTINGENCIA Y DE CARA A LA PROMOCIÓN DE LOS VALORES DE SOLIDARIDAD Y FRATERNIDAD PROPIOS DEL SOCIALISMO DEMOCRÁTICO.	75	1	5
\nINCREMENTAR LA SEGURIDAD SOCIAL DE TODOS LOS TRABAJADORES Y TRABAJADORAS DEL ESTADO ARAGUA, PARA HONRAR LOS PRINCIPIOS DEL SOCIALISMO DEMOCRÁTICO.	76	1	5
\nLA MUJER JUEGA UN IMPORTANTE ROL EN EL FUTURO GOBIERNO DEL ESTADO ARAGUA. POR LO TANTO, SE PROPONE LA CREACIÓN DEL CONSEJO PATRIÓTICO DE MUJERES DE ARAGUA, QUIENES SERÁN LAS GARANTES EN EL CUMPLIMIENTO DE MUCHOS DE LOS ROLES SOCIALES, ASÍ COMO ESTABILIZADORAS DE LA SOCIEDAD ARAGÜEÑA.	77	1	5
\nPLAN PILOTO PARA SAN VICENTE: SE DESARROLLARÁ UNA MISIÓN INTEGRAL QUE SE DENOMINARÁ “A TODA VIDA SAN VICENTE”. A TRAVÉS DE ESTE PROYECTO LLEVARÁ A CABO PLANES DE PREVENCIÓN EN CULTURA, CON NÚCLEOS MUSICALES Y CLÍNICAS DEPORTIVAS.	78	1	4
\nIMPULSAR UN PROGRAMA REGIONAL SOBRE LA SALUD SEXUAL Y REPRODUCTIVA PARA DISMINUIR EL EMBARAZO PRECOZ Y EMPODERAR A LAS ADOLESCENTES EN ÁREAS PRODUCTIVAS Y DE FORMACIÓN PROFESIONAL.	81	1	5
\nCREAR LA ESCUELA DE FORMACIÓN SOCIO-POLÍTICA PARA EL PODER POPULAR. UNA ESCUELA DE FORMACIÓN PARA EL EJERCICIO DEL GOBIERNO LOCAL, EL CONTROL DEL PRESUPUESTO PARTICIPATIVO, LA BANCA COMUNAL, LA ORGANIZACIÓN COMUNITARIA Y LA CONTRALORÍA SOCIAL.	82	1	5
\nFORTALECER EL SECTOR TURISMO, COMO UNA HERRAMIENTA DE INCLUSIÓN SOCIAL,QUE LE FACILITE Y GARANTICE AL PUEBLO VENEZOLANO, FUNDAMENTALMENTE A LAS POBLACIONES MÁS VULNERABLES, EL ACCESO A SU PATRIMONIO TURÍSTICO (DESTINOS TURÍSTICOS) Y EL DISFRUTE DE LAS INFRAESTRUCTURAS TURÍSTICAS DEL ESTADO EN CONDICIONES DE PRECIOS JUSTOS Y RAZONABLES.	83	1	6
\nCREAR LOS COMITÉS PARA EL DESARROLLO DEL TURISMO, QUE FAVOREZCAN LA EJECUCIÓN DE TODOS LOS PLANES TURÍSTICOS CON PARTICIPACIÓN COMUNITARIA.	84	1	6
\nEL NUEVO CICLO REVOLUCIONARIO DE ARAGUA PLANTEA LA RECUPERACIÓN DEL EMBALSE DE CAMATAGUA, POR CUANTO ESTE ESCENARIO NATURAL OFRECE UN ESTUPENDO PAISAJE Y POSEE UNA GRAN DIVERSIDAD DE FAUNA TERRESTRE, HACEN DE ESTE SITIO UNA ALTERNATIVA TURÍSTICA PARA EL ESTADO.	85	1	6
\nRECUPERACIÓN DEL PARQUE AGUSTÍN CODAZZI, UN PUNTO EN LA AGENDA DEL NUEVO GOBIERNO REGIONAL, POR CUANTO REPRESENTA UN ESCENARIO PARA LA RECREACIÓN Y EL ESPARCIMIENTO, Y POTENCIALIZA LOS DESTINOS TURÍSTICOS DEL ESTADO ARAGUA.	86	1	6
\nRECUPERACIÓN DE LOS PARQUES SANTOS MICHELENA Y METROPOLITANO, POR SER ESPACIOS RECREATIVOS DE MARACAY, Y QUE, EN CONJUNTO, CON LA RECUPERACIÓN DE TODAS ESTAS ÁREAS, COMPRENDE UN DESTINO CON POTENCIAL TURÍSTICO EN EL CORAZÓN DE MARACAY.	87	1	6
\nLA TRANSFORMACIÓN DEL HOTEL MARACAY, PARA CONVERTIRLO EN EL HOTEL ESCUELA MARACAY. EN SUS ESPACIOS SERÁN CAPACITADOS LOS LUCHADORES Y LUCHADORAS EN MATERIA DE TURISMO. EL OBJETIVO ES QUE ESTA SEDE CONTRIBUYA CONSIDERABLEMENTE AL SUSTENTO Y ESTIMULACIÓN DE ESTE SECTOR CON POTENCIAL LOCAL Y DE OTRAS REGIONES. ADEMÁS, PROMOVER UNA CULTURA DE ATENCIÓN AL TURISTA QUE PERMITA GENERAR UN SISTEMA DE ATENCIÓN ESPECIALIZADA PARA AUMENTAR EL TURISMO EN ARAGUA.	88	1	6
\nCREAR UN FONDO PARA EL DESARROLLO DEL TURISMO DE MODO QUE LAS COMUNIDADES ORGANIZADAS PUEDAN ACTIVARSE EN PROYECTOS DE DESARROLLO LOCAL PARA EL HOSPEDAJE, LA RECREACIÓN CUALQUIER ACTIVIDAD DE ATENCIÓN AL TURISTA.	89	1	6
\nCREAR EL FONDO PARA EL DESARROLLO PESQUERO EN EL QUE LOS PESCADORES TENGAN ACCESO PARA MEJORAR SUS CONDICIONES MATERIALES Y EJERCER EN CONDICIONES ÓPTIMAS LA ACTIVIDAD PRODUCTIVA.	90	1	6
\nCREAR EMPRESAS MIXTAS PARA LAS DIFERENTES ÁREAS INDUSTRIALES QUE SE DESARROLLAN EN EL ESTADO ARAGUA, COMO LA TEXTIL, METALÚRGICO, AGRÍCOLA, PROCESADORAS DE PESCADO, ENTRE OTROS.	91	1	6
\nFORTALECER EL FONDO PARA LA PEQUEÑA Y MEDIANA INDUSTRIA ARAGÜEÑA EN LAS DIFERENTES ÁREAS PRODUCTIVAS.	92	1	6
\nLA CREACIÓN DE LA ESCUELA DE LOS DIABLOS DANZANTES, CON LA CUAL SE FORTALECERÁ ESTE PATRIMONIO CULTURAL DE LA HUMANIDAD. ES IMPORTANTE RECORDAR QUE CINCO (5) DE LAS COFRADÍAS RATIFICADAS POR LA UNESCO SON ORIUNDAS DE LA ZONA. CON ESTA ESCUELA SE MANTENDRÁ LAS RAÍCES CULTURALES DEL ESTADO A LO LARGO DE LAS DIVERSAS GENERACIONES.	94	1	7
\nREHABILITACIÓN DEL TEATRO DE LA OPERA Y EL ATENEO DE MARACAY. CONSISTE EN LA REHABILITACIÓN Y AMPLIACIÓN DEL AFORO DEL TEATRO DE LA OPERA DE MARACAY, Y LA REHABILITACIÓN INTEGRAL DEL ATENEO DE MARACAY. CONTEMPLA LA CONSTRUCCIÓN DE DOS PALCOS CON LO CUAL SE RATIFICAN ESTOS RECINTOS COMO ICONOS CULTURALES Y CENTROS DE ENCUENTRO DEL  PUEBLO MARACAYERO. TAMBIÉN ESTÁ PREVISTO EL EQUIPAMIENTO Y MODERNIZACIÓN, LO QUE CONTRIBUIRÁ A LA PRESENTACIÓN DE LAS DIVERSA EXPRESIONES ARTÍSTICAS.	95	1	7
\nDEL RECORRIDO REALIZADO DURANTE LA CAMPAÑA, Y LA ATENCIÓN A LAS SOLICITUDES DEL PUEBLO ARAGÜEÑO, SE DESPRENDE LA NECESARIA LA CREACIÓN DE DIVERSAS ESCUELAS DE MÚSICA Y DANZA. ESTAS INSTANCIAS ESTARÁN DIRIGIDAS A NIÑAS, NIÑOS Y JÓVENES EN SECTORES POPULARES, CON LA FINALIDAD DE RESCATAR LOS VALORES CULTURALES Y EL POTENCIAL DE LA JUVENTUD ARAGÜEÑA A TRAVÉS DE LA EXPRESIÓN ARTÍSTICA.	96	1	7
\nLA CREACIÓN DE NÚCLEOS DE ESCUELAS SINFÓNICAS EN CADA MUNICIPIO DEL ESTADO ARAGUA, A TRAVÉS DE OCHO NÚCLEOS DE LA RED DE ESCUELAS DE ORQUESTAS SINFÓNICAS JUVENILES EN LAS CUALES SE FORMARÁN LAS Y LOS JÓVENES EN MATERIA MUSICAL. ESTA MEDIDA CONTRIBUIRÁ A REFORZAR LA CULTURA DE PAZ Y PREVENCIÓN EN LA ENTIDAD.	97	1	7
\nCADA MUNICIPIO CONTARÁ CON UNA CASA DE LA CULTURA PARA FOMENTAR LAS ARTES TRADICIONALES Y LA ORGANIZACIÓN DE LOS CULTORES Y LAS CULTORAS DE LA REGIÓN.	98	1	7
\nSE DISEÑARÁN A MENOS 6 PARQUES DE PATINETEROS Y PAREDES DE ESCALADA, CON EL PROPÓSITO DE CONTRIBUIR CON EL DEPORTE EXTREMO QUE FAVOREZCA LA INCLUSIÓN SIMBÓLICA DE JÓVENES A ACTIVIDADES LÚDICO-RECREATIVA QUE LES GENERE INTERÉS.	99	1	7
\nSE DESARROLLARÁ CADA AÑO UN FESTIVAL DE VIDEOS REALIZADOS POR LOS JÓVENES Y CONCURSOS PARA LOS MEJORES. PARA ELLO SE ABRIRÁ UNA ESCUELA DE VIDEO PARA AQUELLOS JÓVENES INTERESADOS EN EL CULTIVO DE ESTA CAPACIDAD ARTÍSTICA.	100	1	7
\nINSTALAR UN MUSEO PARA LOS NIÑOS Y JÓVENES EN EL ESTADO ARAGUA CON TEMAS DE LAS CIENCIAS BÁSICAS PARA FOMENTAR LA CURIOSIDAD CIENTÍFICA EN LOS NIÑOS, NIÑAS Y ADOLESCENTES.	101	1	7
\nLA META DEBE SER AGUA POTABLE PARA TODAS LAS COMUNIDADES DE ARAGUA. NO PUEDE HABER NINGUNA COMUNIDAD QUE NO SE SIRVA DEL SISTEMA DE AGUA POTABILIZADORA.	104	1	9
\nSE CREA UN EQUIPO PERMANENTE CON CUADRILLAS DE TRABAJADORES ENCARGADOS DE LA LIMPIEZA DE LOS RÍOS, LAS LAGUNAS Y LAS QUEBRADAS, CON PARTICIPACIÓN DE LOS CONSEJOS COMUNALES Y LAS COMUNAS ORGANIZADAS. 	105	1	9
\nVIGILANCIA PERMANENTE SOBRE LA DEFORESTACIÓN, PORQUE ES UN DELITO Y PERSEGUIRLO COMO TAL. LA VEEDURÍA COMUNITARIA SE CONVIERTE EN UNA TAREA QUE SE TRADUCE EN LA ORGANIZACIÓN DE LOS CONTRALORES.	106	1	9
\nTODOS LOS ESPACIOS PÚBLICOS COMO PLAZAS O CENTROS CULTURALES SE LLENARÁN DE GRUPOS QUE PUEDAN PRESENTAR SUS MANIFESTACIONES CULTURALES. EL GOBIERNO REGIONAL CREARÁ LAS CONDICIONES PARA QUE TODOS LOS MUNICIPIOS PUEDAN TENER ACCESO A LA CULTURA.	108	1	7
\nSE ORGANIZARÁ CADA AÑO UNA FERIA DEL LIBRO PARA FOMENTAR LA LECTURA Y EL CULTIVO POR LOS VALORES DEL ESTUDIO Y LA RECREACIÓN INTELECTUAL.	109	1	7
\nSE RECUPERARÁN LOS MUESOS HISTÓRICOS Y SE HARÁN CURADURÍAS VINCULADAS A LOS EPISODIOS HISTÓRICOS MÁS IMPORTANTES VINCULADOS CON LOS MISMOS Y SE PROMOVERÁ LA VISITA A LOS MUESOS CON LAS ESCUELAS, LICEOS Y UNIVERSIDADES.	110	1	7
\nLOS MOVIMIENTOS MUSICALES TENDRÁN ESPECIAL INTERÉS EN EL GOBIERNO REGIONAL Y SE CREARÁN LAS CONDICIONES PARA QUE SE PUEDA FOMENTAR UNA RED DE MÚSICOS QUE PUEDAN PRODUCIR SUS DISCOS A BAJO COSTO.	111	1	7
\nORGANIZARÁ EL GOBIERNO REGIONAL EL FESTIVAL ANUAL DE TEATRO, PARA FOMENTAR LOS GRUPOS TEATRALES ESCOLARES, UNIVERSITARIOS Y OTROS GRUPOS INTERESADOS DE LA COMUNIDAD. SE ABRIRÁ UN FONDO ESPECIAL PARA FINANCIAR ESTE TIPO DE ACTIVIDADES.	112	1	7
\nEN EL MARCO DE LA COMUNICACIÓN, SE PREVÉ LA CREACIÓN DEL CONSEJO DE MEDIOS ALTERNATIVOS, QUE PERMITA LA CONVERGENCIA DE TODOS LOS SECTORES COMUNICACIONALES DEL ESTADO, IMPRESOS, RADIALES Y TELEVISIVOS, QUE PERMITAN LA LIBRE EXPRESIÓN DEL PUEBLO ARAGÜEÑO.	113	1	7
\nASIMISMO, SE CONSIDERA LA FUNDACIÓN DEL PERIÓDICO “CIUDAD MARACAY” QUE PERMITIRÁ LA SOCIALIZACIÓN DE LA INFORMACIÓN Y EL LIBRE ACCESO DE LA CIUDADANÍA. ADEMÁS DE ACOMPAÑAR AL GOBIERNO BOLIVARIANO EN EL DESARROLLO DEL SISTEMA NACIONAL DE MEDIOS PÚBLICOS.	114	1	7
\nSE PLANTEA INTEGRAR LA MODERNIZACIÓN DE LOS ESPACIOS PÚBLICOS CON LOS LUGARES ICÓNICOS DE LA CIUDAD E INTEGRAR A LA VIDA COTIDIANA DE LOS CIUDADANOS Y CIUDADANAS, Y EL COMPARTIR UNOS ESPACIOS DIGNOS PARA EL DESARROLLO CULTURAL EN ARMONÍA CON EL AMBIENTE. ASIMISMO, SE PREVÉ LA RECUPERACIÓN DE ESPACIOS FÍSICOS Y LA CONSTRUCCIÓN DE UN PARQUE QUE INTEGRE LAS ACTIVIDADES DEPORTIVAS, RECREACIONALES Y CULTURALES CON LA INCORPORACIÓN DE SUS VISITANTES A UN ENCUENTRO CERCANO CON EL AMBIENTE, DONDE SE REALIZAN ACTIVIDADES DE RECICLAJE, AMBIENTES TEMÁTICOS PARA ENERGÍAS ALTERNATIVAS Y CONVIERTAN AL PARQUE EN UN ÁREA ECOLÓGICA AUTOSUSTENTABLE.	115	1	9
\nIMPULSAR LA MISIÓN ÁRBOL, PARA HACER DE ARAGUA EL REAL ESTADO JARDÍN. RECUPERAR LOS ESPACIOS PARA ARBORIZAR TODO EL ESTADO.	116	1	9
\nCREAR EL CONSEJO DE MANTENIMIENTO DE LAS PLAYAS PARA CREAR CONCIENCIA AMBIENTAL, MANTENERLAS LIMPIAS Y DESARROLLAR UN SISTEMA DE SANCIONES PARA QUIENES ATENTEN CONTRA LA NATURALEZA.	117	1	9
GENERAR UN MECANISMO PARA SUPERVISAR LAS EMPRESAS Y LA EMISIÓN DE GASES TÓXICOS, DE MODO QUE SE CUMPLAN LAS EXIGENCIAS INDUSTRIALES NECESARIAS PARA QUE NO HAYA CONTAMINACIÓN AMBIENTAL.	118	1	9
\.


--
-- Name: objetivo_especifico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('objetivo_especifico_id_seq', 1, false);


--
-- Data for Name: objetivo_estrategico; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY objetivo_estrategico (objetivo_estrategico, id, plan_patria, objetivo_historico, objetivo_nacional) FROM stdin;
1.1.3. FORTALECER Y EXPANDIR EL PODER POPULAR.	2	1	3	3
1.2.3. MANTENER Y GARANTIZAR EL CONTROL POR PARTE DEL ESTADO DE LAS EMPRESAS NACIONALES QUE EXPLOTEN LOS RECURSOS MINEROS EN EL TERRITORIO NACIONAL.	7	1	3	4
1.2.2. MANTENER Y GARANTIZAR EL CONTROL POR PARTE DEL ESTADO SOBRE PETRÓLEOS DE VENEZUELA S.A. (PDVSA).	6	1	3	4
2.2.7. FORTALECER EL PROTAGONISMO DE LA JUVENTUD EN EL DESARROLLO Y CONSOLIDACIÓN DE LA REVOLUCIÓN BOLIVARIANA.	245	1	4	11
1.1.2. PREPARAR LA DEFENSA DE LA VOLUNTAD DEL PUEBLO, MEDIANTE LA ORGANIZACIÓN POPULAR Y EL EJERCICIO DEMOCRÁTICO DE LA AUTORIDAD DEL ESTADO	1	1	3	3
1.1.4. PRESERVAR Y RECUPERAR LOS ESPACIOS DE GOBIERNO REGIONAL Y LOCAL, PARA PROFUNDIZAR LA RESTITUCIÓN DEL PODER AL PUEBLO.	3	1	3	3
1.1.5. SEGUIR CONSTRUYENDO LA SOBERANÍA Y DEMOCRATIZACIÓN COMUNICACIONAL.	4	1	3	3
1.2.1. FORTALECER EL ROL DEL ESTADO EN LA ADMINISTRACIÓN Y EXPLOTACIÓN DE LOS RECURSOS HIDROCARBURÍFEROS Y MINEROS.	5	1	3	4
3.4.4. MEJORAR E INCREMENTAR LA INFRAESTRUCTURA EN LAS ÁREAS DE PRODUCCIÓN AGRÍCOLA.	288	1	5	18
1.2.4. PROMOVER Y ESTIMULAR LA INVESTIGACIÓN CIENTÍFICA Y EL DESARROLLO TECNOLÓGICO, CON EL PROPÓSITO DE ASEGURAR LAS OPERACIONES MEDULARES DE LA INDUSTRIA PETROLERA.	8	1	3	4
1.2.5. ASEGURAR LOS MEDIOS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS Y ESTRATÉGICAS ASOCIADAS A LA CADENA INDUSTRIAL DE EXPLOTACIÓN DE LOS RECURSOS HIDROCARBURÍFEROS.	9	1	3	4
1.2.6. FORTALECER LA COORDINACIÓN DE POLÍTICAS PETROLERAS EN EL SENO DE LA OPEP Y OTROS ORGANISMOS INTERNACIONALES, PARA LA JUSTA VALORIZACIÓN DE NUESTROS RECURSOS NATURALES.	10	1	3	4
1.2.7. IMPULSAR Y PROMOVER UNA INICIATIVA DE COORDINACIÓN ENTRE LOS PAÍSES GIGANTES PETROLEROS.	11	1	3	4
1.2.8. ASEGURAR LOS MEDIOS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS Y ESTRATÉGICAS ASOCIADAS A LA CADENA INDUSTRIAL DE EXPLOTACIÓN DE LOS RECURSOS MINEROS.	12	1	3	4
1.2.9. LOGRAR UNA INSTANCIA DE COORDINACIÓN DE POLÍTICAS GASÍFERAS PARA UNA VALORIZACIÓN JUSTA Y RAZONABLE DEL GAS.	13	1	3	4
1.2.10. ELEVAR LA CONCIENCIA POLÍTICA E IDEOLÓGICA DEL PUEBLO Y DE LOS TRABAJADORES PETROLEROS Y MINEROS, ASÍ COMO TAMBIÉN SU PARTICIPACIÓN ACTIVA EN LA DEFENSA DE LOS RECURSOS NATURALES ESTRATÉGICOS DE LA NACIÓN.	14	1	3	4
1.2.11. CREAR LAS CONDICIONES PARA INFLUIR EN LA VALORIZACIÓN DE LOS PRECIOS DE LOS MINERALES.	15	1	3	4
1.3.1. MANTENER Y FORTALECER EL ACTUAL RÉGIMEN FISCAL PETROLERO PARA GARANTIZAR EL BIENESTAR DEL PUEBLO.	16	1	3	5
1.3.2. MANTENER Y FORTALECER MECANISMOS EFICACES DE CAPTACIÓN DE LA RENTA EXCEDENTARIA, POR INCREMENTOS EXTRAORDINARIOS DE LOS PRECIOS INTERNACIONALES DE LOS HIDROCARBUROS.	17	1	3	5
1.3.3. ESTABLECER Y DESARROLLAR UN RÉGIMEN FISCAL MINERO, ASÍ COMO MECANISMOS DE CAPTACIÓN EFICIENTES PARA LA RECAUDACIÓN DE LA RENTA POR LA ACTIVIDAD MINERA.	18	1	3	5
1.3.4. ESTABLECER MECANISMOS DE CONTROL SOBRE LA COMERCIALIZACIÓN DE LOS MINERALES.	19	1	3	5
1.3.5. FORTALECER Y PROFUNDIZAR ACUERDOS FINANCIEROS CON SOCIOS ESTRATÉGICOS.	20	1	3	5
1.3.6. MANTENER Y CONSOLIDAR LOS CONVENIOS DE COOPERACIÓN, SOLIDARIDAD Y COMPLEMENTARIEDAD CON PAÍSES ALIADOS.	21	1	3	5
1.3.7. FORTALECER LOS MECANISMOS DE COOPERACIÓN EN EL MERCADO COMÚN DEL SUR (MERCOSUR).	22	1	3	5
1.3.8. DISEÑAR Y ESTABLECER MECANISMOS NOVEDOSOS Y EFECTIVOS, ORIENTADOS A PROMOVER LA PARTICIPACIÓN POPULAR EN LA RENTA PETROLERA, TALES COMO LA INVERSIÓN Y EL AHORRO.	23	1	3	5
1.3.9. COMPATIBILIZAR EL SISTEMA IMPOSITIVO HACIA ESTÁNDARES INTERNACIONALES DE EFICIENCIA TRIBUTARIA PARA ALCANZAR ACUERDOS COMERCIALES MÁS EFECTIVOS Y EFICIENTES CON LOS PAÍSES SOCIOS, SALVAGUARDANDO LA SOBERANÍA NACIONAL.	24	1	3	5
1.3.10. MEJORAR Y PROMOVER LA EFICIENCIA DE LA GESTIÓN FISCAL DEL SECTOR PÚBLICO PARA GENERAR MAYOR TRANSPARENCIA Y CONFIABILIDAD SOBRE EL IMPACTO ECONÓMICO Y SOCIAL DE LA POLÍTICA FISCAL.	25	1	3	5
1.4.4. FORTALECER LA INFRAESTRUCTURA, EL DESARROLLO Y FUNCIONAMIENTO DE LOS GRANDES POLOS SOCIALISTAS DE PRODUCCIÓN PRIMARIA AGROPECUARIA Y GRANDES SISTEMAS DE RIEGO, GESTIONADOS A TRAVÉS DE EMPRESAS SOCIALISTAS, PRIVILEGIANDO LA INTEGRACIÓN DE LOS PROCESOS PRODUCTIVOS A ESCALA INDUSTRIAL.	26	1	3	6
1.4.5. CONSOLIDAR LAS REDES DE PRODUCCIÓN Y DISTRIBUCIÓN DE PRODUCTOS DE CONSUMO DIRECTO Y DEL SISTEMA DE PROCESAMIENTO AGROINDUSTRIAL.	27	1	3	6
1.4.6. CREAR, CONSOLIDAR Y APOYAR CENTROS DE VENTA Y DISTRIBUCIÓN DIRECTA DE PRODUCTOS AGROPECUARIOS Y OTROS DE CONSUMO MASIVO, LOCALES Y EN LAS GRANDES CIUDADES, GARANTIZANDO SU ACCESO A PRECIO JUSTO POR PARTE DE LA POBLACIÓN Y UNA REMUNERACIÓN JUSTA AL TRABAJO CAMPESINO E INCENTIVANDO EL DESARROLLO DEL COMERCIO LOCAL, NACIONAL Y DE EXPORTACIÓN.	28	1	3	6
1.4.1. ELIMINAR DEFINITIVAMENTE EL LATIFUNDIO. REALIZAR UN PROCESO DE ORGANIZACIÓN Y ZONIFICACIÓN AGROECOLÓGICA EN BASE A LAS CAPACIDADES DE USO DE LA TIERRA Y CREAR UN SISTEMA DE CATASTRO RURAL PARA GARANTIZAR EL ACCESO JUSTO Y USO RACIONAL DEL RECURSO SUELO.	29	1	3	6
1.4.3. AFIANZAR UN CONJUNTO DE POLÍTICAS PÚBLICAS DE APOYO A LA PRODUCCIÓN, DISTRIBUCIÓN, COMERCIALIZACIÓN Y ORGANIZACIÓN DEL SECTOR RURAL Y PARTICIPACIÓN DEL PODER POPULAR CAMPESINO EN LA IMPLEMENTACIÓN DE UN PLAN NACIONAL DE PRODUCCIÓN DE ALIMENTOS QUE GARANTICE LA SOBERANÍA ALIMENTARIA.	30	1	3	6
1.1.1. FORTALECER A TRAVÉS DE LOS PROCESOS ELECTORALES LA REVOLUCIÓN BOLIVARIANA, ELEVANDO LA MORAL Y LA CONCIENCIA DEL PUEBLO VENEZOLANO Y DE LOS PUEBLOS DEL MUNDO EN SU LUCHA POR LA EMANCIPACIÓN.	31	1	3	3
1.2.12. GARANTIZAR LA PROPIEDAD Y USO DE LOS RECURSOS NATURALES DEL PAÍS, DE FORMA SOBERANA, PARA LA SATISFACCIÓN DE LAS DEMANDAS INTERNAS ASÍ COMO SU USO EN FUNCIÓN DE LOS MÁS ALTOS INTERESES NACIONALES.	32	1	3	4
1.4.7. CONSOLIDAR EL APARATO AGROINDUSTRIAL BAJO CONTROL DE EMPRESAS SOCIALISTAS, GARANTIZANDO AL MENOS UN 60% DE LA CAPACIDAD DE ALMACENAMIENTO Y PROCESAMIENTO EN RUBROS BÁSICOS (CEREALES, OLEAGINOSAS, LEGUMINOSAS, AZÚCAR, CARNE Y LECHE) Y UN 30% EN EL RESTO DE LOS RUBROS ALIMENTICIOS.	33	1	3	6
1.4.8. DESARROLLAR UN SISTEMA DE APOYO E INCENTIVOS PARA LA PROMOCIÓN DEL COMERCIO INTERNACIONAL DE EXPORTACIÓN DE RUBROS AGRÍCOLAS.	34	1	3	6
1.4.9. ESTABLECER MECANISMOS PARA EJERCER LA NUEVA INSTITUCIONALIDAD REVOLUCIONARIA QUE GARANTICE LA PARTICIPACIÓN DE LOS PEQUEÑOS Y MEDIANOS PRODUCTORES EN LAS DECISIONES EN MATERIA AGROPECUARIA, A TRAVÉS DE LOS CONSEJOS CAMPESINOS Y LAS REDES DE PRODUCTORES Y PRODUCTORAS LIBRES Y ASOCIADOS.	35	1	3	6
5.2.2. DESMONTAR Y LUCHAR CONTRA LOS ESQUEMAS INTERNACIONALES QUE PROMUEVEN LA MERCANTILIZACIÓN DE LA NATURALEZA, DE LOS SERVICIOS AMBIENTALES Y DE LOS ECOSISTEMAS.	105	1	7	24
1.4.10. PROMOVER LOS MODELOS DE PRODUCCIÓN DIVERSIFICADOS, A PARTIR DE LA AGRICULTURA FAMILIAR, CAMPESINA, URBANA, PERIURBANA E INDÍGENA, RECUPERANDO, VALIDANDO Y DIVULGANDO MODELOS TRADICIONALES Y SOSTENIBLES DE PRODUCCIÓN.	36	1	3	6
3.2.4. GENERAR MECANISMOS DE CIRCULACIÓN DEL CAPITAL QUE CONSTRUYAN UN NUEVO METABOLISMO ECONÓMICO PARA EL ESTÍMULO, FUNCIONAMIENTO Y DESARROLLO DE LA INDUSTRIA NACIONAL.	71	1	5	16
1.5.1. CONSOLIDAR UN ESTILO CIENTÍFICO, TECNOLÓGICO E INNOVADOR DE CARÁCTER TRANSFORMADOR, DIVERSO, CREATIVO Y DINÁMICO, GARANTE DE LA INDEPENDENCIA Y LA SOBERANÍA ECONÓMICA, CONTRIBUYENDO ASÍ A LA CONSTRUCCIÓN DEL MODELO PRODUCTIVO SOCIALISTA, EL FORTALECIMIENTO DE LA ÉTICA SOCIALISTA Y LA SATISFACCIÓN EFECTIVA DE LAS NECESIDADES DEL PUEBLO VENEZOLANO.	37	1	3	7
1.5.2. FORTALECER LOS ESPACIOS Y PROGRAMAS DE FORMACIÓN PARA EL TRABAJO LIBERADOR, FOMENTANDO LOS VALORES PATRIÓTICOS Y EL SENTIDO CRÍTICO.	38	1	3	7
1.5.3. IMPULSAR EL DESARROLLO Y USO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.	39	1	3	7
1.5.4. ESTABLECER UNA POLÍTICA SATELITAL DEL ESTADO VENEZOLANO PARA COLOCAR LA ACTIVIDAD AL SERVICIO DEL DESARROLLO GENERAL DE LA NACIÓN.	40	1	3	7
1.6.1. INCREMENTAR LA CAPACIDAD DEFENSIVA DEL PAÍS CON LA CONSOLIDACIÓN Y AFIANZAMIENTO DE LA REDISTRIBUCIÓN TERRITORIAL DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.	41	1	3	8
1.6.2. CONSOLIDAR LA GRAN MISIÓN SOLDADO DE LA PATRIA NEGRO PRIMERO COMO POLÍTICA INTEGRAL DE FORTALECIMIENTO DE LA FUERZA ARMADA NACIONAL BOLIVARIANA, QUE ASEGURE BIENESTAR, SEGURIDAD SOCIAL Y PROTECCIÓN A LA FAMILIA MILITAR VENEZOLANA; EL EQUIPAMIENTO, MANTENIMIENTO E INFRAESTRUCTURA MILITAR; LA PARTICIPACIÓN DE LA FANB EN LAS TAREAS DE DESARROLLO NACIONAL; Y EL DESARROLLO EDUCATIVO DE SUS COMPONENTES.	42	1	3	8
1.4.2. ACELERAR LA DEMOCRATIZACIÓN DEL ACCESO DE LOS CAMPESINOS Y CAMPESINAS, PRODUCTORES Y PRODUCTORAS, Y DE LAS DISTINTAS FORMAS COLECTIVAS Y EMPRESAS SOCIALISTAS, A LOS RECURSOS NECESARIOS PARA LA PRODUCCIÓN (TIERRA, AGUA, RIEGO, SEMILLAS, CAPITAL), IMPULSANDO EL USO RACIONAL Y SOSTENIBLE DE LOS MISMOS.	43	1	3	6
1.6.3. FORTALECER E INCREMENTAR EL SISTEMA DE INTELIGENCIA Y CONTRAINTELIGENCIA MILITAR PARA LA DEFENSA INTEGRAL DE LA PATRIA.	44	1	3	8
1.6.4. FORTALECER LA MILICIA NACIONAL BOLIVARIANA.	45	1	3	8
1.6.5. INCREMENTAR Y MANTENER EL APRESTO OPERACIONAL DE LA FUERZA ARMADA NACIONAL BOLIVARIANA PARA LA DEFENSA INTEGRAL DE LA NACIÓN.	46	1	3	8
1.7.1. CREAR EL SISTEMA INTEGRAL DE GESTIÓN DE LOS ESTADOS DE EXCEPCIÓN.	47	1	3	9
1.7.2. CREAR EL SISTEMA LOGÍSTICO NACIONAL, INTEGRANDO EL SISTEMA LOGÍSTICO DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.	48	1	3	9
2.1.1. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN QUE PONGAN AL SERVICIO DE LA SOCIEDAD LOS MEDIOS DE PRODUCCIÓN, Y ESTIMULEN LA GENERACIÓN DE UN TEJIDO PRODUCTIVO SUSTENTABLE ENMARCADO EN EL NUEVO METABOLISMO PARA LA TRANSICIÓN AL SOCIALISMO.	49	1	4	10
2.1.2. DESARROLLAR UN SISTEMA DE FIJACIÓN DE PRECIOS JUSTOS PARA LOS BIENES Y SERVICIOS, COMBATIENDO LAS PRÁCTICAS DE ATAQUE A LA MONEDA, ACAPARAMIENTO, ESPECULACIÓN, USURA Y OTROS FALSOS MECANISMOS DE FIJACIÓN DE PRECIOS, MEDIANTE EL FORTALECIMIENTO DE LAS LEYES E INSTITUCIONES RESPONSABLES Y LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR, PARA EL DESARROLLO DE UN NUEVO MODELO PRODUCTIVO DIVERSIFICADO, SUSTENTADO EN LA CULTURA DEL TRABAJO.\n	50	1	4	10
2.1.3. EXPANDIR E INTEGRAR LAS CADENAS PRODUCTIVAS, GENERANDO LA MAYOR CANTIDAD DE VALOR AGREGADO Y ORIENTÁNDOLAS HACIA LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES PARA LA CONSTRUCCIÓN DEL SOCIALISMO, PROMOVIENDO LA DIVERSIFICACIÓN DEL APARATO PRODUCTIVO.	51	1	4	10
2.1.5. FORTALECER EL SISTEMA DE DISTRIBUCIÓN DIRECTA DE LOS INSUMOS Y PRODUCTOS, ATACANDO LA ESPECULACIÓN PROPIA DEL CAPITALISMO, PARA GARANTIZAR LA SATISFACCIÓN DE LAS NECESIDADES DEL PUEBLO.	52	1	4	10
2.1.6. CONFORMAR LA INSTITUCIONALIDAD DEL MODELO DE GESTIÓN SOCIALISTA.	53	1	4	10
3.1.1. DESARROLLAR LA CAPACIDAD DE PRODUCCIÓN DEL PAÍS EN LÍNEA CON LAS INMENSAS RESERVAS DE HIDROCARBUROS, BAJO EL PRINCIPIO DE LA EXPLOTACIÓN RACIONAL Y LA POLÍTICA DE CONSERVACIÓN DEL RECURSO NATURAL AGOTABLE Y NO RENOVABLE.	54	1	5	15
3.1.2. DESARROLLAR LA FAJA PETROLÍFERA DEL ORINOCO, PARA ALCANZAR, MEDIANTE LAS RESERVAS PROBADAS, YA CERTIFICADAS, UNA CAPACIDAD DE PRODUCCIÓN TOTAL DE 4 MMBD PARA EL 2019, EN CONCORDANCIA CON LOS OBJETIVOS ESTRATÉGICOS DE PRODUCCIÓN DE CRUDO, BAJO UNA POLÍTICA AAMBIENTALMENTE RESPONSABLE.	55	1	5	15
3.1.3. MANTENER LA PRODUCCIÓN EN LAS ÁREAS TRADICIONALES DE PETRÓLEO Y GAS.	56	1	5	15
3.1.4. DESARROLLAR LAS RESERVAS DEL CINTURÓN GASÍFERO EN NUESTRO MAR TERRITORIAL INCREMENTANDO LA CAPACIDAD DE PRODUCCIÓN Y ACELERANDO LOS ESFUERZOS EXPLORATORIOS DE NUESTRAS RESERVAS.	57	1	5	15
3.1.5. ADECUAR Y EXPANDIR EL CIRCUITO DE REFINACIÓN NACIONAL PARA EL INCREMENTO DE LA CAPACIDAD DE PROCESAMIENTO DE HIDROCARBUROS, EN ESPECÍFICO CRUDO EXTRA PESADO DE LA FAJA, DESCONCENTRANDO TERRITORIALMENTE LA MANUFACTURA DE COMBUSTIBLE Y AMPLIANDO LA COBERTURA TERRITORIAL DE ABASTECIMIENTO DE LAS REFINERÍAS.	58	1	5	15
3.1.6. EXPANDIR LA INFRAESTRUCTURA DE TRANSPORTE, AL MACENAMIENTO Y DESPACHO DE PETRÓLEO Y GAS, SOBRE LA BASE DE COMPLEMENTAR LOS OBJETIVOS DE SEGURIDAD ENERGÉTICA DE LA NACIÓN, LA NUEVA GEOPOLÍTICA NACIONAL Y EL INCREMENTO DE LA PRODUCCIÓN NACIONAL DE PETRÓLEO Y GAS.	59	1	5	15
3.1.7. FORTALECER Y EXPANDIR LA INDUSTRIA PETROQUÍMICA NACIONAL.	60	1	5	15
3.1.8. DESARROLLAR EL COMPLEJO INDUSTRIAL CONEXO A LA INDUSTRIA PETROLERA, GASÍFERA Y PETROQUÍMICA PARA FORTALECER Y PROFUNDIZAR NUESTRA SOBERANÍA ECONÓMICA.	61	1	5	15
3.1.9. FORTALECER Y PROFUNDIZAR LA SOBERANÍA TECNOLÓGICA DEL SECTOR HIDROCARBUROS.	62	1	5	15
3.1.11. FORTALECER Y PROFUNDIZAR LAS CAPACIDADES OPERATIVAS DE PDVSA.	63	1	5	15
3.1.13. FORTALECER AL ESTADO EN EL CONTROL Y GESTIÓN DEL SISTEMA ELÉCTRICO NACIONAL PARA SU AMPLIACIÓN Y CONSOLIDACIÓN.	64	1	5	15
3.1.14. FORTALECER Y PROFUNDIZAR LA COOPERACIÓN ENERGÉTICA INTERNACIONAL.	65	1	5	15
3.1.15. CONTRIBUIR AL DESARROLLO DEL SISTEMA ECONÓMICO NACIONAL MEDIANTE LA EXPLOTACIÓN Y TRANSFORMACIÓN RACIONAL SUSTENTABLE DE LOS RECURSOS MINERALES, CON EL USO DE TECNOLOGÍA DE BAJO IMPACTO AMBIENTAL.	66	1	5	15
3.1.16. DESARROLLAR EL POTENCIAL MINERO NACIONAL PARA LA DIVERSIFICACIÓN DE LAS FUENTES DE EMPLEO, INGRESOS Y FORMAS DE PROPIEDAD SOCIAL.	67	1	5	15
3.2.1. AVANZAR HACIA LA SOBERANÍA E INDEPENDENCIA PRODUCTIVA EN LA CONSTRUCCIÓN DE REDES ESTRATÉGICAS TANTO PARA BIENES ESENCIALES COMO DE GENERACIÓN DE VALOR, A PARTIR DE NUESTRAS VENTAJAS COMPARATIVAS.	68	1	5	16
3.2.2. APROVECHAR LAS VENTAJAS DE LOCALIZACIÓN DE NUESTRO PAÍS A ESCALA CONTINENTAL Y DIVERSIDAD DE REGIONES NACIONALES, A EFECTO DE FOMENTAR SU ESPECIALIZACIÓN PRODUCTIVA, ASOCIADA A VENTAJAS COMPARATIVAS DE SECTORES ESTRATÉGICOS.	69	1	5	16
3.2.3. APROPIAR Y DESARROLLAR LA TÉCNICA Y TECNOLOGÍA COMO CLAVE DE LA EFICIENCIA Y HUMANIZACIÓN DEL PROCESO PRODUCTIVO, ANCLANDO ESLABONES DE LAS CADENAS PRODUCTIVAS Y DESATANDO EL POTENCIAL ESPACIAL DE LAS MISMAS.	70	1	5	16
3.2.7. DESARROLLAR EL SECTOR TURISMO COMO UNA ACTIVIDAD PRODUCTIVA SUSTENTABLE QUE GENERE EXCEDENTES QUE PUEDAN REDISTRIBUIRSE PARA SATISFACER LAS NECESIDADES DEL PUEBLO.	72	1	5	16
3.3.1. FORTALECER LA INDUSTRIA MILITAR VENEZOLANA.	73	1	5	17
3.3.2. DESARROLLAR EL SISTEMA DE ADIESTRAMIENTO CON LA DOCTRINA MILITAR BOLIVARIANA PARA LA DEFENSA INTEGRAL DE LA PATRIA.	74	1	5	17
3.3.3. MEJORAR Y PERFECCIONAR EL SISTEMA EDUCATIVO DE LA FUERZA ARMADA NACIONAL Y EL PODER POPULAR, PARA FORTALECER LA UNIDAD CÍVICO MILITAR EN FUNCIÓN DE LOS INTERESES DE LA PATRIA.	75	1	5	17
3.4.2. MANTENER Y GARANTIZAR EL FUNCIONAMIENTO DEL CONSEJO FEDERAL DE GOBIERNO, LAS INSTANCIAS QUE LO CONFORMAN, ASÍ COMO LAS FORMAS DE COORDINACIÓN DE POLÍTICAS Y ACCIONES ENTRE LAS ENTIDADES POLÍTICO-TERRITORIALES Y LAS ORGANIZACIONES DE BASE DEL PODER POPULAR.	76	1	5	18
5.3.4. ELABORAR ESTRATEGIAS DE MANTENIMIENTO Y DIFUSIÓN DE LAS CARACTERÍSTICAS CULTURALES Y DE LA MEMORIA HISTÓRICA DEL PUEBLO VENEZOLANO.	111	1	7	25
3.4.3. PROMOVER LA CREACIÓN DE LOS DISTRITOS MOTORES DE DESARROLLO, CON LA FINALIDAD DE IMPULSAR PROYECTOS ECONÓMICOS, SOCIALES, CIENTÍFICOS Y TECNOLÓGICOS DESTINADOS A LOGRAR EL DESARROLLO INTEGRAL DE LAS REGIONES Y EL FORTALECIMIENTO DEL PODER POPULAR, EN ARAS DE FACILITAR LA TRANSICIÓN HACIA EL SOCIALISMO.	77	1	5	18
3.4.5. INTEGRAR EL TERRITORIO NACIONAL, MEDIANTE LOS CORREDORES MULTIMODALES DE INFRAESTRUCTURA: TRANSPORTE TERRESTRE, FERROVIARIO, AÉREO, FLUVIAL, ENERGÍA ELÉCTRICA,GAS, PETRÓLEO, AGUA Y TELECOMUNICACIONES.	78	1	5	18
4.1.1. FORTALECER LA ALIANZA BOLIVARIANA PARA LOS PUEBLOS DE NUESTRA AMÉRICA (ALBA) COMO EL ESPACIO VITAL DE RELACIONAMIENTO POLÍTICO DE LA REVOLUCIÓN BOLIVARIANA.	79	1	6	19
4.1.2. FORTALECER LA INICIATIVA PETROCARIBE COMO ESQUEMA DE COOPERACIÓN ENERGÉTICA Y SOCIAL SOLIDARIO.	80	1	6	19
4.1.3. FORTALECER MERCOSUR COMO ESPACIO DE COOPERACIÓN E INTEGRACIÓN SOCIAL, POLÍTICO, ECONÓMICO, PRODUCTIVO Y COMERCIAL.	81	1	6	19
4.1.4. CONSOLIDAR LA UNIÓN DE NACIONES SURAMERICANAS (UNASUR) COMO ESPACIO ESTRATÉGICO REGIONAL PARA LA CONSTRUCCIÓN DEL MUNDO PLURIPOLAR.	82	1	6	19
4.1.5. IMPULSAR Y FORTALECER A LA COMUNIDAD DE ESTADOS LATINOAMERICANOS Y CARIBEÑOS (CELAC), COMO MECANISMO DE UNIÓN DE NUESTRA AMÉRICA.	83	1	6	19
3.4.1. PROFUNDIZAR LA INTEGRACIÓN SOBERANA NACIONAL Y LA EQUIDAD SOCIO-TERRITORIAL A TRAVÉS DE EJES DE DESARROLLO INTEGRAL: NORTE LLANERO, APURE-ORINOCO, OCCIDENTAL Y ORIENTAL, POLOS DE DESARROLLO SOCIALISTA, DISTRITOS MOTORES DE DESARROLLO, LAS ZONAS ECONÓMICAS ESPECIALES Y REDIS.	84	1	5	18
4.1.6. FORTALECER LAS ALIANZAS ESTRATÉGICAS BILATERALES CON LOS PAÍSES DE NUESTRA AMÉRICA, COMO BASE PARA IMPULSAR LOS ESQUEMAS DE INTEGRACIÓN Y UNIÓN SUBREGIONALES Y REGIONALES.	85	1	6	19
4.1.7. AVANZAR EN LA CREACIÓN DE ENCADENAMIENTOS ECONÓMICOS PRODUCTIVOS Y ESQUEMAS DE FINANCIAMIENTO CON AMÉRICA LATINA Y EL CARIBE, QUE FORTALEZCAN LA INDUSTRIA NACIONAL Y GARANTICEN EL SUMINISTRO SEGURO DE PRODUCTOS.	86	1	6	19
4.1.8. PROFUNDIZAR LAS ALIANZAS ESTRATÉGICAS BILATERALES EXISTENTES ENTRE VENEZUELA Y LOS PAÍSES DE LA REGIÓN, CON ESPECIAL ÉNFASIS EN LA COOPERACIÓN CON BRASIL, ARGENTINA Y URUGUAY, EN LAS DISTINTAS ÁREAS DE COMPLEMENTACIÓN Y COOPERACIÓN EN MARCHA.	87	1	6	19
4.1.9. IMPULSAR EL NUEVO ORDEN COMUNICACIONAL DE NUESTRA AMÉRICA, CON ESPECIAL ÉNFASIS EN LOS NUEVOS SISTEMAS Y MEDIOS DE INFORMACIÓN REGIONALES Y EN EL IMPULSO DE NUEVAS HERRAMIENTAS COMUNICACIONALES.	88	1	6	19
4.2.2. CREAR Y CONSOLIDAR LA INSTITUCIONALIDAD NACIONAL NUESTROAMERICANA EN LAS ORGANIZACIONES DE COOPERACIÓN E INTEGRACIÓN.	89	1	6	20
4.3.1. CONFORMAR UNA RED DE RELACIONES POLÍTICAS CON LOS POLOS DE PODER EMERGENTES.	90	1	6	21
4.3.2. CONFORMAR UN NUEVO ORDEN COMUNICACIONAL DEL SUR.	91	1	6	21
4.3.3. IMPULSAR LA DIPLOMACIA DE LOS PUEBLOS Y LA PARTICIPACIÓN PROTAGÓNICA DE LOS MOVIMIENTOS POPULARES ORGANIZADOS EN LA CONSTRUCCIÓN DE UN MUNDO MULTIPOLAR Y EN EQUILIBRIO.	92	1	6	21
2.2.7. FORTALECER EL PROTAGONISMO DE LA JUVENTUD EN EL DESARROLLO Y CONSOLIDACIÓN DE LA REVOLUCIÓN BOLIVARIANA.	93	1	4	11
4.3.4. CONTINUAR IMPULSANDO LA TRANSFORMACIÓN DEL SISTEMA DE DERECHOS HUMANOS SOBRE LA BASE DEL RESPETO, SU DEMOCRATIZACIÓN, LA IGUALDAD SOBERANA DE LOS ESTADOS Y EL PRINCIPIO DE LA NO INJERENCIA.	94	1	6	21
4.4.1. DESLINDAR A VENEZUELA DE LOS MECANISMOS INTERNACIONALES DE DOMINACIÓN IMPERIAL.	95	1	6	22
4.4.2. REDUCIR EL RELACIONAMIENTO ECONÓMICO Y TECNOLÓGICO CON LOS CENTROS IMPERIALES DE DOMINACIÓN A NIVELES QUE NO COMPROMETAN LA INDEPENDENCIA NACIONAL.	96	1	6	22
4.4.3. PROFUNDIZAR Y AMPLIAR EL RELACIONAMIENTO CON LOS POLOS EMERGENTES DEL MUNDO NUEVO.	97	1	6	22
5.1.1. IMPULSAR DE MANERA COLECTIVA LA CONSTRUCCIÓN Y CONSOLIDACIÓN DEL SOCIALISMO COMO ÚNICA OPCIÓN FRENTE AL MODELO DEPREDADOR, DISCRIMINADOR E INSOSTENIBLE CAPITALISTA.	98	1	7	23
5.1.2. PROMOVER, A NIVEL NACIONAL E INTERNACIONAL, UNA ÉTICA ECOSOCIALISTA QUE IMPULSE LA TRANSFORMACIÓN DE LOS PATRONES INSOSTENIBLES DE PRODUCCIÓN Y DE CONSUMO PROPIOS DEL SISTEMA CAPITALISTA.	99	1	7	23
5.1.3. GENERAR ALTERNATIVAS SOCIO-PRODUCTIVAS Y NUEVOS ESQUEMAS DE COOPERACIÓN SOCIAL, ECONÓMICA Y FINANCIERA PARA EL APALANCAMIENTO DEL ECOSOSCIALISMO Y EL ESTABLECIMIENTO DE UN COMERCIO JUSTO, BAJO LOS PRINCIPIOS DE COMPLEMENTARIEDAD, COOPERACIÓN, SOBERANÍA Y SOLIDARIDAD.	100	1	7	23
5.1.4. IMPULSAR LA PROTECCIÓN DEL AMBIENTE, LA EFICIENCIA EN LA UTILIZACIÓN DE RECURSOS Y EL LOGRO DE UN DESARROLLO SOSTENIBLE, IMPLEMENTANDO LA REDUCCIÓN Y EL REÚSO EN TODAS LAS ACTIVIDADES ECONÓMICAS PÚBLICAS Y PRIVADAS.	101	1	7	23
5.1.5. MEJORAR SUSTANCIALMENTE LAS CONDICIONES SOCIOAMBIENTALES DE LAS CIUDADES.	102	1	7	23
5.1.6. IMPULSAR LA GENERACIÓN DE ENERGÍAS LIMPIAS, AUMENTANDO SU PARTICIPACIÓN EN LA MATRIZ ENERGÉTICA NACIONAL Y PROMOVIENDO LA SOBERANÍA TECNOLÓGICA.	103	1	7	23
5.2.1. PROMOVER ACCIONES EN EL ÁMBITO NACIONAL E INTERNACIONAL PARA LA PROTECCIÓN, CONSERVACIÓN Y GESTIÓN SUSTENTABLE DE ÁREAS ESTRATÉGICAS, TALES COMO FUENTES Y RESERVORIOS DE AGUA DULCE (SUPERFICIAL Y SUBTERRÁNEA), CUENCAS HIDROGRÁFICAS, DIVERSIDAD BIOLÓGICA, MARES, OCÉANOS Y BOSQUES.	104	1	7	24
5.2.3. PROMOVER LA COOPERACIÓN, A NIVEL REGIONAL, PARA EL MANEJO INTEGRADO DE LOS RECURSOS NATURALES TRANSFRONTERIZOS.	106	1	7	24
1.3.8. DISEÑAR Y ESTABLECER MECANISMOS NOVEDOSOS Y EFECTIVOS, ORIENTADOS A PROMOVER LA PARTICIPACIÓN POPULAR EN LA RENTA PETROLERA, TALES COMO LA INVERSIÓN Y EL AHORRO.	175	1	3	5
5.2.4. LUCHAR CONTRA LA SECURITIZACIÓN DE LOS PROBLEMAS AMBIENTALES MUNDIALES, PARA EVITAR LA INCORPORACIÓN DE LOS TEMAS AMBIENTALES Y HUMANOS COMO TEMAS DE SEGURIDAD INTERNACIONAL POR PARTE DE LAS POTENCIAS HEGEMÓNICAS.	107	1	7	24
4.2.1. CONSOLIDAR LA VISIÓN DE LA HETEROGENEIDAD Y DIVERSIDAD ÉTNICA DE VENEZUELA Y NUESTRA AMÉRICA, BAJO EL RESPETO E INCLUSIÓN PARTICIPATIVA Y PROTAGÓNICA DE LAS  MINORÍAS Y PUEBLOS ORIGINARIOS.	140	1	6	20
5.3.1. CONTRARRESTAR LA PRODUCCIÓN Y VALORIZACIÓN DE ELEMENTOS CULTURALES Y RELATOS HISTÓRICOS GENERADOS DESDE LA ÓPTICA NEOCOLONIAL DOMINANTE, QUE CIRCULAN A TRAVÉS DE LOS MEDIOS DE COMUNICACIÓN E INSTITUCIONES EDUCATIVAS Y CULTURALES, ENTRE OTRAS.	108	1	7	25
5.3.2. FORTALECER Y VISIBILIZAR LOS ESPACIOS DE EXPRESIÓN Y FOMENTAR MECANISMOS DE REGISTRO E INTERPRETACIÓN DE LAS CULTURAS POPULARES Y DE LA MEMORIA HISTÓRICA VENEZOLANA Y NUESTROAMERICANA.	109	1	7	25
5.3.3. PROMOVER UNA CULTURA ECOSOCIALISTA, QUE REVALORICE EL PATRIMONIO HISTÓRICO CULTURAL VENEZOLANO Y NUESTROAMERICANO.	110	1	7	25
5.4.1. CONTINUAR LA LUCHA POR LA PRESERVACIÓN, EL RESPETO Y EL FORTALECIMIENTO DEL RÉGIMEN CLIMÁTICO CONFORMADO POR LA CONVENCIÓN MARCO DE NACIONES UNIDAS PARA EL CAMBIO CLIMÁTICO Y SU PROTOCOLO DE KYOTO.	112	1	7	26
5.4.2. DISEÑAR UN PLAN DE MITIGACIÓN QUE ABARQUE LOS SECTORES PRODUCTIVOS EMISORES DE GASES DE EFECTO INVERNADERO, COMO UNA CONTRIBUCIÓN VOLUNTARIA NACIONAL A LOS ESFUERZOS PARA SALVAR EL PLANETA.	113	1	7	26
5.4.3. DISEÑAR UN PLAN NACIONAL DE ADAPTACIÓN QUE PERMITA AL PAÍS PREPARARSE PARA LOS ESCENARIOS E IMPACTOS CLIMÁTICOS QUE SE PRODUCIRÁN DEBIDO A LA IRRESPONSABILIDAD DE LOS PAÍSES INDUSTRIALIZADOS, CONTAMINADORES DEL MUNDO.	114	1	7	26
2.1.4. DESARROLLAR MODELOS INCLUYENTES DE GESTIÓN DE LAS UNIDADES PRODUCTIVAS, PARTICIPATIVOS CON LOS TRABAJADORES Y TRABAJADORAS, ALINEADOS CON LAS POLÍTICAS NACIONALES, ASÍ COMO CON UNA CULTURA DEL TRABAJO QUE SE CONTRAPONGA AL RENTISMO PETROLERO, DESMONTANDO LA ESTRUCTURA OLIGOPÓLICA Y MONOPÓLICA EXISTENTE.	115	1	4	10
3.1.12. GARANTIZAR LA SEGURIDAD ENERGÉTICA DEL PAÍS, OPTIMIZANDO LA EFICIENCIA EN LA PLANIFICACIÓN ESTRATÉGICA Y TÁCTICA, QUE PERMITA MINIMIZAR LOS RIESGOS INHERENTES A LOS FLUJOS ENERGÉTICOS EN EL TERRITORIO.	116	1	5	15
2.1.1. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN QUE PONGAN AL SERVICIO DE LA SOCIEDAD LOS MEDIOS DE PRODUCCIÓN, Y ESTIMULEN LA GENERACIÓN DE UN TEJIDO PRODUCTIVO SUSTENTABLE ENMARCADO EN EL NUEVO METABOLISMO PARA LA TRANSICIÓN AL SOCIALISMO.	117	1	4	10
2.2.1. SUPERAR LAS FORMAS DE EXPLOTACIÓN CAPITALISTAS PRESENTES EN EL PROCESO SOCIAL DEL TRABAJO, A TRAVÉS DEL DESPLIEGUE DE RELACIONES SOCIALISTAS ENTRE TRABAJADORES Y TRABAJADORAS CON ESTE PROCESO, COMO ESPACIO FUNDAMENTAL PARA EL DESARROLLO INTEGRAL DE LA POBLACIÓN.	118	1	4	11
2.2.2. CONSOLIDAR EL SISTEMA NACIONAL DE MISIONES Y GRANDES MISIONES SOCIALISTAS HUGO CHÁVEZ, COMO CONJUNTO INTEGRADO DE POLÍTICAS Y PROGRAMAS QUE MATERIALIZAN LOS DERECHOS Y GARANTÍAS DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA Y SIRVE DE PLATAFORMA DE ORGANIZACIÓN, ARTICULACIÓN Y GESTIÓN DE LA POLÍTICA SOCIAL EN LOS DISTINTOS NIVELES TERRITORIALES DEL PAÍS, PARA DAR MAYOR EFICIENCIA Y EFICACIA A LAS POLÍTICAS SOCIALES DE LA REVOLUCIÓN.	119	1	4	11
2.2.3. POTENCIAR LAS EXPRESIONES CULTURALES LIBERADORAS DEL PUEBLO.	120	1	4	11
2.2.4. CONSOLIDAR LA EQUIDAD DE GÉNERO CON VALORES SOCIALISTAS, GARANTIZANDO Y RESPETANDO LOS DERECHOS DE TODOS Y TODAS, Y LA DIVERSIDAD SOCIAL.	121	1	4	11
2.2.5. FOMENTAR LA INCLUSIÓN Y EL VIVIR BIEN DE LOS PUEBLOS INDÍGENAS.	122	1	4	11
2.2.6. PROPICIAR LAS CONDICIONES PARA EL DESARROLLO DE UNA CULTURA DE RECREACIÓN Y PRÁCTICA DEPORTIVA LIBERADORA, AMBIENTALISTA E INTEGRADORA EN TORNO A LOS VALORES DE LA PATRIA, COMO VÍA PARA LA LIBERACIÓN DE LA CONCIENCIA, LA PAZ Y LA CONVIVENCIA ARMÓNICA.	123	1	4	11
2.2.8. SEGUIR AVANZANDO EN LA TRANSFORMACIÓN DEL SISTEMA PENITENCIARIO PARA LA PRESTACIÓN DE UN SERVICIO QUE GARANTICE LOS DERECHOS HUMANOS DE LAS PERSONAS PRIVADAS DE LIBERTAD Y FAVOREZCA SU INSERCIÓN PRODUCTIVA EN LA SOCIEDAD.	124	1	4	11
2.2.9. CONTINUAR COMBATIENDO LA DESIGUALDAD A TRAVÉS DE LA ERRADICACIÓN DE LA POBREZA EXTREMA Y DISMINUCIÓN DE LA POBREZA GENERAL, HACIA SU TOTAL ELIMINACIÓN.	125	1	4	11
2.2.10. ASEGURAR LA SALUD DE LA POBLACIÓN DESDE LA PERSPECTIVA DE PREVENCIÓN Y PROMOCIÓN DE LA CALIDAD DE VIDA, TENIENDO EN CUENTA LOS GRUPOS SOCIALES VULNERABLES, ETARIOS, ETNIAS, GÉNERO, ESTRATOS Y TERRITORIOS SOCIALES.	126	1	4	11
2.2.11. ASEGURAR UNA ALIMENTACIÓN SALUDABLE, UNA NUTRICIÓN ADECUADA A LO LARGO DEL CICLO DE VIDA Y LA LACTANCIA MATERNA, EN CONCORDANCIA CON LOS MANDATOS CONSTITUCIONALES SOBRE SALUD, SOBERANÍA Y SEGURIDAD ALIMENTARIA, PROFUNDIZANDO Y AMPLIANDO LAS CONDICIONES QUE LAS GARANTICEN.	127	1	4	11
2.2.12. CONTINUAR GARANTIZANDO EL DERECHO A LA EDUCACIÓN CON CALIDAD Y PERTINENCIA, A TRAVÉS DEL MEJORAMIENTO DE LAS CONDICIONES DE INGRESO, PROSECUCIÓN Y EGRESO DEL SISTEMA EDUCATIVO	128	1	4	11
2.2.13. CONSOLIDAR LAS MISIONES, GRANDES MISIONES SOCIALISTAS COMO INSTRUMENTO REVOLUCIONARIO PARA NUEVO ESTADO DEMOCRÁTICO, SOCIAL DE DERECHO Y DE JUSTICIA.	129	1	4	11
2.3.1 PROMOVER LA CONSTRUCCIÓN DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA A TRAVÉS DE LA CONSOLIDACIÓN Y EXPANSIÓN DEL PODER POPULAR ORGANIZADO.	130	1	4	12
2.3.2. IMPULSAR LA TRANSFORMACIÓN DEL MODELO ECONÓMICO RENTÍSTICO HACIA EL NUEVO MODELO PRODUCTIVO DIVERSIFICADO Y SOCIALISTA, CON PARTICIPACIÓN PROTAGÓNICA DE LAS INSTANCIAS DEL PODER POPULAR.	131	1	4	12
2.3.3. GARANTIZAR LA TRANSFERENCIA DE COMPETENCIAS EN TORNO A LA GESTIÓN Y ADMINISTRACIÓN DE LO PÚBLICO DESDE LAS DISTINTAS INSTANCIAS DEL ESTADO HACIA LAS COMUNIDADES ORGANIZADAS.	132	1	4	12
2.3.4. IMPULSAR LA CORRESPONSABILIDAD DEL PODER POPULAR EN LA LUCHA POR LA INCLUSIÓN SOCIAL Y ERRADICACIÓN DE LA POBREZA.	133	1	4	12
2.3.5. CONSOLIDAR LA FORMACIÓN INTEGRAL SOCIALISTA, PERMANENTE Y CONTINUA, EN LOS DIFERENTES PROCESOS DE SOCIALIZACIÓN E INTERCAMBIO DE SABERES DEL PODER POPULAR, FORTALECIENDO HABILIDADES Y ESTRATEGIAS PARA EL EJERCICIO DE LO PÚBLICO Y EL DESARROLLO SOCIOCULTURAL Y PRODUCTIVO DE LAS COMUNIDADES.	134	1	4	12
3.1.10. PROFUNDIZAR LA DIVERSIFICACIÓN DE NUESTROS MERCADOS INTERNACIONALES DE HIDROCARBUROS, CON EL OBJETIVO DE UTILIZAR LA FORTALEZA DE SER UN PAÍS POTENCIA ENERGÉTICA, PARA DESPLEGAR NUESTRA PROPIA GEOPOLÍTICA.	135	1	5	15
3.4.4. MEJORAR E INCREMENTAR LA INFRAESTRUCTURA EN LAS ÁREAS DE PRODUCCIÓN AGRÍCOLA.	136	1	5	18
1.3.9. COMPATIBILIZAR EL SISTEMA IMPOSITIVO HACIA ESTÁNDARES INTERNACIONALES DE EFICIENCIA TRIBUTARIA PARA ALCANZAR ACUERDOS COMERCIALES MÁS EFECTIVOS Y EFICIENTES CON LOS PAÍSES SOCIOS, SALVAGUARDANDO LA SOBERANÍA NACIONAL.	176	1	3	5
3.2.6. FORTALECER EL SECTOR TURISMO COMO ESTRATEGIA DE INCLUSIÓN SOCIAL QUE FACILITE Y GARANTICE AL PUEBLO VENEZOLANO, FUNDAMENTALMENTE A LAS POBLACIONES MÁS VULNERABLES, EL ACCESO A SU PATRIMONIO TURÍSTICO (DESTINOS TURÍSTICOS) Y EL DISFRUTE DE LAS INFRAESTRUCTURAS TURÍSTICAS DEL ESTADO EN CONDICIONES DE PRECIOS JUSTOS Y RAZONABLES.	137	1	5	16
3.4.6. PLANIFICAR DESDE EL GOBIERNO CENTRAL Y CON PROTAGONISMO POPULAR, EL DESARROLLO URBANO Y RURAL DE LAS CIUDADES EXISTENTES Y DE LAS NACIENTES A LO LARGO DE NUESTRO TERRITORIO NACIONAL.	138	1	5	18
4.1.10. PROMOVER LA RESOLUCIÓN ARMONIOSA Y COOPERATIVA DE LAS DELIMITACIONES PENDIENTES, ENTENDIENDO LA ESTABILIZACIÓN DE LAS FRONTERAS COMO UN ELEMENTO DE UNIDAD Y DE PAZ.	139	1	6	19
3.2.5. DESARROLLAR, FORTALECER E IMPULSAR LOS ESLABONES PRODUCTIVOS DE LA INDUSTRIA NACIONAL IDENTIFICADOS EN PROYECTOS DE ÁREAS PRIORITARIAS TALES COMO AUTOMOTRIZ, ELECTRODOMÉSTICOS, MATERIALES DE CONSTRUCCIÓN, TRANSFORMACIÓN DE PLÁSTICO Y ENVASES, QUÍMICA, HIERRO-ACERO, ALUMINIO, ENTRE OTRAS; ORIENTADOS POR UN MECANISMO DE PLANIFICACIÓN CENTRALIZADA, SISTEMA PRESUPUESTARIO Y MODELOS DE GESTIÓN EFICIENTES Y PRODUCTIVOS CÓNSONOS CON LA TRANSICIÓN AL SOCIALISMO.	141	1	5	16
3.4.7. REFORZAR Y DESARROLLAR MECANISMOS DE CONTROL QUE PERMITAN AL ESTADO EJERCER EFICAZMENTE SU SOBERANÍA EN EL INTERCAMBIO DE BIENES EN LAS ZONAS FRONTERIZAS.	142	1	5	18
2.4.1. PRESERVAR LOS VALORES BOLIVARIANOS LIBERADORES, IGUALITARIOS, SOLIDARIOS DEL PUEBLO VENEZOLANO Y FOMENTAR EL DESARROLLO DE UNA NUEVA ÉTICA SOCIALISTA.	143	1	4	13
2.4.2. FORTALECER LA CONTRALORÍA SOCIAL, PARA MEJORAR EL DESEMPEÑO DE LA GESTIÓN PÚBLICA, DE LAS INSTANCIAS DEL PODER POPULAR Y LAS ACTIVIDADES PRIVADAS QUE AFECTEN EL INTERÉS COLECTIVO.	144	1	4	13
2.5.1. DESATAR LA POTENCIA CONTENIDA EN LA CONSTITUCIÓN BOLIVARIANA PARA EL EJERCICIO DE LA DEMOCRACIA PARTICIPATIVA Y PROTAGÓNICA.	145	1	4	14
2.5.2. DESARROLLAR EL SISTEMA FEDERAL DE GOBIERNO, BASADO EN LOS PRINCIPIOS DE INTEGRIDAD TERRITORIAL, ECONÓMICA Y POLÍTICA DE LA NACIÓN, MEDIANTE LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR EN LAS FUNCIONES DE GOBIERNO COMUNAL Y EN LA ADMINISTRACIÓN DE LOS MEDIOS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE PROPIEDAD SOCIAL.	146	1	4	14
2.5.3. ACELERAR LA CONSTRUCCIÓN DE LA NUEVA PLATAFORMA INSTITUCIONAL DEL ESTADO, EN EL MARCO DEL NUEVO MODELO DE GESTIÓN SOCIALISTA BOLIVARIANO.	147	1	4	14
2.5.4. IMPULSAR UNA PROFUNDA, DEFINITIVA E IMPOSTERGABLE REVOLUCIÓN EN EL SISTEMA DE ADMINISTRACIÓN DE JUSTICIA, ENTRE LOS PODERES PÚBLICOS Y EL PODER POPULAR, QUE GARANTICE LA IGUALDAD DE CONDICIONES Y OPORTUNIDADES A TODA LA POBLACIÓN A SU ACCESO Y APLICACIÓN.	148	1	4	14
2.5.5. DESPLEGAR EN SOBREMARCHA LA GRAN MISIÓN ¡A TODA VIDA! VENEZUELA CONCEBIDA COMO UNA POLÍTICA INTEGRAL DE SEGURIDAD CIUDADANA, CON EL FIN DE TRANSFORMAR LOS FACTORES DE CARÁCTER ESTRUCTURAL, SITUACIONAL E INSTITUCIONAL, GENERADORES DE LA VIOLENCIA Y EL DELITO, PARA REDUCIRLOS, AUMENTANDO LA CONVIVENCIA SOLIDARIA Y EL DISFRUTE DEL PUEBLO AL LIBRE Y SEGURO EJERCICIO DE SUS ACTIVIDADES FAMILIARES, COMUNALES, SOCIALES, FORMATIVAS, LABORALES, SINDICALES, ECONÓMICAS, CULTURALES Y RECREACIONALES.	149	1	4	14
2.5.7. FORTALECER EL SISTEMA ESTADÍSTICO NACIONAL EN SUS MECANISMOS, INSTANCIAS Y OPERACIONES ESTADÍSTICAS.	150	1	4	14
2.5.6. FORTALECER EL SISTEMA NACIONAL DE PLANIFICACIÓN PÚBLICA Y POPULAR PARA LA CONSTRUCCIÓN DE LA SOCIEDAD SOCIALISTA DE JUSTICIA Y EQUIDAD, EN EL MARCO DEL NUEVO ESTADO DEMOCRÁTICO Y SOCIAL DE DERECHO Y DE JUSTICIA.	151	1	4	14
2.5.8. IMPULSAR EL DESARROLLO DE LA NORMATIVA LEGAL E INFRAESTRUCTURA NECESARIA PARA LA CONSOLIDACIÓN DE GOBIERNO ELECTRÓNICO.	152	1	4	14
1.1.2. PREPARAR LA DEFENSA DE LA VOLUNTAD DEL PUEBLO, MEDIANTE LA ORGANIZACIÓN POPULAR Y EL EJERCICIO DEMOCRÁTICO DE LA AUTORIDAD DEL ESTADO	153	1	3	3
1.1.3. FORTALECER Y EXPANDIR EL PODER POPULAR.	154	1	3	3
1.1.4. PRESERVAR Y RECUPERAR LOS ESPACIOS DE GOBIERNO REGIONAL Y LOCAL, PARA PROFUNDIZAR LA RESTITUCIÓN DEL PODER AL PUEBLO.	155	1	3	3
1.1.5. SEGUIR CONSTRUYENDO LA SOBERANÍA Y DEMOCRATIZACIÓN COMUNICACIONAL.	156	1	3	3
1.2.1. FORTALECER EL ROL DEL ESTADO EN LA ADMINISTRACIÓN Y EXPLOTACIÓN DE LOS RECURSOS HIDROCARBURÍFEROS Y MINEROS.	157	1	3	4
1.2.2. MANTENER Y GARANTIZAR EL CONTROL POR PARTE DEL ESTADO SOBRE PETRÓLEOS DE VENEZUELA S.A. (PDVSA).	158	1	3	4
1.2.3. MANTENER Y GARANTIZAR EL CONTROL POR PARTE DEL ESTADO DE LAS EMPRESAS NACIONALES QUE EXPLOTEN LOS RECURSOS MINEROS EN EL TERRITORIO NACIONAL.	159	1	3	4
1.2.4. PROMOVER Y ESTIMULAR LA INVESTIGACIÓN CIENTÍFICA Y EL DESARROLLO TECNOLÓGICO, CON EL PROPÓSITO DE ASEGURAR LAS OPERACIONES MEDULARES DE LA INDUSTRIA PETROLERA.	160	1	3	4
1.2.5. ASEGURAR LOS MEDIOS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS Y ESTRATÉGICAS ASOCIADAS A LA CADENA INDUSTRIAL DE EXPLOTACIÓN DE LOS RECURSOS HIDROCARBURÍFEROS.	161	1	3	4
1.2.6. FORTALECER LA COORDINACIÓN DE POLÍTICAS PETROLERAS EN EL SENO DE LA OPEP Y OTROS ORGANISMOS INTERNACIONALES, PARA LA JUSTA VALORIZACIÓN DE NUESTROS RECURSOS NATURALES.	162	1	3	4
1.2.7. IMPULSAR Y PROMOVER UNA INICIATIVA DE COORDINACIÓN ENTRE LOS PAÍSES GIGANTES PETROLEROS.	163	1	3	4
1.2.8. ASEGURAR LOS MEDIOS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS Y ESTRATÉGICAS ASOCIADAS A LA CADENA INDUSTRIAL DE EXPLOTACIÓN DE LOS RECURSOS MINEROS.	164	1	3	4
1.2.9. LOGRAR UNA INSTANCIA DE COORDINACIÓN DE POLÍTICAS GASÍFERAS PARA UNA VALORIZACIÓN JUSTA Y RAZONABLE DEL GAS.	165	1	3	4
1.2.10. ELEVAR LA CONCIENCIA POLÍTICA E IDEOLÓGICA DEL PUEBLO Y DE LOS TRABAJADORES PETROLEROS Y MINEROS, ASÍ COMO TAMBIÉN SU PARTICIPACIÓN ACTIVA EN LA DEFENSA DE LOS RECURSOS NATURALES ESTRATÉGICOS DE LA NACIÓN.	166	1	3	4
1.2.11. CREAR LAS CONDICIONES PARA INFLUIR EN LA VALORIZACIÓN DE LOS PRECIOS DE LOS MINERALES.	167	1	3	4
1.3.1. MANTENER Y FORTALECER EL ACTUAL RÉGIMEN FISCAL PETROLERO PARA GARANTIZAR EL BIENESTAR DEL PUEBLO.	168	1	3	5
1.3.2. MANTENER Y FORTALECER MECANISMOS EFICACES DE CAPTACIÓN DE LA RENTA EXCEDENTARIA, POR INCREMENTOS EXTRAORDINARIOS DE LOS PRECIOS INTERNACIONALES DE LOS HIDROCARBUROS.	169	1	3	5
1.3.3. ESTABLECER Y DESARROLLAR UN RÉGIMEN FISCAL MINERO, ASÍ COMO MECANISMOS DE CAPTACIÓN EFICIENTES PARA LA RECAUDACIÓN DE LA RENTA POR LA ACTIVIDAD MINERA.	170	1	3	5
1.3.4. ESTABLECER MECANISMOS DE CONTROL SOBRE LA COMERCIALIZACIÓN DE LOS MINERALES.	171	1	3	5
1.3.5. FORTALECER Y PROFUNDIZAR ACUERDOS FINANCIEROS CON SOCIOS ESTRATÉGICOS.	172	1	3	5
1.3.6. MANTENER Y CONSOLIDAR LOS CONVENIOS DE COOPERACIÓN, SOLIDARIDAD Y COMPLEMENTARIEDAD CON PAÍSES ALIADOS.	173	1	3	5
1.3.7. FORTALECER LOS MECANISMOS DE COOPERACIÓN EN EL MERCADO COMÚN DEL SUR (MERCOSUR).	174	1	3	5
1.3.10. MEJORAR Y PROMOVER LA EFICIENCIA DE LA GESTIÓN FISCAL DEL SECTOR PÚBLICO PARA GENERAR MAYOR TRANSPARENCIA Y CONFIABILIDAD SOBRE EL IMPACTO ECONÓMICO Y SOCIAL DE LA POLÍTICA FISCAL.	177	1	3	5
3.1.3. MANTENER LA PRODUCCIÓN EN LAS ÁREAS TRADICIONALES DE PETRÓLEO Y GAS.	208	1	5	15
1.4.4. FORTALECER LA INFRAESTRUCTURA, EL DESARROLLO Y FUNCIONAMIENTO DE LOS GRANDES POLOS SOCIALISTAS DE PRODUCCIÓN PRIMARIA AGROPECUARIA Y GRANDES SISTEMAS DE RIEGO, GESTIONADOS A TRAVÉS DE EMPRESAS SOCIALISTAS, PRIVILEGIANDO LA INTEGRACIÓN DE LOS PROCESOS PRODUCTIVOS A ESCALA INDUSTRIAL.	178	1	3	6
1.4.5. CONSOLIDAR LAS REDES DE PRODUCCIÓN Y DISTRIBUCIÓN DE PRODUCTOS DE CONSUMO DIRECTO Y DEL SISTEMA DE PROCESAMIENTO AGROINDUSTRIAL.	179	1	3	6
1.4.6. CREAR, CONSOLIDAR Y APOYAR CENTROS DE VENTA Y DISTRIBUCIÓN DIRECTA DE PRODUCTOS AGROPECUARIOS Y OTROS DE CONSUMO MASIVO, LOCALES Y EN LAS GRANDES CIUDADES, GARANTIZANDO SU ACCESO A PRECIO JUSTO POR PARTE DE LA POBLACIÓN Y UNA REMUNERACIÓN JUSTA AL TRABAJO CAMPESINO E INCENTIVANDO EL DESARROLLO DEL COMERCIO LOCAL, NACIONAL Y DE EXPORTACIÓN.	180	1	3	6
3.1.7. FORTALECER Y EXPANDIR LA INDUSTRIA PETROQUÍMICA NACIONAL.	212	1	5	15
1.4.1. ELIMINAR DEFINITIVAMENTE EL LATIFUNDIO. REALIZAR UN PROCESO DE ORGANIZACIÓN Y ZONIFICACIÓN AGROECOLÓGICA EN BASE A LAS CAPACIDADES DE USO DE LA TIERRA Y CREAR UN SISTEMA DE CATASTRO RURAL PARA GARANTIZAR EL ACCESO JUSTO Y USO RACIONAL DEL RECURSO SUELO.	181	1	3	6
1.4.3. AFIANZAR UN CONJUNTO DE POLÍTICAS PÚBLICAS DE APOYO A LA PRODUCCIÓN, DISTRIBUCIÓN, COMERCIALIZACIÓN Y ORGANIZACIÓN DEL SECTOR RURAL Y PARTICIPACIÓN DEL PODER POPULAR CAMPESINO EN LA IMPLEMENTACIÓN DE UN PLAN NACIONAL DE PRODUCCIÓN DE ALIMENTOS QUE GARANTICE LA SOBERANÍA ALIMENTARIA.	182	1	3	6
1.1.1. FORTALECER A TRAVÉS DE LOS PROCESOS ELECTORALES LA REVOLUCIÓN BOLIVARIANA, ELEVANDO LA MORAL Y LA CONCIENCIA DEL PUEBLO VENEZOLANO Y DE LOS PUEBLOS DEL MUNDO EN SU LUCHA POR LA EMANCIPACIÓN.	183	1	3	3
1.2.12. GARANTIZAR LA PROPIEDAD Y USO DE LOS RECURSOS NATURALES DEL PAÍS, DE FORMA SOBERANA, PARA LA SATISFACCIÓN DE LAS DEMANDAS INTERNAS ASÍ COMO SU USO EN FUNCIÓN DE LOS MÁS ALTOS INTERESES NACIONALES.	184	1	3	4
1.4.7. CONSOLIDAR EL APARATO AGROINDUSTRIAL BAJO CONTROL DE EMPRESAS SOCIALISTAS, GARANTIZANDO AL MENOS UN 60% DE LA CAPACIDAD DE ALMACENAMIENTO Y PROCESAMIENTO EN RUBROS BÁSICOS (CEREALES, OLEAGINOSAS, LEGUMINOSAS, AZÚCAR, CARNE Y LECHE) Y UN 30% EN EL RESTO DE LOS RUBROS ALIMENTICIOS.	185	1	3	6
1.4.8. DESARROLLAR UN SISTEMA DE APOYO E INCENTIVOS PARA LA PROMOCIÓN DEL COMERCIO INTERNACIONAL DE EXPORTACIÓN DE RUBROS AGRÍCOLAS.	186	1	3	6
1.4.9. ESTABLECER MECANISMOS PARA EJERCER LA NUEVA INSTITUCIONALIDAD REVOLUCIONARIA QUE GARANTICE LA PARTICIPACIÓN DE LOS PEQUEÑOS Y MEDIANOS PRODUCTORES EN LAS DECISIONES EN MATERIA AGROPECUARIA, A TRAVÉS DE LOS CONSEJOS CAMPESINOS Y LAS REDES DE PRODUCTORES Y PRODUCTORAS LIBRES Y ASOCIADOS.	187	1	3	6
1.4.10. PROMOVER LOS MODELOS DE PRODUCCIÓN DIVERSIFICADOS, A PARTIR DE LA AGRICULTURA FAMILIAR, CAMPESINA, URBANA, PERIURBANA E INDÍGENA, RECUPERANDO, VALIDANDO Y DIVULGANDO MODELOS TRADICIONALES Y SOSTENIBLES DE PRODUCCIÓN.	188	1	3	6
1.5.1. CONSOLIDAR UN ESTILO CIENTÍFICO, TECNOLÓGICO E INNOVADOR DE CARÁCTER TRANSFORMADOR, DIVERSO, CREATIVO Y DINÁMICO, GARANTE DE LA INDEPENDENCIA Y LA SOBERANÍA ECONÓMICA, CONTRIBUYENDO ASÍ A LA CONSTRUCCIÓN DEL MODELO PRODUCTIVO SOCIALISTA, EL FORTALECIMIENTO DE LA ÉTICA SOCIALISTA Y LA SATISFACCIÓN EFECTIVA DE LAS NECESIDADES DEL PUEBLO VENEZOLANO.	189	1	3	7
1.5.2. FORTALECER LOS ESPACIOS Y PROGRAMAS DE FORMACIÓN PARA EL TRABAJO LIBERADOR, FOMENTANDO LOS VALORES PATRIÓTICOS Y EL SENTIDO CRÍTICO.	190	1	3	7
1.5.3. IMPULSAR EL DESARROLLO Y USO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.	191	1	3	7
1.5.4. ESTABLECER UNA POLÍTICA SATELITAL DEL ESTADO VENEZOLANO PARA COLOCAR LA ACTIVIDAD AL SERVICIO DEL DESARROLLO GENERAL DE LA NACIÓN.	192	1	3	7
1.6.1. INCREMENTAR LA CAPACIDAD DEFENSIVA DEL PAÍS CON LA CONSOLIDACIÓN Y AFIANZAMIENTO DE LA REDISTRIBUCIÓN TERRITORIAL DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.	193	1	3	8
1.6.2. CONSOLIDAR LA GRAN MISIÓN SOLDADO DE LA PATRIA NEGRO PRIMERO COMO POLÍTICA INTEGRAL DE FORTALECIMIENTO DE LA FUERZA ARMADA NACIONAL BOLIVARIANA, QUE ASEGURE BIENESTAR, SEGURIDAD SOCIAL Y PROTECCIÓN A LA FAMILIA MILITAR VENEZOLANA; EL EQUIPAMIENTO, MANTENIMIENTO E INFRAESTRUCTURA MILITAR; LA PARTICIPACIÓN DE LA FANB EN LAS TAREAS DE DESARROLLO NACIONAL; Y EL DESARROLLO EDUCATIVO DE SUS COMPONENTES.	194	1	3	8
1.4.2. ACELERAR LA DEMOCRATIZACIÓN DEL ACCESO DE LOS CAMPESINOS Y CAMPESINAS, PRODUCTORES Y PRODUCTORAS, Y DE LAS DISTINTAS FORMAS COLECTIVAS Y EMPRESAS SOCIALISTAS, A LOS RECURSOS NECESARIOS PARA LA PRODUCCIÓN (TIERRA, AGUA, RIEGO, SEMILLAS, CAPITAL), IMPULSANDO EL USO RACIONAL Y SOSTENIBLE DE LOS MISMOS.	195	1	3	6
1.6.3. FORTALECER E INCREMENTAR EL SISTEMA DE INTELIGENCIA Y CONTRAINTELIGENCIA MILITAR PARA LA DEFENSA INTEGRAL DE LA PATRIA.	196	1	3	8
1.6.4. FORTALECER LA MILICIA NACIONAL BOLIVARIANA.	197	1	3	8
1.6.5. INCREMENTAR Y MANTENER EL APRESTO OPERACIONAL DE LA FUERZA ARMADA NACIONAL BOLIVARIANA PARA LA DEFENSA INTEGRAL DE LA NACIÓN.	198	1	3	8
1.7.1. CREAR EL SISTEMA INTEGRAL DE GESTIÓN DE LOS ESTADOS DE EXCEPCIÓN.	199	1	3	9
1.7.2. CREAR EL SISTEMA LOGÍSTICO NACIONAL, INTEGRANDO EL SISTEMA LOGÍSTICO DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.	200	1	3	9
2.1.1. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN QUE PONGAN AL SERVICIO DE LA SOCIEDAD LOS MEDIOS DE PRODUCCIÓN, Y ESTIMULEN LA GENERACIÓN DE UN TEJIDO PRODUCTIVO SUSTENTABLE ENMARCADO EN EL NUEVO METABOLISMO PARA LA TRANSICIÓN AL SOCIALISMO.	201	1	4	10
2.1.2. DESARROLLAR UN SISTEMA DE FIJACIÓN DE PRECIOS JUSTOS PARA LOS BIENES Y SERVICIOS, COMBATIENDO LAS PRÁCTICAS DE ATAQUE A LA MONEDA, ACAPARAMIENTO, ESPECULACIÓN, USURA Y OTROS FALSOS MECANISMOS DE FIJACIÓN DE PRECIOS, MEDIANTE EL FORTALECIMIENTO DE LAS LEYES E INSTITUCIONES RESPONSABLES Y LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR, PARA EL DESARROLLO DE UN NUEVO MODELO PRODUCTIVO DIVERSIFICADO, SUSTENTADO EN LA CULTURA DEL TRABAJO.\n	202	1	4	10
2.1.3. EXPANDIR E INTEGRAR LAS CADENAS PRODUCTIVAS, GENERANDO LA MAYOR CANTIDAD DE VALOR AGREGADO Y ORIENTÁNDOLAS HACIA LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES PARA LA CONSTRUCCIÓN DEL SOCIALISMO, PROMOVIENDO LA DIVERSIFICACIÓN DEL APARATO PRODUCTIVO.	203	1	4	10
2.1.5. FORTALECER EL SISTEMA DE DISTRIBUCIÓN DIRECTA DE LOS INSUMOS Y PRODUCTOS, ATACANDO LA ESPECULACIÓN PROPIA DEL CAPITALISMO, PARA GARANTIZAR LA SATISFACCIÓN DE LAS NECESIDADES DEL PUEBLO.	204	1	4	10
2.1.6. CONFORMAR LA INSTITUCIONALIDAD DEL MODELO DE GESTIÓN SOCIALISTA.	205	1	4	10
3.1.1. DESARROLLAR LA CAPACIDAD DE PRODUCCIÓN DEL PAÍS EN LÍNEA CON LAS INMENSAS RESERVAS DE HIDROCARBUROS, BAJO EL PRINCIPIO DE LA EXPLOTACIÓN RACIONAL Y LA POLÍTICA DE CONSERVACIÓN DEL RECURSO NATURAL AGOTABLE Y NO RENOVABLE.	206	1	5	15
3.1.2. DESARROLLAR LA FAJA PETROLÍFERA DEL ORINOCO, PARA ALCANZAR, MEDIANTE LAS RESERVAS PROBADAS, YA CERTIFICADAS, UNA CAPACIDAD DE PRODUCCIÓN TOTAL DE 4 MMBD PARA EL 2019, EN CONCORDANCIA CON LOS OBJETIVOS ESTRATÉGICOS DE PRODUCCIÓN DE CRUDO, BAJO UNA POLÍTICA AAMBIENTALMENTE RESPONSABLE.	207	1	5	15
3.1.4. DESARROLLAR LAS RESERVAS DEL CINTURÓN GASÍFERO EN NUESTRO MAR TERRITORIAL INCREMENTANDO LA CAPACIDAD DE PRODUCCIÓN Y ACELERANDO LOS ESFUERZOS EXPLORATORIOS DE NUESTRAS RESERVAS.	209	1	5	15
3.1.5. ADECUAR Y EXPANDIR EL CIRCUITO DE REFINACIÓN NACIONAL PARA EL INCREMENTO DE LA CAPACIDAD DE PROCESAMIENTO DE HIDROCARBUROS, EN ESPECÍFICO CRUDO EXTRA PESADO DE LA FAJA, DESCONCENTRANDO TERRITORIALMENTE LA MANUFACTURA DE COMBUSTIBLE Y AMPLIANDO LA COBERTURA TERRITORIAL DE ABASTECIMIENTO DE LAS REFINERÍAS.	210	1	5	15
3.1.6. EXPANDIR LA INFRAESTRUCTURA DE TRANSPORTE, AL MACENAMIENTO Y DESPACHO DE PETRÓLEO Y GAS, SOBRE LA BASE DE COMPLEMENTAR LOS OBJETIVOS DE SEGURIDAD ENERGÉTICA DE LA NACIÓN, LA NUEVA GEOPOLÍTICA NACIONAL Y EL INCREMENTO DE LA PRODUCCIÓN NACIONAL DE PETRÓLEO Y GAS.	211	1	5	15
3.1.8. DESARROLLAR EL COMPLEJO INDUSTRIAL CONEXO A LA INDUSTRIA PETROLERA, GASÍFERA Y PETROQUÍMICA PARA FORTALECER Y PROFUNDIZAR NUESTRA SOBERANÍA ECONÓMICA.	213	1	5	15
3.1.9. FORTALECER Y PROFUNDIZAR LA SOBERANÍA TECNOLÓGICA DEL SECTOR HIDROCARBUROS.	214	1	5	15
3.1.11. FORTALECER Y PROFUNDIZAR LAS CAPACIDADES OPERATIVAS DE PDVSA.	215	1	5	15
3.1.13. FORTALECER AL ESTADO EN EL CONTROL Y GESTIÓN DEL SISTEMA ELÉCTRICO NACIONAL PARA SU AMPLIACIÓN Y CONSOLIDACIÓN.	216	1	5	15
3.1.14. FORTALECER Y PROFUNDIZAR LA COOPERACIÓN ENERGÉTICA INTERNACIONAL.	217	1	5	15
3.1.15. CONTRIBUIR AL DESARROLLO DEL SISTEMA ECONÓMICO NACIONAL MEDIANTE LA EXPLOTACIÓN Y TRANSFORMACIÓN RACIONAL SUSTENTABLE DE LOS RECURSOS MINERALES, CON EL USO DE TECNOLOGÍA DE BAJO IMPACTO AMBIENTAL.	218	1	5	15
3.1.16. DESARROLLAR EL POTENCIAL MINERO NACIONAL PARA LA DIVERSIFICACIÓN DE LAS FUENTES DE EMPLEO, INGRESOS Y FORMAS DE PROPIEDAD SOCIAL.	219	1	5	15
3.2.1. AVANZAR HACIA LA SOBERANÍA E INDEPENDENCIA PRODUCTIVA EN LA CONSTRUCCIÓN DE REDES ESTRATÉGICAS TANTO PARA BIENES ESENCIALES COMO DE GENERACIÓN DE VALOR, A PARTIR DE NUESTRAS VENTAJAS COMPARATIVAS.	220	1	5	16
3.2.2. APROVECHAR LAS VENTAJAS DE LOCALIZACIÓN DE NUESTRO PAÍS A ESCALA CONTINENTAL Y DIVERSIDAD DE REGIONES NACIONALES, A EFECTO DE FOMENTAR SU ESPECIALIZACIÓN PRODUCTIVA, ASOCIADA A VENTAJAS COMPARATIVAS DE SECTORES ESTRATÉGICOS.	221	1	5	16
3.2.3. APROPIAR Y DESARROLLAR LA TÉCNICA Y TECNOLOGÍA COMO CLAVE DE LA EFICIENCIA Y HUMANIZACIÓN DEL PROCESO PRODUCTIVO, ANCLANDO ESLABONES DE LAS CADENAS PRODUCTIVAS Y DESATANDO EL POTENCIAL ESPACIAL DE LAS MISMAS.	222	1	5	16
3.2.4. GENERAR MECANISMOS DE CIRCULACIÓN DEL CAPITAL QUE CONSTRUYAN UN NUEVO METABOLISMO ECONÓMICO PARA EL ESTÍMULO, FUNCIONAMIENTO Y DESARROLLO DE LA INDUSTRIA NACIONAL.	223	1	5	16
3.2.7. DESARROLLAR EL SECTOR TURISMO COMO UNA ACTIVIDAD PRODUCTIVA SUSTENTABLE QUE GENERE EXCEDENTES QUE PUEDAN REDISTRIBUIRSE PARA SATISFACER LAS NECESIDADES DEL PUEBLO.	224	1	5	16
3.3.1. FORTALECER LA INDUSTRIA MILITAR VENEZOLANA.	225	1	5	17
3.3.2. DESARROLLAR EL SISTEMA DE ADIESTRAMIENTO CON LA DOCTRINA MILITAR BOLIVARIANA PARA LA DEFENSA INTEGRAL DE LA PATRIA.	226	1	5	17
3.3.3. MEJORAR Y PERFECCIONAR EL SISTEMA EDUCATIVO DE LA FUERZA ARMADA NACIONAL Y EL PODER POPULAR, PARA FORTALECER LA UNIDAD CÍVICO MILITAR EN FUNCIÓN DE LOS INTERESES DE LA PATRIA.	227	1	5	17
3.4.2. MANTENER Y GARANTIZAR EL FUNCIONAMIENTO DEL CONSEJO FEDERAL DE GOBIERNO, LAS INSTANCIAS QUE LO CONFORMAN, ASÍ COMO LAS FORMAS DE COORDINACIÓN DE POLÍTICAS Y ACCIONES ENTRE LAS ENTIDADES POLÍTICO-TERRITORIALES Y LAS ORGANIZACIONES DE BASE DEL PODER POPULAR.	228	1	5	18
3.4.3. PROMOVER LA CREACIÓN DE LOS DISTRITOS MOTORES DE DESARROLLO, CON LA FINALIDAD DE IMPULSAR PROYECTOS ECONÓMICOS, SOCIALES, CIENTÍFICOS Y TECNOLÓGICOS DESTINADOS A LOGRAR EL DESARROLLO INTEGRAL DE LAS REGIONES Y EL FORTALECIMIENTO DEL PODER POPULAR, EN ARAS DE FACILITAR LA TRANSICIÓN HACIA EL SOCIALISMO.	229	1	5	18
3.4.5. INTEGRAR EL TERRITORIO NACIONAL, MEDIANTE LOS CORREDORES MULTIMODALES DE INFRAESTRUCTURA: TRANSPORTE TERRESTRE, FERROVIARIO, AÉREO, FLUVIAL, ENERGÍA ELÉCTRICA,GAS, PETRÓLEO, AGUA Y TELECOMUNICACIONES.	230	1	5	18
4.1.1. FORTALECER LA ALIANZA BOLIVARIANA PARA LOS PUEBLOS DE NUESTRA AMÉRICA (ALBA) COMO EL ESPACIO VITAL DE RELACIONAMIENTO POLÍTICO DE LA REVOLUCIÓN BOLIVARIANA.	231	1	6	19
4.1.2. FORTALECER LA INICIATIVA PETROCARIBE COMO ESQUEMA DE COOPERACIÓN ENERGÉTICA Y SOCIAL SOLIDARIO.	232	1	6	19
4.1.3. FORTALECER MERCOSUR COMO ESPACIO DE COOPERACIÓN E INTEGRACIÓN SOCIAL, POLÍTICO, ECONÓMICO, PRODUCTIVO Y COMERCIAL.	233	1	6	19
4.1.4. CONSOLIDAR LA UNIÓN DE NACIONES SURAMERICANAS (UNASUR) COMO ESPACIO ESTRATÉGICO REGIONAL PARA LA CONSTRUCCIÓN DEL MUNDO PLURIPOLAR.	234	1	6	19
4.1.5. IMPULSAR Y FORTALECER A LA COMUNIDAD DE ESTADOS LATINOAMERICANOS Y CARIBEÑOS (CELAC), COMO MECANISMO DE UNIÓN DE NUESTRA AMÉRICA.	235	1	6	19
3.4.1. PROFUNDIZAR LA INTEGRACIÓN SOBERANA NACIONAL Y LA EQUIDAD SOCIO-TERRITORIAL A TRAVÉS DE EJES DE DESARROLLO INTEGRAL: NORTE LLANERO, APURE-ORINOCO, OCCIDENTAL Y ORIENTAL, POLOS DE DESARROLLO SOCIALISTA, DISTRITOS MOTORES DE DESARROLLO, LAS ZONAS ECONÓMICAS ESPECIALES Y REDIS.	236	1	5	18
4.1.6. FORTALECER LAS ALIANZAS ESTRATÉGICAS BILATERALES CON LOS PAÍSES DE NUESTRA AMÉRICA, COMO BASE PARA IMPULSAR LOS ESQUEMAS DE INTEGRACIÓN Y UNIÓN SUBREGIONALES Y REGIONALES.	237	1	6	19
4.1.7. AVANZAR EN LA CREACIÓN DE ENCADENAMIENTOS ECONÓMICOS PRODUCTIVOS Y ESQUEMAS DE FINANCIAMIENTO CON AMÉRICA LATINA Y EL CARIBE, QUE FORTALEZCAN LA INDUSTRIA NACIONAL Y GARANTICEN EL SUMINISTRO SEGURO DE PRODUCTOS.	238	1	6	19
4.1.8. PROFUNDIZAR LAS ALIANZAS ESTRATÉGICAS BILATERALES EXISTENTES ENTRE VENEZUELA Y LOS PAÍSES DE LA REGIÓN, CON ESPECIAL ÉNFASIS EN LA COOPERACIÓN CON BRASIL, ARGENTINA Y URUGUAY, EN LAS DISTINTAS ÁREAS DE COMPLEMENTACIÓN Y COOPERACIÓN EN MARCHA.	239	1	6	19
4.1.9. IMPULSAR EL NUEVO ORDEN COMUNICACIONAL DE NUESTRA AMÉRICA, CON ESPECIAL ÉNFASIS EN LOS NUEVOS SISTEMAS Y MEDIOS DE INFORMACIÓN REGIONALES Y EN EL IMPULSO DE NUEVAS HERRAMIENTAS COMUNICACIONALES.	240	1	6	19
4.2.2. CREAR Y CONSOLIDAR LA INSTITUCIONALIDAD NACIONAL NUESTROAMERICANA EN LAS ORGANIZACIONES DE COOPERACIÓN E INTEGRACIÓN.	241	1	6	20
4.3.1. CONFORMAR UNA RED DE RELACIONES POLÍTICAS CON LOS POLOS DE PODER EMERGENTES.	242	1	6	21
4.3.2. CONFORMAR UN NUEVO ORDEN COMUNICACIONAL DEL SUR.	243	1	6	21
4.3.3. IMPULSAR LA DIPLOMACIA DE LOS PUEBLOS Y LA PARTICIPACIÓN PROTAGÓNICA DE LOS MOVIMIENTOS POPULARES ORGANIZADOS EN LA CONSTRUCCIÓN DE UN MUNDO MULTIPOLAR Y EN EQUILIBRIO.	244	1	6	21
4.3.4. CONTINUAR IMPULSANDO LA TRANSFORMACIÓN DEL SISTEMA DE DERECHOS HUMANOS SOBRE LA BASE DEL RESPETO, SU DEMOCRATIZACIÓN, LA IGUALDAD SOBERANA DE LOS ESTADOS Y EL PRINCIPIO DE LA NO INJERENCIA.	246	1	6	21
4.4.1. DESLINDAR A VENEZUELA DE LOS MECANISMOS INTERNACIONALES DE DOMINACIÓN IMPERIAL.	247	1	6	22
4.4.2. REDUCIR EL RELACIONAMIENTO ECONÓMICO Y TECNOLÓGICO CON LOS CENTROS IMPERIALES DE DOMINACIÓN A NIVELES QUE NO COMPROMETAN LA INDEPENDENCIA NACIONAL.	248	1	6	22
4.4.3. PROFUNDIZAR Y AMPLIAR EL RELACIONAMIENTO CON LOS POLOS EMERGENTES DEL MUNDO NUEVO.	249	1	6	22
5.1.1. IMPULSAR DE MANERA COLECTIVA LA CONSTRUCCIÓN Y CONSOLIDACIÓN DEL SOCIALISMO COMO ÚNICA OPCIÓN FRENTE AL MODELO DEPREDADOR, DISCRIMINADOR E INSOSTENIBLE CAPITALISTA.	250	1	7	23
5.1.2. PROMOVER, A NIVEL NACIONAL E INTERNACIONAL, UNA ÉTICA ECOSOCIALISTA QUE IMPULSE LA TRANSFORMACIÓN DE LOS PATRONES INSOSTENIBLES DE PRODUCCIÓN Y DE CONSUMO PROPIOS DEL SISTEMA CAPITALISTA.	251	1	7	23
5.1.3. GENERAR ALTERNATIVAS SOCIO-PRODUCTIVAS Y NUEVOS ESQUEMAS DE COOPERACIÓN SOCIAL, ECONÓMICA Y FINANCIERA PARA EL APALANCAMIENTO DEL ECOSOSCIALISMO Y EL ESTABLECIMIENTO DE UN COMERCIO JUSTO, BAJO LOS PRINCIPIOS DE COMPLEMENTARIEDAD, COOPERACIÓN, SOBERANÍA Y SOLIDARIDAD.	252	1	7	23
5.1.4. IMPULSAR LA PROTECCIÓN DEL AMBIENTE, LA EFICIENCIA EN LA UTILIZACIÓN DE RECURSOS Y EL LOGRO DE UN DESARROLLO SOSTENIBLE, IMPLEMENTANDO LA REDUCCIÓN Y EL REÚSO EN TODAS LAS ACTIVIDADES ECONÓMICAS PÚBLICAS Y PRIVADAS.	253	1	7	23
5.1.5. MEJORAR SUSTANCIALMENTE LAS CONDICIONES SOCIOAMBIENTALES DE LAS CIUDADES.	254	1	7	23
5.1.6. IMPULSAR LA GENERACIÓN DE ENERGÍAS LIMPIAS, AUMENTANDO SU PARTICIPACIÓN EN LA MATRIZ ENERGÉTICA NACIONAL Y PROMOVIENDO LA SOBERANÍA TECNOLÓGICA.	255	1	7	23
5.2.1. PROMOVER ACCIONES EN EL ÁMBITO NACIONAL E INTERNACIONAL PARA LA PROTECCIÓN, CONSERVACIÓN Y GESTIÓN SUSTENTABLE DE ÁREAS ESTRATÉGICAS, TALES COMO FUENTES Y RESERVORIOS DE AGUA DULCE (SUPERFICIAL Y SUBTERRÁNEA), CUENCAS HIDROGRÁFICAS, DIVERSIDAD BIOLÓGICA, MARES, OCÉANOS Y BOSQUES.	256	1	7	24
5.2.2. DESMONTAR Y LUCHAR CONTRA LOS ESQUEMAS INTERNACIONALES QUE PROMUEVEN LA MERCANTILIZACIÓN DE LA NATURALEZA, DE LOS SERVICIOS AMBIENTALES Y DE LOS ECOSISTEMAS.	257	1	7	24
5.2.3. PROMOVER LA COOPERACIÓN, A NIVEL REGIONAL, PARA EL MANEJO INTEGRADO DE LOS RECURSOS NATURALES TRANSFRONTERIZOS.	258	1	7	24
5.2.4. LUCHAR CONTRA LA SECURITIZACIÓN DE LOS PROBLEMAS AMBIENTALES MUNDIALES, PARA EVITAR LA INCORPORACIÓN DE LOS TEMAS AMBIENTALES Y HUMANOS COMO TEMAS DE SEGURIDAD INTERNACIONAL POR PARTE DE LAS POTENCIAS HEGEMÓNICAS.	259	1	7	24
5.3.1. CONTRARRESTAR LA PRODUCCIÓN Y VALORIZACIÓN DE ELEMENTOS CULTURALES Y RELATOS HISTÓRICOS GENERADOS DESDE LA ÓPTICA NEOCOLONIAL DOMINANTE, QUE CIRCULAN A TRAVÉS DE LOS MEDIOS DE COMUNICACIÓN E INSTITUCIONES EDUCATIVAS Y CULTURALES, ENTRE OTRAS.	260	1	7	25
5.3.2. FORTALECER Y VISIBILIZAR LOS ESPACIOS DE EXPRESIÓN Y FOMENTAR MECANISMOS DE REGISTRO E INTERPRETACIÓN DE LAS CULTURAS POPULARES Y DE LA MEMORIA HISTÓRICA VENEZOLANA Y NUESTROAMERICANA.	261	1	7	25
5.3.3. PROMOVER UNA CULTURA ECOSOCIALISTA, QUE REVALORICE EL PATRIMONIO HISTÓRICO CULTURAL VENEZOLANO Y NUESTROAMERICANO.	262	1	7	25
5.3.4. ELABORAR ESTRATEGIAS DE MANTENIMIENTO Y DIFUSIÓN DE LAS CARACTERÍSTICAS CULTURALES Y DE LA MEMORIA HISTÓRICA DEL PUEBLO VENEZOLANO.	263	1	7	25
5.4.1. CONTINUAR LA LUCHA POR LA PRESERVACIÓN, EL RESPETO Y EL FORTALECIMIENTO DEL RÉGIMEN CLIMÁTICO CONFORMADO POR LA CONVENCIÓN MARCO DE NACIONES UNIDAS PARA EL CAMBIO CLIMÁTICO Y SU PROTOCOLO DE KYOTO.	264	1	7	26
5.4.2. DISEÑAR UN PLAN DE MITIGACIÓN QUE ABARQUE LOS SECTORES PRODUCTIVOS EMISORES DE GASES DE EFECTO INVERNADERO, COMO UNA CONTRIBUCIÓN VOLUNTARIA NACIONAL A LOS ESFUERZOS PARA SALVAR EL PLANETA.	265	1	7	26
5.4.3. DISEÑAR UN PLAN NACIONAL DE ADAPTACIÓN QUE PERMITA AL PAÍS PREPARARSE PARA LOS ESCENARIOS E IMPACTOS CLIMÁTICOS QUE SE PRODUCIRÁN DEBIDO A LA IRRESPONSABILIDAD DE LOS PAÍSES INDUSTRIALIZADOS, CONTAMINADORES DEL MUNDO.	266	1	7	26
2.1.4. DESARROLLAR MODELOS INCLUYENTES DE GESTIÓN DE LAS UNIDADES PRODUCTIVAS, PARTICIPATIVOS CON LOS TRABAJADORES Y TRABAJADORAS, ALINEADOS CON LAS POLÍTICAS NACIONALES, ASÍ COMO CON UNA CULTURA DEL TRABAJO QUE SE CONTRAPONGA AL RENTISMO PETROLERO, DESMONTANDO LA ESTRUCTURA OLIGOPÓLICA Y MONOPÓLICA EXISTENTE.	267	1	4	10
3.1.12. GARANTIZAR LA SEGURIDAD ENERGÉTICA DEL PAÍS, OPTIMIZANDO LA EFICIENCIA EN LA PLANIFICACIÓN ESTRATÉGICA Y TÁCTICA, QUE PERMITA MINIMIZAR LOS RIESGOS INHERENTES A LOS FLUJOS ENERGÉTICOS EN EL TERRITORIO.	268	1	5	15
2.1.1. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN QUE PONGAN AL SERVICIO DE LA SOCIEDAD LOS MEDIOS DE PRODUCCIÓN, Y ESTIMULEN LA GENERACIÓN DE UN TEJIDO PRODUCTIVO SUSTENTABLE ENMARCADO EN EL NUEVO METABOLISMO PARA LA TRANSICIÓN AL SOCIALISMO.	269	1	4	10
2.2.1. SUPERAR LAS FORMAS DE EXPLOTACIÓN CAPITALISTAS PRESENTES EN EL PROCESO SOCIAL DEL TRABAJO, A TRAVÉS DEL DESPLIEGUE DE RELACIONES SOCIALISTAS ENTRE TRABAJADORES Y TRABAJADORAS CON ESTE PROCESO, COMO ESPACIO FUNDAMENTAL PARA EL DESARROLLO INTEGRAL DE LA POBLACIÓN.	270	1	4	11
2.2.2. CONSOLIDAR EL SISTEMA NACIONAL DE MISIONES Y GRANDES MISIONES SOCIALISTAS HUGO CHÁVEZ, COMO CONJUNTO INTEGRADO DE POLÍTICAS Y PROGRAMAS QUE MATERIALIZAN LOS DERECHOS Y GARANTÍAS DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA Y SIRVE DE PLATAFORMA DE ORGANIZACIÓN, ARTICULACIÓN Y GESTIÓN DE LA POLÍTICA SOCIAL EN LOS DISTINTOS NIVELES TERRITORIALES DEL PAÍS, PARA DAR MAYOR EFICIENCIA Y EFICACIA A LAS POLÍTICAS SOCIALES DE LA REVOLUCIÓN.	271	1	4	11
2.2.3. POTENCIAR LAS EXPRESIONES CULTURALES LIBERADORAS DEL PUEBLO.	272	1	4	11
2.2.4. CONSOLIDAR LA EQUIDAD DE GÉNERO CON VALORES SOCIALISTAS, GARANTIZANDO Y RESPETANDO LOS DERECHOS DE TODOS Y TODAS, Y LA DIVERSIDAD SOCIAL.	273	1	4	11
2.2.5. FOMENTAR LA INCLUSIÓN Y EL VIVIR BIEN DE LOS PUEBLOS INDÍGENAS.	274	1	4	11
2.2.6. PROPICIAR LAS CONDICIONES PARA EL DESARROLLO DE UNA CULTURA DE RECREACIÓN Y PRÁCTICA DEPORTIVA LIBERADORA, AMBIENTALISTA E INTEGRADORA EN TORNO A LOS VALORES DE LA PATRIA, COMO VÍA PARA LA LIBERACIÓN DE LA CONCIENCIA, LA PAZ Y LA CONVIVENCIA ARMÓNICA.	275	1	4	11
2.2.8. SEGUIR AVANZANDO EN LA TRANSFORMACIÓN DEL SISTEMA PENITENCIARIO PARA LA PRESTACIÓN DE UN SERVICIO QUE GARANTICE LOS DERECHOS HUMANOS DE LAS PERSONAS PRIVADAS DE LIBERTAD Y FAVOREZCA SU INSERCIÓN PRODUCTIVA EN LA SOCIEDAD.	276	1	4	11
2.2.9. CONTINUAR COMBATIENDO LA DESIGUALDAD A TRAVÉS DE LA ERRADICACIÓN DE LA POBREZA EXTREMA Y DISMINUCIÓN DE LA POBREZA GENERAL, HACIA SU TOTAL ELIMINACIÓN.	277	1	4	11
2.2.10. ASEGURAR LA SALUD DE LA POBLACIÓN DESDE LA PERSPECTIVA DE PREVENCIÓN Y PROMOCIÓN DE LA CALIDAD DE VIDA, TENIENDO EN CUENTA LOS GRUPOS SOCIALES VULNERABLES, ETARIOS, ETNIAS, GÉNERO, ESTRATOS Y TERRITORIOS SOCIALES.	278	1	4	11
2.2.11. ASEGURAR UNA ALIMENTACIÓN SALUDABLE, UNA NUTRICIÓN ADECUADA A LO LARGO DEL CICLO DE VIDA Y LA LACTANCIA MATERNA, EN CONCORDANCIA CON LOS MANDATOS CONSTITUCIONALES SOBRE SALUD, SOBERANÍA Y SEGURIDAD ALIMENTARIA, PROFUNDIZANDO Y AMPLIANDO LAS CONDICIONES QUE LAS GARANTICEN.	279	1	4	11
2.2.12. CONTINUAR GARANTIZANDO EL DERECHO A LA EDUCACIÓN CON CALIDAD Y PERTINENCIA, A TRAVÉS DEL MEJORAMIENTO DE LAS CONDICIONES DE INGRESO, PROSECUCIÓN Y EGRESO DEL SISTEMA EDUCATIVO	280	1	4	11
2.2.13. CONSOLIDAR LAS MISIONES, GRANDES MISIONES SOCIALISTAS COMO INSTRUMENTO REVOLUCIONARIO PARA NUEVO ESTADO DEMOCRÁTICO, SOCIAL DE DERECHO Y DE JUSTICIA.	281	1	4	11
2.3.1 PROMOVER LA CONSTRUCCIÓN DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA A TRAVÉS DE LA CONSOLIDACIÓN Y EXPANSIÓN DEL PODER POPULAR ORGANIZADO.	282	1	4	12
2.3.2. IMPULSAR LA TRANSFORMACIÓN DEL MODELO ECONÓMICO RENTÍSTICO HACIA EL NUEVO MODELO PRODUCTIVO DIVERSIFICADO Y SOCIALISTA, CON PARTICIPACIÓN PROTAGÓNICA DE LAS INSTANCIAS DEL PODER POPULAR.	283	1	4	12
2.3.3. GARANTIZAR LA TRANSFERENCIA DE COMPETENCIAS EN TORNO A LA GESTIÓN Y ADMINISTRACIÓN DE LO PÚBLICO DESDE LAS DISTINTAS INSTANCIAS DEL ESTADO HACIA LAS COMUNIDADES ORGANIZADAS.	284	1	4	12
2.3.4. IMPULSAR LA CORRESPONSABILIDAD DEL PODER POPULAR EN LA LUCHA POR LA INCLUSIÓN SOCIAL Y ERRADICACIÓN DE LA POBREZA.	285	1	4	12
2.3.5. CONSOLIDAR LA FORMACIÓN INTEGRAL SOCIALISTA, PERMANENTE Y CONTINUA, EN LOS DIFERENTES PROCESOS DE SOCIALIZACIÓN E INTERCAMBIO DE SABERES DEL PODER POPULAR, FORTALECIENDO HABILIDADES Y ESTRATEGIAS PARA EL EJERCICIO DE LO PÚBLICO Y EL DESARROLLO SOCIOCULTURAL Y PRODUCTIVO DE LAS COMUNIDADES.	286	1	4	12
3.1.10. PROFUNDIZAR LA DIVERSIFICACIÓN DE NUESTROS MERCADOS INTERNACIONALES DE HIDROCARBUROS, CON EL OBJETIVO DE UTILIZAR LA FORTALEZA DE SER UN PAÍS POTENCIA ENERGÉTICA, PARA DESPLEGAR NUESTRA PROPIA GEOPOLÍTICA.	287	1	5	15
3.2.6. FORTALECER EL SECTOR TURISMO COMO ESTRATEGIA DE INCLUSIÓN SOCIAL QUE FACILITE Y GARANTICE AL PUEBLO VENEZOLANO, FUNDAMENTALMENTE A LAS POBLACIONES MÁS VULNERABLES, EL ACCESO A SU PATRIMONIO TURÍSTICO (DESTINOS TURÍSTICOS) Y EL DISFRUTE DE LAS INFRAESTRUCTURAS TURÍSTICAS DEL ESTADO EN CONDICIONES DE PRECIOS JUSTOS Y RAZONABLES.	289	1	5	16
3.4.6. PLANIFICAR DESDE EL GOBIERNO CENTRAL Y CON PROTAGONISMO POPULAR, EL DESARROLLO URBANO Y RURAL DE LAS CIUDADES EXISTENTES Y DE LAS NACIENTES A LO LARGO DE NUESTRO TERRITORIO NACIONAL.	290	1	5	18
4.1.10. PROMOVER LA RESOLUCIÓN ARMONIOSA Y COOPERATIVA DE LAS DELIMITACIONES PENDIENTES, ENTENDIENDO LA ESTABILIZACIÓN DE LAS FRONTERAS COMO UN ELEMENTO DE UNIDAD Y DE PAZ.	291	1	6	19
4.2.1. CONSOLIDAR LA VISIÓN DE LA HETEROGENEIDAD Y DIVERSIDAD ÉTNICA DE VENEZUELA Y NUESTRA AMÉRICA, BAJO EL RESPETO E INCLUSIÓN PARTICIPATIVA Y PROTAGÓNICA DE LAS  MINORÍAS Y PUEBLOS ORIGINARIOS.	292	1	6	20
3.2.5. DESARROLLAR, FORTALECER E IMPULSAR LOS ESLABONES PRODUCTIVOS DE LA INDUSTRIA NACIONAL IDENTIFICADOS EN PROYECTOS DE ÁREAS PRIORITARIAS TALES COMO AUTOMOTRIZ, ELECTRODOMÉSTICOS, MATERIALES DE CONSTRUCCIÓN, TRANSFORMACIÓN DE PLÁSTICO Y ENVASES, QUÍMICA, HIERRO-ACERO, ALUMINIO, ENTRE OTRAS; ORIENTADOS POR UN MECANISMO DE PLANIFICACIÓN CENTRALIZADA, SISTEMA PRESUPUESTARIO Y MODELOS DE GESTIÓN EFICIENTES Y PRODUCTIVOS CÓNSONOS CON LA TRANSICIÓN AL SOCIALISMO.	293	1	5	16
3.4.7. REFORZAR Y DESARROLLAR MECANISMOS DE CONTROL QUE PERMITAN AL ESTADO EJERCER EFICAZMENTE SU SOBERANÍA EN EL INTERCAMBIO DE BIENES EN LAS ZONAS FRONTERIZAS.	294	1	5	18
2.4.1. PRESERVAR LOS VALORES BOLIVARIANOS LIBERADORES, IGUALITARIOS, SOLIDARIOS DEL PUEBLO VENEZOLANO Y FOMENTAR EL DESARROLLO DE UNA NUEVA ÉTICA SOCIALISTA.	295	1	4	13
2.4.2. FORTALECER LA CONTRALORÍA SOCIAL, PARA MEJORAR EL DESEMPEÑO DE LA GESTIÓN PÚBLICA, DE LAS INSTANCIAS DEL PODER POPULAR Y LAS ACTIVIDADES PRIVADAS QUE AFECTEN EL INTERÉS COLECTIVO.	296	1	4	13
2.5.1. DESATAR LA POTENCIA CONTENIDA EN LA CONSTITUCIÓN BOLIVARIANA PARA EL EJERCICIO DE LA DEMOCRACIA PARTICIPATIVA Y PROTAGÓNICA.	297	1	4	14
2.5.2. DESARROLLAR EL SISTEMA FEDERAL DE GOBIERNO, BASADO EN LOS PRINCIPIOS DE INTEGRIDAD TERRITORIAL, ECONÓMICA Y POLÍTICA DE LA NACIÓN, MEDIANTE LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR EN LAS FUNCIONES DE GOBIERNO COMUNAL Y EN LA ADMINISTRACIÓN DE LOS MEDIOS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE PROPIEDAD SOCIAL.	298	1	4	14
2.5.3. ACELERAR LA CONSTRUCCIÓN DE LA NUEVA PLATAFORMA INSTITUCIONAL DEL ESTADO, EN EL MARCO DEL NUEVO MODELO DE GESTIÓN SOCIALISTA BOLIVARIANO.	299	1	4	14
2.5.4. IMPULSAR UNA PROFUNDA, DEFINITIVA E IMPOSTERGABLE REVOLUCIÓN EN EL SISTEMA DE ADMINISTRACIÓN DE JUSTICIA, ENTRE LOS PODERES PÚBLICOS Y EL PODER POPULAR, QUE GARANTICE LA IGUALDAD DE CONDICIONES Y OPORTUNIDADES A TODA LA POBLACIÓN A SU ACCESO Y APLICACIÓN.	300	1	4	14
2.5.5. DESPLEGAR EN SOBREMARCHA LA GRAN MISIÓN ¡A TODA VIDA! VENEZUELA CONCEBIDA COMO UNA POLÍTICA INTEGRAL DE SEGURIDAD CIUDADANA, CON EL FIN DE TRANSFORMAR LOS FACTORES DE CARÁCTER ESTRUCTURAL, SITUACIONAL E INSTITUCIONAL, GENERADORES DE LA VIOLENCIA Y EL DELITO, PARA REDUCIRLOS, AUMENTANDO LA CONVIVENCIA SOLIDARIA Y EL DISFRUTE DEL PUEBLO AL LIBRE Y SEGURO EJERCICIO DE SUS ACTIVIDADES FAMILIARES, COMUNALES, SOCIALES, FORMATIVAS, LABORALES, SINDICALES, ECONÓMICAS, CULTURALES Y RECREACIONALES.	301	1	4	14
2.5.7. FORTALECER EL SISTEMA ESTADÍSTICO NACIONAL EN SUS MECANISMOS, INSTANCIAS Y OPERACIONES ESTADÍSTICAS.	302	1	4	14
2.5.6. FORTALECER EL SISTEMA NACIONAL DE PLANIFICACIÓN PÚBLICA Y POPULAR PARA LA CONSTRUCCIÓN DE LA SOCIEDAD SOCIALISTA DE JUSTICIA Y EQUIDAD, EN EL MARCO DEL NUEVO ESTADO DEMOCRÁTICO Y SOCIAL DE DERECHO Y DE JUSTICIA.	303	1	4	14
2.5.8. IMPULSAR EL DESARROLLO DE LA NORMATIVA LEGAL E INFRAESTRUCTURA NECESARIA PARA LA CONSOLIDACIÓN DE GOBIERNO ELECTRÓNICO.	304	1	4	14
\.


--
-- Name: objetivo_estrategico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('objetivo_estrategico_id_seq', 1, false);


--
-- Data for Name: objetivo_general; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY objetivo_general (objetivo_general, id, plan_patria, objetivo_historico, objetivo_nacional, objetivo_estrategico) FROM stdin;
GARANTIZAR EL FINANCIAMIENTO DEL PLAN DE INVERSIÓN DE LA CORPORACION DE SALUD DEL ESTADO ARAGUA QUE PERMITA CONSOLIDAR LOS PROYECTOS DEL SECTOR SALUD PARA EL AÑO 2015	1332	1	4	11	142
2.2.1.5. PROMOVER LA ARMONIZACIÓN DE LA VIDA FAMILIAR Y LABORAL.\n	184	1	4	11	133
4.1.9.1. FORTALECER TELESUR, GARANTIZANDO UNA MAYOR PRESENCIA REGIONAL Y MUNDIAL.	296	1	6	19	104
5.3.2.5. IMPULSAR LA CREACIÓN DE ESPACIOS HISTÓRICOS CULTURALES COMUNITARIOS EN TODA LA GEOGRAFÍA NACIONAL.	325	1	7	25	126
3.1.13.1. FORTALECER Y AMPLIAR EL SISTEMA ELÉCTRICO NACIONAL.	377	1	5	15	77
1.2.2.1. GARANTIZAR LA HEGEMONÍA DEL ESTADO SOBRE LA PRODUCCIÓN NACIONAL DE PETRÓLEO.	690	1	3	4	7
1.4.1.5. MEJORAR PROCESO DE REGULACIÓN Y ACCESO A LA TIERRA.\n	724	1	3	3	4
1.4.1.6. ORDENAR Y REGLAMENTAR LA ACTIVIDAD PESQUERA Y ACUÍCOLA.\n	725	1	3	6	29
2.2.12.11. CONSOLIDAR LA DEMOCRATIZACIÓN DEL ACCESO A LA EDUCACIÓN TÉCNICA UNIVERSITARIA.\n	914	1	4	11	144
NO APLICA	986	1	6	19	105
1.4.8.2. DISEÑAR Y EJECUTAR UNA POLÍTICA DE EXPORTACIONES DE PRODUCTOS AGRÍCOLAS CON VALOR AGREGADO A LOS PAÍSES DEL CARIBE Y AL NORTE DE BRASIL.\n	100	1	3	6	38
3.1.13.10. CREAR UN FONDO DE DESARROLLO PARA LAS INVERSIONES DEL SECTOR ELÉCTRICO.	1078	1	5	15	77
NO APLICA	1149	1	5	18	92
1.4.7.4. CREAR, CULMINAR Y CONSOLIDAR FÁBRICAS DE PLANTAS Y MÁQUINAS PARA EL PROCESAMIENTO AGROINDUSTRIAL (TRACTORES, COSECHADORAS), CENTROS GENÉTICOS DE PRODUCCIÓN PECUARIA Y ACUÍCOLAS, ENTRE OTROS. 	98	1	3	6	37
1.1.1.1. CONSOLIDAR LA UNIDAD DE LA CLASE TRABAJADORA Y DE SUS CAPAS PROFESIONALES, DE LOS PEQUEÑOS Y MEDIANOS PRODUCTORES DEL CAMPO Y LA CIUDAD; ASÍ COMO DE LOS MOVIMIENTOS Y ORGANIZACIONES SOCIALES QUE ACOMPAÑAN A LA REVOLUCIÓN BOLIVARIANA.	1	1	3	3	1
1.1.1.2. DESPLEGAR TODAS LAS ACCIONES POLÍTICAS NECESARIAS PARA GARANTIZAR LOS PROCESOS ELECTORALES EN UN CLIMA DE ESTABILIDAD Y LOGRAR QUE SE RECONOZCA DE MANERA PACÍFICA LA VOLUNTAD SOBERANA DE NUESTRO PUEBLO.	2	1	3	3	1
1.1.1.3. CONVOCAR A TODOS LOS SECTORES DEMOCRÁTICOS Y HONESTOS DEL PAÍS A CONTRIBUIR AL DESARROLLO PACÍFICO DE LOS PROCESOS ELECTORALES.	3	1	3	3	1
1.1.2.2. FORTALECER LA CONCIENCIA Y LA ORGANIZACIÓN SECTORIAL Y TERRITORIAL DE NUESTRO PUEBLO PARA LA DEFENSA INTEGRAL DE LA PATRIA.	4	1	3	3	2
1.2.9.1. IMPULSAR MECANISMOS ENTRE LOS PAÍSES PRODUCTORES DE GAS PARA UNA JUSTA VALORIZACIÓN DEL GAS Y SU CONSERVACIÓN.	5	1	3	4	15
1.2.10.1. PROFUNDIZAR EL CONTENIDO POLÍTICO Y SOCIAL DE LA INDUSTRIA PETROLERA Y MINERA.	6	1	3	4	16
1.2.10.2. IMPULSAR LA PARTICIPACIÓN DE LOS TRABAJADORES EN LA PLANIFICACIÓN DE LAS ACTIVIDADES DE LA INDUSTRIA PETROLERA Y MINERA.	7	1	3	4	16
1.1.2.1. FORTALECER Y DEFENDER A LOS PODERES PÚBLICOS DEL ESTADO.	8	1	3	3	2
1.1.2.3. POTENCIAR LAS CAPACIDADES DE LOS ORGANISMOS DE SEGURIDAD CIUDADANA DEL ESTADO PARA GARANTIZAR LA ESTABILIDAD POLÍTICA Y LA PAZ DE LA NACIÓN.	9	1	3	3	2
1.1.3.1. FORMAR A LAS ORGANIZACIONES DEL PODER POPULAR EN PROCESOS DE PLANIFICACIÓN, COORDINACIÓN, CONTROL Y ADMINISTRACIÓN DE SERVICIOS QUE ELEVEN EL VIVIR BIEN.	10	1	3	3	3
1.1.3.2. FORTALECER EL PODER POPULAR EN EL EJERCICIO COMPARTIDO DE FUNCIONES DE PLANIFICACIÓN, ELABORACIÓN, EJECUCIÓN Y SEGUIMIENTO DE LAS POLÍTICAS PÚBLICAS.	11	1	3	3	3
1.1.3.3. TRANSFERIR AL PODER POPULAR, EN CORRESPONSABILIDAD, COMPETENCIAS, SERVICIOS Y OTRAS ATRIBUCIONES DEL PODER PÚBLICO NACIONAL, REGIONAL Y MUNICIPAL.	12	1	3	3	3
1.1.4.1. GARANTIZAR LA PLANIFICACIÓN, ELABORACIÓN, EJECUCIÓN Y SEGUIMIENTO PARTICIPATIVO DE LAS POLÍTICAS REGIONALES Y LOCALES, EN CONSONANCIA CON LOS OBJETIVOS DEL PLAN DE DESARROLLO ECONÓMICO Y SOCIAL DE LA NACIÓN.	13	1	3	3	4
1.1.5.1. GARANTIZAR EL DERECHO DEL PUEBLO A ESTAR INFORMADO VERAZ Y OPORTUNAMENTE, ASÍ COMO AL LIBRE EJERCICIO DE LA INFORMACIÓN Y COMUNICACIÓN.	14	1	3	3	5
1.1.5.2. FORTALECER EL USO RESPONSABLE Y CRÍTICO DE LOS MEDIOS DE COMUNICACIÓN PÚBLICOS, PRIVADOS Y COMUNITARIOS COMO INSTRUMENTOS DE FORMACIÓN DE VALORES BOLIVARIANOS.	15	1	3	3	5
1.1.5.3. CONSOLIDAR LA REGULACIÓN Y CONTRALORÍA SOCIAL DE LOS MEDIOS DE COMUNICACIÓN COMO HERRAMIENTA PARA EL FORTALECIMIENTO DEL PODER POPULAR.	16	1	3	3	5
1.1.5.4. PROMOVER E IMPULSAR UN SISTEMA NACIONAL DE COMUNICACIÓN POPULAR.	17	1	3	3	5
1.1.5.5. FOMENTAR LA INVESTIGACIÓN Y FORMACIÓN SOBRE LA COMUNICACIÓN COMO PROCESO HUMANO Y HERRAMIENTA DE TRANSFORMACIÓN Y CONSTRUCCIÓN SOCIAL.	18	1	3	3	5
1.1.5.6. DESARROLLAR REDES DE COMUNICACIÓN Y MEDIOS DE EXPRESIÓN DE LA PALABRA, LA IMAGEN Y LAS VOCES DE NUESTROS PUEBLOS, CON MIRAS AL FORTALECIMIENTO DE LOS PROCESOS DE INTEGRACIÓN Y UNIDAD LATINOAMERICANA Y CARIBEÑA.	19	1	3	3	5
1.1.5.7. ACTUALIZAR Y DESARROLLAR DE FORMA PERMANENTE LAS PLATAFORMAS TECNOLÓGICAS DE COMUNICACIÓN E INFORMACIÓN, GARANTIZANDO EL ACCESO A LA COMUNICACIÓN OPORTUNA Y ÉTICA A FIN DE CONTRIBUIR A LA SATISFACCIÓN DE LAS NECESIDADES PARA EL VIVIR BIEN DE NUESTRO PUEBLO, ENTRE OTRAS.	20	1	3	3	5
1.1.5.8. CONSOLIDAR LA ADECUACIÓN TECNOLÓGICA DEL SISTEMA PÚBLICO DE COMUNICACIÓN CON EL MARCO DE LA IMPLEMENTACIÓN DE LA TELEVISIÓN DIGITAL ABIERTA Y EL USO DE LAS NUEVAS TIC.	21	1	3	3	5
1.2.10.3. CONSOLIDAR Y PROFUNDIZAR INSTANCIAS DE PARTICIPACIÓN POLÍTICA DEL PUEBLO Y DE LOS TRABAJADORES PETROLEROS Y MINEROS.	22	1	3	4	16
1.2.2.1. GARANTIZAR LA HEGEMONÍA DEL ESTADO SOBRE LA PRODUCCIÓN NACIONAL DE PETRÓLEO.	23	1	3	4	7
1.2.2.2. ASEGURAR UNA PARTICIPACIÓN MAYORITARIA DE PDVSA EN LAS EMPRESAS MIXTAS.	24	1	3	4	7
1.2.3.1. CONSOLIDAR Y FORTALECER UNA EMPRESA ESTATAL PARA LA EXPLOTACIÓN DE LOS RECURSOS MINEROS.	25	1	3	4	8
1.2.5.1. FORTALECER LAS ACCIONES EMPRENDIDAS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS ESTRATÉGICAS DE LA INDUSTRIA PETROLERA.	26	1	3	4	10
1.2.5.2. CONSOLIDAR EL CONTROL EFECTIVO DE LAS ACTIVIDADES CLAVE DE LA CADENA DE VALOR DE PETRÓLEO Y GAS.	27	1	3	4	10
1.2.6.1. DEFENDER LAS POLÍTICAS PARA LA JUSTA VALORIZACIÓN DEL PETRÓLEO.	28	1	3	4	11
1.3.3.1. REGULARIZAR Y CONTROLAR LA PRODUCCIÓN DE MINERALES ESTRATÉGICOS.	29	1	3	5	21
1.2.12.1. DEFENDER LA PROPIEDAD DE LA NACIÓN SOBRE LOS RECURSOS ESTRATÉGICOS NO PETROLEROS, ASÍ COMO EL DESARROLLO SUSTENTABLE Y SOSTENIBLE DE LAS CAPACIDADES DE APROVECHAMIENTO DE LOS MISMOS, EN SUS PROCESOS DE TRANSFORMACIÓN Y AGREGACIÓN DE VALOR NACIONAL.	30	1	3	4	18
1.2.10.4. FORTALECER LOS PLANES ESTRATÉGICOS DE CONTINGENCIA EN EL SECTOR DE HIDROCARBUROS, MINERÍA Y GAS, QUE INCORPOREN LA PARTICIPACIÓN DEL PODER POPULAR PARA CONTRARRESTAR POSIBLES SABOTAJES.	31	1	3	4	16
1.2.12.3. GARANTIZAR LA INCORPORACIÓN DE LOS RECURSOS NATURALES ESTRATÉGICOS AL PROCESO PRODUCTIVO, DE FORMA EFICIENTE Y SUSTENTABLE PARA LA SATISFACCIÓN Y ACCESO DEMOCRÁTICO DE LA POBLACIÓN A LOS BIENES Y SERVICIOS PARA EL VIVIR BIEN.	32	1	3	4	18
1.4.8.1. CONSTITUIR EMPRESAS MIXTAS DE EXPORTACIÓN CON PAÍSES MIEMBROS DEL ALBA Y MERCOSUR Y OTROS ALIADOS EXTRARREGIONALES.\n	99	1	3	6	38
1.1.5.9. CONFORMAR UN SISTEMA DE MEDIOS QUE CONTRIBUYA A LA ORGANIZACIÓN SECTORIAL PARA LA DEFENSA INTEGRAL DE LA PATRIA, CON ÉNFASIS EN LA CONSOLIDACIÓN DE NUEVOS MEDIOS Y FORMAS DE PRODUCIR CONTENIDOS EN LA FRONTERA CON RELEVANCIA DE LOS VALORES PATRIÓTICOS Y SOCIALISTAS.	33	1	3	3	5
1.3.3.2. FORTALECER EL RÉGIMEN DE RECAUDACIÓN Y FISCALIZACIÓN DE LA ACTIVIDAD MINERA.	34	1	3	5	21
1.5.2.6. GARANTIZAR LA CREACIÓN Y APROPIACIÓN DEL CONOCIMIENTO PARA EL DESARROLLO, PRODUCCIÓN Y BUEN USO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE LA INFORMACIÓN.\n	35	1	3	7	42
1.3.5.1. MANTENER Y AMPLIAR EL FONDO CONJUNTO CHINO - VENEZOLANO, COMO ESTRATEGIA PARA AFIANZAR UNA NUEVA GEOPOLÍTICA, BASADA EN LA DIVERSIFICACIÓN DE MERCADOS, Y COMO MECANISMO PARA LA ASIGNACIÓN DE RECURSOS DIRIGIDOS AL DESARROLLO DE PROYECTOS  ESTRATÉGICOS EN MATERIA SOCIAL, DE INFRAESTRUCTURA, INDUSTRIA, AGRICULTURA Y ENERGÍA,\nENTRE OTROS.	36	1	3	5	23
1.3.5.2. PROMOVER LA CREACIÓN DE MECANISMOS DE COOPERACIÓN BILATERAL CON SOCIOS ESTRATÉGICOS, MEDIANTE LOS CUALES SE RECIBAN RECURSOS FINANCIEROS QUE SEAN CANCELADOS A TRAVÉS DEL SUMINISTRO DE CRUDOS Y PRODUCTOS.	37	1	3	5	23
1.3.3.3. REORDENAR Y ESTABLECER LAS TASAS DE REGALÍA APLICABLES A LA LIQUIDACIÓN DE LOS DISTINTOS MINERALES.	38	1	3	5	21
1.3.3.4. REVISAR Y REGULARIZAR LOS CONVENIOS DE REGALÍA ESPECÍFICOS PARA CADA UNO DE LOS MINERALES.	39	1	3	5	21
1.3.4.1. CREAR ENTES ESTATALES PARA LA COMERCIALIZACIÓN DE LOS MINERALES.	40	1	3	5	22
1.3.4.2. ESTABLECER MECANISMOS TRANSPARENTES PARA LA VALORIZACIÓN DE LOS MINERALES.	41	1	3	5	22
1.3.5.3. PROMOVER LA CONSTITUCIÓN DE FIDEICOMISOS PARA EL FINANCIAMIENTO DE PROYECTOS ESTRATÉGICOS.	42	1	3	5	23
1.3.6.3. IMPULSAR EN EL SENO DE PETROCARIBE PROYECTOS ORIENTADOS A LA DISMINUCIÓN DEL CONSUMO ENERGÉTICO.	43	1	3	5	21
1.3.7.1. INCENTIVAR A TRAVÉS DEL MERCOSUR PROYECTOS QUE PERMITAN DIVERSIFICAR LA ECONOMÍA VENEZOLANA.	44	1	3	5	25
1.3.8.1. FORTALECER EL FONDO DE AHORRO NACIONAL DE LA CLASE OBRERA, PARA GENERAR Y MANEJAR INSTRUMENTOS FINANCIEROS QUE PERMITAN OBTENER LOS RECURSOS NECESARIOS PARA CUBRIR LA DEUDA ACTUAL QUE MANTIENE EL ESTADO POR CONCEPTO DE PRESTACIONES SOCIALES DE EMPLEADOS DEL SECTOR PÚBLICO.	45	1	3	5	26
1.3.8.2. IMPULSAR EL FONDO DE AHORRO POPULAR, COMO MECANISMO DE AHORRO Y PARTICIPACIÓN EN LA INDUSTRIA PETROLERA.	46	1	3	5	26
1.2.12.2. DESARROLLAR LA PROSPECTIVA, INVENTARIO INTEGRAL SOBRE UNA PLATAFORMA TECNOLÓGICA NACIONAL, ASÍ COMO LA APROPIACIÓN DE TÉCNICAS PARA EL APROVECHAMIENTO EFICIENTE Y SUSTENTABLE DE LOS RECURSOS NATURALES, EN FUNCIÓN DE LOS INTERESES SOBERANOS DE LA NACIÓN.	47	1	3	4	18
1.3.9.1. ADECUAR Y FORTALECER LOS MECANISMOS DE CONTROL IMPOSITIVO PARA MEJORAR LA EFICIENCIA EN LA RECAUDACIÓN DE LOS TRIBUTOS NACIONALES Y VIABILIZAR FUTUROS ACUERDOS COMERCIALES.	48	1	3	5	27
1.3.10.1. DESARROLLAR UN NUEVO SISTEMA CAMBIARIO Y DE ASIGNACIÓN DE DIVISAS QUE NOS PERMITAN ALCANZAR MÁXIMA TRANSPARENCIA, CONTROL, EFICIENCIA Y EFICACIA EN LA ASIGNACIÓN DE DIVISAS.	49	1	3	5	28
1.3.10.3. IMPLEMENTAR EL PLAN GENERAL DE DIVISAS DE LA NACIÓN QUE PERMITA OPTIMIZAR, JERARQUIZAR Y CONTROLAR LA ASIGNACIÓN DE DIVISAS A LOS DISTINTOS SECTORES DE LA ECONOMÍA NACIONAL.	50	1	3	5	28
1.3.10.4. CREAR LA CORPORACIÓN NACIONAL DE COMERCIO EXTERIOR A FIN DE CONCENTRAR ESFUERZOS EN POTENCIAR NUESTRA CAPACIDAD PARA LA OBTENCIÓN Y PROCURA NACIONAL E INTERNACIONAL DE BIENES E INSUMOS BÁSICOS, REQUERIDOS PARA LA SATISFACCIÓN DE LAS NECESIDADES DE NUESTRA POBLACIÓN.	51	1	3	5	28
1.3.10.6. INCREMENTAR LOS NIVELES DE INVERSIÓN PÚBLICA EN SECTORES ESTRATÉGICOS COMO APALANCAMIENTO PARA EL DESARROLLO SOCIO PRODUCTIVO.	52	1	3	5	28
1.4.1.1. INCREMENTAR LA SUPERFICIE CULTIVADA PARA VEGETALES DE CICLO CORTO EN AL MENOS UN 43%, PASANDO DE 2,88 MM DE HECTÁREAS A 4,12 MM DE HECTÁREAS ANUALES AL FINAL DE PERÍODO, CONSIDERANDO EL USO RACIONAL DEL RECURSO SUELO Y LAS TECNOLOGÍAS DE CASA DE CULTIVO.	53	1	3	3	4
1.4.1.2. AMPLIAR LA SUPERFICIE AGRÍCOLA BAJO RIEGO.\n	54	1	3	6	29
1.4.1.3. FORTALECER EL USO OPORTUNO DE LAS HERRAMIENTAS GEOGRÁFICAS COMO INSTRUMENTO DE SISTEMATIZACIÓN Y DIFUSIÓN DE LA GESTIÓN Y ANÁLISIS DEL DESARROLLO RURAL INTEGRAL DEL PAÍS.\n	55	1	3	6	29
1.4.1.4. ESTABLECER UN SISTEMA INTEGRADO DE OPERACIONES INSTITUCIONALES EN LA CREACIÓN DEL CATASTRO RURAL.\n	56	1	3	6	29
1.4.1.5. MEJORAR PROCESO DE REGULACIÓN Y ACCESO A LA TIERRA.\n	57	1	3	3	4
1.4.1.6. ORDENAR Y REGLAMENTAR LA ACTIVIDAD PESQUERA Y ACUÍCOLA.\n	58	1	3	6	29
1.4.1.7. CONTRIBUIR CON LA SOBERANÍA ALIMENTARIA EN EL PAÍS MEDIANTE EL FORTALECIMIENTO EL SISTEMA DE TRANSPORTE Y LA CONECTIVIDAD ACUÁTICA Y AÉREA.	59	1	3	6	29
1.4.1.7. CONTRIBUIR CON LA SOBERANÍA ALIMENTARIA EN EL PAÍS MEDIANTE EL FORTALECIMIENTO EL SISTEMA DE TRANSPORTE Y LA CONECTIVIDAD ACUÁTICA Y AÉREA.	60	1	3	6	29
1.4.2.1. INCORPORAR AL PARQUE DE MAQUINARIAS AGRÍCOLAS, PRIVILEGIANDO LA ORGANIZACIÓN COLECTIVA PARA SU USO, EN BASE AL DESARROLLO DE LA INDUSTRIA NACIONAL DE ENSAMBLAJE Y FABRICACIÓN: TRACTORES AGRÍCOLAS, COSECHADORAS E IMPLEMENTOS PARA LA SIEMBRA.\n	61	1	3	6	30
1.4.2.2. FORTALECER LOS PROGRAMAS DE MANTENIMIENTO Y CONSTRUCCIÓN DE VIALIDAD Y ELECTRIFICACIÓN RURAL, CON LA CREACIÓN DE BRIGADAS Y UNIDADES DE MECANIZACIÓN VIAL POR PARTE DE LA MILICIA NACIONAL BOLIVARIANA, LOS CONSEJOS COMUNALES Y CAMPESINOS, LAS REDES DE PRODUCTORES LIBRES Y ASOCIADOS, LAS ALCALDÍAS, LAS GOBERNACIONES Y EL INSTITUTO NACIONAL DE DESARROLLO RURAL.\n	62	1	3	6	30
1.4.2.3. ESTABLECER REDES DE TRANSPORTE COMUNAL, FINANCIADAS Y ADMINISTRADAS POR EL ESTADO, CON EL FIN DE MINIMIZAR COSTOS AL PRODUCTOR EN EL TRASLADO DE INSUMOS Y COSECHA.\n	63	1	3	6	30
1.4.2.5. DISEÑAR Y EJECUTAR UN PLAN PARA LA REACTIVACIÓN DE MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS.\n	64	1	3	6	30
1.3.10.2. CREAR EL CENTRO NACIONAL DE COMERCIO EXTERIOR CON EL FIN DE DESARROLLAR E INSTRUMENTAR LA POLÍTICA NACIONAL EN MATERIA DE DIVISAS, EXPORTACIONES E IMPORTACIONES, ARTICULANDO DICHAS POLÍTICAS EN FUNCIÓN DEL DESARROLLO NACIONAL.	65	1	3	5	28
1.3.10.5. DISEÑAR LA PLANIFICACIÓN DE LA INVERSIÓN PÚBLICA PARA EL EJERCICIO DEL PRESUPUESTO ANUAL, CON EL FIN DE DAR CONSISTENCIA A LA POLÍTICA FISCAL CON LOS OBJETIVOS ECONÓMICOS Y SOCIALES DE LA NACIÓN.	66	1	3	5	28
1.3.6.2. FORTALECER LOS ACUERDOS EN EL MARCO DE PETROCARIBE, CON LA FINALIDAD DE ELIMINAR LAS BARRERAS DEL ACCESO A LOS RECURSOS ENERGÉTICOS, POR LA VÍA DE UN NUEVO ESQUEMA DE INTERCAMBIO COMERCIAL FAVORABLE, EQUITATIVO Y JUSTO.	67	1	3	5	24
2.2.1.1. UNIVERSALIZAR LA SEGURIDAD SOCIAL PARA TODOS Y TODAS.\n	68	1	4	11	134
4.1.7.1. FORTALECER EL BANCO DEL SUR COMO UNA INSTITUCIÓN PARA LA INTEGRACIÓN FINANCIERA REGIONAL.\n	975	1	6	19	102
1.4.2.4. APOYAR Y PROMOVER LA CREACIÓN Y FORTALECIMIENTO DE LAS REDES DE CAMPESINOS, ENTRE OTRAS FORMAS DE ORGANIZACIÓN PARA LA PRODUCCIÓN AGRÍCOLA, ASÍ COMO SU FORMACIÓN INTEGRAL PERMANENTE EN LOS SECTORES PRODUCTORES DEL PAÍS.\n	69	1	3	6	30
1.4.2.6. INCREMENTAR LA PRODUCCIÓN Y PROTECCIÓN NACIONAL DE LAS SEMILLAS DE RUBROS ESTRATÉGICOS, A FIN DE SATISFACER LOS REQUERIMIENTOS DE LOS PLANES NACIONALES DE SIEMBRA PARA CONSUMO, PROTEGIENDO A LA POBLACIÓN DEL CULTIVO Y CONSUMO DE PRODUCTOS TRANSGÉNICOS Y OTROS PERJUDICIALES A LA SALUD.\n	70	1	3	6	30
1.4.2.7. INCREMENTAR LA PRODUCCIÓN NACIONAL DE BIOINSUMOS PARA IMPULSAR MODELOS DE PRODUCCIÓN SUSTENTABLES.	71	1	3	6	30
1.4.3.1. AUMENTO DE LA PRODUCCIÓN NACIONAL AGROPECUARIA (VEGETAL, PECUARIA Y ACUÍCOLA-PESQUERA) EN UN 80%, PARA ALCANZAR 42 MM DE TN/AÑO.\n	72	1	3	6	32
1.4.3.2. DESARROLLAR UN DIAGNÓSTICO DE LOS REQUERIMIENTOS DE ALIMENTO, DE LAS CAPACIDADES DE PRODUCCIÓN QUE PERMITAN GARANTIZAR EL ACCESO A LA TIERRA, LA TECNOLOGÍA SOBERANA Y LOS INSUMOS ADECUADOS.\n	73	1	3	6	32
1.4.3.3. IMPULSAR UNA PRODUCCIÓN AGRÍCOLA SIN AGROTÓXICOS, BASADA EN LA DIVERSIDAD AUTÓCTONA Y EN UNA RELACIÓN ARMÓNICA CON LA NATURALEZA.\n	74	1	3	6	32
1.4.3.4. INCREMENTAR LA PRODUCCIÓN DE CEREALES, EN AL MENOS UN 100%, PARA LLEGAR A 7 MM DE TN/AÑO; A TRAVÉS DEL PLAN CEREALERO NACIONAL.\n	75	1	3	6	32
1.4.3.5. INCREMENTAR LA PRODUCCIÓN DE LEGUMINOSAS EN 95%, PARA ALCANZAR 200 MIL TN/AÑO; DE OLEAGINOSAS EN 30% PARA ALCANZAR 1,5 MM TN/AÑO; DE CULTIVOS TROPICALES EN 165%, PARA ALCANZAR 17 MM TN/AÑO; DE HORTALIZAS EN 40%, PARA ALCANZAR 2,5 MM TN/AÑO; DE FRUTALES EN 20%, PARA ALCANZAR 4 MM TN/AÑO; DE RAÍCES Y TUBÉRCULOS EN 25%, PARA ALCANZAR 2,5 MM TN/AÑO; A TRAVÉS DEL PLANES ESPECIALES DE PRODUCCIÓN.\n	76	1	3	6	32
1.4.3.6. INCREMENTAR LA PRODUCCIÓN PECUARIA EN AL MENOS 40%, PARA ALCANZAR 7 MM DE TN/AÑO; A TRAVÉS DEL PLAN PECUARIO NACIONAL.\n	77	1	3	6	32
1.4.3.7. ELEVAR LA PRODUCCIÓN DE CARNE DE BOVINO EN AL MENOS 45%, PARA ALCANZAR 740 MIL TN/AÑO; DE LECHE EN 50%, PARA ALCANZAR 4 MM DE TN/AÑO; DE HUEVOS DE CONSUMO EN 40%, PARA LLEGAR A 370 MIL TN/AÑO; DE POLLO EN 43%, PARA ALCANZAR 1,7 MM DE TN/AÑO; DE PORCINOS EN 75%, PARA ALCANZAR LAS 400 MIL TN/AÑO; DE OVINOS Y CAPRINOS EN 450%, PARA ALCANZAR 66 MIL TN/AÑO; OTRAS ESPECIES EN 35%, PARA ALCANZAR 370 MIL TN/AÑO.\n	78	1	3	6	32
1.4.3.8. INCREMENTAR LA PRODUCCIÓN DE PESCA Y ACUICULTURA EN UN 20%, PARA ALCANZAR 300 MIL TN/AÑO.\n	79	1	3	6	32
1.4.3.9. AMPLIAR LA FRONTERA AGRÍCOLA Y CONSOLIDAR EL DESARROLLO RURAL EN ÁREAS CON GRAN POTENCIAL AGRÍCOLA E HÍDRICO, MEDIANTE LA TRANSFERENCIA TECNOLÓGICA E INVERSIÓN PARA EL SANEAMIENTO DE SUELOS CON ESTRUCTURA DE DRENAJE, RIEGO, PLANTAS DE PROCESAMIENTO Y ALMACENAMIENTO DE ALIMENTOS, REHABILITACIÓN DE INFRAESTRUCTURA AGRÍCOLA Y SOCIAL.\n	80	1	3	6	32
1.4.3.10. FORTALECER LA PRODUCCIÓN NACIONAL EN NUEVOS RUBROS, O RUBROS EN LOS CUALES LA PRODUCCIÓN NACIONAL ES RELATIVAMENTE DÉBIL, PARA CUBRIR 30% DE LA DEMANDA NACIONAL EN ACEITES Y GRASAS, Y 50% DE DERIVADOS LÁCTEOS.	81	1	3	6	32
1.4.4.1. INICIAR, CONTINUAR Y CONSOLIDAR PROYECTOS DE DESARROLLO RURAL INTEGRAL, TALES COMO: DELTA DEL ORINOCO EN ISLAS COCUINAS, MANAMITO Y GUARA; PÍRITU-BECERRA; EJE ELORZA-MANTECAL, ENTRE OTROS.\n	82	1	3	6	33
1.4.4.2. CONSOLIDAR EL MODELO PRODUCTIVO SOCIALISTA EN PROYECTOS, UNIDADES DE PROPIEDAD SOCIAL AGRÍCOLAS (UPSA), GRANDES Y MEDIANOS SISTEMAS DE RIEGO, EMPRESAS SOCIALISTAS GANADERAS Y FUNDOS ZAMORANOS ADSCRITOS AL MINISTERIO DEL PODER POPULAR CON COMPETENCIA EN MATERIA DE AGRICULTURA Y TIERRAS. 	83	1	3	6	33
1.4.5.1. IMPULSAR LA CONFORMACIÓN, ORGANIZACIÓN, PLANIFICACIÓN, FINANCIAMIENTO Y COMPRAS A REDES DE PRODUCTORES LIBRES Y ASOCIADOS (REPLA’S) EN EL ENTORNO DE LAS PLANTAS AGROINDUSTRIALES, PARA GARANTIZAR LA TRANSFORMACIÓN DEL MODELO AGRÍCOLA ACTUAL HACIA LA AGRICULTURA PLANIFICADA BAJO LOS PRINCIPIOS SOCIALISTAS.\n	84	1	3	6	34
1.4.5.2. CONSOLIDAR EL SISTEMA AGROINDUSTRIAL VENEZOLANO BASADO EN LA CONSTRUCCIÓN PLANIFICADA DE PLANTAS AGROINDUSTRIALES, Y CREACIÓN EN SU ENTORNO DE REDES DE PRODUCCIÓN DE LAS MATERIAS PRIMAS REQUERIDAS Y REDES DE DISTRIBUCIÓN DE LOS PRODUCTOS TERMINADOS, COMO ESTRATEGIA PRINCIPAL DEL INJERTO SOCIALISTA. INCLUYENDO ENTRE OTROS: PLANTAS PROCESADORAS DE LECHE, MATADEROS FRIGORÍFICOS, ALMACENAMIENTO DE CEREALES, OLEAGINOSAS Y SEMILLAS, CASAS DE LABORES PESQUERAS.	85	1	3	6	34
1.4.6.1. EXPANDIR LAS REDES DE DISTRIBUCIÓN SOCIALISTA DE ALIMENTOS, TALES COMO MERCAL, CVAL, PDVAL, BICENTENARIO Y PROGRAMAS DE DISTRIBUCIÓN GRATUITA Y RED DE DISTRIBUCIÓN DE ALIMENTOS PREPARADOS, TALES COMO LAS AREPERAS Y RESTAURANTES VENEZUELA.\n	86	1	3	6	36
1.4.6.2. CREAR CENTROS DE ACOPIO Y REDES DE DISTRIBUCIÓN COMUNAL, Y FORTALECER LOS MERCADOS COMUNALES PARA GARANTIZAR LA VENTA A PRECIO JUSTO DE ALIMENTOS SIN INTERMEDIARIOS.\n	87	1	3	6	36
1.4.6.3. FORTALECER Y MODERNIZAR EL SISTEMA DE REGULACIÓN SOCIAL Y ESTATAL PARA COMBATIR LA USURA Y LA ESPECULACIÓN EN LA COMPRA Y DISTRIBUCIÓN DE LOS ALIMENTOS, DADO SU CARÁCTER DE BIENES ESENCIALES PARA LA VIDA HUMANA.\n	88	1	3	6	36
1.4.6.4. ESTABLECER UNA RED NACIONAL DE CENTROS DE DISTRIBUCIÓN DE HORTALIZAS Y FRUTALES CON SUS RESPECTIVAS REDES DE TRANSPORTE.\n	89	1	3	6	36
1.4.6.5. FORTALECER LOS SISTEMAS DE CONTROL DE CALIDAD ASOCIADOS A LOS SERVICIOS DE ALMACENAJE, EMPAQUE, DISTRIBUCIÓN, Y EXPENDIO AL MAYOR Y DETAL DE ALIMENTOS, QUE GARANTICE LAS CONDICIONES ÓPTIMAS DEL PRODUCTO.\n	90	1	3	6	36
1.4.6.6. FORTALECER EL ACCESO A LOS PROGRAMAS Y PROYECTOS DE EDUCACIÓN AL PRODUCTOR Y AL CONSUMIDOR DE ARTÍCULOS ALIMENTICIOS DECLARADOS DE PRIMERA NECESIDAD, A TRAVÉS DE LA AMPLIACIÓN Y MEJORA DE LOS MECANISMOS DE DIFUSIÓN.\n	91	1	3	6	36
1.4.6.7. FORTALECER EL SISTEMA DE TRANSPORTE DE CARGA QUE FACILITE EL FLUJO DESDE LOS CENTROS DE PRODUCCIÓN A LOS CENTROS DE ACOPIO Y DISTRIBUCIÓN.	92	1	3	6	36
1.4.7.1. FORTALECER EL COMPONENTE TECNOLÓGICO DE LAS EMPRESAS AGROINDUSTRIALES QUE CONFORMAN LA CORPORACIÓN VENEZOLANA DE ALIMENTOS, PARA OPTIMIZAR LA PRODUCTIVIDAD EN FUNCIÓN DE LAS CAPACIDADES ACTUALES Y LAS POTENCIALIDADES DE CADA UNO DE SUS COMPONENTES.\n	93	1	3	6	37
1.7.2.2. CREAR LA ESCUELA POPULAR ITINERANTE PARA LA EDUCACIÓN DEL PUEBLO EN MATERIA DE DEFENSA INTEGRAL.	94	1	3	9	53
3.1.1.1. ALCANZAR LA CAPACIDAD DE PRODUCCIÓN DE CRUDO HASTA 3,3 MMBD PARA EL AÑO 2014 Y 6 MMBD PARA EL AÑO 2019.	95	1	5	15	65
1.4.7.2 ACTIVAR FORMAS DE ORGANIZACIÓN POPULAR, PARTIENDO DE LAS BASES CAMPESINAS E INCLUYENDO LAS MILICIAS BOLIVARIANAS, CON EL FIN DE SER INCORPORADAS A LOS PROCESOS DE DISEÑO, EJECUCIÓN Y SEGUIMIENTO DE POLÍTICAS AGRÍCOLAS DEL GOBIERNO BOLIVARIANO.\n	96	1	3	6	37
1.4.7.3. DESTINAR LAS TIERRAS RESCATADAS PRIORITARIAMENTE A LA PRODUCCIÓN DE SEMILLAS DE ACUERDO CON SUS RESPECTIVAS CARACTERÍSTICAS CLIMÁTICAS, CONSIDERANDO LAS TÉCNICAS TRADICIONALES Y COSTUMBRES DE CULTIVO DE LA REGIÓN.\n	97	1	3	6	37
1.4.8.3. DEFINIR, EN EL MARCO DE LOS ACUERDOS INTERNACIONALES Y DE INTEGRACIÓN, POLÍTICAS DE PROTECCIÓN COMERCIAL DE LA AGRICULTURA NACIONAL.\n	101	1	3	6	38
1.4.8.4. DISEÑAR MEDIDAS DE FOMENTO PARA LA CREACIÓN O REACTIVACIÓN DEL SECTOR PRODUCTIVO NACIONAL CON MIRAS A LA EXPORTACIÓN, CON ESPECIAL ATENCIÓN A LAS PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, COOPERATIVAS Y OTRAS FORMAS SOCIATIVAS.	102	1	3	6	38
1.4.9.1. PROMOVER A TRAVÉS DE LAS ASAMBLEAS AGRARIAS A NIVEL REGIONAL, CONJUNTAMENTE CON PEQUEÑAS ORGANIZACIONES AGROPRODUCTIVAS, CONSEJOS CAMPESINOS Y LAS REDES DE PRODUCTORES Y PRODUCTORAS LIBRES Y ASOCIADOS, EL DESARROLLO PARTICIPATIVO EN LOS PLANES PRODUCCIÓN, APROVECHANDO ASÍ LAS CAPACIDADES TÉCNICAS Y CULTURALES DE CADA REGIÓN.	103	1	3	6	39
2.2.4.1. PROFUNDIZAR LA PARTICIPACIÓN POLÍTICA Y PROTAGÓNICA DE LAS MUJERES.\n	198	1	4	11	136
1.4.10.1. PROMOVER LA INNOVACIÓN Y PRODUCCIÓN DE INSUMOS TECNOLÓGICOS PARA LA PEQUEÑA AGRICULTURA, AUMENTANDO LOS ÍNDICES DE EFICACIA Y PRODUCTIVIDAD.\n	104	1	3	6	40
1.4.10.2. FOMENTAR LA ORGANIZACIÓN Y FORMACIÓN DEL PODER POPULAR Y LAS FORMAS COLECTIVAS PARA EL DESARROLLO DE LOS PROCESOS PRODUCTIVOS A NIVEL LOCAL, A TRAVÉS DE LA EXPANSIÓN DE LAS ESCUELAS Y CURSOS DE FORMACIÓN DE CUADROS.\n	105	1	3	6	40
1.4.10.3. IMPULSAR EL DESARROLLO Y UTILIZACIÓN DE TECNOLOGÍAS DE BAJOS INSUMOS, REDUCIENDO LAS EMISIONES NOCIVAS AL AMBIENTE Y PROMOVIENDO LA AGRICULTURA A PEQUEÑA ESCALA Y SIN AGROTÓXICOS.\n	106	1	3	6	40
1.4.10.4. OTORGAR EL RECONOCIMIENTO AL CONUCO COMO FUENTE HISTÓRICA, PATRIMONIO DE NUESTRA AGROBIODIVERSIDAD Y PRINCIPAL RESERVA DE GERMOPLASMAS AUTÓCTONOS VIVOS.	107	1	3	6	40
1.5.1.1. DESARROLLAR UNA ACTIVIDAD CIENTÍFICA, TECNOLÓGICA Y DE INNOVACIÓN, TRANSDISCIPLINARIA ASOCIADA DIRECTAMENTE A LA ESTRUCTURA PRODUCTIVA NACIONAL, QUE PERMITA DAR RESPUESTA A PROBLEMAS CONCRETOS DEL SECTOR, FOMENTANDO EL DESARROLLO DE PROCESOS DE ESCALAMIENTO INDUSTRIAL ORIENTADOS AL APROVECHAMIENTO DE LAS POTENCIALIDADES, CON EFECTIVA TRANSFERENCIA DE CONOCIMIENTOS PARA LA SOBERANÍA TECNOLÓGICA.\n	108	1	3	7	41
1.5.1.2. CREAR UNA RED NACIONAL DE PARQUES TECNOLÓGICOS PARA EL DESARROLLO Y APLICACIÓN DE LA CIENCIA, LA TECNOLOGÍA Y LA INNOVACIÓN EN ESOS ESPACIOS TEMÁTICOS Y EN LOS PARQUES INDUSTRIALES EN GENERAL.\n	109	1	3	7	41
1.5.1.3. FORTALECER Y ORIENTAR LA ACTIVIDAD CIENTÍFICA, TECNOLÓGICA Y DE INNOVACIÓN HACIA EL APROVECHAMIENTO EFECTIVO DE LAS POTENCIALIDADES Y CAPACIDADES NACIONALES PARA EL DESARROLLO SUSTENTABLE Y LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES, ORIENTANDO LA INVESTIGACIÓN HACIA ÁREAS ESTRATÉGICAS DEFINIDAS COMO PRIORITARIAS PARA LA SOLUCIÓN DE LOS PROBLEMAS SOCIALES.\n	110	1	3	7	41
1.5.1.4. CREAR ESPACIOS DE INNOVACIÓN ASOCIADAS A UNIDADES SOCIOPRODUCTIVAS EN COMUNIDADES ORGANIZADAS, APROVECHANDO PARA ELLO EL ESTABLECIMIENTO DE REDES NACIONALES Y REGIONALES DE COOPERACIÓN CIENTÍFICOTECNOLÓGICA, A FIN DE FORTALECER LAS CAPACIDADES DEL SISTEMA NACIONAL DE CIENCIA, TECNOLOGÍA E INNOVACIÓN.\n	111	1	3	7	41
1.5.1.5. GARANTIZAR EL ACCESO OPORTUNO Y USO ADECUADO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE INFORMACIÓN, MEDIANTE EL DESARROLLO DE LA INFRAESTRUCTURA NECESARIA, ASÍ COMO DE LAS APLICACIONES INFORMÁTICAS QUE ATIENDAN NECESIDADES SOCIALES.\n	112	1	3	7	41
1.5.1.6. FOMENTAR LA CONSOLIDACIÓN DE LOS ESPACIOS DE PARTICIPACIÓN POPULAR EN LA GESTIÓN PÚBLICA DE LAS ÁREAS TEMÁTICAS Y TERRITORIALES RELACIONADAS CON LA CIENCIA, LA TECNOLOGÍA Y LA INNOVACIÓN.\n	113	1	3	7	41
1.5.1.7. TRANSFORMAR LA PRAXIS CIENTÍFICA A TRAVÉS DE LA INTERACCIÓN ENTRE LAS DIVERSAS FORMAS DE CONOCIMIENTO, ABRIENDO LOS ESPACIOS TRADICIONALES DE PRODUCCIÓN DEL MISMO PARA LA GENERACIÓN DE SABERES COLECTIVIZADOS Y NUEVOS CUADROS CIENTÍFICOS INTEGRALES.\n	114	1	3	7	41
1.5.1.8. IMPULSAR LA FORMACIÓN PARA LA CIENCIA, TECNOLOGÍA E INNOVACIÓN, A TRAVÉS DE FORMAS DE ORGANIZACIÓN Y SOCIALIZACIÓN DEL CONOCIMIENTO CIENTÍFICO PARA LA CONSOLIDACIÓN DE ESPACIOS DE PARTICIPACIÓN COLECTIVA.	115	1	3	7	41
1.5.1.8. IMPULSAR LA FORMACIÓN PARA LA CIENCIA, TECNOLOGÍA E INNOVACIÓN, A TRAVÉS DE FORMAS DE ORGANIZACIÓN Y SOCIALIZACIÓN DEL CONOCIMIENTO CIENTÍFICO PARA LA CONSOLIDACIÓN DE ESPACIOS DE PARTICIPACIÓN COLECTIVA.	116	1	3	7	41
1.5.2.1. ACTUALIZAR Y ORIENTAR LOS PROGRAMAS FORMATIVOS INTEGRALES Y PERMANENTES HACIA LAS NECESIDADES Y DEMANDAS DEL SISTEMA PRODUCTIVO NACIONAL, CON EL FIN DE GARANTIZAR LA FORMACIÓN TÉCNICA, PROFESIONAL Y OCUPACIONAL DEL TRABAJO.\n	117	1	3	7	42
1.5.2.2. PROPICIAR EL PROGRAMA LA ESCUELA EN LA FÁBRICA, O UNIDAD PRODUCTIVA A EFECTOS NO SÓLO DE MEJORAR LOS NIVELES DE PREPARACIÓN PARA EL TRABAJO, SINO MÁS AÚN LA CULTURA DEL MISMO, LA ORGANIZACIÓN EN CONSEJOS DE OBREROS Y EL PUNTO Y CÍRCULO COMO ELEMENTOS SUSTANCIALES DEL CAMBIO DEL MODELO PRODUCTIVO.\n	118	1	3	7	42
1.5.2.3. CONSOLIDAR EL DESPLIEGUE DE LA INFRAESTRUCTURA EDUCATIVA DEL PAÍS, EN LOS CENTROS UNIVERSITARIOS, TÉCNICOS, MEDIOS Y OCUPACIONALES, TANTO EN LAS UNIDADES DE PRODUCCIÓN COMO EN LOS PARQUES INDUSTRIALES.\n	119	1	3	7	42
1.5.2.4. DESARROLLAR APLICACIONES INFORMÁTICAS QUE ATIENDAN NECESIDADES SOCIALES.\n	120	1	3	7	42
1.5.2.5. GENERAR Y DIFUNDIR A TRAVÉS DE LAS TIC CONTENIDOS BASADOS EN VALORES NACIONALES, MULTIÉTNICOS Y PLURICULTURALES DE NUESTROS PUEBLOS Y, CON ELLOS, LOS PRINCIPIOS INHERENTES AL SOCIALISMO BOLIVARIANO.\n	121	1	3	7	42
1.5.2.7. AMPLIAR LA CAPACIDAD CIENTÍFICO-TÉCNICA Y HUMANÍSTICA PARA GARANTIZAR LA SEGURIDAD Y SOBERANÍA EN LA PRODUCCIÓN DE LOS INSUMOS MATERIALES, ASÍ COMO LA PRODUCCIÓN TEÓRICO-METODOLÓGICA Y ARTÍSTICA, NECESARIAS PARA EL BUEN VIVIR, MEDIANTE EL INCREMENTO EN UN 70% EL FINANCIAMIENTO A LA INVESTIGACIÓN E INNOVACIÓN ORIENTADAS A PROYECTOS QUE APUNTALEN LA FELICIDAD DEL PUEBLO.	122	1	3	7	42
1.5.3.1. GARANTIZAR EL IMPULSO DE LA FORMACIÓN Y TRANSFERENCIA DE CONOCIMIENTO QUE PERMITA EL DESARROLLO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.\n	123	1	3	7	43
2.2.13.4. GARANTIZAR SISTEMAS DE FINANCIAMIENTO ESPECIAL PARA LA SOSTENIBILIDAD DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS.	256	1	4	11	145
1.5.3.2. GARANTIZAR LA DEMOCRATIZACIÓN Y APROPIACIÓN DEL CONOCIMIENTO DEL PUEBLO EN MATERIA DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES A TRAVÉS DE PROGRAMAS EDUCATIVOS EN LOS CENTROS UNIVERSITARIOS, TÉCNICOS, MEDIOS Y OCUPACIONALES.\n	124	1	3	7	43
1.5.3.3. GARANTIZAR, EN LAS INSTITUCIONES DEL ESTADO, EL USO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.\n	125	1	3	7	43
1.5.3.4. DESARROLLAR UNA POLÍTICA INTEGRAL QUE IMPULSE LA CREACIÓN DE CENTROS TECNOLÓGICOS EN CENTROS EDUCATIVOS, UNIVERSITARIOS, TÉCNICOS, MEDIOS QUE GARANTICEN PROCESOS FORMATIVOS INTEGRALES Y CONTINUOS EN MATERIA DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.	126	1	3	7	43
2.1.3.2. POTENCIAR EL APARATO PRODUCTIVO NACIONAL, ACTUALIZÁNDOLO TECNOLÓGICAMENTE Y ARTICULÁNDOLO AL NUEVO MODELO, PARA PROVEER LA BASE MATERIAL DE LA CONSTRUCCIÓN DEL SOCIALISMO.\n	162	1	4	10	57
1.5.4.1. FORTALECER EL USO PACÍFICO DE LA TECNOLOGÍA ESPACIAL PARA GARANTIZAR AL PAÍS EL MANEJO SOBERANO DE SUS TELECOMUNICACIONES Y DE HERRAMIENTAS ASOCIADAS QUE PERMITAN CONSOLIDAR EL DESARROLLO NACIONAL EN ÁREAS ESTRATÉGICAS COMO EDUCACIÓN, SALUD, SEGURIDAD Y ALIMENTACIÓN.\n	127	1	3	7	44
1.5.4.2. IMPULSAR LA MASIFICACIÓN DE LA TECNOLOGÍA ESPACIAL A TRAVÉS DE PROCESOS DE FORMACIÓN E INFRAESTRUCTURA NECESARIA QUE PERMITAN COLOCARLA AL SERVICIO DE LAS NECESIDADES DEL PUEBLO.	128	1	3	7	44
1.6.1.1. MANTENER ACTUALIZADOS LOS PLANES PARA LA DEFENSA TERRITORIAL Y DEFENSA INTEGRAL ADAPTADOS A LAS CARACTERÍSTICAS GEOESTRATÉGICAS Y SOCIOPOLÍTICAS DE NUESTRA PATRIA.\n	129	1	3	8	45
1.6.1.2. INCREMENTAR LA ACTIVIDAD OPERATIVA CÍVICOMILITAR EN LAS FRONTERAS PARA LA DEFENSA DE NUESTRO TERRITORIO, A FIN DE CONTROLAR Y NEUTRALIZAR EL CRIMEN TRASNACIONAL, ASÍ COMO LA ACCIÓN DE GRUPOS GENERADORES DE VIOLENCIA.\n	130	1	3	8	45
2.1.3.7. GENERAR ESPACIOS DE COMPLEMENTACIÓN PRODUCTIVA Y COMERCIAL CON PAÍSES ALIADOS Y ESTRATÉGICOS.	166	1	4	10	57
1.6.1.3. EFECTUAR LOS PROCESOS DE CREACIÓN, REESTRUCTURACIÓN, REEQUIPAMIENTO Y REUBICACIÓN DE LAS UNIDADES MILITARES, ATENDIENDO A LAS NECESIDADES DE LA DEFENSA INTEGRAL DE LA PATRIA Y SU SOBERANÍA.\n	131	1	3	8	45
1.6.1.4. PREPARAR AL PAÍS PARA LA DEFENSA INTEGRAL DE LA NACIÓN, INTEGRANDO LOS ESFUERZOS DEL PODER PÚBLICO, EL PUEBLO Y LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	132	1	3	8	45
1.6.1.5. INCREMENTAR LA PARTICIPACIÓN ACTIVA DEL PUEBLO PARA CONSOLIDAR LA UNIÓN CÍVICO-MILITAR.\n	133	1	3	8	45
1.6.1.6. FORTALECER LA FORMACIÓN DEL PUEBLO EN PRINCIPIOS Y VALORES DE INDEPENDENCIA, SOBERANÍA Y PATRIA, PARA SU PARTICIPACIÓN EN LA DEFENSA INTEGRAL DE LA NACIÓN.\n	134	1	3	8	45
1.6.3.1. CONSOLIDAR EL SISTEMA TERRITORIAL DE INTELIGENCIA Y CONTRAINTELIGENCIA MILITAR.\n	135	1	3	8	49
1.6.3.2. MASIFICAR DE MANERA ORDENADA LA BÚSQUEDA DE INFORMACIÓN ÚTIL PARA LA SEGURIDAD CIUDADANA Y DEFENSA DE LA PATRIA.\n	136	1	3	8	49
1.6.3.3. ACTUALIZAR Y ADAPTAR LOS PLANES DE ESTUDIO EN EL ÁREA DE INTELIGENCIA Y CONTRAINTELIGENCIA DE ACUERDO AL PENSAMIENTO MILITAR BOLIVARIANO.\n	137	1	3	8	49
1.6.3.4. ADECUAR EL MARCO JURÍDICO NECESARIO PARA DESARROLLAR LAS ÁREAS DE INTELIGENCIA Y CONTRAINTELIGENCIA DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA BAJO LOS PRINCIPIOS DE LA DEFENSA INTEGRAL DE LA NACIÓN.	138	1	3	8	49
1.6.4.1. INCREMENTAR EL DESARROLLO DE LA MILICIA TERRITORIAL CON LA FINALIDAD DE ASEGURAR LAS FUERZAS NECESARIAS PARA LA DEFENSA INTEGRAL DE LA NACIÓN.\n	139	1	3	8	50
1.6.4.2. INCREMENTAR Y FORTALECER EL EMPLEO DE LA MILICIA EN LAS FUNCIONES DE APOYO AL DESARROLLO NACIONAL.\n	140	1	3	8	50
1.6.4.3. FOMENTAR E INCREMENTAR LA CREACIÓN DE LOS CUERPOS COMBATIENTES EN TODAS LAS ESTRUCTURAS DEL ESTADO.\n	141	1	3	8	50
1.6.4.4. DISEÑAR ESTRATEGIAS PARA GARANTIZAR LA PARTICIPACIÓN DEL PUEBLO EN LA DEFENSA INTEGRAL DE LA NACIÓN, TALES COMO PLANES DE ADIESTRAMIENTO A CIUDADANAS Y CIUDADANOS EN LA CORRESPONSABILIDAD DE DEFENSA INTEGRAL DE LA NACIÓN.	142	1	3	8	50
1.6.5.1. MODERNIZAR, CONSERVAR, ALMACENAR Y MANTENER EL EQUIPAMIENTO Y LOS SISTEMAS DE ARMAS DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	143	1	3	8	51
1.6.5.2. FORTALECER EL SISTEMA DE APOYO LOGÍSTICO Y DE SANIDAD MILITAR DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	144	1	3	8	51
1.6.5.3. INCREMENTAR LAS RESERVAS DE MATERIALES, SISTEMAS Y EQUIPOS PARA EL SOSTENIMIENTO DE LA DEFENSA INTEGRAL DE LA NACIÓN.\n	145	1	3	8	51
1.6.5.4. INCREMENTAR LA ADQUISICIÓN DE SISTEMAS DE ARMAS Y MATERIALES PARA LA DOTACIÓN DE UNIDADES MILITARES.	146	1	3	8	51
1.7.1.1. PROMOVER EN LOS PODERES PÚBLICOS DEL ESTADO LA CREACIÓN Y DESARROLLO DE SUS PROPIOS SISTEMAS DE CONTINGENCIA.\n	147	1	3	9	52
1.7.1.2. REALIZAR EL INVENTARIO DEL POTENCIAL NACIONAL DISPONIBLE PARA EL APOYO INTEGRAL EN SITUACIONES DE ESTADO DE EXCEPCIÓN.\n	148	1	3	9	52
1.7.1.3. REGLAMENTAR Y DIFUNDIR LOS PARÁMETROS QUE REGIRÁN LOS PROCESOS DE MOVILIZACIÓN Y REQUISICIÓN.\n	149	1	3	9	52
1.7.1.4. CREAR ESTRATEGIAS QUE GENEREN EL RECONOCIMIENTO POR PARTE DE LA POBLACIÓN SOBRE LOS CAMBIOS DE CONDICIONES ORDINARIAS A CONDICIONES EXTRAORDINARIAS, PARA LA ACTIVACIÓN Y MOVILIZACIÓN ORGANIZADA EN EL MARCO DE LA DEFENSA INTEGRAL DE LA PATRIA.\n	150	1	3	9	52
1.7.1.5. CREAR EL FONDO ESTRATÉGICO MILITAR, COMO ENTE FINANCIERO FORMALMENTE ESTRUCTURADO QUE SOLVENTE LAS CONTINGENCIAS PRESUPUESTARIAS.	151	1	3	9	52
2.2.11.2. DESARROLLAR PLANES DE APOYO, PROTECCIÓN Y PROMOCIÓN DE LA LACTANCIA MATERNA, ASÍ COMO LA CREACIÓN DE REDES DE LACTARIOS DE LECHE MATERNA.\n	152	1	4	11	143
1.7.2.1. INTEGRAR EL SISTEMA DE APOYO LOGÍSTICO TERRITORIAL (SALTE) AL PROCESO DE ARTICULACIÓN DE LA ESTRUCTURA DEL APARATO PRODUCTIVO E INFRAESTRUCTURA DE SERVICIOS DEL ESTADO, SEGÚN LA CONFORMACIÓN GEOGRÁFICA DE LAS REGIONES ESTRATÉGICAS DE DEFENSA INTEGRAL.\n	153	1	3	9	53
1.3.6.1. FORTALECER Y AMPLIAR LOS CONVENIOS DE COOPERACIÓN ENERGÉTICA (CCE) PARA MOTORIZAR EL ESTABLECIMIENTO DE RELACIONES DE INTERCAMBIO JUSTAS, SOLIDARIAS, EFICIENTES Y SIN INTERMEDIACIÓN EN LA LUCHA CONTRA LA POBREZA, REDUCIENDO LAS ASIMETRÍAS ECONÓMICAS Y SOCIALES.	154	1	3	5	24
1.3.6.4. FORTALECER EL ALBA COMO INSTRUMENTO PARA ALCANZAR UN DESARROLLO JUSTO, SOLIDARIO Y SUSTENTABLE; EL TRATO ESPECIAL Y DIFERENCIADO QUE TENGA EN CUENTA EL NIVEL DE DESARROLLO DE LOS DIVERSOS PAÍSES Y LA DIMENSIÓN DE SUS ECONOMÍAS; LA  COMPLEMENTARIEDAD ECONÓMICA Y LA COOPERACIÓN ENTRE LOS PAÍSES PARTICIPANTES, Y EL FOMENTO DE LAS INVERSIONES DE CAPITALES LATINOAMERICANOS EN LA PROPIA AMÉRICA LATINA Y EL CARIBE.	155	1	3	5	24
3.3.1.1. AFIANZAR LA COOPERACIÓN CON PAÍSES HERMANOS EN CORRESPONDENCIA CON LAS NECESIDADES INHERENTES A LA DEFENSA INTEGRAL DE LA PATRIA.	458	1	5	17	88
1.6.1.7. DISEÑAR PLANES ESTRATÉGICOS DE COOPERACIÓN ENTRE LAS INSTITUCIONES DEL GOBIERNO, LA FUERZA ARMADA NACIONAL BOLIVARIANA Y EL PODER POPULAR, A FIN DE GARANTIZAR EL DESARROLLO Y LA DEFENSA INTEGRAL DE LA NACIÓN.	156	1	3	8	45
2.1.1.1. DISEÑAR ESTRATEGIAS QUE PERMITAN GARANTIZAR LA PARTICIPACIÓN DEL PUEBLO, AUMENTANDO SU NIVEL DE CONCIENCIA PARA AFRONTAR CUALQUIER ESCENARIO QUE SE ORIGINE COMO CONSECUENCIA DE LA GUERRA ECONÓMICA.\n	157	1	4	10	55
2.1.1.3. DEMOCRATIZAR LOS MEDIOS DE PRODUCCIÓN, IMPULSANDO NUEVAS FORMAS DE PROPIEDAD, COLOCÁNDOLAS AL SERVICIO DE LA SOCIEDAD.\n	158	1	4	10	55
2.1.1.4. FORTALECER LA PLANIFICACIÓN CENTRALIZADA Y EL SISTEMA PRESUPUESTARIO PARA EL DESARROLLO Y DIRECCIONAMIENTO DE LAS CADENAS ESTRATÉGICAS DE LA NACIÓN.	159	1	4	10	55
2.1.3.1. GENERAR UN SISTEMA DE INTEGRACIÓN DE LAS REDES PRODUCTIVAS QUE PERMITA ARTICULAR LA CADENA DE VALOR PARA LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES DE LA POBLACIÓN.	160	1	4	10	57
2.1.3.3. GENERAR UN NUEVO ESQUEMA DE INCENTIVOS QUE PERMITA LA OPTIMIZACIÓN EN LA ASIGNACIÓN DE RECURSOS E INCREMENTAR LA PRODUCCIÓN Y EL VALOR AGREGADO NACIONAL.\n	161	1	4	10	57
2.1.3.4. FORTALECER SECTORES PRODUCTIVOS DONDE EL PAÍS PRESENTE VENTAJAS COMPARATIVAS, ORIENTANDO LOS EXCEDENTES COMO BASE ECONÓMICA ALTERNATIVA AL MODELO MONOEXPORTADOR.\n	163	1	4	10	57
2.1.3.5. CONFORMAR UN SISTEMA DE PARQUES INDUSTRIALES PARA EL FORTALECIMIENTO DE CADENAS PRODUCTIVAS, TEJIDO INDUSTRIAL, FACILIDADES LOGÍSTICAS, FORMACIÓN, TECNOLOGÍA Y SISTEMA DE DISTRIBUCIÓN DE INSUMOS Y PRODUCTOS CON PRECIOS JUSTOS. ESTOS NODOS TENDRÁN UNIDADES DE GESTIÓN INTEGRAL PARA CONCENTRAR SERVICIOS Y POTENCIAR NUEVAS FORMAS DE ORGANIZACIÓN DE LA PRODUCCIÓN.\n	164	1	4	10	58
2.1.3.6. DESARROLLAR BANCOS DE INSUMOS DENTRO DEL SISTEMA INDUSTRIAL PARA GARANTIZAR LA CANTIDAD Y EL TIEMPO DEL ACCESO A LAS MATERIAS PRIMAS E INSUMOS INDUSTRIALES CON PRECIOS JUSTOS, PARA UNA ESTRUCTURA SANA DEL SISTEMA ECONÓMICO INDUSTRIAL.\n	165	1	4	10	57
2.1.4.1. CONSTRUIR UNA CULTURA DEL TRABAJO QUE SE CONTRAPONGA AL RENTISMO MEDIANTE EL IMPULSO DE LA FORMACIÓN DESDE LA PRAXIS DEL TRABAJO, CONCIENCIA DEL TRABAJADOR Y TRABAJADORA, COMO SUJETOS ACTIVOS DEL PROCESO DE TRANSFORMACIÓN Y PARTICIPACIÓN DEMOCRÁTICA DEL TRABAJO, ORIENTADA A LOS MÁS ALTOS INTERESES NACIONALES.\n	167	1	4	10	58
2.1.4.2. PROPICIAR UN NUEVO MODELO DE GESTIÓN EN LAS UNIDADES PRODUCTIVAS, DE PROPIEDAD SOCIAL DIRECTA E INDIRECTA, QUE SEA EFICIENTE, SUSTENTABLE Y QUE GENERE RETORNABILIDAD SOCIAL Y/O ECONÓMICA DEL PROCESO PRODUCTIVO.\n	168	1	4	10	58
2.1.4.3. IMPULSAR LA CONFORMACIÓN DE CONSEJOS DE TRABAJADORES Y TRABAJADORAS EN LAS UNIDADES PRODUCTIVAS, EN EL MARCO DE LA CONSOLIDACIÓN Y FORTALECIMIENTO DE LA DEMOCRACIA PARTICIPATIVA Y PROTAGÓNICA.\n	169	1	4	10	58
2.1.4.4. PROMOVER EL DESARROLLO DE INSTANCIAS DE COORDINACIÓN ENTRE LOS CONSEJOS COMUNALES Y CONSEJOS DE TRABAJADORES Y TRABAJADORAS.\n	170	1	4	10	58
2.1.4.5. DESARROLLAR UN SISTEMA DE ESTÍMULOS PARA EL FOMENTO DE LAS PEQUEÑAS Y MEDIANAS INDUSTRIAS PRIVADAS Y EMPRESAS CONJUNTAS, EN UN MARCO DE MÁXIMA CORRESPONSABILIDAD SOCIAL DEL APARATO PRODUCTIVO, RECONOCIENDO EL TRABAJO DE MUJERES Y HOMBRES EMPRENDEDORES.\n	171	1	4	10	58
2.1.4.6. CONTRIBUIR CON EL BIENESTAR SOCIOECONÓMICO DEL ENTORNO DONDE SE ASIENTEN LAS UNIDADES PRODUCTIVAS, APLICANDO LA ESTRATEGIA DE PUNTO Y CÍRCULO, DANDO CABIDA A LA PARTICIPACIÓN POPULAR EN PROCESOS SOCIALES Y ECONÓMICOS; ASÍ COMO DE CONTRALORÍA SOCIAL. LAS UNIDADES DE MAYOR ESCALA PROPICIARÁN RAMIFICACIONES DE INSUMOS A ESCALA COMUNAL, PARA COOPERAR EN LA SATISFACCIÓN DE LAS NECESIDADES DE NUESTRAS COMUNIDADES.	172	1	4	10	58
2.1.4.7. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN DE LA PRODUCCIÓN A TRAVÉS DE LOS CONGLOMERADOS PRODUCTIVOS QUE PERMITA LA VINCULACIÓN DE LA INDUSTRIA NACIONAL DE UNA MISMA CADENA PRODUCTIVA, GENERANDO ECONOMÍA DE ESCALA, ASÍ COMO EL DESARROLLO DE LOS PRINCIPIOS DE SOLIDARIDAD Y COMPLEMENTARIEDAD ECONÓMICA PRODUCTIVA.\n	173	1	4	10	58
2.1.4.8. FOMENTAR LA EDUCACIÓN DEL CONSUMIDOR EN EL DESARROLLO DE SU ROL PROTAGÓNICO EN LA PLANIFICACIÓN, EJECUCIÓN Y FISCALIZACIÓN DE POLÍTICAS, EN EL MODELO ECONÓMICO PRODUCTIVO SOCIALISTA.\n	174	1	4	10	58
2.1.4.9. IMPULSAR EL PLAN NACIONAL DE PLENO ABASTECIMIENTOS GARANTIZANDO A LA POBLACIÓN VENEZOLANA EL ACCESO A LOS ALIMENTOS Y BIENES ESENCIALES.	175	1	4	10	58
2.1.5.1. GENERAR Y FORTALECER LAS CADENAS DE DISTRIBUCIÓN, ESTATALES, COMUNALES Y MIXTAS QUE REPRESENTEN ALTERNATIVAS EN LA DISTRIBUCIÓN Y AHORRO DIRECTO A LA POBLACIÓN DE LOS PRODUCTOS INTERMEDIOS Y DE CONSUMO FINAL.\n	176	1	4	10	59
2.1.5.2. PROPICIAR SISTEMAS DE TRANSPORTE Y DISTRIBUCIÓN QUE TIENDAN AL FLUJO DE MERCANCÍAS DIRECTO DESDE LAS UNIDADES DE PRODUCCIÓN AL CONSUMIDOR, CENTROS DE ACOPIO O UNIDADES DE PRODUCCIÓN INTERMEDIAS.\n	177	1	4	10	59
2.1.5.3. AMPLIAR Y ADECUAR LA RED DE ALMACENES (TANTO EN FRÍO COMO EN SECO) A NIVEL LOCAL, PARA EL FORTALECIMIENTO DE LAS UNIDADES PRODUCTIVAS SOCIALISTAS.	178	1	4	10	59
2.1.6.1. CONFIGURAR UNA ARQUITECTURA INSTITUCIONAL QUE ORGANICE LOS SECTORES PRODUCTIVOS DE PROPIEDAD SOCIAL DIRECTA O INDIRECTA A TRAVÉS DE CORPORACIONES PARA LA PLANIFICACIÓN CENTRALIZADA.\n	179	1	4	10	60
2.1.6.2. IMPLANTAR EL MODELO DE GESTIÓN SOCIALISTA EN LAS UNIDADES PRODUCTIVAS.	180	1	4	10	60
2.2.1.2. ASEGURAR LA GARANTÍA DE PRESTACIONES BÁSICAS UNIVERSALES RELATIVAS A LAS CONTINGENCIAS DE VEJEZ, SOBREVIVENCIA, PERSONAS CON DISCAPACIDAD, CESANTÍA Y DESEMPLEO, DERIVADAS DE LA VINCULACIÓN CON EL MERCADO DE TRABAJO.\n	181	1	4	11	133
2.2.1.3. GARANTIZAR LA FORMACIÓN COLECTIVA EN LOS CENTROS DE TRABAJO, FAVORECIENDO LA INCORPORACIÓN AL TRABAJO PRODUCTIVO, SOLIDARIO Y LIBERADOR.\n	182	1	4	11	133
2.2.1.4. AFIANZAR VALORES QUE RESGUARDEN LA IDENTIDAD, CONSTRUYAN SOBERANÍA Y DEFENSA DE LA PATRIA, A PARTIR DEL DISFRUTE FÍSICO, ESPIRITUAL E INTELECTUAL, Y EL RECONOCIMIENTO DE NUESTRO PATRIMONIO CULTURAL Y NATURAL.\n	183	1	4	11	133
2.2.1.6. ASEGURAR EL DESARROLLO FÍSICO, COGNITIVO, MORAL Y UN AMBIENTE SEGURO Y SALUDABLE DE TRABAJO, EN CONDICIONES LABORALES Y DE SEGURIDAD SOCIAL GRATIFICANTES.	185	1	4	11	133
2.2.2.1. UNIFICAR EL NIVEL DE DIRECCIÓN NACIONAL, REGIONAL, ESTADAL, MUNICIPAL Y COMUNAL DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS.\n	186	1	4	11	133
2.2.9.2. REDUCIR LA POBREZA GENERAL A MENOS DEL 15% DE LOS HOGARES Y ERRADICAR LA POBREZA EXTREMA, POTENCIANDO EL DESARROLLO Y EXPANSIÓN DEL ALCANCE TERRITORIAL DE LAS MISIONES, GRANDES MISIONES Y MICROMISIONES QUE GARANTICEN AL PUEBLO LAS CONDICIONES PARA EL GOCE Y EJERCICIO DE TODOS LOS DERECHOS ECONÓMICOS, SOCIALES Y CULTURALES.\n	187	1	4	11	141
2.2.13.1. FORTALECER Y AMPLIAR EL SISTEMA DE MISIONES Y GRANDES MISIONES SOCIALISTAS PARA GARANTIZAR LA COBERTURA, CALIDAD, CORRESPONSABILIDAD Y EFICIENCIA EN LA SATISFACCIÓN DE LAS NECESIDADES DE LA POBLACIÓN.\n	253	1	4	11	145
2.2.2.2. CREAR EL SERVICIO NACIONAL DE INFORMACIÓN DE MISIONES Y GRANDES MISIONES, QUE ESTABLEZCA UN REGISTRO ÚNICO DE LOS BENEFICIARIOS DE LAS MISIONES, PARA LA PLANIFICACIÓN, SEGUIMIENTO Y EVALUACIÓN DE LA EFECTIVIDAD DE LOS PROGRAMAS SOCIALES EN EL CUMPLIMIENTO DE SUS COMETIDOS, MEDIANTE: A) LA IDENTIFICACIÓN Y SITUACIÓN DE LA FAMILIA; B) LA VINCULACIÓN A LAS MISIONES Y OTROS PROGRAMAS SOCIALES; C) EL CATASTRO DE SERVICIOS E INSTALACIONES SOCIALES; D) EL SISTEMA DE MONITOREO DE LA SUPERACIÓN DE LA POBREZA.\n	188	1	4	11	134
2.2.2.3. FORTALECER EL TEJIDO SOCIAL DE LAS MISIONES, PARA GARANTIZAR LA PARTICIPACIÓN DEL PODER POPULAR EN TODAS LAS ETAPAS DE PLANIFICACIÓN, EJECUCIÓN, SEGUIMIENTO Y CONTROL, ASÍ COMO LA GENERACIÓN DE SALDOS ORGANIZATIVOS DE LA POBLACIÓN BENEFICIARIA.\n	189	1	4	11	134
2.2.2.4. COORDINAR DE MANERA CENTRALIZADA, EL PLAN DE FORMACIÓN, FINANCIAMIENTO Y PRODUCCIÓN DE TODA LA POLÍTICA SOCIAL, MEDIANTE LA INTEGRACIÓN DE LA INFRAESTRUCTURA SOCIAL, DEL PERSONAL Y DE LOS RECURSOS OPERATIVOS.	190	1	4	11	134
2.2.3.1. INCREMENTAR SOSTENIDAMENTE LA PRODUCCIÓN Y DISTRIBUCIÓN DE BIENES CULTURALES A NIVEL NACIONAL.\n	191	1	4	11	135
2.2.3.2. FORTALECER LAS EDITORIALES QUE INCLUYAN ESPACIOS DE PARTICIPACIÓN DEL PODER POPULAR EN LA POLÍTICA EDITORIAL MEDIANTE LA GENERACIÓN DE IMPRENTAS REGIONALES.\n	192	1	4	11	135
2.2.3.3. AUMENTAR LOS ESPACIOS Y LA INFRAESTRUCTURA CULTURAL A DISPOSICIÓN DEL PUEBLO, QUE PERMITAN EL DESARROLLO LOCAL DE LAS ARTES.\n	193	1	4	11	135
2.2.3.4. IMPULSAR Y AMPLIAR LA RED DE INTELECTUALES, ARTISTAS, CULTORES Y CULTORAS, Y LA ORGANIZACIÓN DE REDES COMUNITARIAS CULTURALES.\n	194	1	4	11	135
2.2.3.5. DESARROLLAR INVESTIGACIONES SOBRE LAS TRADICIONES CULTURALES QUE IMPULSEN EL CONOCIMIENTO Y PRÁCTICA CULTURAL.\n	195	1	4	11	135
2.2.3.6. VISIBILIZAR LA IDENTIDAD HISTÓRICO-COMUNITARIA EN CONEXIÓN CON LA MISIÓN CULTURA CORAZÓN ADENTRO.\n	196	1	4	11	135
2.2.3.7 CONSOLIDAR EL PROTAGONISMO POPULAR EN LAS MANIFESTACIONES CULTURALES Y DEPORTIVAS, CENTRADO EN LA CREACIÓN DE UNA CONCIENCIA GENERADORA DE TRANSFORMACIONES PARA LA CONSTRUCCIÓN DEL SOCIALISMO.	197	1	4	11	135
2.2.4.2. INCORPORAR LA PERSPECTIVA DE LA IGUALDAD DE GÉNERO EN LAS POLÍTICAS PÚBLICAS PROMOVIENDO LA NO DISCRIMINACIÓN Y LA PROTECCIÓN DE LOS GRUPOS SOCIALMENTE VULNERABLES.\n	199	1	4	10	58
2.2.4.3. GENERAR POLÍTICAS FORMATIVAS SOBRE LA PERSPECTIVA DE IGUALDAD DE GÉNERO Y DE DIVERSIDAD SEXUAL.\n	200	1	4	11	136
2.2.4.4. PROMOVER EL DEBATE Y REFLEXIÓN DE LOS DERECHOS DE LA COMUNIDAD SEXO-DIVERSA.\n\n\n	201	1	4	11	136
2.2.5.1. ACELERAR LA DEMARCACIÓN DE LOS TERRITORIOS INDÍGENAS, A TRAVÉS DE LA ENTREGA DE TÍTULOS DE PROPIEDAD DE TIERRAS A SUS COMUNIDADES.\n	202	1	4	11	137
2.2.5.2. GARANTIZAR LA ADJUDICACIÓN DE VIVIENDAS DIGNAS A LAS COMUNIDADES INDÍGENAS EN SITUACIÓN DE VULNERABILIDAD, RESPETANDO SU CULTURA Y TRADICIONES.\n	203	1	4	11	137
2.2.5.3. IMPULSAR LA FORMACIÓN, CAPACITACIÓN Y FINANCIAMIENTO\nPARA UNIDADES SOCIO-PRODUCTIVAS EN LAS COMUNIDADES INDÍGENAS, RESPETANDO SUS PRÁCTICAS Y FORMAS DE ORGANIZACIÓN TRADICIONALES.\n	204	1	4	11	137
2.2.5.4. AMPLIAR LA PRESENCIA DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS EN LAS COMUNIDADES INDÍGENAS, CON ABSOLUTO RESPETO A SUS COSTUMBRES, USOS, CULTURA, FORMAS DE ORGANIZACIÓN Y EJERCICIO DE LA AUTORIDAD ANCESTRAL.\n\n	205	1	4	11	137
\n2.2.6.1. PROFUNDIZAR LA MASIFICACIÓN DEPORTIVA.\n\n\n\n\n\n\n	206	1	4	11	138
2.2.6.2. CONSOLIDAR EL FONDO NACIONAL DEL DEPORTE, ACTIVIDAD FÍSICA Y EDUCACIÓN FÍSICA PARA IMPULSAR LA MASIFICACIÓN DEL DEPORTE.\n\n\n\n	207	1	4	11	138
2.2.6.3. AMPLIAR LA INFRAESTRUCTURA DE LA MISIÓN BARRIO ADENTRO DEPORTIVO Y DE TODOS LOS ESPACIOS DEPORTIVOS A NIVEL PARROQUIAL.\n	208	1	4	11	138
2.2.6.4. CONTRIBUIR A LA PRÁCTICA SISTEMÁTICA, MASIVA Y DIVERSIFICADA DE LA ACTIVIDAD FÍSICA EN LAS COMUNIDADES Y ESPACIOS PÚBLICOS.\n	209	1	4	11	138
2.2.11.7. PREVENIR Y CONTROLAR LAS CARENCIAS DE MICRONUTRIENTES Y PROMOCIÓN DE LA SEGURIDAD ALIMENTARIA EN LOS HOGARES.	210	1	4	11	143
2.2.6.5. FORTALECER EL DEPORTE DE ALTO RENDIMIENTO, CON APOYO INTEGRAL AL ATLETA Y HÉROES DEL DEPORTE, DESARROLLO DE LA MEDICINA Y LAS CIENCIAS APLICADAS AL DEPORTE DE ALTO RENDIMIENTO, DESARROLLO DE CENTROS DE ALTO RENDIMIENTO Y DE LA ESCUELA NACIONAL DE TALENTOS DEPORTIVOS.\n\n	211	1	4	11	138
2.2.7.1. PROMOVER LA ÉTICA SOCIALISTA EN LOS ESPACIOS DE FORMACIÓN, RECREACIÓN Y OCIO LIBRE DE LOS JÓVENES, ORIENTANDO ÉSTA HACIA LA PAZ, LA SOLIDARIDAD, UNA VIDA SANA Y LA CONVIVENCIA COMUNAL.\n	212	1	4	11	139
3.1.1.2. ALCANZAR LA PRODUCCIÓN DE GAS NATURAL PARA EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	213	1	5	15	65
2.2.7.2. DESARROLLAR ESPACIOS INSTITUCIONALES DE FORMACIÓN Y ATENCIÓN INTEGRAL PARA JÓVENES EN SITUACIÓN DE VULNERABILIDAD.\n	214	1	4	11	139
2.2.7.3. FORTALECER LA ORGANIZACIÓN Y PARTICIPACIÓN PROTAGÓNICA DE LOS JÓVENES A TRAVÉS DE LA CONFORMACIÓN DE CONSEJOS DEL PODER POPULAR JUVENIL, ENTRE OTRAS INICIATIVAS.\n	215	1	4	11	139
2.2.7.4. PROMOVER UNA POLÍTICA DE INCLUSIÓN DE LOS JÓVENES AL SISTEMA PRODUCTIVO NACIONAL, CON ESPECIAL ÉNFASIS EN LOS JÓVENES DE SECTORES DE MENORES INGRESOS, INCENTIVANDO UNA CULTURA ECONÓMICA PRODUCTIVA SOCIALISTA.\n\n	216	1	4	11	139
2.2.8.1. AVANZAR EN LA TRANSFORMACIÓN DEL SISTEMA PENITENCIARIO, A TRAVÉS DE LA INCORPORACIÓN DE FAMILIARES DE LAS PERSONAS PRIVADAS DE LIBERTAD, CONSEJOS COMUNALES, ORGANIZACIONES SOCIALES Y CUALQUIER OTRA FORMA DE ORGANIZACIÓN, A LABORES PERTINENTES A LA MATERIA PENITENCIARIA.\n	217	1	4	11	140
2.2.8.2. COMBATIR LA IMPUNIDAD, EL RETARDO PROCESAL PENAL, EN COORDINACIÓN CON LOS PODERES PÚBLICOS INVOLUCRADOS.\n	218	1	4	11	140
2.2.8.3. MEJORAR Y CONSTRUIR INFRAESTRUCTURAS PARA LAS COMUNIDADES PENITENCIARIAS, INCORPORANDO ESPACIOS PARA EL TRABAJO PRODUCTIVO.	219	1	4	11	140
2.2.8.4. TRANSFORMAR EL SISTEMA DE JUSTICIA PENAL, GENERANDO ALTERNATIVAS PARA EL CUMPLIMIENTO DE LA PENA, ASÍ COMO OTROS BENEFICIOS PROCESALES QUE COADYUVE A LA CONFORMACIÓN DE UN NUEVO ORDEN DE ADMINISTRACIÓN DE JUSTICIA.\n	220	1	4	11	140
2.2.8.5. CREAR UN SISTEMA INTEGRAL DE APOYO POST PENITENCIARIO, CON ÉNFASIS EN PROGRAMAS SOCIOEDUCATIVOS Y LABORALES, GARANTIZANDO LA PRIVACIDAD DE LOS ANTECEDENTES PENALES.\n\n	221	1	4	11	140
2.2.9.1 ERRADICAR LA POBREZA EXTREMA.	222	1	4	11	141
2.2.13.2. DESARROLLAR, DESDE LAS GRANDES MISIONES, LOS SISTEMAS DE ACOMPAÑAMIENTO TERRITORIAL, PARA TRANSFORMAR LA VIDA DE FAMILIAS Y COMUNIDADES EN SITUACIÓN DE POBREZA Y DE RIESGO.\n	254	1	4	11	145
2.2.13.3. GENERAR SALDOS ORGANIZATIVOS DEL PODER POPULAR EN LAS MISIONES Y GRANDES MISIONES.\n\n	255	1	4	11	145
2.2.9.3. REDUCIR LAS CONDICIONES DE VULNERABILIDAD SOCIAL A TRAVÉS DEL DESARROLLO Y CONSOLIDACIÓN DE LAS MISIONES, GRANDES MISIONES, TALES COMO LA GRAN MISIÓN EN AMOR MAYOR, MISIÓN MADRES DEL BARRIO, MISIÓN HIJOS E HIJAS DE VENEZUELA, MISIÓN ALIMENTACIÓN DE VENEZUELA, GRAN MISIÓN SABER Y TRABAJO, GRAN MISIÓN VIVIENDA VENEZUELA, JÓVENES DE LA PATRIA, AGROVENEZUELA, BARRIO ADENTRO I Y II; ASÍ COMO LAS MICROMISIONES Y OTROS PROGRAMAS SOCIALES, QUE PERMITAN LA MÁXIMA PROTECCIÓN A FAMILIAS VENEZOLANAS CONFORMADAS POR PERSONAS ADULTAS MAYORES, MUJERES EMBARAZADAS, NIÑOS, NIÑAS Y ADOLESCENTES O CON DISCAPACIDAD.\n	223	1	4	11	141
2.2.10.1. ASEGURAR LA SALUD DE LA POBLACIÓN, A TRAVÉS DEL FORTALECIMIENTO CONTINUO Y LA CONSOLIDACIÓN DE TODOS LOS NIVELES DE ATENCIÓN Y SERVICIOS DEL SISTEMA PÚBLICO NACIONAL DE SALUD, PRIORIZANDO EL NIVEL DE ATENCIÓN PRIMARIA PARA LA PROMOCIÓN DE ESTILOS Y CONDICIONES DE VIDA SALUDABLES EN TODA LA POBLACIÓN.\n	224	1	4	11	142
2.2.10.3. ARTICULAR BAJO LA RECTORÍA ÚNICA DEL SISTEMA PÚBLICO NACIONAL DE SALUD A TODOS LOS ÓRGANOS Y ENTES PRESTADORES DE SERVICIOS DE SALUD PÚBLICOS Y PRIVADOS.\n	225	1	4	11	142
2.2.10.4. DISMINUIR EL SOBREPESO Y EL SEDENTARISMO COMO FACTORES DE RIESGOS DE ENFERMEDADES PREVENIBLES, A TRAVÉS DE MECANISMOS QUE FOMENTEN LA ACTIVIDAD FÍSICA, MEJOREN LOS HÁBITOS ALIMENTICIOS Y PATRONES DE CONSUMO. PROMOVER LA DISMINUCIÓN A UN 12% DEL PORCENTAJE DE LA POBLACIÓN DE 7-14 AÑOS CON SOBREPESO (PESO-TALLA).\n	226	1	4	11	142
2.2.10.6. AUMENTAR AL 15% LA PRODUCCIÓN NACIONAL DE MEDICAMENTOS ESENCIALES REQUERIDOS POR EL SISTEMA PUBLICO NACIONAL DE SALUD.\n	227	1	4	11	142
2.2.10.7. AUMENTAR AL 10% LA PRODUCCIÓN NACIONAL DE MATERIAL MÉDICO QUIRÚRGICO REQUERIDO POR EL SISTEMA PÚBLICO NACIONAL DE SALUD.\n	228	1	4	11	142
2.2.11.4. CONSOLIDAR LAS CASAS DE ALIMENTACIÓN, PARA ADECUARLAS Y AMPLIARLAS COMO CENTROS DE FORMACIÓN Y ATENCIÓN NUTRICIONAL.\n	229	1	4	11	143
2.2.11.5. FORTALECER LOS PROGRAMAS DE ASISTENCIA ALIMENTARIA EN EL SISTEMA EDUCATIVO.\n	230	1	4	11	143
2.2.9.4. IMPULSAR LA CORRESPONSABILIDAD DEL PODER POPULAR EN LA LUCHA POR LA ERRADICACIÓN DE LA POBREZA EN TODAS SUS MANIFESTACIONES.\n\n	231	1	4	11	141
2.2.10.2. FOMENTAR LA CREACIÓN DE CENTROS Y SERVICIOS ESPECIALIZADOS EN EL SISTEMA PÚBLICO NACIONAL DE SALUD.\n	232	1	4	11	142
2.2.10.8. CONSOLIDAR Y EXPANDIR LA RED DE FARMACIAS POPULARES EN TODO EL TERRITORIO NACIONAL.\n	233	1	4	11	142
2.2.10.11. ARTICULAR TODOS LOS NIVELES DE PROTECCIÓN, PROMOCIÓN, PREVENCIÓN, ATENCIÓN INTEGRAL Y REHABILITACIÓN A LA SALUD INDIVIDUAL Y COLECTIVA EN EL MARCO DE ÁREAS DE SALUD INTEGRAL COMUNITARIAS.	234	1	4	11	142
2.2.11.1. FOMENTAR POLÍTICAS PARA INCREMENTAR LA LACTANCIA MATERNA EXCLUSIVA (LME) PARA CUBRIR AL MENOS EL 70% DE LA POBLACIÓN LACTANTE.\n\n	235	1	4	11	143
2.2.11.3. ASEGURAR LA ALIMENTACIÓN SALUDABLE DE LA POBLACIÓN, CON ESPECIAL ATENCIÓN EN LA PRIMERA INFANCIA (PRENATAL - 8 AÑOS).\n	236	1	4	11	143
2.2.11.6. PROMOVER HÁBITOS ALIMENTARIOS SALUDABLES Y PATRONES DE CONSUMO ADAPTADOS A LAS POTENCIALIDADES PRODUCTIVAS DEL PAÍS.\n	237	1	4	11	143
2.2.10.5. IMPULSAR LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR EN LOS ESPACIOS DE ARTICULACIÓN INTERSECTORIAL E INSTITUCIONALES PARA LA PROMOCIÓN DE LA CALIDAD DE VIDA Y LA SALUD, A TRAVÉS DEL: A) EL INCREMENTO DE LOS EGRESADOS DE LAS DISTINTAS PROFESIONES QUE SE ENCUENTRAN INTEGRADAS AL SISTEMA PÚBLICO NACIONAL DE SALUD, ALCANZANDO LOS 80.000 PROFESIONALES DE LA SALUD PARA 2019; B) LA PARTICIPACIÓN DE LOS ÓRGANOS DEL PODER POPULAR EN LA PLANIFICACIÓN, EJECUCIÓN, MONITOREO Y EVALUACIÓN DE LAS ACCIONES DE SALUD EN LAS ÁREAS DE SALUD INTEGRAL COMUNITARIA; Y C) LA CONSTITUCIÓN DE ORGANIZACIONES POPULARES EN SALUD, TALES COMO LOS COMITÉS DE SALUD.\n	238	1	4	11	142
2.2.10.9. FORTALECER LA ATENCIÓN DE LA SALUD SEXUAL Y REPRODUCTIVA DE LA POBLACIÓN VENEZOLANA CON ÉNFASIS EN LOS SECTORES DE MAYOR VULNERABILIDAD Y EXCLUSIÓN.\n\n	239	1	4	11	142
2.2.10.10. REDUCIR CARGAS DE ENFERMEDAD, MORTALIDAD PREMATURA Y MORTALIDAD EVITABLE CON ÉNFASIS EN MORTALIDAD MATERNA, MORTALIDAD EN MENORES DE 5 AÑOS.\n	240	1	4	11	142
2.2.12.1. DESARROLLAR EN EL CURRÍCULO NACIONAL BOLIVARIANO OS CONTENIDOS DE LA EDUCACIÓN INTEGRAL Y LIBERADORA CON FUNDAMENTO EN LOS VALORES Y PRINCIPIOS DE LA PATRIA.\n\n	241	1	4	11	144
2.5.4.1. FORTALECER EL SISTEMA DE ADMINISTRACIÓN DE JUSTICIA MEDIANTE LA DOTACIÓN DE LOS MEDIOS NECESARIOS PARA SU ÓPTIMO DESEMPEÑO, INCLUYENDO EL NIVEL DE INVESTIGACIÓN CRIMINAL QUE PERMITA COMBATIR LA IMPUNIDAD Y EL RETRASO PROCESAL.\n	242	1	4	14	157
2.2.12.2. EXTENDER LA COBERTURA DE LA MATRÍCULA ESCOLAR A TODA LA POBLACIÓN, CON ÉNFASIS EN LAS POBLACIONES EXCLUIDAS, DE LA SIGUIENTE MANERA: A) ETAPA DE MATERNAL:  INCREMENTAR LA MATRÍCULA DE 13% HASTA EL 40%; B)ETAPA DE PREESCOLAR: UNIVERSALIZAR LA MATRÍCULA AL 100% DE COBERTURA; C) ETAPA PRIMARIA: CONSOLIDAR LA UNIVERSALIZACIÓN, AUMENTANDO AL <0%; D) EDUCACIÓN MEDIA GENERAL: INCREMENTAR LA MATRÍCULA AL 100% PARA LOGRAR QUE TODA LA POBLACIÓN ALCANCE UN NIVEL DE INSTRUCCIÓN PROMEDIO NO MENOR A EDUCACIÓN MEDIA GENERAL O MEDIA TÉCNICA; E) INCREMENTAR LA MATRÍCULA DE LA EDUCACIÓN TÉCNICA AL 40%.\n	243	1	4	11	144
2.2.12.3. PROFUNDIZAR LA TERRITORIALIZACIÓN Y PERTINENCIA DE LA EDUCACIÓN UNIVERSITARIA, A TRAVÉS DEL AUMENTO DE LA MATRÍCULA MUNICIPALIZADA EN UN 60%, CON INICIATIVAS COMO LAS MISIONES SUCRE Y ALMA MATER, ASÍ COMO LOS PROGRAMAS NACIONALES DE FORMACIÓN AVANZADA.\n	244	1	4	11	144
2.2.12.4. AMPLIAR LA INFRAESTRUCTURA Y LA DOTACIÓN ESCOLAR Y DEPORTIVA, GARANTIZANDO LA EJECUCIÓN DE UN PLAN DE CONSTRUCCIÓN, AMPLIACIÓN, REPARACIÓN Y MANTENIMIENTO PERMANENTE.\n	245	1	4	11	144
2.2.12.5. CONTINUAR INCORPORANDO TECNOLOGÍAS DE LA INFORMACIÓN Y DE LA COMUNICACIÓN AL PROCESO EDUCATIVO.\n	246	1	4	11	144
2.2.12.6. PROFUNDIZAR LA ACCIÓN EDUCATIVA, COMUNICACIONAL Y DE PROTECCIÓN DEL AMBIENTE.\n	247	1	4	11	144
2.2.12.7. DESARROLLAR LA EDUCACIÓN INTERCULTURAL BILINGÜE, PROMOVIENDO EL RESCATE Y LA PRESERVACIÓN DE LAS LENGUAS INDÍGENAS.\n	248	1	4	11	144
2.2.12.8. DESARROLLAR PROGRAMAS Y PROYECTOS DE FORMACIÓN-INVESTIGACIÓN QUE DEN RESPUESTA A LAS NECESIDADES Y POTENCIALIDADES PRODUCTIVAS PARA EL PROYECTO NACIONAL.\n	249	1	4	11	144
2.2.12.9. DESARROLLAR PROGRAMAS EN EDUCACIÓN EN LOS QUE SE INCORPOREN CONTENIDOS ENFOCADOS EN LOS CONOCIMIENTOS ANCESTRALES Y POPULARES.\n	250	1	4	11	144
2.2.12.11. CONSOLIDAR LA DEMOCRATIZACIÓN DEL ACCESO A LA EDUCACIÓN TÉCNICA UNIVERSITARIA.\n	251	1	4	11	144
2.2.12.12. CONSOLIDAR EL DERECHO CONSTITUCIONAL A LA EDUCACIÓN UNIVERSITARIA PARA TODAS Y TODOS, FORTALECIENDO EL INGRESO, PROSECUCIÓN Y EGRESO, INCREMENTANDO AL 100% LA INCLUSIÓN DE JÓVENES BACHILLERES AL SISTEMA DE EDUCACIÓN UNIVERSITARIA.	252	1	4	11	144
1.3.5.3. PROMOVER LA CONSTITUCIÓN DE FIDEICOMISOS PARA EL FINANCIAMIENTO DE PROYECTOS ESTRATÉGICOS.	709	1	3	5	23
2.5.1.1. DISEÑAR, JUNTO A LAS DIFERENTES ORGANIZACIONES DEL PODER POPULAR, NORMAS QUE DESARROLLEN LOS PRINCIPIOS CONSTITUCIONALES PARA EL EJERCICIO DE LA DEMOCRACIA DIRECTA.\n	257	1	4	14	153
2.5.1.2. ESTABLECER NUEVOS Y PERMANENTES MECANISMOSDE INTEGRACIÓN ENTRE ESTADO Y SOCIEDAD, FORTALECIENDO LA ORGANIZACIÓN Y LAS CAPACIDADES PARA LA DEFENSA INTEGRAL DE LA NACIÓN.\n	258	1	4	14	153
2.5.1.3. FORTALECER LOS SISTEMAS DE COMUNICACIÓN PERMANENTE, QUE PERMITAN LA INTERACCIÓN ENTRE LAS INSTITUCIONES PÚBLICAS Y EL PODER POPULAR PARA LA CONSTRUCCIÓN COLECTIVA DEL NUEVO ESTADO SOCIALISTA, BAJO EL PRINCIPIO DE “MANDAR, OBEDECIENDO”.\n\n	259	1	4	14	153
2.5.2.1. TRANSFERIR COMPETENCIAS DE LOS DISTINTOS NIVELES DEL PODER PÚBLICO A LAS COMUNAS, COMUNIDADES ORGANIZADAS Y DEMÁS ORGANIZACIONES DEL PODER POPULAR, BAJO LAS DIRECTRICES DEL CONSEJO FEDERAL DE GOBIERNO, CON EL MAYOR GRADO DE PLANIFICACIÓN PARA EL ADECUADO DESARROLLO TERRITORIAL.\n	260	1	4	14	154
2.5.2.2. DESPLEGAR LA FUNCIÓN PLANIFICADORA DEL CONSEJO FEDERAL DE GOBIERNO, PROPICIANDO  LA COORDINACIÓN Y CONTROL DE LAS ACCIONES DEL PODER EJECUTIVO NACIONAL EN LAS DIFERENTES INSTANCIAS TERRITORIALES, POLÍTICO-ADMINISTRATIVAS Y COMUNALES, PARA EL ADECUADO DESARROLLO REGIONAL BAJO CRITERIOS DE SOSTENIBILIDAD Y SUSTENTABILIDAD, GUIADO POR LOS PRINCIPIOS SOCIALISTAS.\n	261	1	4	14	154
3.1.13.4. IMPULSAR EL USO DE TECNOLOGÍAS MÁS EFICIENTES PARA LA GENERACIÓN ELÉCTRICA, A TRAVÉS DE LOS CIERRES DE CICLOS COMBINADOS EN LAS PLANTAS TÉRMICAS.	352	1	5	15	77
2.5.2.3. PROMOVER EL DESARROLLO DE LA PLANIFICACIÓN PARTICIPATIVA TERRITORIAL Y ECONÓMICA, A TRAVÉS DE LA ARTICULACIÓN PERMANENTE DE LOS PLANES COMUNITARIOS Y COMUNALES CON LOS PLANES LOCALES, REGIONALES Y NACIONALES.\n\n	262	1	4	14	154
2.5.3.1. ESTABLECER POLÍTICAS DE ESTÍMULO Y RECONOCIMIENTO A LOS SERVIDORES PÚBLICOS, ASÍ COMO DE LÍDERES POPULARES Y SOCIALES, QUE DESARROLLEN EL EJERCICIO DE SUS FUNCIONES EN EL MARCO DE LOS VALORES QUE COMPORTAN LA ÉTICA SOCIALISTA.\n	263	1	4	14	154
2.5.3.2. FORJAR UNA CULTURA REVOLUCIONARIA DEL SERVIDOR PÚBLICO, REGIDA POR LA NUEVA ÉTICA SOCIALISTA, PROMOVIENDO UNA ACTUACIÓN EN FUNCIÓN DE LA ACCIÓN DEL ESTADO, FUNDAMENTADO EN EL PRINCIPIO DE LA ADMINISTRACIÓN PÚBLICA AL SERVICIO DE LAS PERSONAS.\n	264	1	4	14	154
2.5.3.3. PROMOVER LA REVALORIZACIÓN DE LA CULTURA DEL SABER Y DEL TRABAJO CON VISIÓN SOCIALISTA, MEDIANTE LA CREACIÓN DE ESCUELAS DE FORMACIÓN DE CUADROS ADMINISTRATIVOS, POLÍTICOS Y TÉCNICOS EN LAS INSTITUCIONES DEL ESTADO, EN LAS EMPRESAS DE PROPIEDAD SOCIAL, EN LAS INSTANCIAS DEL PODER POPULAR Y EN LAS INSTITUCIONES PÚBLICAS, COMO MECANISMOS INDISPENSABLES PARA LA TRANSFORMACIÓN DEL ESTADO.\n	265	1	4	14	154
3.1.12.3. FOMENTAR EL DESARROLLO DE COMBUSTIBLES ALTERNATIVOS QUE REEMPLACEN PAULATINAMENTE EL CONSUMO DE DERIVADOS DEL PETRÓLEO.	266	1	5	15	76
2.5.4.6. PROMOVER LA ARTICULACIÓN E INTEGRACIÓN COHERENTE DE LOS INSTRUMENTOS JURÍDICOS EXISTENTES, QUE FAVOREZCA LA EFICIENCIA Y EFICACIA EN LA APLICACIÓN DE LA JUSTICIA.\n	267	1	4	14	157
2.5.5.5. DESPLEGAR LA POLICÍA NACIONAL BOLIVARIANA EN TODO EL TERRITORIO NACIONAL.\n\n	268	1	4	14	158
2.5.5.9. PROSEGUIR CON LA EXPANSIÓN DE LA UNES EN EL TERRITORIO NACIONAL, CON EL FIN DE AUMENTAR LA CAPACIDAD DE INVESTIGACIÓN Y FORMACIÓN DEL NUEVO MODELO POLICIAL Y LA PRODUCCIÓN DE SABER EN MATERIA DE SEGURIDAD CIUDADANA.\n	269	1	4	14	158
2.5.5.16. OPTIMIZAR LOS PROCESOS DE REGISTRO PÚBLICO Y DEL NOTARIADO PARA GARANTIZAR LA SEGURIDAD JURÍDICA DE LAS ACTUACIONES DE LOS USUARIOS, MEDIANTE LA PUBLICIDAD REGISTRAL Y FE PÚBLICA, DE PROCESOS EXPEDITOS Y OPORTUNOS, APEGADOS A LA LEY.	270	1	4	14	158
2.5.4.3. MEJORAR LA INFRAESTRUCTURA EXISTENTE Y CONSTRUIR NUEVOS ESPACIOS FÍSICOS PARA AUMENTAR EL NÚMERO DE TRIBUNALES Y FISCALÍAS A NIVEL NACIONAL.\n	271	1	4	14	157
2.5.4.5. DESARROLLAR UNA CULTURA DE RESPONSABILIDAD EN LA ADMINISTRACIÓN DE JUSTICIA, IMPULSANDO LAS POLÍTICAS DE FORMACIÓN Y CAPACITACIÓN DE JUECES, JUEZAS Y FISCALES PÚBLICOS, EN FUNCIÓN DEL DERECHO A VIVIR BIEN.\n\n	272	1	4	14	157
2.5.4.7. APOYAR LA CREACIÓN DE MECANISMOS ALTERNATIVOS DE RESOLUCIÓN DE CONFLICTOS, MEDIANTE LA INSTALACIÓN DE CASAS DE LA JUSTICIA PENAL EN CADA UNO DE LOS MUNICIPIOS PRIORIZADOS.	273	1	4	14	157
2.5.5.2. CONSOLIDAR EL MOVIMIENTO POR LA PAZ Y LA VIDA PARA LA CONSTRUCCIÓN DE UNA CULTURA DE PAZ, MEDIANTE PROPUESTAS Y ACCIONES A FAVOR DE UNA CONVIVENCIA PACÍFICA, SEGURA, SOLIDARIA Y LIBERTARIA, A TRAVÉS DEL FORTALECIMIENTO DE LA ORGANIZACIÓN Y LA MOVILIZACIÓN POPULAR EN APOYO A LA GRAN MISIÓN A TODA VIDA VENEZUELA.\n	274	1	4	14	158
2.5.5.6. IMPLEMENTAR EL PLAN PATRIA SEGURA A NIVEL NACIONAL, PARA FORTALECER LA CAPACIDAD DEL ESTADO DE PROTECCIÓN A LOS CIUDADANOS Y CONSTRUIR LA PAZ DESDE\nADENTRO, EN CORRESPONSABILIDAD CON EL PODER POPULAR Y LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	275	1	4	14	158
2.5.5.11. CREAR UN ÁREA ESTRATÉGICA O CAMPO DE CONOCIMIENTO SOBRE SEGURIDAD CIUDADANA, A TRAVÉS DEL FONDO NACIONAL DE CIENCIA, INNOVACIÓN Y TECNOLOGÍA.\n	276	1	4	14	158
2.5.6.1. AVANZAR EN EL DESARROLLO DEL ORDENAMIENTO LEGAL DEL SISTEMA DE PLANIFICACIÓN PÚBLICA Y POPULAR.\n	277	1	4	14	159
2.5.6.5. PROMOVER AL SISTEMA NACIONAL DE PLANIFICACIÓN COMO INSTANCIA COORDINADORA, E INTEGRADORA DE LA ACTIVIDAD PLANIFICADORA, FAVORECIENDO LA POLÍTICA DE ORDENACIÓN DEL TERRITORIO DE ACUERDO A SUS CAPACIDADES Y RECURSOS FÍSICOS, NATURALES, AMBIENTALES Y PATRIMONIALES, DANDO RELEVANCIA A SU HISTORIA.\n	278	1	4	14	159
2.5.7.5. ASEGURAR LA FORMACIÓN SISTEMÁTICA EN ESTADÍSTICAS PÚBLICAS.\n	279	1	4	14	160
2.5.4.4. APOYAR LA IMPLEMENTACIÓN DE FISCALÍAS Y JUZGADOS MUNICIPALES EN TODO EL PAÍS.\n	280	1	4	14	157
2.5.5.3. IMPULSAR LOS COMITÉS Y CAMPAÑAS DE DESARME VOLUNTARIO DE LA POBLACIÓN, ASÍ COMO LA REINSERCIÓN PLENA EN LA SOCIEDAD DE QUIENES HAGAN ENTREGA VOLUNTARIA DE ARMAS, CON PROCEDIMIENTOS AJUSTADOS A DERECHO, PARA FORTALECER LAS POLÍTICAS PÚBLICAS DE SEGURIDAD CIUDADANA, ATACANDO LAS CAUSAS DEL DELITO Y GENERANDO CONDICIONES DE PAZ Y DE JUSTICIA DESDE DENTRO DE LAS COMUNIDADES.\n	281	1	4	14	158
2.5.5.7. CULMINAR EL PROCESO DE REFUNDACIÓN DEL CUERPO DE INVESTIGACIONES CIENTÍFICAS, PENALES Y CRIMINALÍSTICAS (CICPC).\n	282	1	4	14	158
2.5.5.10. ACTIVAR EL SISTEMA NACIONAL DE ATENCIÓN A LAS VÍCTIMAS.\n	283	1	4	14	158
2.5.5.13. OPTIMIZAR EL ESTABLECIMIENTO DE POLÍTICAS Y PLANES QUE PROMUEVAN UNA CULTURA HACIA LA PREVENCIÓN Y ATENCIÓN ANTE EVENTOS ADVERSOS, SUSTENTÁNDOSE EN LOS VALORES DE VOLUNTARIEDAD, SOLIDARIDAD Y DESPRENDIMIENTO.\n	284	1	4	14	158
2.5.6.2. REFORZAR EL FUNCIONAMIENTO DE LOS ÓRGANOS ENCARGADOS DE LA PLANIFICACIÓN Y COORDINACIÓN DE LAS POLÍTICAS PÚBLICAS, COMO GARANTÍA DE LA ASIGNACIÓN DE LOS RECURSOS PÚBLICOS ORIENTADOS A LA CONSECUCIÓN, COORDINACIÓN Y ARMONIZACIÓN DE PLANES Y PROYECTOS, A TRAVÉS DE LA TRANSFORMACIÓN DEL PAÍS, EL DESARROLLO TERRITORIAL EQUILIBRADO Y LA JUSTA DISTRIBUCIÓN DE LA RIQUEZA.\n	285	1	4	14	159
2.5.6.4. DESARROLLAR UN SISTEMA ÚNICO QUE INTEGRE LA FORMULACIÓN, EJECUCIÓN Y CONTROL DE LOS PLANES Y PROYECTOS VINCULADOS CON EL PRESUPUESTO PÚBLICO, QUE PERMITA EL SEGUIMIENTO OPORTUNO DE LAS METAS Y OBJETIVOS ESTABLECIDOS, PROMOVIENDO LA TRANSPARENCIA EN EL MANEJO DE LOS RECURSOS PÚBLICOS, BAJO CRITERIOS DE PRUDENCIA Y RACIONALIDAD ECONÓMICA.\n	286	1	4	14	159
2.5.7.4. DESARROLLAR INVESTIGACIONES ESTADÍSTICAS MEDIANTE EL SISTEMA INTEGRADO DE ESTADÍSTICAS SOCIALES Y ECONÓMICAS, PARA EL SEGUIMIENTO DE LAS POLÍTICAS Y MEDICIÓN DE IMPACTOS.\n	287	1	4	14	160
2.5.8.1. GARANTIZAR EL DESARROLLO DEL GOBIERNO ELECTRÓNICO, MEDIANTE LA NORMATIVA LEGAL E INFRAESTRUCTURA NECESARIA, COMO SISTEMA PARA FACILITAR LA PARTICIPACIÓN CIUDADANA Y LA GESTIÓN PÚBLICA EFICIENTE Y TRANSPARENTE.\n	288	1	4	14	161
2.1.1.2. INSERTAR NUEVOS ESQUEMAS PRODUCTIVOS QUE IRRADIEN EN SU ENTORNO RELACIONES DE PRODUCCIÓN E INTERCAMBIO COMPLEMENTARIO Y SOLIDARIO, AL TIEMPO QUE CONSTITUYAN TEJIDOS PRODUCTIVOS DE SOSTÉN DE UN NUEVO METABOLISMO SOCIALISTA. ESTOS INJERTOS PRODUCTIVOS TENDRÁN POLÍTICAS DE ASOCIACIÓN ENTRE SÍ BAJO FORMAS DE CONGLOMERADOS PARA MULTIPLICAR SU ESCALA.\n	289	1	4	10	55
2.5.4.2. PROMOVER LA JUSTICIA DE PAZ COMUNAL COMO HERRAMIENTA EFICAZ PARA RESPALDAR LA CONVIVENCIA PACÍFICA Y FAVORECER LA PRÁCTICA DE LA SOLIDARIDAD Y EL AMOR ENTRE LOS VENEZOLANOS Y LAS VENEZOLANAS.\n	290	1	4	14	157
3.1.13.3. COMPLETAR EL DESARROLLO HIDROELÉCTRICO DEL PAÍS, A TRAVÉS DE LA CULMINACIÓN DE LOS COMPLEJOS HIDROELÉCTRICOS UBICADOS EN EL CARONÍ Y EN LOS ANDES.	379	1	5	15	77
2.5.5.1. EXPANDIR Y CONSOLIDAR LA PREVENCIÓN INTEGRAL Y CONVIVENCIA COMUNAL, EN CORRESPONSABILIDAD CON EL ESTADO, A TRAVÉS DEL DISEÑO, EJECUCIÓN Y MONITOREO DEL PLAN DE PREVENCIÓN INTEGRAL EN EL ÁMBITO NACIONAL, CON ESPECIAL ATENCIÓN A LOS JÓVENES DESOCUPADOS DE LOS SECTORES POPULARES; DE LA APLICACIÓN DE UN PLAN ESPECIAL DE VIGILANCIA DE PATRULLAJE; DE LA ACTIVACIÓN DEL SERVICIO DE POLICÍA COMUNAL EN ACCIÓN CONJUNTA CON LAS ORGANIZACIONES COMUNALES DE BASE; DE LA EJECUCIÓN DEL PLAN DE TRABAJO PARA LOGRAR EL CONTROL DE ARMAS, MUNICIONES Y DESARME; ASÍ COMO LA INTENSIFICACIÓN DEL PROGRAMA DE FORTALECIMIENTO DE LA INVESTIGACIÓN, APREHENSIÓN Y PROCESAMIENTO DE PERSONAS RESPONSABLES DE DELITOS.\n	291	1	4	14	158
2.5.5.4. FORTALECER LOS ÓRGANOS DE SEGURIDAD PÚBLICA Y CIUDADANA EN MATERIA DE CONTROL Y PREVENCIÓN DEL DELITO, MEDIANTE LA DOTACIÓN DE EQUIPAMIENTO INDIVIDUAL E INSTITUCIONAL A LOS CUERPOS DE POLICÍA Y LA TECNIFICACIÓN COMUNICACIONAL PARA UNA RESPUESTA RÁPIDA Y EFECTIVA.\n	292	1	4	14	158
2.5.5.8. CREAR Y SOCIALIZAR EL CONOCIMIENTO PARA LA CONVIVENCIA Y LA SEGURIDAD CIUDADANA, CONSTITUYENDO CENTROS COMUNALES INTEGRALES DE RESOLUCIÓN DE CONFLICTOS.\n	293	1	4	14	158
2.5.5.12. FORTALECER LOS ÓRGANOS EN MATERIA DE PROTECCIÓN CIVIL, ADMINISTRACIÓN DE DESASTRES Y EMERGENCIAS, PARA GARANTIZAR LA PROTECCIÓN CIUDADANA ANTE CUALQUIER SITUACIÓN QUE IMPLIQUE AMENAZA, VULNERABILIDAD O RIESGO.\n	294	1	4	14	158
2.5.5.14. MANTENER Y REFORZAR LA LUCHA FRONTAL CONTRA LA PRODUCCIÓN, TRÁFICO Y CONSUMO ILÍCITO DE DROGAS, LEGITIMACIÓN DE CAPITALES Y DELINCUENCIA ORGANIZADA, CONSIDERADOS ASUNTOS DE SEGURIDAD DE ESTADO, DE CONFORMIDAD CON LAS LEYES NACIONALES, CONVENIOS, ACUERDOS Y TRATADOS INTERNACIONES.\n	295	1	4	14	158
2.5.5.15. FORTALECER LOS PROCESOS EN MATERIA DE IDENTIFICACIÓN, MIGRACIÓN Y EXTRANJERÍA, MEDIANTE LA IMPLANTACIÓN DE ALTA TECNOLOGÍA, CON EL PROPÓSITO DE GARANTIZAR EL DERECHO A LA IDENTIDAD Y A LA SEGURIDAD JURÍDICA.\n	297	1	4	14	158
2.5.6.1. AVANZAR EN EL DESARROLLO DEL ORDENAMIENTO LEGAL DEL SISTEMA DE PLANIFICACIÓN PÚBLICA Y POPULAR.\n	298	1	4	14	159
2.5.6.3. OPTIMIZAR LOS PROCESOS DE DEFINICIÓN, FORMULACIÓN, EJECUCIÓN, CONTROL Y EVALUACIÓN DE LAS POLÍTICAS PÚBLICAS, REGULANDO LA RELACIÓN ENTRE LOS DISTINTOS NIVELES POLÍTICOS DEL PODER PÚBLICO, Y LA RELACIÓN DE ÉSTOS CON EL PODER POPULAR.\n	299	1	4	14	159
2.5.6.6. ESTABLECER MECANISMOS DE FORMACIÓN INTEGRAL EN MATERIA DE PLANIFICACIÓN A LOS SERVIDORES Y SERVIDORAS PÚBLICOS, ASÍ COMO A LOS VOCEROS DEL PODER POPULAR, ORIENTADOS AL FORTALECIMIENTO DE LAS CAPACIDADES TÉCNICAS PARA EL DESARROLLO DE PROYECTOS Y EL DISEÑO DE POLÍTICAS PÚBLICAS.\n\n	300	1	4	14	159
2.5.6.7. CONSOLIDAR LA DEMOCRACIA PROTAGÓNICA Y PARTICIPATIVA DEL PUEBLO, DANDO SIGNIFICANCIA AL PAPEL PLANIFICADOR DE LOS CONSEJOS COMUNALES, QUE SE INCORPORAN AL SISTEMA NACIONAL DE PLANIFICACIÓN PÚBLICA A TRAVÉS DEL CONSEJO DE PLANIFICACIÓN COMUNAL Y LAS INSTANCIAS DE PLANIFICACIÓN DE LOS CONSEJOS COMUNALES.	301	1	4	14	159
2.5.7.1. DESARROLLAR INDICADORES Y ESTADÍSTICAS CON EL PODER POPULAR PARA SER INCLUIDOS EN EL SISTEMA ESTADÍSTICO NACIONAL.	302	1	4	14	160
2.5.7.2. FORTALECER LA PRODUCCIÓN, INTEROPERABILIDAD E INTERCAMBIO DE INFORMACIÓN ESTADÍSTICA OFICIAL PRODUCIDA POR ORGANISMOS, ENTES Y EMPRESAS DEL ESTADO.\n	303	1	4	14	160
2.5.7.3. IMPULSAR EL DESARROLLO DE LA CARTOGRAFÍA CON FINES ESTADÍSTICOS Y EL MAPEO DE LAS POLÍTICAS SOCIALES.\n\n	304	1	4	14	160
2.5.7.6. DESARROLLAR UN NUEVO SISTEMA DE INDICADORES DEL VIVIR BIEN, QUE PERMITA UNA EFECTIVA EVALUACIÓN Y VISIBILIZACIÓN DE LOS AVANCES DE LA REVOLUCIÓN BOLIVARIANA.	305	1	4	14	160
2.5.8.2. ADECUAR Y FORTALECER LAS PLATAFORMAS DE LAS INSTITUCIONES DEL ESTADO COMO VÍA PARA MEJORAR LA EFICIENCIA EN EL INTERCAMBIO DE DATOS NECESARIO PARA EL DESARROLLO DEL GOBIERNO ELECTRÓNICO.\n	306	1	4	14	161
2.2.12.10. IMPULSAR LA TRANSFORMACIÓN UNIVERSITARIA Y LA FORMACIÓN TÉCNICO-PROFESIONAL, PARA SU VINCULACIÓN CON LOS OBJETIVOS DEL PROYECTO NACIONAL. \n	307	1	4	11	144
3.1.2.9. CONSTRUIR DOS CONDOMINIOS INDUSTRIALES, UNO EN EL ÁREA DE CARABOBO Y OTRO EN EL ÁREA DE JUNÍN, PARA EL SUMINISTRO DE SERVICIOS DE HIDRÓGENO, NITRÓGENO, AIRE COMPRIMIDO, VAPOR, AGUA INDUSTRIAL Y DE ENFRIAMIENTO, ALMACENAMIENTO DE COQUE Y AZUFRE, Y DISTRIBUCIÓN DE ELECTRICIDAD, A LOS NUEVOS MEJORADORES.	308	1	5	15	66
3.1.2.5. PERFORAR EN LOS BLOQUES ASIGNADOS 10.550 POZOS HORIZONTALES DE PETRÓLEO, AGRUPADOS EN 520 MACOLLAS DE PRODUCCIÓN.	309	1	5	15	66
3.2.7.4. FORTALECER EL POSICIONAMIENTO INTERNACIONAL DE VENEZUELA COMO DESTINO TURÍSTICO, A TRAVÉS DE LA PROMOCIÓN TURÍSTICA.	310	1	5	16	87
4.1.7.1. FORTALECER EL BANCO DEL SUR COMO UNA INSTITUCIÓN PARA LA INTEGRACIÓN FINANCIERA REGIONAL.\n	311	1	6	19	102
5.1.3.11. FOMENTAR MEDIOS DE PAGO ALTERNATIVOS QUE TRASCIENDAN EL USO DE MONEDAS (DE PAPEL Y METÁLICAS), FACILITANDO EL ESTABLECIMIENTO DEL COMERCIO JUSTO ENTRE LOS PUEBLOS SURAMERICANOS Y PAÍSES ALIADOS, A LA VEZ QUE SE MODIFIQUE LA INFLUENCIA DEL DÓLAR ESTADOUNIDENSE COMO PATRÓN REFERENCIAL EN EL COMERCIO INTERNACIONAL.	312	1	7	23	117
4.4.1.2. ESTABLECER LAS ALIANZAS NECESARIAS PARA NEUTRALIZAR LAS ACCIONES DE LAS POTENCIAS NEOCOLONIALES EN ORGANISMOS INTERNACIONALES.	313	1	6	22	112
5.2.1.4. MANTENER LA INDEPENDENCIA EN EL MANEJO DEL SISTEMA DE OBTENCIÓN, PURIFICACIÓN, ADMINISTRACIÓN Y SUMINISTRO DE AGUA POTABLE.	314	1	7	24	121
3.2.2.2. GENERAR UNA ESTRUCTURA DE SOSTÉN PRODUCTIVO, REDES REGIONALES, INFRAESTRUCTURA DE APOYO A LA PRODUCCIÓN, LOGÍSTICA Y DISTRIBUCIÓN QUE TIENDAN A CONSTRUIR ECONOMÍA DE ESCALA EN UNA NUEVA CULTURA ORGANIZATIVA.DESARROLLAR LA ESTRATEGIA DE CONGLOMERADOS Y ALIANZAS ESTRATÉGICAS A EFECTOS DE CANALIZAR LOS INSUMOS INDUSTRIALES ASÍ COMO LA DISTRIBUCIÓN DE LOS MISMOS, EN UNA DINÁMICA DE RUPTURA DEL METABOLISMO DEL CAPITAL. CONSTITUIR UNA RED DE TRANSPORTE ESTATAL ASÍ COMO UNA NUEVA LÓGICA AL SISTEMA DE TRANSPORTE NACIONAL QUE RACIONALICE LOS COSTOS Y GARANTICE LOS TIEMPOS DE LOS INSUMOS Y PRODUCTOS EN UN MARCO DE SOBERANÍA NACIONAL. ARTICULAR UN SISTEMA MULTIMODAL DE TRANSPORTE Y ALMACENAJE,RENTABLEY EFICIENTE PARA LA PRODUCCIÓN Y DISTRIBUCIÓN, A ESCALA NACIONAL E INTERNACIONAL. FORTALECER Y EXPANDIR REDES ALTERNAS DE DISTRIBUCIÓN DE PRODUCTOS SIN INTERMEDIACIÓN ESPECULATIVA. MODERNIZACIÓN DEL SISTEMA DE PUERTOS Y AEROPUERTOS ASÍ COMO NUEVAS INFRAESTRUCTURAS VOLCADAS SOBRE EL ORINOCO APURE.	315	1	5	16	82
3.4.3.7 CONFORMAR EL DISTRITO MOTOR BIRUACAACHAGUAS, ESTADOS GUÁRICO Y APURE.PROYECTO DINAMIZADOR: CENTRO DE CAÑA ETANOL, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	316	1	5	18	93
3.1.2.4. CONSTRUIR UNA NUEVA REFINERÍA EN EL COMPLEJO INDUSTRIAL JOSÉ ANTONIO ANZOÁTEGUI CON UNA CAPACIDAD DE PROCESAMIENTO DE 373 MBD Y LA PRIMERA ETAPA DE UNA NUEVA REFINERÍA EN CABRUTA, CON UNA CAPACIDAD DE PROCESAMIENTO DE 220 MBD	317	1	5	15	66
3.1.1.2. ALCANZAR EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	318	1	5	15	65
1.4.1.4. ESTABLECER UN SISTEMA INTEGRADO DE OPERACIONES INSTITUCIONALES EN LA CREACIÓN DEL CATASTRO RURAL.\n	723	1	3	6	29
3.1.7.2. CONSOLIDAR Y DESARROLLAR LOS SEIS POLOS PETROQUÍMICOS PLANIFICADOS: ANA MARÍA CAMPOS, MORÓN,JOSÉ ANTONIO ANZOÁTEGUI, PARAGUANÁ, NAVAY, PUERTO DE NUTRIAS Y GÜIRIA.	319	1	5	15	71
3.3.2.5. CONSOLIDAR UN SISTEMA DEFENSIVO TERRITORIAL CAPAZ DE DIRIGIR AL PAÍS EN TIEMPO DE GUERRA DESDE TIEMPO DE PAZ, ESTRATÉGICAMENTE DEFENSIVO Y EMINENTEMENTE POPULAR.	320	1	5	17	89
3.4.1.11. MAXIMIZAR EL SISTEMA PORTUARIO Y AEROPORTUARIO QUE PERMITA EL FLUJO E INTERCAMBIO ENTRE LOS CENTROS POBLADOS.\n	321	1	5	18	91
NO APLICA	322	1	6	19	105
NO APLICA	323	1	5	18	163
3.3.3.3. INCREMENTAR LA FORMACIÓN DE PROFESIONALES MILITARES Y CIVILES EN CONVENIOS CON PAÍSES HERMANOS,PARA CONTRIBUIR RECÍPROCAMENTE EN LA UNIDAD REGIONAL Y EN CÍVICO MILITAR.	324	1	5	17	90
3.1.6.4. INCREMENTAR LA CAPACIDAD DE EXTRACCIÓN DE LÍQUIDOS DE GAS NATURAL, DE ALTO VALOR COMERCIAL, EN 130 MBD, A TRAVÉS DE LOS PROYECTOS DE PROCESAMIENTO DE GAS EN EL ORIENTE DEL PAÍS.\n	326	1	5	15	70
3.1.1.2. ALCANZAR LA PRODUCCIÓN DE GAS NATURAL PARA EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	327	1	5	15	66
3.3.2.2. CONSOLIDAR Y PROFUNDIZAR LA DOCTRINA BOLIVARIANA, EN NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA.	328	1	5	17	89
3.1.6.7. SATISFACER LA DEMANDA DE GAS DOMÉSTICO A TRAVÉS DEL AUMENTO DE CAPACIDAD ALMACENAJE DE GLP.	329	1	5	15	70
3.1.9.3. CREAR LA ESCUELA TÉCNICA PETROLERA SOCIALISTA PARA LA CAPACITACIÓN DE LOS TÉCNICOS MEDIOS REQUERIDOS EN LA INDUSTRIA PETROLERA.	330	1	5	15	73
3.1.1.1. ALCANZAR CRUDO HASTA 3,3 MMBD PARA EL AÑO 2014 Y 6 MMBD PARA EL AÑO 2019.	331	1	5	15	65
3.1.2.1. DESARROLLAR LA PRODUCCIÓN DE LAS SIETE NUEVAS EMPRESAS MIXTAS YA ESTABLECIDAS DE PRODUCCIÓN Y PROCESAMIENTO DE LOS CRUDOS DE LA FORINOCO, PARA ALCANZAR LA CA2.090 MBD EN EL 2019.\n	332	1	5	15	66
3.1.2.2. ELEVAR LA PRODUCCIÓN,FAJA PETROLÍFERA DEL ORINOCO ACTUALMENTE DESARROLLADAS POR PDVSA Y LAS EMPRESA MIXTAS,2019, APLICANDO TECNOLOGÍAS QUE INCREMENTEN EL FACTOR DE RECOBRO.\n	333	1	5	15	66
3.1.2.3. CONSTRUIR CINCO NUEVOS MEJORADORES PARA CONVERTIR EL CRUDO EXTRAPESADO DE LA FAJA PETROLÍFERA DEL ORINOCO EN 8º API EN CRUDO MEJORADO DE 32 A 42 API CON UNA CAPACIDAD TOTAL DE 1 MMBD DE PROCESAMIENTO.	334	1	5	15	66
3.1.2.6. CONSTRUIR UNA CAPACIDAD DE ALMACENAMIENTO DE 20 MILLONES DE BARRILES DE CRUDO Y PRODUCTOS, Y EL TENDIDO DE 2.000 KM DE TUBERÍAS ENTRE OLEODUCTOS Y DILUENDUCTOS CON CAPACIDAD DE TRANSPORTAR 2,5 MMBD.\n	335	1	5	15	66
3.1.2.7. CONSTRUIR UN TERMINAL DE AGUAS PROFUNDAS EN EL ESTADO SUCRE PARA LA RECEPCIÓN Y DESPACHO DE CRUDOS Y PRODUCTOS, CON UNA CAPACIDAD DE EXPORTACIÓN DE 2,0 MMBD, ASÍ COMO TRES TERMINALES FLUVIALES DE SÓLIDOS Y LÍQUIDOS EN EL RÍO ORINOCO PARA EL ALMACENAMIENTO DE 120 MIL TONELADAS DE COQUE Y 90 MIL TONELADAS DE AZUFRE, ASÍ COMO EL DESPACHO DE 250 MBD DE CRUDO, TODO ELLO EN ARMONÍA CON EL AMBIENTE.	336	1	5	15	66
3.1.2.8. CONSTRUIR TRES PLANTAS TERMOELÉCTRICAS CON UNA CAPACIDAD TOTAL DE GENERACIÓN DE 2.100 MW, LAS CUALES EMPLEARÁN COQUE PETROLERO GENERADO POR EL PROCESO DE MEJORAMIENTO DE LOS CRUDOS DE LA FAJA PETROLÍFERA DEL ORINOCO, CONTRIBUYENDO ASÍ AL APROVECHAMIENTO DE LOS SUBPRODUCTOS GENERADOS Y AL MEJORAMIENTO DE LA MATRIZ ENERGÉTICA DE CONSUMO.	337	1	5	15	66
3.1.2.10. CREAR CINCO (5) BASES PETROINDUSTRIALES SOCIALISTAS (BPISOS) EN LA ZONA DE LA FAJA PETROLÍFERA DEL ORINOCO, EN LAS ÁREAS DE PALITAL, CHAGUARAMAS, SAN DIEGO\nDE CABRUTICA, SOLEDAD Y SANTA RITA PARA DESARROLLAR ACTIVIDADES DE METALMECÁNICA,\nSERVICIOS A POZOS, QUÍMICOS Y SERVICIOS ESPECIALIZADOS A REFINACIÓN.	338	1	5	15	66
3.1.2.11. DESARROLLAR FACILIDADES PORTUARIAS Y AÉREOPORTUARIAS EN EL EJE NORTE-SUR DEL RÍO ORINOCO.	339	1	5	15	66
3.1.3.1. CONTINUAR LAS ACTIVIDADES DE PERFORACIÓN,REHABILITACIÓN Y REPARACIÓN DE POZOS, QUE PERMITAN MANTENER LA PRODUCCIÓN.	340	1	5	15	67
3.1.3.2. MANTENER Y MEJORAR LOS PROYECTOS DE RECUPERACIÓN SECUNDARIA EXISTENTES E INCORPORAR NUEVOS PROYECTOS A TRAVÉS DE TECNOLOGÍAS DE INYECCIÓN DE AGUA Y GAS, INYECCIÓN CONTINÚA DE VAPOR Y SURFACTANTES. 	341	1	5	15	67
3.1.3.3. MANTENER Y MEJORAR LOS NIVELES DE CONFIABILIDAD Y MANTENIBILIDAD DE LA INFRAESTRUCTURA EXISTENTE.	342	1	5	15	67
3.1.4.1. DESARROLLAR LAS POTENCIALIDADES EXISTENTES EN EL CINTURÓN GASÍFERO DE VENEZUELA EN LOS PROYECTOS RAFAEL URDANETA Y MARISCAL SUCRE, PARA ALCANZAR UNA CAPACIDAD DE PRODUCCIÓN DE GAS DE 300 MMPCD PARA EL 2014 Y 2.030 MMPCD PARA EL AÑO 2019.	343	1	5	15	68
3.1.6.3. AMPLIAR LA RED DE TRANSPORTE DE GAS HASTA ALCANZAR 3.648 KM DE GASODUCTOS ENTRE EXISTENTES Y NUEVOS COMO LOS GASODUCTOS JOSÉ FRANCISCO BERMÚDEZ (SINORGAS) Y EL NORTE LLANERO FASE I.	344	1	5	15	70
3.1.7.4. INCREMENTAR EN UN 300% LA CAPACIDAD DE PRODUCCIÓN DE OLEFINAS Y RESINAS PLÁSTICAS TRADICIONALES, Y DESARROLLAR OTRAS CADENAS DE RESINAS PLÁSTICAS NECESARIAS\nPARA EL PAÍS, SUSTITUYENDO IMPORTACIONES.	345	1	5	15	71
3.1.7.6. CONTINUAR EN EL MARCO DE LA GRAN MISIÓN VIVIENDA VENEZUELA, DESARROLLANDO LAS FÁBRICAS MODULARES DE VIVIENDAS Y ACCESORIOS (PETROCASAS), INSTALANDO EN DIFERENTES ZONAS DEL PAÍS DIEZ NUEVAS PLANTAS, PARA ALCANZAR UNA PRODUCCIÓN DE 50.000 VIVIENDAS/AÑO, 800.000 VENTANAS/AÑO Y 800.000 PUERTAS/AÑO.	346	1	5	15	71
3.1.8.2. FORTALECER LOS PROCESOS DE CONSTRUCCIÓN DE PLATAFORMAS DE PERFORACIÓN Y PRODUCCIÓN DE LOS YACIMIENTOS COSTA AFUERA, A PARTIR DE LA EXPERIENCIA NACIONAL EN ESTA MATERIA, GARANTIZANDO LA DISPONIBILIDAD DE DICHOS EQUIPOS PARA EL DESARROLLO DE\nLA PRODUCCIÓN GASÍFERA, TAL COMO LA PLATAFORMA 4 DE FEBRERO QUE OPERA EN EL GOLFO DE PARIA, A FIN DE GARANTIZAR LA OPORTUNA DISPONIBILIDAD DE LOS EQUIPOS REQUERIDOS EN EL DESARROLLO DE MARISCAL SUCRE, CARDÓN IV Y PLATAFORMA DELTANA.	347	1	5	15	72
3.1.8.3. IMPULSAR LAS ACTIVIDADES DE LAS EMPRESAS ESTATALES DE MANTENIMIENTO, PARA MEJORAR EL TIEMPO, SERVICIO Y COSTO DE LAS PARADAS DE PLANTA, EN EL SISTEMA DE  REFINACIÓN NACIONAL Y MEJORADORES.\n	348	1	5	15	72
3.1.8.4. IMPULSAR EL PROCESAMIENTO DE SUBPRODUCTOS PETROLEROS, MEDIANTE LA CREACIÓN DE EMPRESAS ESTATALES, MIXTAS Y CONGLOMERADOS INDUSTRIALES PARA LA PRODUCCIÓN DE INSUMOS REQUERIDOS POR LAS INDUSTRIAS BÁSICAS, QUE PERMITAN INTEGRAR LAS CADENAS DE PETRÓLEO Y GAS NATURAL CON LAS DE HIERRO-ACERO Y BAUXITA-ALUMINIO, A TRAVÉS DE LA INSTALACIÓN DE PLANTAS DE CALCINACIÓN DEL COQUE, Y RECUPERACIÓN DE METALES DEL FLEXICOQUE Y COQUE VERDE, FERROVANADIO, BREA DE PETRÓLEO Y ORIMATITA, ENTRE LOS CASOS\nDE NEGOCIO IDENTIFICADOS.	349	1	5	15	72
3.1.12.2. SINCRONIZAR LA PRODUCCIÓN DE LOS DISTINTOS COMBUSTIBLES CON LA DEMANDA INTERNA, ASEGURANDO LOS DÍAS DE COBERTURA REQUERIDOS Y SU DISPONIBILIDAD EN EL TERRITORIO NACIONAL.	350	1	5	15	76
3.1.9.1. CONTINUAR CON EL DESARROLLO EN EL PAÍS DE LAS TECNOLOGÍAS PROPIAS DE MEJORAMIENTO DE CRUDOS PESADOS Y EXTRAPESADOS Y PROMOVER SU USO, A TRAVÉS DE PROCESOS\nDE MEJORAMIENTO EN SITIO, PROCESOS DE CONVERSIÓN PROFUNDA Y PROCESOS DE VISCO REDUCCIÓN.	351	1	5	15	73
3.1.14.1. CONSOLIDAR LAS ALIANZAS ESTRATÉGICAS ENTRE LOS PAÍSES SIGNATARIOS DE LOS ACUERDOS DEL ALBA, PETROCARIBE, ACUERDOS DE COOPERACIÓN ENERGÉTICA Y CONVENIOS INTEGRALES DE COOPERACIÓN.	353	1	5	15	78
3.1.12.5. EJECUTAR LOS PROYECTOS DE ADECUACIÓN, REHABILITACIÓN, CONSTRUCCIÓN Y MANTENIMIENTO DE INSTALACIONES Y EQUIPOS DEL SISTEMA ELÉCTRICO.	354	1	5	15	76
3.1.11.4. REFORZAR EL SISTEMA DE AUTOSUFICIENCIA ELÉCTRICA EN LOS CAMPOS OPERACIONALES, ASEGURANDO AUTONOMÍA CON EL SISTEMA ELÉCTRICO NACIONAL Y ESQUEMAS FLEXIBLES PARA LA GENERACIÓN DE 1.260 MW.	355	1	5	15	75
3.1.13.5. AMPLIAR Y MEJORAR EL USO DE LA RED DE TRANSMISIÓN Y DISTRIBUCIÓN DE ELECTRICIDAD, MEDIANTE LA IMPLEMENTACIÓN DE: A) PLAN ROBUSTO, QUE PERMITE AMPLIAR LA CAPACIDAD DE TRANSMISIÓN EN LAS SIGUIENTES SUBESTACIONES: SUBESTACIÓN SAN CARLOS II 400/115 KV, CHIVACOA II 400/115 KV, PORTUGUESA 400/115 KV, CARABOBO II 400/230 KV Y SU SISTEMA DE TRANSMISIÓN ASOCIADO, SVC EN LA SUBESTACIÓN HORQUETA 230 KV, LÍNEA N° 2 URIBANTE-EL VIGÍA II Y EL VIGIA II-BUENA VISTA AISLADA 400 KV, SISTEMA A 400 KV EN EL OCCIDENTE DEL PAÍS (EL VENADO-BUENA VISTA). EN SUBTRANSMISIÓN: AMPLIACIÓN DEL SISTEMA DE ENLACE TRANSMISIÓN-DISTRIBUCIÓN A 115/13.8-34.5 KV, PARA ATENDER LAS CARGAS DE LOS USUARIOS FINALES. EN DISTRIBUCIÓN: COMPENSAR A NIVEL DE DISTRIBUCIÓN LOS CIRCUITOS, PARA MEJORAR LOS FACTORES DE POTENCIA DE LAS CARGAS Y CONSTRUIR NUEVOS ALIMENTADORES PARA SUPLIR A LOS USUARIOS FINALES CON LA CALIDAD DE SERVICIO ADECUADA. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO EN LA REGIÓN OCCIDENTAL QUE AGRUPA LOS ESTADOS BARINAS,MÉRIDA, TÁCHIRA, APURE(ALTO APURE), TRUJILLO Y ZULIA, Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS: 45 SUBESTACIONES, 4.044 KM DE LÍNEAS DE TRANSMISIÓN, 7.096 KM DE LÍNEAS DE DISTRIBUCIÓN, 1.305 MVA EN DISTRIBUCIÓN Y 8.654 MW EN PLANTAS DE GENERACIÓN. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO EN LA REGIÓN CENTRAL, QUE AGRUPA LOS ESTADOS APURE, ARAGUA, CARABOBO, COJEDES, CAPITAL, FALCÓN, GUÁRICO, LARA, MIRANDA, PORTUGUESA, VARGAS Y YARACUY; Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS: 67 SUBESTACIONES, 4.075 KM DE LÍNEAS DE TRANSMISIÓN, 3.179 KM DE LÍNEAS DE DISTRIBUCIÓN, 8.488 MVA EN DISTRIBUCIÓN, 5.542 MW EN PLANTAS DE GENERACIÓN. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO ORIENTAL, QUE AGRUPA LOS ESTADOS ANZOÁTEGUI, BOLÍVAR, DELTA AMACURO, MONAGAS, NUEVA ESPARTA Y SUCRE, Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS:48 SUBESTACIONES, 4.110 KM DE LÍNEAS DE TRANSMISIÓN, 4.743 KM DE LÍNEAS DE DISTRIBUCIÓN,\n1.083 MVA EN DISTRIBUCIÓN Y 6.780 MW EN PLANTAS DE GENERACIÓN.	356	1	5	15	77
3.1.14.3. PROFUNDIZAR LAS RELACIONES DE COOPERACIÓN CON LOS PAÍSES EN LA REGIÓN, EN BASE A LOS PRINCIPIOS DE COMPLEMENTARIEDAD Y SOLIDARIDAD, CON EL PROPÓSITO DE PROVEERLE A LOS PAÍSES ALIADOS EL ACCESO A LA ENERGÍA.	357	1	5	15	78
3.1.15.2. EXPLORAR NUEVOS YACIMIENTOS MINERALES EN EL ESCUDO DE GUAYANA, SISTEMA MONTAÑOSO DEL CARIBE,CORDILLERA DE LOS ANDES Y SIERRA DE PERIJÁ, CON LA PROSPECCIÓN GEOLÓGICA Y LA UTILIZACIÓN DE NUEVAS TECNOLOGÍAS DE BAJO IMPACTO AMBIENTAL.	358	1	5	15	79
3.1.15.3. DUPLICAR LAS RESERVAS MINERALES DE BAUXITA, HIERRO, COLTÁN (NIOBIO Y TANTALITA), NÍQUEL, ROCA FOSFÓRICA, FELDESPATO Y CARBÓN, CON LA CERTIFICACIÓN DE LOS YACIMIENTOS UBICADOS EN EL ESCUDO DE GUAYANA, CORDILLERA DE LOS ANDES, SISTEMA MONTAÑOSO DEL CARIBE Y LA SIERRA DE PERIJÁ.	359	1	5	15	79
3.1.15.4. DUPLICAR LAS RESERVAS MINERALES DE ORO Y DIAMANTE CON LA CERTIFICACIÓN DE LOS YACIMIENTOS UBICADOS EN EL ESCUDO DE GUAYANA, PARA SU UTILIZACIÓN COMO BIENES TRANSABLES PARA EL FORTALECIMIENTO DE LAS RESERVAS INTERNACIONALES.	360	1	5	15	79
3.1.16.1. IMPULSAR EL DESARROLLO DE LA MINERÍA, PARTIENDO DE LA DEMANDA ENDÓGENA INDUSTRIAL COMO FUERZA MOTRIZ Y ARTICULANDO LA DEMANDA INTERNA CON LA DEMANDA INTERNACIONAL.	361	1	5	15	80
3.1.16.2. INTEGRAR LAS ACTIVIDADES MINERAS, EXPLOTANDO RACIONALMENTE LOS YACIMIENTOS MINERALES, A TRAVÉS DEL DESARROLLO DE LOS CONOCIMIENTOS CIENTÍFICOS Y TECNOLÓGICOS, QUE PERMITA ELEVAR LA PRODUCTIVIDAD Y MEJORAR LA EFICIENCIA DE LA PRODUCCIÓN EN EL SECTOR.	362	1	5	15	80
3.1.16.3. INCREMENTAR LA PRODUCCIÓN DE ORO Y DIAMANTE, ACTUALIZANDO TECNOLÓGICAMENTE LAS EMPRESAS ESTATALES DE ORO, CONFORMANDO EMPRESAS MIXTAS EN LAS CUALES LA REPÚBLICA TENGA EL CONTROL DE SUS DECISIONES Y MANTENGA UNA PARTICIPACIÓN MAYORITARIA, Y ORGANIZANDO LA PEQUEÑA MINERÍA EN UNIDADES DE PRODUCCIÓN DE PROPIEDAD SOCIAL.	363	1	5	15	80
3.1.16.4. CONFORMAR EMPRESAS MIXTAS PARA LA EXPLOTACIÓN Y PROCESAMIENTO DE BAUXITA, HIERRO, COLTÁN (NIOBIO Y TANTALITA), NÍQUEL, ROCA FOSFÓRICA, FELDESPATO Y CARBÓN; EN LAS CUALES LA REPÚBLICA TENGA EL CONTROL DE SUS DECISIONES Y MANTENGA UNA PARTICIPACIÓN MAYORITARIA.	364	1	5	15	80
3.1.4.2. ACELERAR LOS ESFUERZOS EXPLORATORIOS DEL CINTURÓN GASÍFERO DE VENEZUELA EN LAS ÁREAS BLANQUILLA, GOLFO DE VENEZUELA, ENSENADA DE BARCELONA, EL NORTE DE MARISCAL SUCRE Y FACHADA ATLÁNTICA, PARA LA BÚSQUEDA DE NUEVAS RESERVAS DE GAS NO ASOCIADO QUE PERMITA INCORPORAR RESERVAS DE GAS CON EXPECTATIVA EXPLORATORIA DE 135 BPC DE GAS NATURAL.	365	1	5	15	68
3.1.5.2. ADECUAR Y EXPANDIR LAS REFINERÍAS EXISTENTES DE EL PALITO, PUERTO LA CRUZ Y COMPLEJO REFINADOR PARAGUANÁ.	366	1	5	15	69
3.1.6.1. ADECUAR Y EXPANDIR LOS SISTEMAS DE TRANSPORTE POR POLIDUCTOS EXISTENTES, TALES COMO EL SISTEMA DE SUMINISTROS LOS ANDES (SUMANDES) Y EL SISTEMA SUMINISTRO ORIENTE (SISOR), Y LA CONSTRUCCIÓN DE NUEVOS POLIDUCTOS COMO PUERTO LA CRUZ- MATURÍN, BAJO GRANDE-PLANTA RAMÓN LAGUNA, EL VIGÍA-LA FRÍA, Y EL PALITO-BARQUISIMETO.	367	1	5	15	70
3.1.6.6. FORTALECER Y AMPLIAR LA COBERTURA DE LA RED DE DISTRIBUCIÓN DE GAS METANO, CON EL FIN DE DESPLAZAR EL CONSUMO DE GAS LICUADO DE PETRÓLEO (GLP) Y BRINDAR MAYOR CALIDAD DE VIDA A LA POBLACIÓN Y MENOR CONTAMINACIÓN DEL AMBIENTE, A TRAVÉS DEL TENDIDO DE 8.625 KM DE REDES DE TUBERÍA Y 16.818 KM DE LÍNEAS INTERNAS PARA BENEFICIAR A 728.900 FAMILIAS.	368	1	5	15	70
3.1.7.1. DIVERSIFICAR EL PROCESAMIENTO DE GAS NATURAL, NAFTAS Y CORRIENTES DE REFINACIÓN, PARA LA GENERACIÓN DE PRODUCTOS DE MAYOR VALOR AGREGADO Y LA ELIMINACIÓN DE IMPORTACIONES DE INSUMOS PARA REFINACIÓN.	369	1	5	15	71
1.3.6.3. IMPULSAR EN EL SENO DE PETROCARIBE PROYECTOS ORIENTADOS A LA DISMINUCIÓN DEL CONSUMO ENERGÉTICO.	710	1	3	5	21
3.1.9.5. IMPULSAR LA FORMACIÓN TÉCNICA Y POLÍTICOIDEOLÓGICA, ASÍ COMO LA INVESTIGACIÓN Y LOS ENCUENTROS DE SOCIALIZACIÓN, PARA LA INDUSTRIALIZACIÓN DE LOS HIDROCARBUROS, A TRAVÉS DEL ESTABLECIMIENTO DE INSTITUCIONES EDUCATIVAS, CIENTÍFICAS Y TECNOLÓGICAS, QUE CONTRIBUYAN EN EL DESARROLLO DE LOS SECTORES DE TRANSFORMACIÓN AGUAS ABAJO.	370	1	5	15	73
3.1.9.6. IMPULSAR LA INVESTIGACIÓN EN LAS ÁREAS DE COQUE Y MINERALES PROVENIENTES DEL PROCESAMIENTO DE LOS CRUDOS DE LA FAJA PETROLÍFERA DEL ORINOCO, PARA SU INDUSTRIALIZACIÓN.	371	1	5	15	73
3.1.10.1. PROFUNDIZAR LAS ESTRATEGIAS DE DIVERSIFICACIÓN DE MERCADOS DE CRUDOS Y PRODUCTOS DERIVADOS HACIA MERCADOS QUE PERMITAN LA MEJOR VALORIZACIÓN DEL CRUDO VENEZOLANO Y ELIMINE LA DEPENDENCIA DEL MERCADO NORTEAMERICANO.	372	1	5	15	74
3.1.10.3. INCREMENTAR LA EXPORTACIÓN DE CRUDO HACIA ASIA, EN ESPECIAL CHINA, INDIA Y JAPÓN PARA ALCANZAR UN VOLUMEN DE EXPORTACIÓN DE 3.162 MBD EN EL 2019.	373	1	5	15	74
3.1.11.1. INTENSIFICAR LAS ACCIONES NECESARIAS PARA GARANTIZAR LA DISPONIBILIDAD DE LOS RECURSOS HUMANOS,LOGÍSTICOS Y FINANCIEROS REQUERIDOS PARA EJECUTAR LOS PLANES, PROGRAMAS Y PROYECTOS DE PETRÓLEOS DE VENEZUELA Y SUS EMPRESAS MIXTAS.\n	374	1	5	15	75
3.1.11.2. INCREMENTAR LA CONFIABILIDAD Y DISPONIBILIDAD DE LA INFRAESTRUCTURA DE RECOLECCIÓN, TRATAMIENTO, ALMACENAMIENTO, EMBARQUE, MEDICIÓN Y REFINACIÓN DE HIDROCARBUROS DE PETRÓLEOS DE VENEZUELA Y SUS EMPRESAS MIXTAS.	375	1	5	15	75
3.1.11.3. GARANTIZAR LA CAPACITACIÓN Y FORMACIÓN DEL TALENTO HUMANO PARA EJECUTAR EFICIENTEMENTE LAS ACTIVIDADES DE LA CADENA DE VALOR DE LOS HIDROCARBUROS EN PETRÓLEOS DE VENEZUELA.	376	1	5	15	75
3.1.13.2. DIVERSIFICAR LA MATRIZ DE INSUMOS PARA LA GENERACIÓN ELÉCTRICA, FAVORECIENDO EL USO DEL GAS NATURAL, EL COQUE Y OTRAS FUENTES DE ENERGÍA.	378	1	5	15	77
3.1.13.6. SATISFACER LOS REQUERIMIENTOS DE DEMANDA DE ELECTRICIDAD MEDIANTE EL SESARROLLO DE INFRAESTRUCTURA ELÉCTRICA, CON CRITERIOS DE EFICIENCIA, USO RACIONAL, CALIDAD, CONTINUIDAD, CONFIABILIDAD, RESPETO AL MEDIO AMBIENTE, SEGURIDAD Y SUSTENTABILIDAD ECONÓMICA FINANCIERA.	380	1	5	15	77
3.1.16.8. CREAR EL FONDO DE DESARROLLO SOCIAL MINERO CON APORTES FINANCIEROS DE LA ACTIVIDAD MINERA, PARA GARANTIZAR LA SEGURIDAD SOCIAL DEL TRABAJADOR.	381	1	5	15	80
3.2.1.3. EXPANDIR Y DESARROLLAR LA PRODUCCIÓN PRIMARIA Y APROVECHAMIENTO FORESTAL DEL PAÍS, AMPLIANDO LAS PLANTACIONES EN VOLUMEN Y TERRITORIALMENTE, E INFRAESTRUCTURA DE TRANSFORMACIÓN EN TODA LA CADENA PRODUCTIVA, PARA MUEBLES, VIVIENDAS, PAPEL E INSUMOS DE OTROS PROCESOS INDUSTRIALES; ELEVANDO LA SUPERFICIE PLANTADA DE 500 MIL HA A 2 MILLONES DE HA, ASÍ COMO SU TRANSFORMACIÓN INTEGRAL EN EL PAÍS Y SANEAMIENTO Y PREVENCIÓN EN LAS SUPERFICIES PLANTADAS. DIVERSIFICAR LA PLANTACIÓN Y PRODUCCIÓN FORESTAL. ALCANZAR 1.167 MIL M  DE MADERA PROCESADA EN EL 2014 Y LOS 3.160 MIL M 33 EN EL 2016, ESTABILIZÁNDOSE HASTA 2019. PROYECTAR LAS CAPACIDADES PARA UN CONSUMO ANUAL DE 6,8 MILLONES DE M/AÑO PARA EL PERIODO 2020-2030. 	382	1	5	16	81
3.2.1.5. DESARROLLAR EL APROVECHAMIENTO SOBERANO TANTO EN LA EXTRACCIÓN COMO EN EL PROCESAMIENTO DE LOS MINERALES NO METÁLICOS; TÉCNICAS DE MAXIMIZACIÓN DEL RENDIMIENTO  CUIDADO AMBIENTAL, EN ESPECIAL DE LAS CADENAS DE CEMENTO Y AGREGADOS DE CONSTRUCCIÓN, VIDRIO E INSUMOS PRODUCTIVOS ESPECIALES (FELDESPATO, CAOLÍN,CAL, CAL SIDERÚRGICA, YESO, CALIZA, SÍLICE, SODA ASH, ENTRE OTROS) Y NUEVOS DESARROLLOS COMO EL COLTÁN.	383	1	5	16	81
3.1.4.3. ACELERAR LA INCORPORACIÓN DE CONDENSADO, HIDROCARBURO DE ALTO VALOR COMERCIAL, QUE GENERA LAS ACTIVIDADES DE EXPLOTACIÓN DE LOS RECURSOS DE HIDROCARBUROS\nCOSTA AFUERA, LA CUAL APORTARÁ MÁS DE 64MBD AL 2019.\n	384	1	5	15	68
3.1.5.1. ADECUAR Y EXPANDIR EL SISTEMA DE REFINACIÓN NACIONAL DE 1,3 MMBD EN EL 2013 A 1,8 MMBD EN EL 2019, IMPULSANDO UN MAYOR PROCESAMIENTO DE LOS CRUDOS PESADOS Y EXTRAPESADOS DE LA FAJA PETROLÍFERA DEL ORINOCO, Y ADAPTARLO A LAS EXIGENCIAS DE CALIDAD DE PRODUCTOS EN LOS MERCADOS NACIONAL E INTERNACIONAL.	385	1	5	15	69
3.1.5.3. CONSTRUIR DOS NUEVAS REFINERÍAS, BATALLA DE SANTA INÉS DE 100 MBD Y PETROBICENTENARIO DE 373 MBD, PARA BALANCEAR EL SUMINISTRO DEL MERCADO INTERNO E INCREMENTAR EL CONTENIDO DE PRODUCTOS EN LA CESTA DE EXPORTACIÓN DE VENEZUELA.	386	1	5	15	69
3.1.6.2. ADECUAR Y AMPLIAR LA RED DE PLANTAS DE DISTRIBUCIÓN DE COMBUSTIBLES, IMPULSANDO LA CONSTRUCCIÓN DE NUEVOS SISTEMAS,ASÍ COMO LA ADECUACIÓN DE LOS EXISTENTES; ENTRE ELLAS: EL GUAMACHE, EN LA ISLA DE MARGARITA, Y PUERTO PESQUERO GÜIRIA, Y LA CONSTRUCCIÓN DE NUEVAS PLANTAS, COMO PLANTA DEL OESTE DE CARACAS, GUATIRE, CATIA LA MAR, BATALLA SANTA INÉS, CABRUTA Y JOSE.	387	1	5	15	70
3.1.7.3. INCREMENTAR LA PRODUCCIÓN DE FERTILIZANTES NITROGENADOS Y FOSFATADOS EN UN 43%, LO CUAL CUBRIRÁ LA DEMANDA NACIONAL Y CONVERTIRÁ A VENEZUELA EN UN EXPORTADOR DE FERTILIZANTES PARA TODA LA REGIÓN.	388	1	5	15	71
3.1.8.1. INCREMENTAR LA CAPACIDAD DE ENSAMBLAJE Y FABRICACIÓN EN EL PAÍS DE TALADROS Y EQUIPOS DE SERVICIOS A POZOS, A TRAVÉS DE EMPRESAS COMO LA INDUSTRIA CHINA VENEZOLANA DE TALADROS (ICVT), ASÍ COMO LA CAPACIDAD DE FABRICACIÓN NACIONAL DE TUBULARES, VÁLVULAS Y OTROS BIENES DE USO EN OPERACIONES PETROLERAS.	389	1	5	15	72
3.1.9.2. POSICIONAR EL USO DE TECNOLOGÍAS DE RECUPERACIÓN SECUNDARIA Y TERCIARIA DE CRUDOS PESADOS Y EXTRAPESADOS, PARA INCREMENTAR EL FACTOR DE RECOBRO EN LOS YACIMIENTOS, TALES COMO INYECCIÓN CONTINUA DE VAPOR, COMBUSTIÓN IN SITU E INYECCIÓN DE SURFACTANTES.	390	1	5	15	73
3.1.9.4. IMPLEMENTAR A NIVEL NACIONAL LA UNIVERSIDAD DE LOS HIDROCARBUROS, A FIN DE CUMPLIR CON LA FORMACIÓN TÉCNICA Y POLÍTICO-IDEOLÓGICA DE CUADROS PARA LAS ÁREAS DE DESARROLLO PETROLERO, EN PARTICULAR PARA LA FAJA PETROLÍFERA DEL ORINOCO Y COSTA AFUERA.	391	1	5	15	73
3.1.10.2. PROFUNDIZAR LA ESTRATEGIA DE INTEGRACIÓN Y POSICIONAMIENTO DE VENEZUELA\nEN LATINOAMÉRICA Y EL CARIBE, MEDIANTE LA CONSTRUCCIÓN DE UN CIRCUITO DE REFINACIÓN QUE ARTICULE CON LAS REFINERÍAS EN VENEZUELA PARA CONTRARRESTAR LA INFLUENCIA EN LA FORMACIÓN DE PRECIOS DE LOS COMBUSTIBLES QUE TIENEN OTROS PAÍSES,ASI COMO EN INCREMENTAR LA EXPORTACIÓN DE CRUDOS Y PRODUCTOS HACIA ESTAS REGIONES PARA ALCANZAR UN VOLUMEN DE 1.335 MBD EN EL 2019.	392	1	5	15	74
3.1.11.5. OPTIMIZAR LA CAPACIDAD DE MANEJO DE OPERACIONES ACUÁTICAS EN EL LAGO DE MARACAIBO Y TODAS LAS EMBARCACIONES PETROLERAS A NIVEL NACIONAL.	393	1	5	15	75
3.1.11.6. PROMOVER LA FABRICACIÓN E INCREMENTAR LA CAPACIDAD NACIONAL DE ENSAMBLAJE Y MANTENIMIENTO DE TALADROS, ASÍ COMO LA CAPACIDAD DE TRANSPORTE Y LOGÍSTICA QUE PERMITA REDUCIR LOS TIEMPOS IMPRODUCTIVOS, ATENDER LOS PLANES DE CRECIMIENTO Y FORTALECER EL CONTROL DE LAS ACTIVIDADES MEDULARES.	394	1	5	15	75
3.1.12.1. DIVERSIFICAR LA MATRIZ DE ENERGÍA PRIMARIA Y ADECUAR EL CONSUMO ENERGÉTICO A LOS MEJORES ESTÁNDARES DE EFICIENCIA, INCORPORANDO COQUE, CARBÓN Y ENERGÍAS ALTERNATIVAS.	395	1	5	15	76
3.1.12.4. REFORZAR PLANES DE CONTINGENCIA EN MATERIA DE PRODUCCIÓN Y DISPONIBILIDAD ENERGÉTICA, PARA ATENDER OPORTUNAMENTE LOS EVENTOS DE FUERZA MAYOR.	396	1	5	15	76
3.1.13.7. FOMENTAR EL USO EFICIENTE DE LA ENERGÍA ELÉCTRICA, A TRAVÉS DE UNA CULTURA DE CONSUMO EFICIENTE Y LA UTILIZACIÓN DE FUENTES ALTERNAS Y RENOVABLES.	397	1	5	15	77
3.1.13.8. GARANTIZAR EL SUMINISTRO ELÉCTRICO PARA LOS PROYECTOS ASOCIADOS CON LAS MISIONES SOCIALES, CON ÉNFASIS EN LA GRAN MISIÓN VIVIENDA VENEZUELA, ASÍ COMO PARA\nNUEVOS PROYECTOS SOCIOPRODUCTIVOS PREVISTOS EN ESTE PLAN.	398	1	5	15	77
3.1.13.9. IMPULSAR Y GARANTIZAR LA SEGURIDAD INTEGRAL Y EL RESGUARDO DE LAS INSTALACIONES DEL SISTEMA ELÉCTRICO.	399	1	5	15	77
3.1.14.2. PROFUNDIZAR LAS ALIANZAS POLÍTICAS Y ECONÓMICAS CON AQUELLOS PAÍSES CON POSICIONAMIENTO GEOESTRATÉGICO FAVORABLE Y CUYOS INTERESES CONVERJAN CON LOS DE NUESTRA NACIÓN, FAVORECIENDO LA CONSTRUCCIÓN DE UN MUNDO PLURIPOLAR.	400	1	5	15	78
3.1.15.1. INCREMENTAR EL NIVEL DE PROSPECCIONES GEOLÓGICAS PARA AUMENTAR LA CERTIFICACIÓN DE RESERVAS DE MINERALES A NIVEL NACIONAL.\n	401	1	5	15	79
3.1.16.6. PROMOVER EL DESARROLLO DE TECNOLOGÍAS MINERAS QUE DISMINUYAN EL IMPACTO AMBIENTAL,LOS VOLÚMENES DE MATERIAL RESIDUAL Y EL PROCESAMIENTO SUPERFICIAL DEL MATERIAL ÚTIL; APROVECHANDO EL POTENCIAL DE LAS UNIVERSIDADES E INSTITUTOS DEL PAÍS Y LOS CONVENIOS DE TRANSFERENCIA TECNOLÓGICA FIRMADOS CON PAÍSES ALIADOS.	402	1	5	15	80
3.1.16.7. ORGANIZAR LA PEQUEÑA MINERÍA, CONCENTRADA EN LA EXPLOTACIÓN DE ORO Y DIAMANTE, EN UNIDADES DE PRODUCCIÓN DONDE EL ESTADO BRINDE APOYO TECNOLÓGICO Y FINANCIERO PARA PROTEGER LA SALUD DE LOS TRABAJADORES, LOS RECURSOS NATURALES Y EL MEDIO AMBIENTE.	403	1	5	15	80
3.3.3.1. PREPARAR Y ADIESTRAR A LOS INTEGRANTES DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA BAJO LA PREMISA FUNDAMENTAL DE LOS IDEALES BOLIVARIANOS DE INTEGRACIÓN, SOBERANÍA, INDEPENDENCIA, PARTIENDO DEL CONCEPTO DE GUERRA POPULAR PROLONGADA, ASIMÉTRICA Y DE RESISTENCIA.	428	1	5	17	90
3.2.1.4. INDUSTRIALIZAR EL SECTOR CONSTRUCCIÓN PARA ATENDER LA SATISFACCIÓN DEL DESARROLLO DE VIVIENDAS,EDIFICACIONES, EQUIPAMIENTO URBANO E INFRAESTRUCTURA.COMPONENTES ELÉCTRICOS, BOMBILLOS DE BAJO CONSUMO ELÉCTRICO, SALAS DE BAÑO, HERRAJES, PIEZAS DE FUNDICIÓN DE TAMAÑO MEDIO, GRIFERÍA, GRUPOS DE DUCHAS, UNIONES Y CONEXIONES DE BRONCE, PINTURA: EQUIPOS Y MAQUINARIAS DE CONSTRUCCIÓN; TECNIFICACIÓN E INDUSTRIALIZACIÓN DE SISTEMAS CONSTRUCTIVOS, ENTRE OTROS.	404	1	5	16	81
3.2.1.9. APLICAR MECANISMOS DE FOMENTO Y REGULACIÓN  PARA FORTALECER EL APARATO PRODUCTIVO NACIONAL EN LOS SECTORES ESTRATÉGICOS.	405	1	5	16	81
3.2.3.1. ESTABLECER ALIANZAS ESTRATÉGICAS EN UN MUNDO PLURIPOLAR QUE GARANTICEN LA TRANSFERENCIA TECNOLÓGICA Y LA MEJORA Y HUMANIZACIÓN DE LOS PROCESOS PRODUCTIVOS.	406	1	5	16	83
3.1.6.5. INCREMENTAR LA CAPACIDAD DE COMPRESIÓN DE GAS PARA SU UTILIZACIÓN EN EL SECTOR INDUSTRIAL Y DOMÉSTICO, ASÍ COMO EN LAS OPERACIONES DE PRODUCCIÓN DE LA INDUSTRIA PETROLERA MEDIANTE LA CONSTRUCCIÓN DE LA INFRAESTRUCTURA NECESARIA QUE GARANTICE EL MANEJO OPORTUNO DE NUEVOS REQUERIMIENTOS.	407	1	5	15	70
3.1.6.8. REACONDICIONAR E INCREMENTAR LA CAPACIDAD DE ALMACENAMIENTO DE CRUDO MEDIANTE LA ADECUACIÓN Y EXPANSIÓN DE LA INFRAESTRUCTURA EXISTENTE.	408	1	5	15	70
3.1.7.5. EXPANDIR EN 87% LA CAPACIDAD INSTALADA DEL SECTOR PRODUCTOR DE QUÍMICOS, HACIENDO ÉNFASIS EN LA PRODUCCIÓN DE AROMÁTICOS Y EL DESARROLLO DE LAS CADENAS AGUAS ABAJO DEL METANOL Y LA UREA.	409	1	5	15	71
3.1.13.10. CREAR UN FONDO DE DESARROLLO PARA LAS INVERSIONES DEL SECTOR ELÉCTRICO.	410	1	5	15	77
3.2.1.10. IMPULSAR EL ESTABLECIMIENTO DE NORMAS EN LOS ACUERDOS COMERCIALES BILATERALES Y REGIONALES,ORIENTADAS A FORTALECER LAS CAPACIDADES PRODUCTIVAS NACIONALES Y TRANSFERENCIA TECNOLÓGICA, ASÍ COMO LA COMPLEMENTARIEDAD DE LAS CADENAS PRODUCTIVAS REGIONALES Y DE LA NUEVA GEOPOLÍTICA INTERNACIONAL PARA FORTALECER EL APARATO PRODUCTIVO NACIONAL, E IGUALMENTE A CORREGIR EL DAÑO O AFECTACIÓN DE LA PRODUCCIÓN NACIONAL CAUSADA POR EL INCREMENTO DE IMPORTACIONES O LA PRESENCIA DE PRÁCTICAS DESLEALES EN LAS MISMAS.	411	1	5	16	81
4.3.3.2. ACOMPAÑAR LA ORGANIZACIÓN Y REALIZACIÓN DE FOROS INTERNACIONALES DE MOVIMIENTOS SOCIALES Y ORGANIZACIONES POPULARES, CON EL FIN DE RECOGER SUS REIVINDICACIONES Y PROPUESTAS PARA INCORPORARLAS EN LA AGENDA POLÍTICA GLOBAL.	412	1	6	21	110
3.2.3.4. FOMENTAR EL USO DE TECNOLOGÍA Y EL COMERCIO ELECTRÓNICO SEGURO EN EL INTERCAMBIO DE SERVICIOS, MATERIAS PRIMAS, BIENES SEMI-ELABORADOS Y PRODUCTOS FINALES, COMO APORTE A LA REDUCCIÓN DE LOS ESLABONES DE LAS CADENAS DE COMERCIALIZACIÓN DE BIENES Y SERVICIOS BÁSICOS PARA LA POBLACIÓN, CONTRIBUYENDO AL ACERCAMIENTO ENTRE PRODUCTORES Y COMPRADORES, ASÍ COMO NUEVAS FORMAS ORGANIZATIVAS QUE ENFRENTEN EL MERCADO ESPECULATIVO.	413	1	5	16	83
3.2.4.4. DESARROLLAR EL DISEÑO, DESARROLLO DE MATERIA LES, INGENIERÍA DE PROCESOS PARA LA PRODUCCIÓN DE BIENES DE CAPITAL Y FÁBRICAS MADRES (FÁBRICAS DE FÁBRICAS). 	414	1	5	16	84
4.1.9.2. EXPANDIR EL ALCANCE DE LA RADIO DEL SUR COMO HERRAMIENTA COMUNICACIONAL PARA LA VISIBILIZACIÓN DE LOS PROCESOS POLÍTICOS DE LA REGIÓN.	415	1	6	19	104
3.2.5.2. AMPLIAR EL HORIZONTE PRODUCTIVO MEDIANTE LA CONSTRUCCIÓN DE LOS SIGUIENTES PROYECTOS ESTRUCTURANTES DE LA CADENA HIERRO-ACERO: A) FÁBRICA DE TUBOS SIN COSTURA; B) SIDERÚRGICA NACIONAL JOSÉ IGNACIO DE ABREU E LIMA; C) PLANTAS RECUPERADORAS DE MATERIAS PRIMAS; D) EN FERROMINERA DEL ORINOCO: PLANTA DE CONCENTRACIÓN DE MINERAL DE HIERRO (CUARCITAS FRIABLES), AMPLIACIÓN DEL MUELLE DE PALÚA, AUMENTO DE CAPACIDAD DE TRANSPORTE FERROVIARIO A 42 MM TN, DOTACIÓN DE MAQUINARIA, EQUIPOS Y REPUESTOS PARA MINAS; E) FORTALECIMIENTO Y DESARROLLO DEL SISTEMA DE TRANSFORMACIÓN NACIONAL PARA INCORPORAR VALOR AGREGADO.	416	1	5	16	85
3.2.5.8. DESARROLLAR LOS SIGUIENTES PROYECTOS EN CONCEPTUALIZACIÓN EN EL SECTOR AUTOMOTRIZ: A) FÁBRICA DE AUTOBUSES TANTO PARA REQUERIMIENTO NACIONAL COMO CAPACIDAD DE EXPORTACIÓN; B) NUEVAS CAPACIDADES EN PRODUCCIÓN DE CAMIONES DE CARGA PESADA; C) PLANTAS DE MAQUINARIA DE CONSTRUCCIÓN Y VIALIDAD D) NUEVAS ALIANZAS ESTRATÉGICAS PARA LA PRODUCCIÓN DE MOTOS Y MOTORES FUERA DE BORDA E) ALIANZA ESTRATÉGICA PARA LA AMPLIACIÓN DE CAPACIDADES EN PRODUCCIÓN AUTOMOTRIZ. LAS CAPACIDADES A GENERAR EN CAMIONES, AUTOBUSES, CARROS DE PASAJERO Y TRACTORES SERÁN CON PERFIL DE SATISFACCIÓN PLENA DEL MERCADO NACIONAL Y EXPORTACIÓN; EN ALIANZA CON LA NUEVA GEOPOLÍTICA MULTIPOLAR Y LAS ZONAS ECONÓMICAS DEL ALBA, PETROCARIBE Y MERCOSUR.	417	1	5	16	85
5.1.6.3. REALIZAR ESTUDIOS PARA EL DESARROLLO DE FUENTES ENERGÉTICAS MARINAS ESPECÍFICAMENTE LA OLAMOTRIZ Y LA MAREOMOTRIZ; CON EL FIN DE APROVECHAR LA POTENCIALIDAD DE NUESTRAS EXTENSAS COSTAS.\n	418	1	7	23	120
3.2.5.16. CONTINUAR AFIANZANDO EL DESARROLLO Y AMPLIACIÓN  DE LOS PROYECTOS RELATIVOS A LA FABRICACIÓN DE PRODUCTOS DEL ÁREA DE INFORMÁTICA Y CELULARES, CON CRECIENTE INCORPORACIÓN DE VALOR AGREGADO NACIONAL, TRANSFERENCIA TECNOLÓGICA Y ESQUEMAS DE EXPORTACIÓN HACIA PAÍSES ALIADOS, ESPECIALMENTE EN EL MARCO DE MERCOSUR.	419	1	5	16	85
1.3.7.1. INCENTIVAR A TRAVÉS DEL MERCOSUR PROYECTOS QUE PERMITAN DIVERSIFICAR LA ECONOMÍA VENEZOLANA.	711	1	3	5	25
3.3.1.4. REFORZAR LOS VÍNCULOS DE INTEGRACIÓN DE NUESTRA PATRIA CON PAÍSES HERMANOS PARA COMPARTIR CAPACIDADES Y CONOCIMIENTOS EN FUNCIÓN DEL VIVIR BIEN DE NUESTRO PUEBLO.	420	1	5	17	88
3.2.5.21. DESARROLLAR LAS CAPACIDADES INDUSTRIALES DE CONSTRUCCIÓN DE MAQUINARIA, EQUIPOS E INFRAESTRUCTURA DEL PAÍS Y DE LA REGIÓN. DESARROLLO DE SOPORTE A LA AGROINDUSTRIA. EQUIPAMIENTO AGRÍCOLA Y ALIMENTOS CONCENTRADOS. HACER ESPECIAL ÉNFASIS EN LA CADENA DEL FRÍO.	421	1	5	16	85
3.2.5.23. CREAR NUEVOS CANALES Y FORMAS DE DISTRIBUCIÓN-COMERCIALIZACIÓN A LOS PRODUCTOS Y SERVICIOS DE MANUFACTURA NACIONAL CON CALIDAD CERTIFICADA QUE PERMITAN EL BENEFICIO DE UN AMPLIO SECTOR DE LA POBLACIÓN DE MANERAECONÓMICA, CONSTANTE Y EFICIENTE, Y PROMOVER LA FIDELIDAD DE LOS BENEFICIARIOS AL SELLO “HECHO EN VENEZUELA”.	422	1	5	16	85
3.3.2.1. MEJORAR Y ADAPTAR LOS DISEÑOS CURRICULARES EN CORRESPONDENCIA CON LA ÉTICA BOLIVARIANA, EL CONCEPTO DE GUERRA POPULAR PROLONGADA Y ASIMÉTRICA Y LAS NUEVAS CONCEPCIONES Y NECESIDADES DEL SECTOR MILITAR.	423	1	5	17	89
3.2.5.24. GENERAR Y FORTALECER LOS SUBSISTEMAS DE NORMALIZACIÓN, METROLOGÍA Y EVALUACIÓN DE LA CONFORMIDAD DEL SISTEMA NACIONAL DE LA CALIDAD, REQUERIDOS PARA EL DESARROLLO DE LOS ESLABONES PRODUCTIVOS Y CONCRECIÓN DE LOS PROYECTOS DE LAS FABRICAS SOCIALISTAS IMPULSADOS POR EL ESTADO EN LA CONSTRUCCIÓN DEL SOCIALISMO BOLIVARIANO.	424	1	5	16	85
3.2.6.3. FORTALECER LA FORMACIÓN INTEGRAL TURÍSTICA A NIVEL NACIONAL, A TRAVÉS DEL CRECIMIENTO DEL COLEGIO UNIVERSITARIO HOTEL ESCUELA DE LOS ANDES VENEZOLANOS Y EL ESTABLECIMIENTO DE LAS REDE DE ESCUELAS DE OFICIOS EN TURISMO.	425	1	5	16	86
3.3.1.2. FOMENTAR LA TRANSFERENCIA TECNOLÓGICA EN CADA FASE DE DOTACIÓN DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA A TRAVÉS DE LA ACTIVACIÓN DE NUEVAS INDUSTRIAS Y ENTES GENERADORES DE BIENES Y SERVICIOS.	426	1	5	17	88
3.3.2.3. DESARROLLAR UN SISTEMA DE ENTRENAMIENTO Y PREPARACIÓN COMBATIVA MÁS EFICIENTE Y DE ACUERDO A NUESTRA REALIDAD.	427	1	5	17	89
3.1.16.5. CONFORMAR EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, FOMENTANDO LA TRANSFORMACIÓN DE MINERALES NO METÁLICOS, DE USO PRINCIPAL PARA LA CONSTRUCCIÓN DE OBRAS CIVILES, TALES COMO ARCILLAS BLANDAS, ARENAS, GRAVAS, GRANZÓN, GRANITO, GRANODIORITA, ESQUISTOS, MÁRMOL,GNEIS, CAL, YESO Y SAL.	429	1	5	15	80
3.2.1.1. EXPANDIR Y FORTALECER LAS CAPACIDADES DE EXTRACCIÓN Y PROCESAMIENTO PRIMARIO Y DESARROLLO AGUAS ABAJO DE LAS CADENAS DE HIERRO-ACERO Y ALUMINIO. DESCONCENTRAR LA LOCALIZACIÓN DE ACERÍAS Y CONSTRUIRLAS EN DISTINTAS REGIONES DEL PAÍS, PARA OPTIMIZAR LAS DISTANCIAS DE DISTRIBUCIÓN Y SENTIDO GEOESTRATÉGICO, ATENDIENDO PARÁMETROS DE EFICIENCIA ENERGÉTICA Y SUSTENTABILIDAD AMBIENTAL, ASÍ COMO EL DESARROLLO AGUAS ABAJO DE NUEVOS PRODUCTOS. ALCANZAR LA META DE EXTRACCIÓN DE 30 MM TN DE MINERAL DE HIERRO Y 9 MM TN DE ACERO LÍQUIDO EN 2019, LO QUE IMPLICA LA INSTALACIÓN DE UNA CAPACIDAD DE 4 MM TN EN ACERÍAS NUEVAS Y EN LAS QUE ESTÁN CONSTRUCCIÓN, ASÍ COMO LAS CONSECUENTES DE REDUCCIÓN DIRECTA. EN EL CASO DEL ALUMINIO, RECUPERAR CAPACIDAD DE EXTRACCIÓN Y TRANSPORTE DE BAUXITA, ASÍ COMO ALCANZAR LOS VALORES NECESARIOS DE LA PRODUCCIÓN DE ALÚMINA, AJUSTANDO LA ESTRUCTURA DE COSTOS PARA HACERLA EFICIENTE. A TALES EFECTOS, GENERAR LA ESTRUCTURA DE SOPORTE DE LA PRODUCCIÓN ASOCIADA A LOS INSUMOS: PLANTAS DE COQUE CALCINADO, CAL, REFRACTARIOS, FLUORURO DE ALUMINIO, ENTRE OTROS; ASÍ COMO LA  INDUSTRIA DE TRANSFORMACIÓN DE ALTO VALOR AGREGADO.	430	1	5	16	81
3.2.1.2. DESARROLLAR LA PRODUCCIÓN PRIMARIA Y CONSTRUIR LOS EJES ESTRATÉGICOS EN LA QUÍMICA PETROQUÍMICA, ASÍ COMO LAS CADENAS ASOCIADAS DE PRODUCTOS DERIVADOS; COMO BASE DE LA INDUSTRIALIZACIÓN EN LA GENERACIÓN DE BIENES DE CONSUMO INTERMEDIOS Y FINALES; AL TIEMPO QUE LA INDUSTRIA DE MAQUINARIAS ASOCIADAS PARA TALES FINES.	431	1	5	16	81
3.2.1.6. CONSTRUIR UN AMPLIO TEJIDO INDUSTRIAL, ASOCIADO A UNA ARQUITECTURA DE REDES DE SINERGIAS PRODUCTIVAS, ZONAS ESPECIALES DE DESARROLLO Y PARQUES Y NODOS INDUSTRIALES, ORIENTADO A BIENES ESENCIALES DE CONSUMO FINAL Y/O GENERACIÓN DE VALOR. 	432	1	5	16	81
3.2.2.1. CONFIGURAR UN ESQUEMA DE ESPECIALIZACIÓN ESPACIAL PRODUCTIVA, A PARTIR DE LAS VENTAJAS DE LOCALIZACIÓN BASADAS EN EL USO RACIONAL Y EFICIENTE DE LOS RECURSOS DISPONIBLES CON CRITERIOS DE INDEPENDENCIA,SOBERANÍA Y EQUILIBRIO INTERREGIONAL, CONSTITUYENDO EL EJE FUNCIONAL DE LAS ESCALAS DE PLANIFICACIÓN ESPACIAL DEL PAÍS Y EL SISTEMA DE CIUDADES.	433	1	5	16	82
3.2.3.5. DESARROLLAR PROCESOS INDUSTRIALES A ESCALA COMUNAL VINCULADOS CON LAS DEMANDAS LAS GRANDES Y MEDIANAS INDUSTRIAS NACIONALES.	434	1	5	16	83
3.2.4.2. DESARROLLAR ECONOMÍAS DE ESCALA Y COMPLEMENTARIEDAD EN EL TEJIDO PRODUCTIVO\nSOCIAL A OBJETO DE CONSTRUIR UN NUEVO METABOLISMO ECONÓMICO, CONTRARIO A LA LÓGICA DEL CAPITAL, IMPLEMENTANDO UN SISTEMA DE APORTES DE LOS EXCEDENTES DE LAS EMPRESAS DE PROPIEDAD SOCIAL DIRECTA E INDIRECTA, EN EL MARCO DE LA PLANIFICACIÓN NACIONAL.	435	1	5	16	84
4.1.9.3. FOMENTAR LAS REDES DE CADENAS INFORMATIVAS ALTERNATIVAS Y COMUNITARIAS EN LA REGIÓN, ASÍ COMO LAS REDES SOCIALES.	436	1	6	19	104
3.2.5.7. DESARROLLAR EL SECTOR AUTOMOTRIZ, FORTALECIENDO LOS SIGUIENTES PROYECTOS EN OPERACIÓN: A) FÁBRICA DE ASIENTOS AUTOMOTRICES; B) FÁBRICA DE ESTAMPADOS, TROQUELADOS Y SOLDADURAS DE ELECTROPUNTOS PARA PIEZAS AUTOMOTRICES; C) PLANTA DE TRANSFORMACIÓN DE VIDRIO AUTOMOTRIZ; D) ENSAMBLADORAS DE VEHÍCULOS; E) ENSAMBLADORAS DE TRACTORES ASÍ COMO EMPRESAS MIXTAS CON EL SECTOR PRODUCTIVO NACIONAL; F) ENSAMBLADORAS DE CAMIONES Y LAS ALIANZAS ESTRATÉGICAS CON EL SECTOR PRIVADO  NACIONAL; G) PRODUCCIÓN DE MOTOS Y H) ENSAMBLADORA DE BICICLETAS Y FORTALECIMIENTO DEL SECTOR DE ENSAMBLAJE; I) PRODUCCIÓN DE PARTES Y PIEZAS.	437	1	5	16	85
3.2.5.15. DESARROLLAR NUEVOS PROYECTOS Y ALIANZAS PARA LA PRODUCCIÓN DE FÁRMACOS E INSUMOS PARA EL SECTOR SALUD CON EL FIN DE CUBRIR LA DEMANDA NACIONAL Y DE LOS PAÍSES DEL ALBA Y ATENDER POTENCIALIDADES DE PETROCARIBE Y MERCOSUR. DESARROLLAR LA PRODUCCIÓN DE PRODUCTOS DE LÁTEX COMO GUANTES Y PRESERVATIVOS. DESARROLLO DE FÁRMACOS E  INSUMOS PARA LA SANIDAD ANIMAL Y VEGETAL.	438	1	5	16	85
4.1.6.4. FORMAR Y DESTACAR A LOS CUADROS QUE IMPULSARÁN LOS ACUERDOS BILATERALES DE COOPERACIÓN Y LOS ESPACIOS ESTRATÉGICOS DE INTEGRACIÓN Y UNIÓN REGIONAL.	439	1	6	19	101
3.2.5.18. CONSOLIDAR LA CONSTRUCCIÓN Y PUESTA EN MARCHA DE LOS SIGUIENTES PROYECTOS EN LA CADENA PRODUCTIVA FORESTAL-PAPEL: A) EMPRESA DE PRODUCCIÓN DE PAPEL PRENSA PARA ALCANZAR LAS 250 MIL TN/AÑO; B) MODERNIZACIÓN Y AMPLIACIÓN DE CAPACIDADES PÚBLICAS, CON PROYECTOS TALES COMO SACOS PARA CEMENTO Y PAPEL HIGIÉNICO PARA ALCANZAR LA SATISFACCIÓN PLENA DE LAS NECESIDADES NACIONALES; Y C) ALIANZAS ESTRATÉGICAS PARA PRODUCCIÓN DE IMPLEMENTOS ESCOLARES; D) CULMINACIÓN DEL SISTEMA DE ASERRADEROS Y PLANTA DE TABLEROS; E) CARRETES Y PALETAS DE MADERA; Y F) MUEBLES Y COMPONENTES  DE CONSTRUCCIÓN.	440	1	5	16	85
3.2.6.2. FORTALECER LA PROMOCIÓN TURÍSTICA NACIONAL,A TRAVÉS DE POLÍTICAS Y PROGRAMAS DE TURISMO SOCIAL Y COMUNITARIO, PARTICULARMENTE LA PROMOCIÓN DE LOS DESTINOS TURÍSTICOS DEPRIMIDOS Y LOS EMPRENDIMIENTOS AGRO Y ECO TURÍSTICOS.	441	1	5	16	86
3.2.7.5. DESARROLLAR LA INFRAESTRUCTURA Y SERVICIOS DE APOYO A LA ACTIVIDAD TURÍSTICA, MEDIANTE EL FORTALECIMIENTO DE VIALIDAD, PUERTOS Y AEROPUERTOS.	442	1	5	16	87
3.3.1.3. INCREMENTAR EL DESARROLLO DE LAS TECNOLOGÍAS PROPIAS DE NUESTRA INDUSTRIA MILITAR, PARA ASEGURAR AUTONOMÍA Y SOBERANÍA EN EL ESPACIO AÉREO, NAVAL Y TERRESTRE.\n	443	1	5	17	88
3.3.3.2. INTEGRAR ACTIVAMENTE LOS PLANES Y DISEÑOS CURRICULARES DE LAS ACADEMIAS MILITARES Y UNIVERSIDADES,PARA PONERLAS AL SERVICIO DEL DESARROLLO NACIONAL Y LA DEFENSA INTEGRAL DE LA PATRIA.	444	1	5	17	90
3.4.1.4. CONSOLIDAR EL PLAN NACIONAL DE AGUAS PARA MEJORAR, REFORZAR Y ESTABLECER EL SUMINISTRO DE AGUA EN TODO EL PAÍS Y ESPECIALMENTE EN COMUNIDADES POPULARES, CON LA PARTICIPACIÓN PROTAGÓNICA DE LOS COMITÉS DE AGUA Y OTRAS ORGANIZACIONES DEL PODER POPULAR. 	445	1	5	18	91
3.4.1.6. PROMOVER Y ACELERAR EL DESARROLLO INTEGRAL SUSTENTABLE DE LA FAJA PETROLÍFERA DEL ORINOCO, DE ACUERDO A LA POTENCIALIDAD PRODUCTIVA Y EL VIVIR BIEN DE SUS HABITANTES.	446	1	5	18	91
3.4.1.12. DESARROLLAR UNA TAXONOMÍA TERRITORIAL QUE ARTICULE LAS COMUNAS PRODUCTIVAS CON LOS DISTRITOS MOTORES INDUSTRIALES, DONDE LAS ZONAS ECONÓMICAS ESPECIALES SERÁN UNA VARIANTE ESPECÍFICA DE ESTA PARA POTENCIAR Y DIRECCIONAR TENSORES DEL DESARROLLO. LA ECONOMÍA DE ESCALA SUPONDRÁ UNA ESTRUCTURA DE RED PRODUCTIVA QUE SINCRONICE LAS DEMANDAS INDUSTRIALES CON LAS POTENCIALIDADES Y DESARROLLO DE ACTIVIDADES EN LAS COMUNAS PRODUCTIVAS. AL MISMO TIEMPO DESARROLLAR SOBRE ESTA ESTRUCTURA DE SOSTÉN UN TRAMADO DE PARQUES INDUSTRIALES PARA EL DESARROLLO NACIONAL Y COMO PIVOTES INTERCONECTADOS PARA LA INTEGRACIÓN PRODUCTIVA BOLIVARIANA DE NUESTRA AMÉRICA, DEFINIENDO LOS ESLABONES DE CADENAS PRODUCTIVAS COMPARTIDAS Y ESTRATÉGICAS PARA LAS NECESIDADES SOCIALES DE NUESTRO PUEBLO; EN ESPECIAL EN EL ÁREA DE SALUD, ALIMENTACIÓN, EDUCACIÓN, VESTIDO, ENERGÍA Y VIVIENDA.	447	1	5	18	91
3.4.3.6 CONFORMAR EL DISTRITO MOTOR CAICARA-CABRUTA, ESTADOS BOLÍVAR Y GUÁRICO. PROYECTOS DINAMIZADORES: TERCER PUENTE SOBRE EL RÍO ORINOCO Y UPS ALGODONES DEL ORINOCO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	448	1	5	18	93
3.2.1.7. AMPLIAR LA CAPACIDAD INSTALADA, MODERNIZAR Y FOMENTAR LA APROPIACIÓN TECNOLÓGICA EN LA PRODUCCIÓN DE ENVASES Y EMPAQUES, TANTO PARA LA SOBERANÍA ALIMENTARIA COMO PARA LA INDUSTRIA EN GENERAL. DESARROLLO SOBERANO DE LA INDUSTRIA DE PLASTICUBIERTA, DIFERENTES RESINAS Y CARTONES PARA ABASTECER LAS DEMANDAS NACIONALES DEL SECTOR DE ALIMENTOS. DESARROLLO DE APLICACIONES VINCULADAS A INSUMOS AGRÍCOLAS E INDUSTRIALES A PARTIR DE LOS SECTORES DE PETROQUÍMICA Y PAPEL, A EFECTOS DE ABASTECER INTEGRALMENTE LAS DEMANDAS NACIONALES Y EXPORTAR EN: SACOS DE CEMENTO, FERTILIZANTES Y MATERIALES DE CONSTRUCCIÓN. DESARROLLO DE TECNOLOGÍAS Y APLICACIONES EN VIDRIO, PLÁSTICO, CARTÓN Y ALUMINIO PARA LA INDUSTRIA FARMACÉUTICA, ASÍ COMO DE HIGIENE Y CUIDADO PERSONAL, TANTO EN CONSUMO NACIONAL COMO EXPORTACIÓN AL ALBA, CARIBE Y MERCOSUR, ESPECIALMENTE.	449	1	5	16	81
3.2.1.8. PRIVILEGIAR LA ADQUISICIÓN DE PRODUCTOS INDUSTRIALES NACIONALES, ASÍ COMO ESTIMULAR SU PRODUCCIÓN PARA LA EJECUCIÓN DE LOS PROYECTOS NACIONALES.	450	1	5	16	81
3.2.1.11. IMPULSAR MECANISMOS Y PRÁCTICAS DE VIGILANCIA TECNOLÓGICA PARA LA PROTECCIÓN DE MARCAS Y PATENTES VENEZOLANAS EN EL EXTRANJERO, INCLUYENDO EL MONITOREO Y LAS ACCIONES DEFENSIVAS NECESARIAS PARA LA SALVAGUARDA DE ESTE PATRIMONIO INTANGIBLE DE LOS VENEZOLANOS Y LAS VENEZOLANAS.	451	1	5	16	81
3.2.2.3. DESARROLLAR PARQUES Y DEMÁS ÁREAS DE AGLOMERACIÓN INDUSTRIAL COMO NODOS DEL NUEVO SISTEMA PRODUCTIVO NACIONAL Y DE COMPLEMENTARIEDAD CON LOS PROYECTOS DE INTEGRACIÓN DE NUESTRA AMÉRICA.	452	1	5	16	82
3.2.4.1. DISEÑAR E IMPLANTAR UNA ARQUITECTURA FINANCIERA EFICIENTE Y SOBERANA, ORIENTADA A APALANCAR EL PROCESO DE INDUSTRIALIZACIÓN NACIONAL EN LA PLANIFICACIÓN, EVALUACIÓN DE VIABILIDAD, FONDOS DE PREINVERSIÓN, EJECUCIÓN Y ACOMPAÑAMIENTO DEL NUEVO APARATO PRODUCTIVO:A) ARTICULANDO Y FORTALECIENDO LOS FONDOS DE DESARROLLO INDUSTRIAL SOBERANO PARA EL NUEVO TEJIDO INDUSTRIAL; B) IMPULSANDO EL FINANCIAMIENTO PROPIO Y CON MECANISMOS INTERNACIONALES SOBERANOS A LOS PROYECTOS INDUSTRIALES ESTRUCTURANTES; C) FORTALECIENDO LOS BANCOS E INSTRUMENTOS FINANCIEROS DE SEGUNDO PISO PARA LA INVERSIÓN Y EXPANSIÓN DEL SISTEMA PRODUCTIVO; D) GENERANDO UNA POLÍTICA PARA LOS RECURSOS DE LA BANCA A EFECTOS DE DEMOCRATIZAR EL ACCESO A LOS RECURSOS PARA LOS DISTINTOS ACTORES ECONÓMICOS, EN ESPECIAL LAS PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS COMUNALES, MIXTAS, PRIVADAS Y ESTATALES; Y E) FOMENTANDO LOS MECANISMOS INSTITUCIONALES PARA EL SEGUIMIENTO EN LA DISTRIBUCIÓN JUSTA Y ACCESO DE LOS RECURSOS DE LA CARTERA DE CRÉDITO A LA MANUFACTURA.	453	1	5	16	84
3.2.5.4. AFIANZAR LOS SIGUIENTES PROYECTOS EN OPERACIÓN EN EL SECTOR ALUMINIO: CAPACIDADES DE PRODUCCIÓN PRIMARIA: A) FÁBRICA DE ALUMINIO PRIMARIO ALCASA; B) FÁBRICA DE ALUMINIO PRIMARIO VENALUM; C) CERTIFICACIÓN Y PRODUCCIÓN DE BAUXITA BAUXILUM; CAPACIDADES DE TRANSFORMACIÓN; D) TRANSFORMADORAS DE ALUMINIO ASOCIADAS A CAPACIDADES DE EXTRUSIÓN, LAMINACIÓN E INYECCIÓN; E) FÁBRICA DE RINES A AFECTOS DE OTORGAR VALOR AGREGADO A LA MATERIA PRIMA; F) FÁBRICA DE PAPEL DE ALUMINIO Y ENVASES; G) FÁBRICA DE CABLES DESNUDOS Y RECUBIERTOS DE ALUMINIO; H) CENTROS DE INSUMOS DE MATERIA PRIMA PARA EL SECTOR PRIVADO Y PÚBLICO NACIONAL; I) POLÍTICA NACIONAL DE FOMENTO Y FORTALECIMIENTO DEL SECTOR TRANSFORMADOR NACIONAL; J) DESARROLLO INDUSTRIAL DE LOS INSUMOS DEL SECTOR Y APROVECHAMIENTO DE SUBPRODUCTOS; Y K) DESARROLLO DE NUEVAS ALEACIONES DE ALUMINIO E INGENIERÍA DE MATERIALES PARA LAS DISTINTAS APLICACIONES INDUSTRIALES Y VARIANTES DE ALTA TECNOLOGÍA.	454	1	5	16	85
3.2.5.6. DESARROLLAR LOS SIGUIENTES PROYECTOS EN EL SECTOR ALUMINIO: A) ADECUACIÓN TECNOLÓGICA DE ALCASA Y DE VENALUM PARA INCREMENTO DE PRODUCCIÓN DE ALUMINIO PRIMARIO; B) EN CABELUM, AMPLIACIÓN DE CAPACIDAD PARA PRODUCCIÓN DE ALAMBRÓN Y CONDUCTORES ELÉCTRICOS; PLANTA DE CONDUCTORES ELÉCTRICOS AISLADOS DE COBRE Y ALUMINIO; FÁBRICA DE CONDUCTORES ELÉCTRICOS; CERTIFICACIÓN PARA EXPORTACIÓN AL MERCOSUR C) ADECUACIÓN TECNOLÓGICA Y AMPLIACIÓN DE RIALCA; D) EN BAUXILUM: ADECUACIÓN DE LA PLANTA DE PRODUCCIÓN DE ALÚMINA METALÚRGICA Y LA MINA DE BAUXITA, Y ADQUISICIÓN DE MAQUINARIA PESADA PARA EXTRACCIÓN Y ACARREO DE BAUXITA Y TRANSPORTE DE MATERIAL; E) INCREMENTO DE CAPACIDAD DE PRODUCCIÓN DE CONDUCTORES ELÉCTRICOS DE ALUMINIO DESNUDO; Y F) DESARROLLO TECNOLÓGICO PARA LA INCORPORACIÓN DE FIBRA ÓPTICA EN EL NÚCLEO DE LOS CABLES COMO OFERTA DE LOS PRODUCTOS A GENERAR.	455	1	5	16	85
3.2.5.9. AFIANZAR EL DESARROLLO DEL SECTOR AUTOMOTRIZ,LOGRANDO NIVELES CRECIENTES DE SOBERANÍA CON: A) LA INCORPORACIÓN DE PARTES Y PIEZAS NACIONALES Y LA APROPIACIÓN DEL CONOCIMIENTO CIENTÍFICO-TECNOLÓGICO; B) EL FORTALECIMIENTO TECNOLÓGICO Y PRODUCTIVO DEL SECTOR AUTOPARTISTA NACIONAL; C) EL DESARROLLO DEL CENTRO DE INGENIERÍA AUTOMOTRIZ: DESARROLLO DE LA PRODUCCIÓN DE PARTES Y PIEZAS DE MANERA DE INCORPORAR MÁS DEL 50% DEL VALOR PARA EL 2015 Y MÁS DEL 60% PARA EL 2019.	456	1	5	16	85
3.2.7.3. FOMENTAR LA INVERSIÓN NACIONAL E INTERNACIONAL EN EL SECTOR TURÍSTICO, A  TRAVÉS DEL ESTÍMULO A LOS PRESTADORES DE SERVICIOS TURÍSTICOS ACTUALES Y POTENCIALES DE MANERA DE MEJORAR DE MANERA SOSTENIDA LA INFRAESTRUCTURA Y LOS SERVICIOS TURÍSTICOS.	457	1	5	16	87
3.2.5.11. AFIANZAR LOS SIGUIENTES PROYECTOS: A) FÁBRICAS DE ESTRUCTURAS LIGERAS DE ACERO GALVANIZADO PARA USO EN CONSTRUCCIÓN; B) EMPRESA DE INSUMOS BÁSICOS PARA LA CONSTRUCCIÓN DE VIVIENDAS; C) FÁBRICA DE PRODUCCIÓN DE VIDRIO PLANO; F) COMPLEJO INDUSTRIAL DE CERÁMICAS. G) FÁBRICA DE PANELES PREFABRICADOS PARA LA CONSTRUCCIÓN; F) SISTEMA DE ASERRADEROS ASOCIADOS A MADERAS DEL ORINOCO, G) FORMA ORGANIZATIVA DEL CONGLOMERADO DE MADERA A EFECTOS DE CUBRIR LAS DEMANDAS DE LA GRAN MISIÓN VIVIENDA EN TANTO PUERTAS Y MUEBLES; H) DESARROLLO DE LA PLANTA DE PANELES DE MADERA.	459	1	5	16	85
3.2.5.13. AMPLIAR Y CONSOLIDAR EL SECTOR DE PAÑALES Y TOALLAS SANITARIAS Y TOALLINES, CON LA PARTICIPACIÓN DE EMPRESAS DEL ESTADO, PRIVADAS Y MIXTAS; A EFECTOS DE SATISFACER PARA EL 2019 TODO EL REQUERIMIENTO NACIONAL. 	460	1	5	16	85
3.2.5.20. CONTINUAR EL IMPULSO A LA FABRICACIÓN NACIONAL DE ELECTRODOMÉSTICOS, CONSOLIDANDO PROYECTOS EXISTENTES Y AMPLIANDO E INCENTIVANDO NUEVOS PROYECTOS Y LA PRODUCTIVIDAD DEL SECTOR. INCENTIVAR LA PARTICIPACIÓN ESTATAL Y ALIANZA CON PRIVADOS NACIONALES E INTERNACIONALES. DESARROLLAR ÉNFASIS ESPECIAL EN LA PRODUCCIÓN DE LOS COMPONENTES E INSUMOS. INSTALACIÓN DE CAPACIDADES EN VENEZUELA PARA LA EXPORTACIÓN A LOS PAÍSES DEL ALBA, MERCOSUR Y PETROCARIBE. DESARROLLAR EL CENTRO DE INGENIERÍA APLICADA Y DE MATERIALES.	461	1	5	16	85
3.2.5.22. AMPLIAR LAS CAPACIDADES DE PRODUCCIÓN DE INSUMOS QUÍMICOS PARA LA INDUSTRIA A EFECTOS DE DISMINUIR LA DEPENDENCIA DEL COMPONENTE IMPORTADO,APROVECHANDO LAS POTENCIALIDADES NACIONALES Y GENERACIÓN DE CADENA DE VALOR.	462	1	5	16	85
3.2.6.1. POTENCIAR A VENEZUELA COMO MULTIDESTINO,GARANTIZANDO EL AUMENTO DEL TURISMO RECEPTIVO, INCREMENTANDO ASÍ EL INGRESO DE DIVISAS AL PAÍS Y FORTALECIENDO LOS DESTINOS NO TRADICIONALES.\n	463	1	5	16	86
3.2.3.2. IMPULSAR UN DESARROLLO TECNOLÓGICO SOBERANO A PARTIR DE LAS NECESIDADES DE NUESTRA INDUSTRIA, PARA HACER VIABLE EL APROVECHAMIENTO EFICIENTE Y SUSTENTABLE DE LOS RECURSOS Y ESTRUCTURAS DE COSTO APROPIADAS.	464	1	5	16	83
3.2.3.3. GARANTIZAR PROCESOS FORMATIVOS INTEGRALES Y CONTINUOS DE LOS TRABAJADORES PARA ADOPTAR TÉCNICAS Y TECNOLOGÍAS QUE HAGAN MÁS EFICIENTE LA PRODUCCIÓN Y HUMANIZAR EL PROCESO DE TRABAJO: A) ESTANDARIZANDO EL PROGRAMA DE LA ESCUELA EN LA FÁBRICA COMO POLÍTICA DE FORMACIÓN Y TRABAJO LIBERADOR; B) PROPICIANDO LA POLÍTICA DEL PUNTO Y CÍRCULO COMO MÉTODO DE TRABAJO, PARA EL FORTALECIMIENTO DE LA BASE PRODUCTIVA DEL ENTORNO, ARTICULACIÓN SOCIAL Y LOS ENCADENAMIENTOS PRODUCTIVOS; C) ABRIENDO LA ESCUELA EN LA FÁBRICA A LAS COMUNIDADES ALEDAÑAS CON PARTICIPACIÓN DE LOS TRABAJADORES COMO FACILITADORES Y MULTIPLICADORES DEL PROCESO; D) DESARROLLANDO PROYECTOS ASOCIADOS A SUBPRODUCTOS Y DESECHOS PARA GENERAR ACTIVIDAD ECONÓMICA A PARTIR DEL RECICLAJE; Y E) AMPLIAR LAS PLATAFORMAS DE FORMACIÓN TÉCNICA Y PROFESIONAL PARA EL TRABAJO.\n	465	1	5	16	83
3.2.4.3. MANTENER E INCREMENTAR LOS SISTEMAS DE COMPRAS PÚBLICAS CON EL OBJETIVO DE IMPULSAR EL DESARROLLO DEL APARATO PRODUCTIVO NACIONAL MEDIANTE EL FLUJO CIRCULAR DEL CAPITAL HACIA CONGLOMERADOS, PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS COMUNALES, EN TANTO QUE MOTORES DE LA UBICACIÓN DIRECTA DE LOS BIENES Y SERVICIOS PRODUCIDOS, FAVORECIENDO ASÍ LA ECONOMÍA A NIVEL REGIONAL.	466	1	5	16	84
3.2.5.14. INCREMENTAR LAS CAPACIDADES PRODUCTIVAS DE LOS PRODUCTOS DE HIGIENE PERSONAL Y DEL HOGAR HACIENDO ÉNFASIS EN JABONES, CHAMPÚ, DESODORANTE, MÁQUINAS DE AFEITAR, PAPEL SANITARIO, PASTA DE DIENTE, A EFECTOS DE SATISFACER CON PRODUCCIÓN NACIONAL LA DEMANDA INTERNA.	467	1	5	16	85
3.2.5.1. AFIANZAR LA CADENA PRODUCTIVA HIERRO-ACERO A EFECTOS DE ESTABILIZAR LAS PRODUCCIÓN, CON BASE EN LAS CAPACIDADES INSTALADAS Y CREAR NUEVAS CAPACIDADES, DE ACUERDO CON LA META DE EXTRACCIÓN DE MINERAL DE HIERRO DE 30 MM TN PARA EL 2019, CERTIFICACIÓN DE RESERVAS Y LA GENERACIÓN DE VALOR AGREGADO NACIONAL: A) FÁBRICA DE CABILLAS Y BOBINAS DE ACERO DE SIDOR, ASÍ COMO COMPONENTES DE ALTO VALOR AGREGADO, NECESIDAD NACIONAL Y POTENCIAL EXPORTADOR; B) FORTALECIMIENTO DEL COMPLEJO SIDERÚRGICO NACIONAL EN SU CAPACIDAD DE ACERÍA Y LAMINACIÓN ASÍ COMO RAMIFICACIÓN REGIONAL; C) PRODUCCIÓN Y REPARACIÓN DE VÁLVULAS PETROLERAS Y SINERGIAS ENTRE LAS PLANTAS EXISTENTES ASÍ COMO EN TUBOS SIN COSTURA; D) FÁBRICA DE PIEZAS FORJADAS PARA LA INDUSTRIA PETROLERA Y DEL ALUMINIO; E) EJECUCIÓN ORGANIZATIVA DE LA CORPORACIÓN DEL HIERRO ACERO Y ECONOMÍA DE ESCALA EN LA PROCURA Y COMERCIALIZACIÓN SOBERANA; F) CENTRO DE INSUMOS DE MATERIAS PRIMAS PARA EL SECTOR TRANSFORMADOR NACIONAL TANTO PÚBLICO COMO PRIVADO; G)INSTALACIÓN DE LÍNEA DE DECAPADO Y GALVANIZADO PARA ATENDER LA DEMANDA NACIONAL Y FOMENTO DE BASE EXPORTADORA; H) INSTALACIÓN DE CAPACIDADES NACIONALES PARA EL APROVECHAMIENTO DEL LAMINADO EN CALIENTE EXISTENTE Y PROYECTADO; I) PRODUCCIÓN NACIONAL DE PERFILES; J) DESARROLLO DE PRODUCCIÓN NACIONAL DE ACERO INOXIDABLE PARA EL MERCADO NACIONAL Y LA NUEVA BASE EXPORTADORA; Y K) DESARROLLO INDUSTRIAL DE LOS INSUMOS DEL SECTOR Y APROVECHAMIENTO DE SUBPRODUCTOS.	468	1	5	16	85
4.2.1.1. ORIENTAR DESDE EL MÁS ALTO NIVEL DE LAS ORGANIZACIONES NACIONALES Y REGIONALES, LA GENERACIÓN Y DIVULGACIÓN DE CONTENIDOS EDUCATIVOS SOBRE LA IDENTIDAD NACIONAL Y LA DIVERSIDAD DE LOS PUEBLOS.	469	1	6	20	106
4.3.1.2. IMPULSAR EL ACERCAMIENTO Y LA COORDINACIÓN ENTRE LOS NUEVOS MECANISMOS DE UNIÓN LATINOAMERICANA Y CARIBEÑA (ALBA, UNASUR, CELAC) Y EL GRUPO DE PAÍSES BRICS, CON EL FIN DE DAR MAYOR CONTUNDENCIA A LA VOZ DE LOS PUEBLOS DEL SUR EN LA AGENDA GLOBAL.	470	1	6	21	108
3.2.5.3. FORTALECER EL POTENCIAL DE EMPRESAS EXISTENTES DE LA CADENA HIERRO-ACERO: A) EN SIDOR: RECUPERACIÓN DE LÍNEA DE DECAPADO, MÁQUINA DE COLADA CONTINUA,LÍNEA DE VALLAS ELECTROSOLDADAS ASÍ COMO OTROS COMPONENTES DE GENERACIÓN DE VALOR; B) ALIANZA ESTRATÉGICA PARA LA PRODUCCIÓN DE ELECTRODOS; C) RED DE TRENES DE LAMINACIÓN DE  ESCALA REGIONAL PARA INCORPORAR LA PRODUCCIÓN DE 500 MIL TN DE CABILLAS A NIVEL NACIONAL; D) CONSTRUCCIÓN DE UN SISTEMA COMPLEMENTARIO SIDERÚRGICO DE HRD, EN PLANTAS DE 1 A 1,5 MM TN, PARA DAR VALOR AGREGADO A LAS NUEVAS CAPACIDADES DE EXTRACCIÓN DE MINERAL QUE SE DESARROLLARÁN; E) AMPLIACIÓN Y CONSTRUCCIÓN DE PLANTA DE CAL PARA LA PRODUCCIÓN SIDERÚRGICA; F) CENTROS NACIONALES DE ACOPIO DE CHATARRA FERROSA Y POLÍTICA DE PROTECCIÓN COMO INSUMO ESTRATÉGICO NACIONAL; Y G) RECUPERACIÓN DE CAPACIDAD DE PRODUCCIÓN DE PELLAS Y BRIQUETAS ASÍ COMO GENERACIÓN DE NUEVOS BALANCES DE MATERIALES.\n	471	1	5	16	85
3.2.5.5. CULMINAR EN LOS PLAZOS ESTABLECIDOS LA CONSTRUCCIÓN DEL PROYECTO EMPRESA DE SERVICIOS DE LAMINACIÓN DEL ALUMINIO (SERLACA). 	472	1	5	16	85
3.2.7.1. PROMOVER EL CRECIMIENTO DEL TURISMO INTERNO, A TRAVÉS DE POLÍTICAS Y PROGRAMAS DE TURISMO SOCIAL Y COMUNITARIO, INCREMENTANDO DE MANERA SOSTENIDA EL NÚMERO DE MOVIMIENTOS TURÍSTICOS INTERNOS ASÍ COMO LA INVERSIÓN EN DESARROLLO Y MEJORAMIENTO DE INFRAESTRUCTURA Y SERVICIOS TURÍSTICOS.	473	1	5	16	87
3.3.2.4. COMUNICAR LA NUEVA CONCEPCIÓN DE DEFENSA INTEGRAL.	474	1	5	17	89
3.4.3.8. CONFORMAR EL DISTRITO MOTOR PARIA, ESTADO SUCRE. PROYECTOS DINAMIZADORES: PROYECTO GASÍFERO PETROLERO, DELTA-CARIBE ORIENTAL, PLATAFORMA DELTANA, EMPRESA MIXTA SOCIALISTA CACAO DEL ALBA, DE ESPECIALIZACIÓN AGRÍCOLA-TURÍSTICA.	492	1	5	18	93
3.4.1.3. FORTALECER Y MEJORAR LOS SISTEMAS DE AGUA POTABLE A LO LARGO DEL TERRITORIO NACIONAL, MANTENIENDO E INCREMENTANDO LA CONTINUIDAD DEL SERVICIO DE AGUA POTABLE A 250 LITROS POR PERSONA, MEDIANTE LA CULMINACIÓN Y CONSTRUCCIÓN DE CIEN ACUEDUCTOS A NIVEL NACIONAL, PARA GARANTIZAR LA PRODUCCIÓN DE 4.000 MILLONES DE METROS CÚBICOS DE AGUA POTABLE, ENTRE OTROS: ACUEDUCTO TUY 4, LUISA CÁCERES DE ARISMENDI, AMPLIACIÓN DEL SISTEMA REGIONAL DEL CENTRO Y ACUEDUCTO BARCELONAGUANTA-LECHERÍA.	475	1	5	18	91
3.4.1.7. MEJORAR LA FUNCIONALIDAD DE LA RED DE CENTROS URBANOS, ARTICULÁNDOLOS AL NUEVO MODELO PRODUCTIVO: A) IMPULSANDO UN SISTEMA DE CIUDADES POLICÉNTRICO;B) MEJORANDO, AMPLIANDO Y CONSOLIDANDO LOS SISTEMAS DE INTERCONEXIÓN ENTRE LOS CENTROS POBLADOS, EN VIALIDAD, TRANSPORTE POLIMODAL, PUERTOS, AEROPUERTOS TELECOMUNICACIONES; C) FOMENTANDO EL CRECIMIENTO TRANSFORMACIÓN SUSTENTABLE DE LOS PRINCIPALES CENTROS URBANOS, LAS CIUDADES INTERMEDIAS Y LOS CENTROS POBLADOS MENORES, CON ESPECIALIZACIÓN PRODUCTIVA Y NUEVOS DESARROLLOS HABITACIONALES.\n	476	1	5	18	91
3.4.1.8. PROMOVER EL DESARROLLO SUSTENTABLE DEL ARCO MINERO, CON EL CONTROL SOBERANO Y HEGEMÓNICO DEL ESTADO EN LA CADENA PRODUCTIVA DEL SECTOR Y SUS ACTIVIDADES CONEXAS, PROMOVIENDO EL DESARROLLO DE TECNOLOGÍAS PROPIAS QUE PERMITAN UNA EXPLOTACIÓN RACIONAL, Y CON BASE EN LA DEFINICIÓN DE UNIDADES DE GESTIÓN TERRITORIAL PARA LA COORDINACIÓN DE POLÍTICAS PÚBLICAS, PRESERVANDO EL ACERVO HISTÓRICO Y SOCIOCULTURAL.	477	1	5	18	91
3.4.1.9. IMPULSAR LA CONSOLIDACIÓN DE UN SISTEMA DE ÁREAS INDUSTRIALES, CONFIGURÁNDOLAS EN VERDADEROS POLOS DE DESARROLLO EN LAS REGIONES: A) CONSOLIDACIÓN DEL SISTEMA DE PARQUES INDUSTRIALES; B) DESARROLLO DE LOS POLOS PETROQUÍMICOS; C) DESARROLLO DE LAS BASES PETROINDUSTRIALES SOCIALISTAS, DE SOPORTE A LOS EMPRENDIMIENTOS PETROLEROS	478	1	5	18	91
3.4.1.10. PRESERVAR LAS CUENCAS HIDROGRÁFICAS Y LOS CUERPOS DE AGUA.	479	1	5	18	91
NO APLICA	480	1	5	18	92
4.1.1.1. FORTALECER EL PAPEL DE VANGUARDIA DEL ALBA EN EL PROCESO DE UNIDAD DE NUESTRA AMÉRICA, DINAMIZANDO LOS NUEVOS ESPACIOS COMO LA UNASUR Y LA CELAC,EN TORNO A LOS PRINCIPIOS DE SOBERANÍA, COOPERACIÓN,COMPLEMENTACIÓN Y SOLIDARIDAD.\n	503	1	6	19	96
4.1.5.1. FORTALECER EL PAPEL DE LA CELAC COMO ESPACIO COMÚN PARA LA INTEGRACIÓN POLÍTICA, ECONÓMICA, SOCIAL Y CULTURAL DE LA REGIÓN.\n	1236	1	6	19	100
3.2.5.10. AFIANZAR Y DESARROLLAR LOS SIGUIENTES PROYECTOS DEL SECTOR DE MATERIALES DE CONSTRUCCIÓN: A) FÁBRICA DE GRIFERÍAS; B) FÁBRICA PRODUCTORA DE CAL; C) EN CEMENTO LAS EMPRESAS CEMENTOS DE VENEZUELA, INDUSTRIAS VENEZOLANAS DEL CEMENTO, FÁBRICA NACIONAL DE CEMENTO, CEMENTO “CERRO AZUL” Y CEMENTO ANDINO; PLANTA DE MORTEROS ASÍ COMO NUEVA PLANTA DE CEMENTO EN LOS ARANGUES; LA EXPANSIÓN PRODUCTIVA IMPLICA ADICIONALMENTE SEGUNDA LÍNEA EN SAN SEBASTIÁN DE LOS REYES Y CUMAREBO; Y LA MODIFICACIÓN DEL EQUIPAMIENTO EN CUMAREBO, PARA ALCANZAR LAS 16 MM TN EN EL 2017; D) DESARROLLO DE LA CADENA DE VALOR DEL CEMENTO EN EL CONCRETO Y COMPONENTES DE LA CONSTRUCCIÓN PREFABRICADOS A PARTIR DEL CEMENTO Y FÁBRICA DE MORTEROS SECOS; E) FORTALECIMIENTO Y EXPANSIÓN DE SANITARIOS Y CERÁMICOS Y DE LA CADENA DE INSUMOS ASOCIADOS, A OBJETO DE CUBRIR LOS REQUERIMIENTOS DE LA GRAN MISIÓN VIVIENDA Y CAPACIDADES DE EXPORTACIÓN; Y F) FÁBRICA DE PARTES E INSUMOS INDUSTRIALES.	481	1	5	16	85
3.2.5.12. CONSOLIDAR EL SECTOR PLÁSTICO, EMPAQUES Y ENVASES, LO QUE PERMITIRÁ SATISFACER LAS NECESIDADES DEL PAÍS, HACIENDO ÉNFASIS EN LOS ENVASES DE VIDRIO, PLÁSTICO,ALUMINIO, PLASTICUBIERTA, CARTÓN Y BOLSAS. ESTO A SU VEZ PERMITIRÁ LA GENERACIÓN DE NUEVAS VERTIENTES DE MAYOR VALOR AGREGADO DE USO EN TELEFONÍA, INFORMÁTICA, VEHÍCULOS Y ELECTRODOMÉSTICOS CÓNSONOS CON LA PRESERVACIÓN DEL AMBIENTE. DESARROLLAR EL SECTOR DEL CARTÓN.	482	1	5	16	85
4.2.2.2. ADELANTAR INICIATIVAS REGIONALES Y SUBREGIONALES, COMO CARTAS SOCIALES Y CULTURALES, DECLARACIONES,PACTOS Y DOCUMENTOS GUBERNAMENTALES, QUE SURGEN DE LA PARTICIPACIÓN POPULAR SON ASUMIDOS EN LA NUEVA INSTITUCIONALIDAD NUESTRO AMERICANA.	483	1	6	20	107
3.2.5.17. CONSOLIDAR Y AMPLIAR DESARROLLO DE PROYECTOS EN EL SECTOR DE MAQUINARIA Y EQUIPOS, TALES COMO: A) FÁBRICAS DE MAQUINARIA PESADA PARA LA CONSTRUCCIÓN; B) FÁBRICAS DE EQUIPOS PARA PROCESAMIENTO DE ALIMENTOS; C) FÁBRICAS DE EQUIPOS DE REFRIGERACIÓN INDUSTRIAL.	484	1	5	16	85
3.2.5.19. DESARROLLAR LOS SIGUIENTES PROYECTOS EN EL SECTOR TEXTIL-CALZADO: A) TENERÍAS PARA PROCESAMIENTO DE PIELES; B) DESARROLLO CONGLOMERADO TEXTIL Y DEL CALZADO, PARA TODA LA CADENA PRODUCTIVA; C) INCREMENTAR LA PRODUCCIÓN PRIMARIA DE ALGODÓN Y SU PROCESAMIENTO; D) FORTALECER LA PRODUCCIÓN DE HILADOS, TEJIDOS DE ALGODÓN, ASÍ COMO LA CONFECCIÓN DE PRENDAS Y CALZADOS E) PRODUCCIÓN DE SUELAS; F) DESARROLLAR TEJIDOS CON MEZCLA SINTÉTICA; G) DESARROLLAR LOS COMPONENTES ASOCIADOS A LOS INSUMOS INDUSTRIALES DEL SECTOR.	485	1	5	16	85
3.2.7.2. FORTALECER A VENETUR COMO LA PRIMERA OPERADORA TURÍSTICA DEL PAÍS Y POSICIONAR A LA RED DE HOTELES VENETUR COMO LA PRINCIPAL ALTERNATIVA DE ALOJAMIENTO TURÍSTICO DE GRAN CALIDAD.	486	1	5	16	87
4.3.1.4. ESTABLECER ALIANZAS ESTRATÉGICAS CON LA REPÚBLICA DE LA INDIA Y LA REPÚBLICA DE SUDÁFRICA.\n	487	1	6	21	108
3.4.1.1. INCREMENTAR LA SINERGIA ENTRE REGIONES, MEDIANTE LOS EJES DE INTEGRACIÓN Y DESARROLLO NORTE LLANERO,APURE-ORINOCO, OCCIDENTAL Y ORIENTAL, A TRAVÉS DE: A) DESARROLLO DE CORREDORES DE INFRAESTRUCTURA DE TRANSPORTE MULTIMODAL, DE ENERGÍA Y DE TELECOMUNICACIONES EN LOS EJES DE INTEGRACIÓN Y DESARROLLO, CONSTITUYÉNDOSE EL EJE NORTE LLANERO EN ARTICULADOR ENTRE ÁREAS PRODUCTIVAS Y DE CONSUMO NACIONAL; B) IMPLANTACIÓN DE INDUSTRIAS DE TRANSFORMACIÓN Y DE PARQUES INDUSTRIALES TEMÁTICOS EN EL EJE NORTE LLANERO; C) CONFORMAR Y DESARROLLAR OCHO DISTRITOS MOTORES DE DESARROLLO PARA LA FAJA PETROLÍFERA DEL ORINOCO, LOS CUALES PERMITIRÁN PROMOVER, POTENCIAR Y ACELERAR EL DESARROLLO TERRITORIAL EN LA FAJA; D) IMPULSAR EL DESARROLLO INTEGRAL DE ÁREAS GEOGRÁFICAS, QUE POR SUS CARACTERÍSTICAS Y UBICACIÓN, SON CONSIDERADAS ESTRATÉGICAS PARA LOS INTERESES NACIONALES, PROCURANDO QUE EN LAS MISMAS TENGA LUGAR UNA EXPANSIÓN PRODUCTIVA Y UN CORRECTO APROVECHAMIENTO DE LOS RECURSOS NATURALES, A TRAVÉS DE LAS ZONAS ECONÓMICAS ESPECIALES.	488	1	5	18	91
3.4.1.2. ORDENAR EL TERRITORIO Y ASEGURAR LA BASE DE SUSTENTACIÓN ECOLÓGICA, MEDIANTE LA FORMULACIÓN E IMPLEMENTACIÓN DE PLANES PARA LAS DISTINTAS ESCALAS TERRITORIALES, LA PRESERVACIÓN DE CUENCAS HIDROGRÁFICAS Y CUERPOS DE AGUA, LA CONSERVACIÓN Y PRESERVACIÓN DE AMBIENTES NATURALES, EL IMPULSO DE PROGRAMAS DE MANEJO INTEGRAL DE DESECHOS SÓLIDOS Y LA CULTURA DE LOS PUEBLOS.	489	1	5	18	91
3.4.1.5. CONTINUAR INCREMENTANDO Y MEJORANDO LOS SISTEMAS DE RECOLECCIÓN Y TRATAMIENTO DE LAS AGUAS SERVIDAS EN TODO EL TERRITORIO NACIONAL, GARANTIZANDO EL VERTIDO ADECUADO A LOS DISTINTOS CUERPOS DE AGUA.	490	1	5	18	91
3.4.3.2. FOMENTAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, EN ÁREAS QUE REQUIERAN ATENCIÓN PRIORITARIA,HACIENDO ÉNFASIS EN EL REORDENAMIENTO TERRITORIAL PARTICIPATIVO EN CORRESPONDENCIA CON EL INTERÉS NACIONAL.	491	1	5	18	93
1.4.3.8. INCREMENTAR LA PRODUCCIÓN DE PESCA Y ACUICULTURA EN UN 20%, PARA ALCANZAR 300 MIL TN/AÑO.\n	746	1	3	6	32
3.4.3.10. CONFORMAR EL DISTRITO MOTOR SANTA ELENA DE UAIRÉN-IKABARÚ, ESTADOS BOLÍVAR Y AMAZONAS. PROYECTO DINAMIZADOR: TRANSPORTE AÉREO Y FLUVIAL, DE ESPECIALIZACIÓN AGROECOLÓGICA Y TURÍSTICA.	493	1	5	18	93
3.4.3.13. CONFORMAR EL DISTRITO MOTOR EL DILUVIO DEL PALMAR, ESTADO ZULIA. PROYECTO DINAMIZADOR: SISTEMA DE RIEGO EL DILUVIO, DE ESPECIALIZACIÓN AGRÍCOLA.	494	1	5	18	93
3.4.4.1. PROMOVER LA CREACIÓN DE ZONAS DE CONCENTRACIÓN AGRÍCOLA CON GRANDES POTENCIALIDADES, CON LA FINALIDAD DE GARANTIZAR LA SEGURIDAD ALIMENTARIA NACIONAL Y LA PRODUCCIÓN DE RUBROS AGROPECUARIOS TALES COMO EL MAÍZ, EL ARROZ, LA SOYA, EL ALGODÓN,  EL GANADO,PECES Y AVES.	495	1	5	18	162
5.1.3.3. CREAR SISTEMAS URBANOS ECOLÓGICOS, CON DISEÑOS ARQUITECTÓNICOS EQUILIBRADOS CON LOS ECOSISTEMAS NATURALES QUE REDUZCAN LOS NIVELES DE CONTAMINACIÓN AMBIENTAL.	496	1	7	23	117
3.4.3.1. IMPULSAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, FUNDAMENTADA EN CRITERIOS DE DESARROLLO DE POTENCIALIDADES PRODUCTIVAS SUSTENTABLES, ASÍ COMO LA OCUPACIÓN DEL TERRITORIO EN ÁREAS ESTRATÉGICAS.	497	1	5	18	93
3.4.3.12. CONFORMAR EL DISTRITO MOTOR LOS TACARIGUAS-LAS TEJERÍAS. ESTADOS ARAGUA Y CARABOBO. PROYECTOS DINAMIZADORES: ENSAMBLADORA DE VEHÍCULOS IRÁN VENEZUELA Y CHINA-VENEZUELA, SOLUCIÓN ESTRUCTURAL DEL CRECIMIENTO DEL LAGO DE TACARIGUA, DE  ESPECIALIZACIÓN INDUSTRIAL, AMBIENTAL Y AGRÍCOLA.	498	1	5	18	93
3.4.3.18. DISTRITO MOTOR URBANO CIUDAD BELÉN, UBICADO EN EL ESTADO MIRANDA, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	499	1	5	18	93
3.4.4.2. DESARROLLAR LAS PLANICIES CENTRALES DEL RÍO ORINOCO.	500	1	5	18	162
3.4.5.2. CONSTRUIR LA INFRAESTRUCTURA VIAL NECESARIA QUE PERMITA CONECTAR LAS ZONAS INDUSTRIALES CON LAS ZONAS DE EXPLOTACIÓN DE RECURSOS, Y MEJORAR LAS CONDICIONES DE LAS CARRETERAS EN LAS ZONAS RURALES Y AGRÍCOLAS.	501	1	5	18	94
3.4.5.3. MEJORAR EL SERVICIO PÚBLICO A LOS USUARIOS Y DESPLAZAR EL VIEJO PARQUE AUTOMOTOR QUE GENERA UN ALTO CONSUMO DE COMBUSTIBLE: A) PROMOVIENDO LA CREACIÓN DE EMPRESAS DE TRANSPORTE BAJO EL ESQUEMA DE PROPIEDAD SOCIAL DIRECTA O INDIRECTA; Y B) INCORPORANDO PROGRESIVAMENTE ENERGÍAS LIMPIAS EN LAS UNIDADES DE TRANSPORTE PÚBLICO Y PRIVADO.	502	1	5	18	94
4.1.1.3. CONSTRUIR LA ZONA ECONÓMICA DEL ALBA, FORTALECIENDO EL PAPEL DEL SISTEMA UNITARIO DE COMPENSACIÓN REGIONAL (SUCRE) Y DEL BANCO DEL ALBA EN LA ESTRATEGIA DE COMPLEMENTARIEDAD ECONÓMICA, FINANCIERA,PRODUCTIVA Y COMERCIAL DE LA REGIÓN.\n	504	1	6	19	96
4.3.1.7. IMPULSAR EL LIDERAZGO EN EL SENO DEL MOVIMIENTO DE PAÍSES NO ALINEADOS (MNOAL), A PROPÓSITO DE LA CELEBRACIÓN DE LA XVII CUMBRE DE JEFES DE ESTADO Y DE GOBIERNO EN VENEZUELA.\n	505	1	6	21	108
4.1.2.1. PROFUNDIZAR LA ALIANZA ENTRE VENEZUELA Y LOS PAÍSES DEL CARIBE, MEDIANTE LA INICIATIVA PETROCARIBE, CONSOLIDANDO UNA UNIÓN CARIBEÑA INDEPENDIENTE Y SOBERANA PARA EL DESARROLLO INTEGRAL DE SUS PUEBLOS,BUSCANDO CORREGIR LAS ASIMETRÍAS ENERGÉTICAS EXISTENTES FUNDAMENTÁNDOSE EN LOS PRINCIPIOS DE COOPERACIÓN Y SOLIDARIDAD, AVANZANDO HACIA LA CREACIÓN DE UNA ZONA ECONÓMICA PETROCARIBE (ZEP) QUE CONSIDERE A TODOS LOS PAÍSES MIEMBROS DEL CARICOM.	506	1	6	19	97
4.1.2.2. PROMOVER LA COORDINACIÓN ENTRE LA ZONA ECONÓMICA DEL ALBA (ECOALBA), LA ZONA ECONÓMICA PETROCARIBE (ZEP) Y EL MERCOSUR, CON EL FIN DE CREAR UNA ZONA ECONÓMICA CARIBEÑA SURAMERICANA. 	507	1	6	19	97
4.1.3.1. CONSOLIDAR LA MISIÓN MERCOSUR PARA DESARROLLAR LAS ÁREAS DE CAPACITACIÓN Y FORMACIÓN PARA LA EXPORTACIÓN; INVESTIGACIÓN, INNOVACIÓN Y TRANSFERENCIA TECNOLÓGICA; INVERSIÓN PARA LA PRODUCCIÓN Y PROMOCIÓN DE LA EXPORTACIÓN; PROFUNDIZACIÓN DE LA INDUSTRIALIZACIÓN; Y ADECUACIÓN DE INFRAESTRUCTURA PORTUARIA Y AEROPORTUARIA.	508	1	6	19	98
4.1.6.2. INTENSIFICAR LOS PROYECTOS GRAN NACIONALES DE LA UNIÓN ECONÓMICA CON LOS PAÍSES DEL ALBA Y DE COMPLEMENTACIÓN PRODUCTIVA CON LOS PAÍSES DEL MERCOSUR.	509	1	6	19	101
5.2.1.5. PROTEGER LAS CUENCAS HIDROGRÁFICAS DEL PAÍS Y TODOS LOS RECURSOS NATURALES PRESENTES EN ELLAS, PROMOVIENDO SU GESTIÓN INTEGRAL, HACIENDO ESPECIAL ÉNFASIS EN LAS SITUADAS AL SUR DEL ORINOCO.	510	1	7	24	121
4.3.2.2. ESTABLECER ALIANZAS CON LAS CADENAS DE COMUNICACIÓN E INFORMACIÓN DE LOS POLOS EMERGENTES DEL MUNDO, PARA ASEGURAR EL CONOCIMIENTO MUTUO Y LA INFORMACIÓN VERAZ SOBRE NUESTRAS REALIDADES, SIN EL FILTRO DEFORMADOR DE LAS GRANDES EMPRESAS DE COMUNICACIÓN DE LAS POTENCIAS IMPERIALISTAS.	511	1	6	21	109
4.3.3.1. PROMOVER LA PARTICIPACIÓN DE LAS REDES GLOBALES DE MOVIMIENTOS SOCIALES EN LOS GRANDES FOROS Y CUMBRES INTERNACIONALES.	512	1	6	21	110
4.4.1.3. LLEVAR A NIVELES NO VITALES LA PARTICIPACIÓN DE LAS INSTITUCIONES FINANCIERAS INTERNACIONALES EN LOS PROYECTOS DE DESARROLLO NACIONAL.	513	1	6	22	112
4.4.3.1. INCREMENTAR LA REPRESENTACIÓN DE DIVISAS EMERGENTES EN LAS RESERVAS MONETARIAS INTERNACIONALES DE LA REPÚBLICA, ASÍ COMO LA UTILIZACIÓN DE ESTE TIPO DE DIVISAS EN EL COMERCIO INTERNACIONAL DE VENEZUELA.	514	1	6	22	114
5.1.2.2. PRIORIZAR LOS INTERESES COMUNES SOBRE LOS INDIVIDUALES, DESDE UNA PERSPECTIVA CENTRADA EN EL EQUILIBRIO CON LA NATURALEZA Y EL RESPETO DE LAS  GENERACIONES PRESENTES Y FUTURAS.\n	515	1	7	23	116
5.1.2.4. FOMENTAR UN NUEVO ESQUEMA DE VALORES,ORIENTADO AL RESPETO Y PRESERVACIÓN DE LA NATURALEZA,QUE TRANSFORME LA CONCIENCIA COLECTIVA, SOBRE LOS PATRONES CAPITALISTAS DE PRODUCCIÓN Y CONSUMO.	516	1	7	23	116
5.1.3.1 PROMOVER LA INVESTIGACIÓN, LA INNOVACIÓN Y LA PRODUCCIÓN DE INSUMOS TECNOLÓGICOS DE BAJO IMPACTO AMBIENTAL, ASÍ COMO EL RESCATE DE TECNOLOGÍAS ANCESTRALES PARA LA PRODUCCIÓN Y PROCESAMIENTO AGRÍCOLA Y PECUARIO, ENTRE OTROS, AUMENTANDO LOS ÍNDICES DE EFICACIA Y PRODUCTIVIDAD.	517	1	7	23	117
3.4.3.3. IMPULSAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, FOMENTANDO LA EJECUCIÓN DE OBRAS Y SERVICIOS ESENCIALES EN LAS REGIONES Y COMUNIDADES DE MENOR DESARROLLO RELATIVO, DISMINUYENDO LAS ASIMETRÍAS ENTRE LAS GRANDES CIUDADES Y MEJORANDO EL HÁBITAT COMUNITARIO.	518	1	5	18	93
3.4.3.9. CONFORMAR EL DISTRITO MOTOR SUR DEL LAGO,ESTADOS ZULIA Y MÉRIDA. PROYECTO DINAMIZADOR UPS DE DISTRIBUCIÓN, DE ESPECIALIZACIÓN AGROINDUSTRIAL.\n	519	1	5	18	93
3.4.3.4. DECRETAR Y DESARROLLAR OCHO (8) DISTRITOS MOTORES DE LA FAJA PETROLÍFERA DEL ORINOCO; CON EL FIN DE APALANCAR EL DESARROLLO PETROLERO ASÍ COMO SUS POTENCIALIDADES ADICIONALES, ELEMENTOS GEOHISTÓRICOS, RELACIONES FUNCIONALES, CAPACIDADES SOCIO-PRODUCTIVAS. LOS DISTRITOS MOTORES SON: MAPIRE-SANTA CRUZ DEL ORINOCO,CIUDAD BOLÍVAR-SOLEDAD FALCONERO, SANTA RITA-CAICARA DEL ORINOCO, PALITAL-CHAGUARAMAS, TEMBLADOR, SANTA MARÍA DE IPIRE Y ZUATA-SAN DIEGO DE CABRUTICA\n	520	1	5	18	93
3.4.3.5. CONFORMAR EL DISTRITO MOTOR BARLOVENTO, ESTADO MIRANDA. ÁREA CON PRIORIDAD DE TRATAMIENTO EN LA CUENCA DEL RÍO TUY, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	521	1	5	18	93
3.4.3.11. CONFORMAR EL DISTRITO MOTOR ORTIZ-CALABOZO, ESTADOS GUÁRICO Y ARAGUA.  PROYECTOS DINAMIZADORES: UPS AGROALIMENTARIA, COMPLEJO AGROINDUSTRIALRÍO TIZNADO Y PROYECTO RÍO GUÁRICO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	522	1	5	18	93
3.4.3.15 CONFORMAR EL DISTRITO MOTOR ORICHUNA-MATIYURE, ESTADO APURE. PROYECTO DINAMIZADOR: UPS GANADERAS, DE ESPECIALIZACIÓN AGROPECUARIA.	523	1	5	18	93
3.4.3.17. DISTRITO MOTOR URBANO CIUDAD CARIBIA, UBICADO EN DISTRITO CAPITAL Y EL ESTADO VARGAS, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	524	1	5	18	93
3.4.5.5. COMPLEMENTAR EL SISTEMA DE PUERTOS Y AEROPUERTOS NACIONALES, CON EL FIN DE ATENDER LOS REQUERIMIENTOS DE MANEJO DE CARGA NACIONAL E INTERNACIONAL: A) DESARROLLANDO LA INFRAESTRUCTURA Y SERVICIOS QUE PERMITAN LA NAVEGACIÓN A LO LARGO DEL RÍO ORINOCO Y EL RÍO APURE COMO CANALES FUNDAMENTALES DE COMUNICACIÓN, SIN DEPREDAR EL MEDIO AMBIENTE; B) DESARROLLANDO UN SISTEMA DE PUERTOS CON NODOS REGIONALES EN LOS EJES DE INTEGRACIÓN Y DESARROLLO ORIENTAL, OCCIDENTAL Y APURE-ORINOCO; Y C) CONFIGURANDO UN SISTEMA LOGÍSTICO NACIONAL QUE PROPORCIONE LOS SERVICIOS Y FACILIDADES NECESARIOS PARA EL CABOTAJE NACIONAL E IMPULSO DE LA INTERMODALIDAD.	525	1	5	18	94
3.4.5.6. FORTALECER LAS EMPRESAS ESTATALES DIRIGIDAS AL TRANSPORTE ACUÁTICO, AÉREO Y TERRESTRE, DE MANERA TAL QUE PERMITA MEJORAR EL SERVICIO PÚBLICO TANTO DE PERSONAS, COMO DE MATERIAS PRIMAS, BIENES INTERMEDIOS Y PRODUCTOS TERMINADOS, CON ELEVADA EFICIENCIA, BAJOS COSTOS Y TARIFAS JUSTAS.	526	1	5	18	94
4.3.1.5. PROFUNDIZAR LAS RELACIONES DE COOPERACIÓN POLÍTICA Y ECONÓMICA CON TODOS LOS PAÍSES DE NUESTRA AMÉRICA, Y CON AQUELLOS PAÍSES DE ÁFRICA, ASIA, EUROPA Y OCEANÍA CUYOS GOBIERNOS ESTÉN DISPUESTOS A TRABAJAR CON BASE EN EL RESPETO Y LA COOPERACIÓN MUTUA.\n	527	1	6	21	108
3.4.6.3. IMPLEMENTAR PLANES DE MEJORA Y DOTACIÓN DE SERVICIOS PÚBLICOS BÁSICOS: A) CONSTRUYENDO NUEVOS SISTEMAS DE DISTRIBUCIÓN DE AGUA POTABLE Y DE SANEAMIENTO DE AGUAS SERVIDAS EN LOS ASENTAMIENTOS; B) MEJORANDO LOS SISTEMAS DE DISTRIBUCIÓN LOCAL DE ELECTRICIDAD; C) ACELERANDO EL PLAN DE DISTRIBUCIÓN DE GAS DOMÉSTICO; D) INCORPORANDO LOS NUEVOS DESARROLLOS Y LAS ZONAS SIN SERVICIO A LA RED DE TELECOMUNICACIONES; E) MEJORANDO LOS SISTEMAS LOCALES DE ACCESIBILIDAD PEATONAL Y VEHICULAR; F) FOMENTANDO Y FORTALECIENDO EL USO DEL TRANSPORTE COLECTIVO; Y G) HABILITANDO NUEVOS TERRENOS CON SERVICIOS BÁSICOS PARA LA CONSTRUCCIÓN DE DESARROLLOS HABITACIONALES.	528	1	5	18	95
4.1.6.1. PROFUNDIZAR LA IDENTIDAD POLÍTICA CON LOS GOBIERNOS Y PUEBLOS HERMANOS DE LOS PAÍSES MIEMBROS DEL ALBA Y DEL MERCOSUR, PARA SEGUIR IMPULSANDO POLÍTICAS DE JUSTICIA Y SOLIDARIDAD EN NUESTRA AMÉRICA.	529	1	6	19	101
4.1.7.2. GENERAR UNA POLÍTICA PERMANENTE DE FINANCIAMIENTO SOLIDARIO PARA EL IMPULSO DE ENCADENAMIENTOS ECONÓMICOS PRODUCTIVOS DE NUESTRA AMÉRICA, A FIN DE DE ALCANZAR LA INDEPENDENCIA ECONÓMICA, PRODUCTIVA Y ALIMENTARIA REGIONAL.	530	1	6	19	102
4.1.8.1. CONSOLIDAR A VENEZUELA COMO PROVEEDOR DE COOPERACIÓN SOLIDARIA, SIN PRETENSIONES HEGEMÓNICAS Y CON APEGO AL PRINCIPIO DE AUTODETERMINACIÓN DE LOS PUEBLOS.	531	1	6	19	103
4.1.8.3. GARANTIZAR LA TRANSFERENCIA CIENTÍFICO-TECNOLÓGICA EN LA COOPERACIÓN, A FIN DE ALCANZAR LA INDEPENDENCIA ECONÓMICA PRODUCTIVA.\n	532	1	6	19	103
4.2.1.3. DEFENDER LA PRESENCIA DE LAS MINORÍAS ÉTNICAS Y LOS PUEBLOS ORIGINARIOS EN LAS INSTANCIAS DE TOMA DE DECISIONES NUESTRO AMERICANAS.	533	1	6	20	106
4.3.1.1. ESTABLECER UNA ALIANZA CON EL GRUPO DE PAÍSES BRICS COMO NÚCLEO QUE AGRUPA A LOS PODERES EMERGENTES FUNDAMENTALES EN LA CONSOLIDACIÓN DEL MUNDO PLURIPOLAR.	534	1	6	21	108
5.1.6.1. DESARROLLAR PROYECTOS DE GENERACIÓN DE ENERGÍA EÓLICA, PARA INCREMENTAR SU PARTICIPACIÓN EN LA MATRIZ ENERGÉTICA.	535	1	7	23	120
4.3.1.6. INTENSIFICAR EL ACERCAMIENTO CON LOS MECANISMOS DE INTEGRACIÓN ECONÓMICA Y POLÍTICA DEL ASIA Y DEL ÁFRICA, TALES COMO ANSA/ASEAN Y CEDEAO/ECOWAS,PARTICIPANDO EN CALIDAD DE OBSERVADORES Y PROMOVIENDO LOS CONTACTOS CON LOS MECANISMOS DE UNIÓN E INTEGRACIÓN LATINOAMERICANA Y CARIBEÑA.	536	1	6	21	108
4.3.1.8. IMPULSAR FOROS DE UNIÓN INTERREGIONALES SUR SUR, COMO EL AMÉRICA DEL SUR-ÁFRICA (ASA) Y EL AMÉRICA DEL SUR-PAÍSES ÁRABES (ASPA).	537	1	6	21	108
4.3.4.1. MANTENER POLÍTICA ACTIVA Y LIDERAZGO, CONJUNTAMENTE CON LOS PAÍSES PROGRESISTAS DE LA REGIÓN, EN EL LLAMADO A LA URGENTE Y NECESARIA REFORMA DEL SISTEMA INTERAMERICANO DE DERECHOS HUMANOS, POR SER BASTIÓN ALTAMENTE POLITIZADO DEL IMPERIALISMO ESTADOUNIDENSE.	538	1	6	21	111
4.4.2.2. REDUCIR LA PARTICIPACIÓN DE LAS POTENCIAS NEOCOLONIALES EN EL FINANCIAMIENTO DE PROYECTOS ESTRATÉGICOS PARA EL DESARROLLO NACIONAL.\n	539	1	6	22	113
5.1.1.1. GARANTIZAR LA SOBERANÍA Y PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR ORGANIZADO PARA LA TOMA DE DECISIONES, DESDE EL INTERCAMBIO DE CONOCIMIENTOS, RACIONALIDADES Y FORMAS DE VIDA, PARA CONSTRUIR EL ECOSOCIALISMO.\n	540	1	7	23	115
5.1.1.3. IMPULSAR Y GARANTIZAR NUEVOS PROCESOS DE PRODUCCIÓN Y VALORIZACIÓN DE CONOCIMIENTOS CIENTÍFICOS,ANCESTRALES, TRADICIONALES Y POPULARES, ASÍ COMO NUEVAS RELACIONES ENTRE ELLOS, CON ESPECIAL ATENCIÓN A LAS PRÁCTICAS DE LOS GRUPOS SOCIALES INVISIBILIZADOS Y DISCRIMINADOS POR EL CAPITALISMO Y EL NEOCOLONIALISMO.	541	1	7	23	115
5.1.2.1. IMPULSAR Y DESARROLLAR UNA VISIÓN DE DERECHOS DE LA MADRE TIERRA, COMO REPRESENTACIÓN DE LOS DERECHOS DE LAS GENERACIONES PRESENTES Y FUTURAS, ASÍ COMO DE RESPETO A LAS OTRAS FORMAS DE VIDA.	542	1	7	23	116
5.1.2.3. PROMOVER LA IGUALDAD SUSTANTIVA ENTRE GÉNEROS, PERSONAS, CULTURAS Y COMUNIDADES.	543	1	7	23	116
5.1.3.7. PROMOVER LA CONFORMACIÓN DE REDES LOCALES,NACIONALES E INTERNACIONALES PARA EL IMPULSO DEL MODELO ECOSOCIALISTA.	544	1	7	23	117
5.1.3.9. IMPLEMENTAR POLÍTICAS DE FINANCIAMIENTO PARA EL DESARROLLO DE UNIDADES PRODUCTIVAS, PROMOVIENDO EL USO DE TECNOLOGÍAS AMIGABLES CON EL AMBIENTE.\n	545	1	7	23	117
3.4.3.14 CONFORMAR EL DISTRITO MOTOR FLORENTINO (BOCONÓ-BARINAS), ESTADO BARINAS Y TRUJILLO. PROYECTOS DINAMIZADORES: AUTOPISTA BOCONÓ-BARINAS, CENTRO DE MEJORAMIENTO GENÉTICO FLORENTINO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	546	1	5	18	93
3.4.3.16 CONFORMAR EL DISTRITO MOTOR URBANO CIUDAD TIUNA, UBICADO EN DISTRITO CAPITAL Y EL ESTADO BOLIVARIANO DE MIRANDA, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	547	1	5	18	93
3.4.5.1. MANTENER Y CONSTRUIR LAS CARRETERAS, AUTOPISTAS Y TRONCALES, CONECTANDO LAS GRANDES Y MEDIANAS CIUDADES A LO LARGO DEL TERRITORIO NACIONAL.	548	1	5	18	94
3.4.5.4. CULMINAR LA CONSTRUCCIÓN Y REHABILITACIÓN DE LOS TRAMOS FERROVIARIOS EN EJECUCIÓN Y DESARROLLAR NUEVOS TRAMOS COMO COLUMNA VERTEBRAL DE LOS EJES DE INTEGRACIÓN Y DESARROLLO, PARA EL TRANSPORTE DE PASAJEROS, PRODUCTOS AGRÍCOLAS, INDUSTRIALES Y BIENES COMERCIALES.	549	1	5	18	94
4.4.2.3. LLEVAR A NIVELES NO VITALES LA CONEXIÓN DE VENEZUELA CON LAS REDES DE COMUNICACIÓN E INFORMACIÓN DOMINADAS POR LAS POTENCIAS NEOCOLONIALES.	578	1	6	22	113
3.4.6.4. MEJORAR Y CONSTRUIR EL EQUIPAMIENTO URBANO NECESARIO PARA GARANTIZAR LA ACCESIBILIDAD A SERVICIOS VIALES, EDUCATIVOS, DE SALUD, DEPORTIVOS, SOCIALES, CULTURALES, DE ESPARCIMIENTO Y DE SEGURIDAD.	550	1	5	18	95
4.1.1.2. FORTALECER LOS MECANISMOS DE CONCERTACIÓN POLÍTICA DEL BLOQUE ALBA EN LOS SISTEMAS INTERAMERICANO Y MUNDIAL, HACIA SU TRANSFORMACIÓN INTEGRAL.	551	1	6	19	96
4.1.4.1. GARANTIZAR LA PARTICIPACIÓN ACTIVA EN LOS CONSEJOS DE UNASUR, PARA ALCANZAR EL IMPULSO DE POLÍTICAS Y ACCIONES QUE BENEFICIEN A LOS PUEBLOS DE NUESTRA AMÉRICA, PROMOVIENDO LA INTEGRACIÓN SOCIOCULTURAL, ECONÓMICA, ENERGÉTICA Y DE INFRAESTRUCTURA SURAMERICANA EN EL MARCO DEL FORTALECIMIENTO DE LA SOBERANÍA E INDEPENDENCIA DE LOS PUEBLOS.\n	552	1	6	19	99
4.1.9.4. DIFUNDIR DE FORMA PERMANENTE INFORMACIÓN VERAZ PRODUCIDA POR LOS PAÍSES DEL ALBA Y PAÍSES ALIADOS DEL SUR.	553	1	6	19	104
4.2.2.1. FOMENTAR EN EL ÁMBITO NUESTRO AMERICANO,CONVENIOS DE INTEGRACIÓN CULTURAL, EDUCATIVA, SOCIAL,CIENTÍFICO-TECNOLÓGICA, ENTRE OTROS.	554	1	6	20	107
4.3.2.1. FORTALECER LAS CADENAS MULTIESTATALES Y REDES COMUNITARIAS DE TELEVISIÓN Y RADIO, JUNTO CON SUS RESPECTIVAS PLATAFORMAS ELECTRÓNICAS, EXPANDIENDO SU ALCANCE, SU OFERTA EN DIFERENTES IDIOMAS Y LA VARIEDAD Y CALIDAD DE SUS CONTENIDOS, CON EL FIN DE PROYECTAR LA VERDAD DE LOS PUEBLOS Y ROMPER EL BLOQUEO INFORMATIVO Y LA CENSURA  IMPUESTAS POR LAS CORPORACIONES TRANSNACIONALES DE LA COMUNICACIÓN.	555	1	6	21	109
4.4.2.1. LLEVAR A NIVELES NO VITALES EL INTERCAMBIO COMERCIAL Y EL RELACIONAMIENTO  CON LOS CIRCUITOS FINANCIEROS DOMINADOS POR LAS POTENCIAS NEOCOLONIALES.\n	556	1	6	22	113
4.4.2.5. LLEVAR A NIVELES NO VITALES LA PARTICIPACIÓN TECNOLÓGICA DE LAS POTENCIAS IMPERIALES EN PROYECTOS DE DESARROLLO NACIONAL.	557	1	6	22	113
4.4.2.6. ELIMINAR LA PARTICIPACIÓN TECNOLÓGICA DE LAS POTENCIAS IMPERIALES EN SECTORES ESTRATÉGICOS PARA SOBERANÍA NACIONAL.\n	558	1	6	22	113
4.4.3.3. INCREMENTAR LA PARTICIPACIÓN ECONÓMICA TECNOLÓGICA DE POLOS EMERGENTES DEL MUNDO EN PROYECTOS DE DESARROLLO NACIONAL.\n	559	1	6	22	114
4.4.3.4. ESTABLECER ALIANZAS PARA LA COORDINACIÓN POLÍTICA Y EL INTERCAMBIO ECONÓMICO ENTRE MECANISMOS DE UNIÓN DEL SUR DE LOS DIFERENTES CONTINENTES, CON ESPECIAL ÉNFASIS EN EL GRUPO DE PAÍSES BRICS.\n	560	1	6	22	114
5.1.3.2. PROMOVER LA GENERACIÓN Y APROPIACIÓN SOCIAL DEL CONOCIMIENTO, TECNOLOGÍA E INNOVACIÓN QUE PERMITAN LA CONSERVACIÓN Y EL APROVECHAMIENTO SUSTENTABLE, JUSTO Y EQUITATIVO DE LA DIVERSIDAD BIOLÓGICA, GARANTIZANDO LA SOBERANÍA DEL ESTADO SOBRE SUS RECURSOS NATURALES.	561	1	7	23	117
5.1.4.1. PROMOVER EL USO SUSTENTABLE Y SOSTENIBLE DE LOS RECURSOS NATURALES EN LOS PROCESOS DE PRODUCCIÓN,CIRCULACIÓN Y CONSUMO DE LOS BIENES, PRODUCTOS Y SERVICIOS, ASÍ COMO LA DISMINUCIÓN DE DESECHOS, FOMENTANDO CAMPAÑAS PERMANENTES DE CONCIENCIACIÓN.	562	1	7	23	118
5.2.1.7. GARANTIZAR EL CONTROL SOBERANO SOBRE EL CONOCIMIENTO, EXTRACCIÓN, DISTRIBUCIÓN, COMERCIALIZACIÓN Y USOS DE LOS MINERALES ESTRATÉGICOS, DE MANERA SOSTENIBLE, EN FUNCIÓN DE LOS MÁS ALTOS INTERESES NACIONALES.	563	1	7	24	121
5.2.3.2. DEFENDER LOS DERECHOS TERRITORIALES Y LA SOBERANÍA DEL ESTADO VENEZOLANO EN LAS NEGOCIACIONES RELACIONADAS CON LA ADMINISTRACIÓN DE LOS ESPACIOS MARINOS, SUBMARINOS Y OCEÁNICOS, ASÍ COMO DE LA DIVERSIDAD BIOLÓGICA PRESENTE EN ESOS ESPACIOS.	564	1	7	24	123
5.3.4.2. EJECUTAR UN PLAN NACIONAL E INTERNACIONAL DE DIFUSIÓN DE LA CULTURA TRADICIONAL Y DE LA MEMORIA HISTÓRICA Y CONTEMPORÁNEA.\n	565	1	7	25	128
5.4.2.3. POSICIONAR A VENEZUELA COMO REFERENTE MUNDIAL EN LA LUCHA POR EL CUMPLIMIENTO DE LOS ACUERDOS ESTABLECIDOS Y DE SU IMPULSO POR LA CONSTRUCCIÓN DE UN NUEVO SISTEMA ECOSOCIALISTA.	566	1	7	26	130
3.4.6.1. IMPULSAR EL DESARROLLO DE CIUDADES INCLUYENTES Y SUSTENTABLES: A) IMPLEMENTANDO LA CIUDAD COMPACTA COMO MODELO DE DESARROLLO URBANO SUSTENTABLE,CON EDIFICACIONES DE BAJA ALTURA Y ALTA DENSIDAD; B) FOMENTANDO LA ECONOMÍA DE ESPACIOS Y RECURSOS COMO MEDIO PARA LOGRAR EL CRECIMIENTO URBANO EQUILIBRADO; Y C) DEMOCRATIZANDO LA ACCESIBILIDAD DE TODA LA POBLACIÓN EN CIUDADES, PRIVILEGIANDO EL USO DEL TRANSPORTE COLECTIVO, ESPACIOS ADECUADOS PARA LA CIRCULACIÓN CIUDADANA EN LA TRAMA URBANA, IMPLEMENTANDO PLANES DE HABILITACIÓN DE ESPACIOS PÚBLICOS EN LOS CENTROS POBLADOS Y REHABILITANDO LAS EDIFICACIONES DE EQUIPAMIENTO URBANO EXISTENTES.	567	1	5	18	95
3.4.6.2. CONTINUAR EL DESARROLLO DE LA GRAN MISIÓN VIVIENDA VENEZUELA Y DESPLEGAR LA GRAN MISIÓN BARRIO NUEVO BARRIO TRICOLOR PARA ABATIR EL DÉFICIT HABITACIONAL ACUMULADO: A) CONSTRUYENDO 2.650.000 VIVIENDAS NUEVAS, DISTRIBUIDAS DE TAL MANERA QUE SE CONSOLIDEN LOS EJES DE DESARROLLO INTEGRAL, LOS POLOS DE DESARROLLO Y LOS DISTRITOS MOTORES; B) PROMOVIENDO LA AUTOCONSTRUCCIÓN; C) MEJORANDO Y AMPLIANDO 1.000.000 DE VIVIENDAS, PARA CONSOLIDAR ASENTAMIENTOS EXISTENTES; Y D) FORTALECIENDO LA CONSTRUCCIÓN DE VIVIENDAS EN EL ÁMBITO RURAL PARA MEJORAR LAS CONDICIONES DE VIDA DE LA FAMILIA CAMPESINA.	568	1	5	18	95
3.4.6.5. ASOCIAR ACTIVIDADES PRODUCTIVAS DE BAJO IMPACTO AMBIENTAL A LOS PLANES Y PROYECTOS URBANOS,GENERANDO TRABAJO LIBERADOR PARA LOS NUEVOS HABITANTES, IMPULSANDO LA DIVERSIFICACIÓN PRODUCTIVA.\n	569	1	5	18	95
4.1.5.1. FORTALECER EL PAPEL DE LA CELAC COMO ESPACIO COMÚN PARA LA INTEGRACIÓN POLÍTICA, ECONÓMICA, SOCIAL Y CULTURAL DE LA REGIÓN.\n	570	1	6	19	100
4.1.6.3. PROFUNDIZAR LA ESTRATEGIA DE DIÁLOGO POLÍTICO AL MÁS ALTO NIVEL Y DE ENCADENAMIENTOS PRODUCTIVOS CON LA HERMANA REPÚBLICA DE COLOMBIA, DANDO CUMPLIMIENTO AL MANDATO DE UNIÓN DE EL LIBERTADOR SIMÓN BOLÍVAR.	571	1	6	19	101
4.1.8.2. ORIENTAR LA COOPERACIÓN CON LOS PAÍSES ALIADOS DE LA REGIÓN, COMO MOTOR DE IMPULSO DEL MODELO SOCIO-PRODUCTIVO SOCIALISTA.	572	1	6	19	103
4.1.9.5. GARANTIZAR LA PRODUCCIÓN PERMANENTE DE CONTENIDOS, PARA DIFUNDIR A TRAVÉS DE MEDIOS DE COMUNICACIÓN REGIONALES LOS AVANCES ECONÓMICOS, SOCIALES, POLÍTICOS Y CULTURALES DE LA REVOLUCIÓN BOLIVARIANA.\n	573	1	6	19	104
4.1.9.6. DESARROLLAR CAPACIDADES DE PRODUCCIÓN DE CONTENIDOS AUDIOVISUALES EN FORMATO DIGITAL DESDE Y PARA LA PUESTA EN MARCHA DE LA TELEVISIÓN DIGITAL ABIERTA (TDA) A NIVEL NACIONAL Y PARA EL INTERCAMBIO REGIONAL.	574	1	6	19	104
4.2.1.2. AUMENTAR LA PRESENCIA DE LA TEMÁTICA SOBRE LA IDENTIDAD NACIONAL Y LA DIVERSIDAD DE LOS PUEBLOS EN LOS CONTENIDOS CURRICULARES, PROGRAMACIÓN AUDIOVISUAL Y EVENTOS NACIONALES E INTERNACIONALES.	575	1	6	20	106
4.3.1.3. ELEVAR A UN NIVEL SUPERIOR LAS ALIANZAS ESTRATÉGICAS CON LA REPÚBLICA POPULAR CHINA, LA FEDERACIÓN DE RUSIA, LA REPÚBLICA FEDERATIVA DEL BRASIL, LA REPÚBLICA DE BELARÚS Y LA REPÚBLICA ISLÁMICA DE IRÁN CON EL FIN DE SEGUIR CONSOLIDANDO EL PODER NACIONAL.	576	1	6	21	108
4.4.1.1. DENUNCIAR LOS TRATADOS MULTILATERALES, ASÍ COMO TAMBIÉN LOS TRATADOS Y ACUERDOS BILATERALES QUE LIMITEN LA SOBERANÍA NACIONAL FRENTE A LOS INTERESES DE LAS POTENCIAS NEOCOLONIALES, TALES COMO LOS TRATADOS DE PROMOCIÓN Y PROTECCIÓN DE INVERSIONES.	577	1	6	22	112
4.4.2.4. ELIMINAR LA DEPENDENCIA DE SECTORES ESTRATÉGICOS PARA EL DESARROLLO NACIONAL DE REDES DE COMUNICACIÓN E INFORMACIÓN CONTROLADAS POR LAS POTENCIAS NEOCOLONIALES.	579	1	6	22	113
4.4.3.2. EFECTUAR LA PORCIÓN MAYORITARIA DEL INTERCAMBIO ECONÓMICO Y COMERCIAL CON POLOS EMERGENTES DEL MUNDO NUEVO.	580	1	6	22	114
5.1.1.2. DESARROLLAR UNA POLÍTICA INTEGRAL DE CONSERVACIÓN, APROVECHAMIENTO SUSTENTABLE, PROTECCIÓN Y DIVULGACIÓN CIENTÍFICA DE LA DIVERSIDAD BIOLÓGICA Y DE LOS RESERVORIOS DE AGUA DEL PAÍS.	581	1	7	23	115
5.1.3.4. PROMOVER EL DESARROLLO DE ACTIVIDADES DE TURISMO SUSTENTABLE Y SOSTENIBLE PARA EL DISFRUTE DE LA POBLACIÓN.	582	1	7	23	117
5.1.3.6. PRESERVAR Y MANEJAR LAS ÁREAS ESTRATÉGICAS PARA LA CONSERVACIÓN, TALES COMO LAS ABRAES, POR LOS BENEFICIOS VITALES QUE SE DERIVAN DE SU CONSERVACIÓN Y SU CONTRIBUCIÓN A LA SUPREMA FELICIDAD SOCIAL.	583	1	7	23	117
5.1.3.8. PROMOVER PRÁCTICAS DE CONSERVACIÓN DEL AMBIENTE EN LA ACTIVIDAD SOCIO-PRODUCTIVA, SUPERANDO EL CRITERIO DE “EFICIENCIA ECONÓMICA” POR SER UNA PRÁCTICA DESVINCULADA DE LA RACIONALIDAD EN EL USO DE LOS RECURSOS NATURALES.	584	1	7	23	117
5.1.4.3. DESARROLLAR NORMATIVAS LEGALES QUE PROMUEVAN LA IMPLEMENTACIÓN DEL REÚSO EN EL PAÍS.	585	1	7	23	118
5.1.5.3. AUMENTAR LA DENSIDAD DE ÁREAS VERDES POR HABITANTE, MEDIANTE LA CONSTRUCCIÓN DE PARQUES Y ESPACIOS DE SOCIALIZACIÓN NATURALES.	586	1	7	23	119
5.1.5.5. ESTABLECER A LA CHATARRA FERROSA Y NO FERROSA COMO UN INSUMO DE INTERÉS NACIONAL PARA EL PROCESO PRODUCTIVO, A EFECTO DE ATENDER LA ESTRUCTURA DE COSTOS DE LOS PRODUCTOS Y EL CUIDADO DEL AMBIENTE ASÍ COMO EFICIENCIA ENERGÉTICA. 	587	1	7	23	119
5.2.1.3. PROFUNDIZAR, ARTICULADAMENTE ENTRE INSTANCIAS DEL PODER PÚBLICO Y EL PODER POPULAR, LA PROTECCIÓNINTEGRAL DEL AGUA COMO UN DEBER, HACIENDO USO RESPONSABLE DE LA MISMA E IMPULSANDO ESPACIOS NACIONALES E INTERNACIONALES DE DISCUSIÓN SOBRE SU USO  Y DEMOCRATIZACIÓN.	588	1	7	24	121
5.2.1.6. CONTINUAR IMPULSANDO EL RECONOCIMIENTO DEL ACCESO AL AGUA POTABLE COMO UN DERECHO HUMANO EN TODOS LOS ÁMBITOS NACIONALES E INTERNACIONALES.	589	1	7	24	121
5.2.2.1. ACTIVAR ALIANZAS ESTRATÉGICAS PARA LA LUCHA CONTRA LA MERCANTILIZACIÓN DE LA NATURALEZA EN TODOS LOS ÁMBITOS NACIONALES E INTERNACIONALES.	590	1	7	24	122
1.1.5.4. PROMOVER E IMPULSAR UN SISTEMA NACIONAL DE COMUNICACIÓN POPULAR.	684	1	3	3	5
5.1.3.5. CONSTITUIR UN SISTEMA NACIONAL, REGIONAL Y LOCAL PARA EL APROVECHAMIENTO DE RESIDUOS Y DESECHOS, PARA LA CREACIÓN DE INSUMOS ÚTILES PARA EL VIVIR BIEN,DÁNDOLE PRIORIDAD A SU USO COMO MATERIAS PRIMAS SECUNDARIAS PARA LA INDUSTRIA NACIONAL.\n	591	1	7	23	117
5.1.3.10. RESCATAR LOS SABERES ANCESTRALES DE LOS PUEBLOS ORIGINARIOS SOBRE LOS PROCESOS PRODUCTIVOS, PARA EL DESARROLLO DE TECNOLOGÍAS SUSTENTABLES QUE INCIDAN EN LOS NUEVOS ESQUEMAS DE RELACIONAMIENTO INTERNACIONAL.	592	1	7	23	117
5.1.3.12. FACILITAR EL ACCESO A LOS PEQUEÑOS Y MEDIANOS PRODUCTORES Y A LAS FORMAS ASOCIATIVAS DE PROPIEDAD Y DE PRODUCCIÓN, PARA SU INSERCIÓN EFECTIVA EN LAS CADENAS DE VALOR INTRARREGIONALES, CON SOSTENIBILIDAD AMBIENTAL.	593	1	7	23	117
5.1.6.2. AUMENTAR LA GENERACIÓN DE ENERGÍA SOLAR MEDIANTE LA INSTALACIÓN DE FÁBRICAS DE PANELES SOLARES,QUE ATIENDAN PRIORITARIAMENTE LA DEMANDA ENERGÉTICA DE LAS POBLACIONES AISLADAS.	594	1	7	23	120
5.2.1.2. PROMOVER LA CONSERVACIÓN Y EL USO SUSTENTABLE DE LA DIVERSIDAD BIOLÓGICA, EN UN MARCO REGIONAL, CONTINENTAL Y MUNDIAL ORIENTADO A LA INTEGRACIÓN, SOBERANÍA Y EL VIVIR BIEN.\n	595	1	7	24	121
5.2.2.2. IMPULSAR EL DESARROLLO DE UNA VISIÓN DESDE EL SUR QUE PERMITA FORTALECER LA DEFENSA DE LOS INTERESES REGIONALES EN MATERIA AMBIENTAL.	596	1	7	24	122
5.3.1.2. PROMOVER LA PRODUCCIÓN DE CONTENIDO EDUCATIVO, TALES COMO TEXTOS ESCOLARES, PARA GENERAR CONSCIENCIA HISTÓRICA Y FORMAR CRÍTICAMENTE LAS NUEVAS GENERACIONES.\n	597	1	7	25	125
5.3.2.2. PROMOVER LA ORGANIZACIÓN DEL PODER POPULAR PARA EL REGISTRO E INTERPRETACIÓN DE LA MEMORIA HISTÓRICA  Y LA DIFUSIÓN Y EXPRESIÓN DE LAS CULTURAS POPULARES.	598	1	7	25	126
5.3.4.3. FOMENTAR Y GARANTIZAR LA PRODUCCIÓN INDEPENDIENTE Y COMUNITARIA DE LAS ARTES.\n	599	1	7	25	128
5.4.2.1. PROMOVER LA ADECUACIÓN TECNOLÓGICA PARA UNA TRANSFORMACIÓN DEL SECTOR PRODUCTIVO, DE MANERA SUSTENTABLE, CON ESPECIAL ÉNFASIS EN EL SECTOR ENERGÉTICO, AGRÍCOLA Y PECUARIO, INCORPORANDO EL PRINCIPIO DE PREVENCIÓN Y MANEJO DE LOS DESECHOS SÓLIDOS Y PELIGROSOS.\n	600	1	7	26	130
5.4.3.1. COORDINAR ACCIONES CON TODOS LOS ENTES NACIONALES ENCARGADOS DE LA PLANIFICACIÓN TERRITORIAL Y LA GESTIÓN DE DESASTRES, CON UNA VISIÓN PROSPECTIVA DEL INCREMENTO DE TEMPERATURA PREVISTO PARA LOS PRÓXIMOS 20 AÑOS, EN FUNCIÓN DE LAS  PROMESAS DE MITIGACIÓN QUE LOGREN CONSOLIDARSE EN EL MARCO DE LA ORGANIZACIÓN DE LAS NACIONES UNIDAS.	601	1	7	26	131
2.2.4.1. PROFUNDIZAR LA PARTICIPACIÓN POLÍTICA Y PROTAGÓNICA DE LAS MUJERES.\n	602	1	4	11	136
5.4.3.2. CALCULAR LOS COSTOS DERIVADOS DE LAS PÉRDIDAS Y DAÑOS RESULTANTES DE SITUACIONES EXTREMAS CLIMÁTICAS, INCLUYENDO SEGUROS Y REASEGUROS PARA SECTORES SENSIBLES ESPECÍFICOS (COMO LA AGRICULTURA), LAS CUALES DEBERÁN SUMARSE A LA DEUDA ECOLÓGICA DE LOS PAÍSES INDUSTRIALIZADOS.	603	1	7	26	131
5.3.1.1. INVOLUCRAR A LAS INSTITUCIONES PÚBLICAS Y AL PODER POPULAR EN LA PRODUCCIÓN DE CRÍTICAS CONTUNDENTES A LAS FORMAS CULTURALES Y A LAS RECONSTRUCCIONES HISTÓRICAS DOMINANTES.\n	604	1	7	25	125
5.1.4.2. FOMENTAR EL RE USO DE LOS RESIDUOS PARA SU UTILIZACIÓN COMO MATERIAS PRIMAS O BIENES FINALES; A TRAVÉS DE LA CONFORMACIÓN DE CIRCUITOS QUE INCLUYAN LA CLASIFICACIÓN DE RESIDUOS POR PARTE DE TODA LA POBLACIÓN,ESTABLECIENDO CENTROS DE ACOPIO Y UNIDADES PRODUCTIVAS TRANSFORMADORAS.	605	1	7	23	118
5.1.5.1. PROMOVER CIUDADES ENERGÉTICAMENTE EFICIENTES, MEDIANTE EL USO DE TECNOLOGÍAS AHORRADORAS DE ENERGÍA, ASÍ COMO BASADAS EN EL USO DE ENERGÍAS LIMPIAS (EÓLICAS,  SOLARES, GAS, ENTRE OTRAS).	606	1	7	23	119
5.1.5.2. DESARROLLAR SISTEMAS DE TRANSPORTE PÚBLICO EFICIENTES EN EL USO DE RECURSOS Y DE BAJO IMPACTO AMBIENTAL.\n	607	1	7	23	119
5.1.5.4. PROMOVER SISTEMAS CONSTRUCTIVOS NO CONTAMINANTES Y SISTEMAS DE VIVIENDAS ECOEFICIENTES.\n	608	1	7	23	119
5.2.1.1. MANTENER EL LIDERAZGO EN LAS NEGOCIACIONES INTERNACIONALES MULTILATERALES Y REGIONALES, RELACIONADAS CON LOS RESPECTIVOS MARCOS JURÍDICOS SECTORIALES AMBIENTALES.	609	1	7	24	121
5.2.2.3. IMPULSAR EN LOS ORGANISMOS DE INTEGRACIÓN SURAMERICANA ALBA, CELAC, UNASUR, MERCORSUR, PETROCARIBE, ASÍ COMO EN LOS DIVERSOS ESPACIOS INTERNACIONALES A LOS QUE ASISTE VENEZUELA, EL CONCEPTO DE BAJO IMPACTO AMBIENTAL DE FORMA TRANSVERSAL EN TODAS LAS ACCIONES EMPRENDIDAS.	610	1	7	24	122
1.3.4.2. ESTABLECER MECANISMOS TRANSPARENTES PARA LA VALORIZACIÓN DE LOS MINERALES.	708	1	3	5	22
5.2.4.1. MANTENER VIGILANCIA DEL DESARROLLO DE LA AGENDA DEL CONSEJO DE SEGURIDAD DE LAS NACIONES UNIDAS PARA EVITAR LA INJERENCIA EN LOS TEMAS AMBIENTALES Y HUMANOS, Y  SU TRATAMIENTO COMO TEMAS DE SEGURIDAD CIUDADANA INTERNACIONAL, LO CUAL ATENTA CONTRA LA SOBERANÍA DE LOS PUEBLOS.\n	611	1	7	24	124
5.2.4.2. FORTALECER LOS DEBATES SUSTANTIVOS EN TEMAS ECONÓMICOS, SOCIALES Y AMBIENTALES EN TODOS LOS ÁMBITOS INTERNACIONALES, REGIONALES Y MULTILATERALES, PARA QUE LAS DECISIONES SE TOMEN DE MANERA INCLUSIVA Y TRANSPARENTE, SIN ORIENTACIONES DE CORTE NEOCOLONIAL  POR PARTE DE LOS PAÍSES DESARROLLADOS, PROMOVIENDO LA INCORPORACIÓN DEL PODER POPULAR Y EN PARTICULAR LOS MOVIMIENTOS SOCIALES EN ESTOS ESPACIOS.\n	612	1	7	24	124
5.3.2.1. FORTALECER LOS PROCESOS QUE VISIBILICEN LA IDENTIDAD HISTÓRICO-COMUNITARIA, IDENTIFICANDO LOS ESPACIOS DE EXPRESIÓN Y FORMAS POPULARES DE REPRODUCCIÓN DE LA MEMORIA HISTÓRICA, Y FOMENTANDO LA EXPRESIÓN DE LAS DIVERSAS MANIFESTACIONES CULTURALES TRADICIONALES.	613	1	7	25	126
5.3.2.3. GARANTIZAR LA PROTECCIÓN DEL PATRIMONIO CULTURAL POPULAR Y DE LA MEMORIA HISTÓRICA, A TRAVÉS DE LA FORMACIÓN INTEGRAL PERMANENTE Y CONTINUA DE LOS PROMOTORES CULTURALES DEL PODER POPULAR.	614	1	7	25	126
5.3.3.2. INCORPORAR A LAS ORGANIZACIONES POPULARES EN EL DISEÑO DE LAS POLÍTICAS CULTURALES, IMPULSANDO INICIATIVAS COMO LOS COMITÉS DE CULTURA DE LOS CONSEJOS COMUNALES ENTRE OTRAS.	615	1	7	25	127
5.4.1.1. DESMONTAR LOS ESQUEMAS DE MERCADOS INTERNACIONALES DE CARBONO QUE LEGITIMAN LA COMPRA DE DERECHOS DE CONTAMINACIÓN Y LA IMPUNE DESTRUCCIÓN DEL PLANETA.	616	1	7	26	129
5.4.1.3. IMPULSAR Y APOYAR ACCIONES QUE PROMUEVAN LA JUSTICIA INTERNACIONAL CON RELACIÓN AL INCUMPLIMIENTO DE LOS PAÍSES DESARROLLADOS DE SUS OBLIGACIONES EN EL MARCO DEL PROTOCOLO DE KYOTO.	617	1	7	26	129
5.4.2.2. IMPULSAR A NIVEL REGIONAL E INTERNACIONAL COMPROMISOS POR PARTE DE TODOS LOS PAÍSES Y MEDIDAS NACIONALES DE MITIGACIÓN QUE CONTRIBUYAN A CORREGIR EL DETERIORO AMBIENTAL QUE GENERA EL CAMBIO CLIMÁTICO GLOBAL.\n	618	1	7	26	130
5.4.3.3. FOMENTAR EL DESARROLLO DE PLANES MUNICIPALES Y LOCALES DE ADAPTACIÓN PARA ESCENARIOS DE MANEJO DE RIESGO QUE INVOLUCREN DIRECTAMENTE LA CORRESPONSABILIDAD ENTRE EL ESTADO Y EL PODER POPULAR.	619	1	7	26	131
5.2.3.1. REIMPULSAR LA COOPERACIÓN CON LOS PAÍSES FRONTERIZOS EN TEMAS DE GESTIÓN AMBIENTAL Y ZONAS ECOLÓGICAS DE INTERÉS COMÚN CONFORME A LOS PRINCIPIOS DEL DERECHO INTERNACIONAL, RESPETANDO LA SOBERANÍA NACIONAL.\n	620	1	7	24	123
5.3.2.4. INVOLUCRAR A LOS MUSEOS Y OTRAS INSTITUCIONES DE INTERÉS HISTÓRICO Y CULTURAL, EN EL PLAN DE CONSERVACIÓN Y VALORIZACIÓN DEL PATRIMONIO CULTURAL E HISTÓRICO POPULAR.	621	1	7	25	126
5.3.3.1. IMPULSAR DEBATES DENTRO DE LAS ORGANIZACIONES DEL PODER POPULAR SOBRE LA VIVENCIA CULTURAL Y LAS IDENTIDADES, PARA EL ANÁLISIS DE LA SITUACIÓN ACTUAL Y LOS CAMBIOS QUE SE NECESITAN EN LA CONSTRUCCIÓN DEL ECOSOCIALISMO.\n	622	1	7	25	127
5.3.3.3. DESARROLLAR ESTRATEGIAS DE LIBERACIÓN Y EMANCIPACIÓN CULTURAL, PONIENDO ESPECIAL ÉNFASIS EN GRUPOS SOCIALES ESPECIALMENTE VULNERABLES, TALES COMO LOS GRUPOS SEXO DIVERSOS, MUJERES, ESTUDIANTES, NIÑOS Y NIÑAS, AFRODESCENDIENTES, ENTRE OTROS, CON LA FINALIDAD DE GARANTIZAR EL RESPETO DE SUS DERECHOS E IDENTIDADES.	623	1	7	25	127
5.3.4.1. PRODUCIR Y DIFUNDIR MATERIALES SOBRE LA HISTORIA DE LOS GRUPOS HISTÓRICAMENTE INVISIBILIZADOS Y LA MEMORIA HISTÓRICA Y CULTURAL DE NUESTRA AMÉRICA, ESPECIALMENTE EN LAS BIBLIOTECAS PÚBLICAS Y ESCOLARES, ASÍ COMO EN LOS MEDIOS MASIVOS DE COMUNICACIÓN.\n	624	1	7	25	128
5.4.1.2. PROMOVER E IMPULSAR EL FORTALECIMIENTO DEL RÉGIMEN JURÍDICO CLIMÁTICO VIGENTE, CON ÉNFASIS EN LAS RESPONSABILIDADES HISTÓRICAS DE LOS PAÍSES DESARROLLADOS.	625	1	7	26	129
5.4.1.4. INICIAR UN PROCESO DE TRANSFORMACIÓN DE LAS DISPOSICIONES LEGALES NACIONALES PARA GARANTIZAR LA ADMINISTRACIÓN Y LA PROTECCIÓN DEL PATRIMONIO NATURAL, EN  LA CONSTRUCCIÓN DEL ECOSOCIALISMO.	626	1	7	26	129
2.4.1.3. PROMOVER LA ÉTICA Y LOS VALORES SOCIALISTAS, LA FORMACIÓN Y AUTOFORMACIÓN, LA DISCIPLINA CONSCIENTE BASADA EN LA CRÍTICA Y LA AUTOCRÍTICA, LA PRÁCTICA DE LA SOLIDARIDAD Y EL AMOR, LA CONCIENCIA DEL DEBER SOCIAL Y LA LUCHA CONTRA LA CORRUPCIÓN Y EL BUROCRATISMO.\n	627	1	4	13	151
2.5.3.4. EJECUTAR UN PROCESO DE REORGANIZACIÓN DE LA ADMINISTRACIÓN PÚBLICA, HOMOLOGANDO Y DIGNIFICANDO LAS CONDICIONES DE LOS SERVIDORES PÚBLICOS, DE ACUERDO A SUS ROLES Y COMPETENCIAS, PARA POTENCIAR Y AMPLIAR SUS CAPACIDADES, CON MIRAS A DESARROLLAR EL MODELO ECONÓMICO PRODUCTIVO SOCIALISTA.\n	628	1	4	14	155
2.3.1.1 PROMOVER, CONSOLIDAR Y EXPANDIR LA ORGANIZACIÓN DEL PODER POPULAR EN EL ÁMBITO TERRITORIAL Y SECTORIAL, EN LA FIGURA DE LAS DISTINTAS INSTANCIAS DE PARTICIPACIÓN.\n	629	1	4	12	146
2.3.3.3. IMPULSAR LA CREACIÓN DE UNIDADES DE ACOMPAÑAMIENTO TÉCNICO INTEGRAL ESTADALES, DOTANDO AL PODER POPULAR ORGANIZADO DE HERRAMIENTAS TÉCNICAS ÚTILES PARA UNA GESTIÓN COMUNAL EFICIENTE, EFICAZ, EFECTIVA Y DE CALIDAD.\n	630	1	4	12	148
2.3.1.2. PROMOVER LA ORGANIZACIÓN DEL PODER POPULAR EN EL SISTEMA DE AGREGACIÓN COMUNAL PARA LA CONSTRUCCIÓN DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA A TRAVÉS DE INSTANCIAS COMO CONSEJOS COMUNALES, SALAS DE BATALLA SOCIAL, COMUNAS SOCIALISTAS, CIUDADES COMUNALES, FEDERACIONES Y CONFEDERACIONES COMUNALES, ENTRE OTROS.\n	631	1	4	12	146
2.3.1.3. ACELERAR LA CONFORMACIÓN LOS CONSEJOS COMUNALES A NIVEL NACIONAL, GARANTIZANDO LA COBERTURA DEL 70% DE LA POBLACIÓN TOTAL VENEZOLANA ORGANIZADA EN CONSEJOS COMUNALES  PARA EL AÑO 2019.\n	632	1	4	12	146
2.3.1.4. PROMOVER LA CONFORMACIÓN DE LAS SALAS DE BATALLA SOCIAL, COMO HERRAMIENTA DE ARTICULACIÓN ENTRE EL PUEBLO ORGANIZADO Y EL ESTADO.\n	633	1	4	12	146
2.3.1.5. AFIANZAR LA CONFORMACIÓN DE LAS COMUNAS SOCIALISTAS, PARA LA CONSOLIDACIÓN DEL PODER POPULAR, DE ACUERDO A LAS CARACTERÍSTICAS DEMOGRÁFICAS DE LOS EJES DE DESARROLLO TERRITORIAL, PARA ALCANZAR 3.000 COMUNAS EL AÑO 2019.\n	634	1	4	12	146
2.3.1.6. CONFORMAR LAS FEDERACIONES Y CONFEDERACIONES COMUNALES PARA EL FORTALECIMIENTO DE LAS CAPACIDADES CREADORAS DEL PODER POPULAR, EN LOS ÁMBITOS TERRITORIALES, SOCIOPRODUCTIVOS, POLÍTICOS, ECONÓMICOS, SOCIALES, CULTURALES, ECOLÓGICOS Y DE SEGURIDAD Y DEFENSA DE LA SOBERANÍA NACIONAL.\n	635	1	4	12	146
2.3.1.7. IMPULSAR LA ORGANIZACIÓN COMUNAL DE LOS PUEBLOS INDÍGENAS, GARANTIZANDO LA CONSTITUCIÓN DE 40 COMUNAS INDÍGENAS SOCIALISTAS PARA EL AÑO 2019.\n\n	636	1	4	12	146
2.3.2.1. DESARROLLAR EL SISTEMA ECONÓMICO COMUNAL CON LAS DISTINTAS FORMAS DE ORGANIZACIÓN SOCIO-PRODUCTIVA: EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, UNIDADES FAMILIARES, GRUPOS DE INTERCAMBIO SOLIDARIO Y DEMÁS FORMAS ASOCIATIVAS PARA EL TRABAJO.\n	637	1	4	12	147
2.3.2.2. PROMOVER LA CREACIÓN Y FORTALECIMIENTO DE EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, PARA CONTRIBUIR A LA GENERACIÓN DE UN NUEVO TEJIDO PRODUCTIVO DIVERSIFICADO Y SUSTENTABLE PARA LA CONSTRUCCIÓN DEL SOCIALISMO BOLIVARIANO.\n	638	1	4	12	147
2.3.2.3. DESARROLLAR UNA NUEVA ARQUITECTURA FINANCIERA, CONFIGURANDO REDES DE ORGANIZACIONES ECONÓMICO-FINANCIERAS, QUE GESTIONEN LOS RECURSOS FINANCIEROS Y NO FINANCIEROS, RETORNABLES Y NO RETORNABLES, ADMINISTRADAS POR LAS COMUNIDADES Y DIFERENTES ORGANIZACIONES DEL PODER POPULAR.\n	639	1	4	12	147
2.3.2.4. FORTALECER EL SISTEMA ECONÓMICO COMUNAL, MEDIANTE PROCESOS DE TRANSFERENCIA DE EMPRESAS DE PROPIEDAD SOCIAL INDIRECTA A INSTANCIAS DEL PODER POPULAR, ASÍ COMO EL FORTALECIMIENTO DE LAS INSTANCIAS DE FINANCIAMIENTO Y LA INTEGRACIÓN DE CADENAS PRODUCTIVAS Y DE VALOR.\n	640	1	4	12	147
2.3.2.5. CONFORMAR BANCOS COMUNALES QUE PERMITAN CONSOLIDAR LA NUEVA ARQUITECTURA FINANCIERA DEL PODER POPULAR.\n	641	1	4	12	147
2.3.2.6. PROMOVER LA CONFORMACIÓN DE LOS CONSEJOS DE ECONOMÍA COMUNAL EN LAS COMUNAS Y LOS COMITÉS DE ECONOMÍA COMUNAL EN LOS CONSEJOS COMUNALES.\n	642	1	4	12	147
2.3.2.7. REGISTRO Y CONFORMACIÓN DE TODAS LAS EMPRESAS DE PROPIEDAD SOCIAL DIRECTA COMUNAL, EMPRESAS DE PROPIEDAD SOCIAL INDIRECTA COMUNAL, UNIDADES PRODUCTIVAS FAMILIARES Y GRUPOS DE INTERCAMBIO SOLIDARIOS EXISTENTES EN EL PAÍS.\n\n	643	1	4	12	147
2.3.3.1. LOGRAR LA CONSOLIDACIÓN DE UN SISTEMA DE ARTICULACIÓN ENTRE LAS DIFERENTES INSTANCIAS DEL PODER POPULAR, CON EL FIN DE TRASCENDER DE LA ACCIÓN LOCAL AL ÁMBITO DE LO REGIONAL Y NACIONAL, RUMBO A LA CONSTRUCCIÓN DE UN SUBSISTEMA DE COMUNAS, DISTRITOS MOTORES DE DESARROLLO Y EJES DE DESARROLLO TERRITORIAL.\n	644	1	4	12	148
2.3.3.2. INSTAURAR LA NOCIÓN DE CORRESPONSABILIDAD EN TORNO AL PROCESO DE PLANIFICACIÓN COMUNAL, REGIONAL Y TERRITORIAL PARA IMPULSAR LA PARTICIPACIÓN CORRESPONSABLE DE LA ORGANIZACIÓN POPULAR EN EL ESTUDIO Y ESTABLECIMIENTO DE LOS LINEAMIENTOS Y ACCIONES ESTRATÉGICAS PARA EL DESARROLLO DE PLANES, OBRAS Y SERVICIOS EN LAS COMUNIDADES Y REGIONES.\n	645	1	4	12	148
2.3.3.4. PROMOVER LA ORGANIZACIÓN DE LAS UNIDADES DE CONTRALORÍA SOCIAL DE LOS CONSEJOS COMUNALES, PARA GARANTIZAR LA MÁXIMA EFICIENCIA DE LAS POLÍTICAS PÚBLICAS.\n	646	1	4	12	148
2.3.3.5. DESARROLLAR LINEAMIENTOS Y ACCIONES ESTRATÉGICAS PARA LA TRANSFERENCIA DE COMPETENCIAS EN LA GESTIÓN DE PLANES, OBRAS Y SERVICIOS EN LAS COMUNIDADES Y REGIONES.\n\n	647	1	4	12	148
2.3.4.1. PROMOVER INSTANCIAS ORGANIZATIVAS DEL PODER POPULAR, TALES COMO LOS COMITÉS DE PREVENCIÓN, PROTECCIÓN SOCIAL, DEPORTE Y RECREACIÓN DE LOS CONSEJOS COMUNALES, PARA ATENDER A LA POBLACIÓN EN SITUACIÓN DE VULNERABILIDAD.\n	648	1	4	12	149
2.3.4.2. DESARROLLAR PLANES INTEGRALES COMUNITARIOS Y POLÍTICAS ORIENTADAS A INCLUIR A LAS PERSONAS EN SITUACIÓN DE VULNERABILIDAD.\n	649	1	4	12	149
2.3.4.3. FOMENTAR EL EJERCICIO DE LA CONTRALORÍA SOCIAL EN EL ÁMBITO COMUNITARIO COMO GARANTÍA DEL CUMPLIMIENTO DE POLÍTICAS DE INCLUSIÓN SOCIAL.\n	650	1	4	12	149
2.3.4.5. APLICAR PROGRAMAS DE FORMACIÓN Y DEBATE PERMANENTE EN MATERIA DE PREVENCIÓN SOCIAL CON LA PARTICIPACIÓN DE LOS VOCEROS Y VOCERAS DEL PODER POPULAR.\n	651	1	4	12	149
2.3.4.6. INCORPORAR AL PODER POPULAR EN LA RECUPERACIÓN Y CREACIÓN DE ESPACIOS PÚBLICOS PARA EL DESARROLLO DE ACTIVIDADES CULTURALES, RECREATIVAS Y PREVENTIVAS, TALES COMO LAS CANCHAS DE PAZ Y OTRAS DE PREVENCIÓN Y RECREACIÓN EN LAS COMUNIDADES.\n	652	1	4	12	149
2.3.4.7. IMPULSAR LA CREACIÓN Y DESARROLLO DE LAS MESAS COMUNALES DEL SISTEMA NACIONAL DE MISIONES Y GRANDES MISIONES SOCIALISTAS, GARANTIZANDO LA PARTICIPACIÓN DE ORGANIZACIONES DEL PODER POPULAR EN LA GESTIÓN DE LOS PROGRAMAS SOCIALES.\n\n	653	1	4	12	149
2.3.5.1. DESARROLLAR PROGRAMAS DE FORMACIÓN Y SOCIALIZACIÓN QUE FORTALEZCAN LA CAPACIDAD DE GESTIÓN DEL PODER POPULAR EN COMPETENCIAS QUE LE SEAN TRANSFERIDAS EN LOS ÁMBITOS POLÍTICO, ECONÓMICO, SOCIAL, JURÍDICO Y EN ÁREAS ESTRATÉGICAS PARA EL DESARROLLO NACIONAL.\n	654	1	4	12	150
2.3.5.2. DESARROLLAR PROGRAMAS PERMANENTES DE FORMACIÓN SOCIOPOLÍTICA Y TÉCNICO-PRODUCTIVA, A TRAVÉS DE LA ESCUELA PARA EL FORTALECIMIENTO DEL PODER POPULAR, ENTRE OTROS ESPACIOS.\n	655	1	4	12	150
2.3.5.3. INCORPORAR FACILITADORES PROVENIENTES DE LAS DIFERENTES ORGANIZACIONES DEL PODER POPULAR COMO SUJETOS PRINCIPALES EN LOS PROCESOS DE FORMACIÓN.\n	656	1	4	12	150
2.3.5.4. ESTABLECER ESPACIOS DE FORMACIÓN EN LAS COMUNAS Y SALAS DE BATALLA SOCIAL, GESTIONADOS POR LAS PROPIAS COMUNIDADES, PARA EL APRENDIZAJE Y SOCIALIZACIÓN DE CONOCIMIENTO.\n	657	1	4	12	150
2.3.5.5. CONTRIBUIR A LA FORMACIÓN TÉCNICO-PRODUCTIVA PARA EL DESARROLLO LOCAL Y EL FORTALECIMIENTO DE LAS CAPACIDADES PRODUCTIVAS DEL PODER POPULAR.	658	1	4	12	150
2.4.1.1. PRESERVAR LOS VALORES TRADICIONALES DEL PUEBLO VENEZOLANO, DE HONESTIDAD, RESPONSABILIDAD, VOCACIÓN DE TRABAJO, AMOR AL PRÓJIMO, SOLIDARIDAD, VOLUNTAD DE SUPERACIÓN, Y DE LA LUCHA POR LA EMANCIPACIÓN; MEDIANTE SU PROMOCIÓN PERMANENTE Y A TRAVÉS DE TODOS LOS MEDIOS DISPONIBLES, COMO DEFENSA CONTRA LOS ANTIVALORES DEL MODELO CAPITALISTA, QUE PROMUEVE LA EXPLOTACIÓN, EL CONSUMISMO, EL INDIVIDUALISMO Y LA CORRUPCIÓN, Y QUE SON EL ORIGEN DE LA VIOLENCIA CRIMINAL QUE AGOBIA A LA SOCIEDAD VENEZOLANA.\n	659	1	4	13	151
2.4.1.2. DESARROLLAR UNA BATALLA FRONTAL CONTRA LAS DIVERSAS FORMAS DE CORRUPCIÓN, FORTALECIENDO LAS INSTITUCIONES DEL ESTADO, FOMENTANDO LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR, PROMOVIENDO LA TRANSPARENCIA Y LA AUTOMATIZACIÓN DE LA GESTIÓN PÚBLICA, ASÍ COMO LOS MECANISMOS LEGALES DE SANCIÓN PENAL, ADMINISTRATIVA, CIVIL Y DISCIPLINARIA CONTRA LAS LESIONES O EL MANEJO INADECUADO DE LOS FONDOS PÚBLICOS.\n	660	1	4	13	151
2.4.1.4. ADECUAR LOS PLANES DE ESTUDIO EN TODOS LOS NIVELES PARA LA INCLUSIÓN DE ESTRATEGIAS DE FORMACIÓN DE VALORES SOCIALISTAS Y PATRIÓTICOS.\n\n	661	1	4	13	151
2.4.2.1. AMPLIAR LOS MECANISMOS DE CONTRALORÍA SOCIAL PARA RESGUARDAR LOS INTERESES COLECTIVOS, FOMENTANDO LA NUEVA ÉTICA REVOLUCIONARIA EN EL DESEMPEÑO DE LAS FUNCIONES PÚBLICAS.\n	662	1	4	13	152
2.4.2.2. MULTIPLICAR LOS MECANISMOS QUE PERMITAN AL PODER POPULAR EJERCER SU CAPACIDAD Y POTESTAD EN LA PREVENCIÓN, VIGILANCIA, SUPERVISIÓN Y ACOMPAÑAMIENTO EN LA GESTIÓN DE LOS FONDOS PÚBLICOS, ORGANISMOS DE LA ADMINISTRACIÓN PÚBLICA Y EN LAS MISMAS INSTANCIAS DEL PODER POPULAR.\n	663	1	4	13	152
2.4.2.3. DESARROLLAR JORNADAS Y PROCEDIMIENTOS DE INTERPELACIÓN POPULAR SOBRE LA GESTIÓN DE LOS SERVIDORES PÚBLICOS.	664	1	4	13	152
2.5.3.6. SUPRIMIR LOS REQUERIMIENTOS INNECESARIOS EXIGIDOS A LOS CIUDADANOS Y CIUDADANAS PARA LA REALIZACIÓN DE TRÁMITES ADMINISTRATIVOS, A TRAVÉS DE LA MASIFICACIÓN DE TECNOLOGÍAS Y UNIFICACIÓN DE CRITERIOS, ERRADICANDO DEFINITIVAMENTE LA ACTIVIDAD DE LOS GESTORES.\n\n	665	1	4	14	155
2.5.3.5. IMPULSAR MECANISMOS DE CONTROL Y SANCIÓN; POLÍTICOS, ADMINISTRATIVOS Y PENALES, SEGÚN SEA EL CASO, PARA LOS SERVIDORES PÚBLICOS QUE INCURRAN EN HECHOS DE CORRUPCIÓN U OTRAS CONDUCTAS Y HECHOS SANCIONADOS POR LAS LEYES.\n	666	1	4	14	155
GARANTIZAR EL FINANCIAMIENTO DEL PLAN DE INVERSIÓN DE LA CORPORACION DE SALUD DEL ESTADO ARAGUA QUE PERMITA CONSOLIDAR LOS PROYECTOS DEL SECTOR SALUD PARA EL AÑO 2015	667	1	4	11	142
1.1.1.1. CONSOLIDAR LA UNIDAD DE LA CLASE TRABAJADORA Y DE SUS CAPAS PROFESIONALES, DE LOS PEQUEÑOS Y MEDIANOS PRODUCTORES DEL CAMPO Y LA CIUDAD; ASÍ COMO DE LOS MOVIMIENTOS Y ORGANIZACIONES SOCIALES QUE ACOMPAÑAN A LA REVOLUCIÓN BOLIVARIANA.	668	1	3	3	1
1.1.1.2. DESPLEGAR TODAS LAS ACCIONES POLÍTICAS NECESARIAS PARA GARANTIZAR LOS PROCESOS ELECTORALES EN UN CLIMA DE ESTABILIDAD Y LOGRAR QUE SE RECONOZCA DE MANERA PACÍFICA LA VOLUNTAD SOBERANA DE NUESTRO PUEBLO.	669	1	3	3	1
1.1.1.3. CONVOCAR A TODOS LOS SECTORES DEMOCRÁTICOS Y HONESTOS DEL PAÍS A CONTRIBUIR AL DESARROLLO PACÍFICO DE LOS PROCESOS ELECTORALES.	670	1	3	3	1
1.1.2.2. FORTALECER LA CONCIENCIA Y LA ORGANIZACIÓN SECTORIAL Y TERRITORIAL DE NUESTRO PUEBLO PARA LA DEFENSA INTEGRAL DE LA PATRIA.	671	1	3	3	2
1.2.9.1. IMPULSAR MECANISMOS ENTRE LOS PAÍSES PRODUCTORES DE GAS PARA UNA JUSTA VALORIZACIÓN DEL GAS Y SU CONSERVACIÓN.	672	1	3	4	15
1.2.10.1. PROFUNDIZAR EL CONTENIDO POLÍTICO Y SOCIAL DE LA INDUSTRIA PETROLERA Y MINERA.	673	1	3	4	16
1.2.10.2. IMPULSAR LA PARTICIPACIÓN DE LOS TRABAJADORES EN LA PLANIFICACIÓN DE LAS ACTIVIDADES DE LA INDUSTRIA PETROLERA Y MINERA.	674	1	3	4	16
1.1.2.1. FORTALECER Y DEFENDER A LOS PODERES PÚBLICOS DEL ESTADO.	675	1	3	3	2
1.1.2.3. POTENCIAR LAS CAPACIDADES DE LOS ORGANISMOS DE SEGURIDAD CIUDADANA DEL ESTADO PARA GARANTIZAR LA ESTABILIDAD POLÍTICA Y LA PAZ DE LA NACIÓN.	676	1	3	3	2
1.1.3.1. FORMAR A LAS ORGANIZACIONES DEL PODER POPULAR EN PROCESOS DE PLANIFICACIÓN, COORDINACIÓN, CONTROL Y ADMINISTRACIÓN DE SERVICIOS QUE ELEVEN EL VIVIR BIEN.	677	1	3	3	3
1.1.3.2. FORTALECER EL PODER POPULAR EN EL EJERCICIO COMPARTIDO DE FUNCIONES DE PLANIFICACIÓN, ELABORACIÓN, EJECUCIÓN Y SEGUIMIENTO DE LAS POLÍTICAS PÚBLICAS.	678	1	3	3	3
1.1.3.3. TRANSFERIR AL PODER POPULAR, EN CORRESPONSABILIDAD, COMPETENCIAS, SERVICIOS Y OTRAS ATRIBUCIONES DEL PODER PÚBLICO NACIONAL, REGIONAL Y MUNICIPAL.	679	1	3	3	3
1.1.4.1. GARANTIZAR LA PLANIFICACIÓN, ELABORACIÓN, EJECUCIÓN Y SEGUIMIENTO PARTICIPATIVO DE LAS POLÍTICAS REGIONALES Y LOCALES, EN CONSONANCIA CON LOS OBJETIVOS DEL PLAN DE DESARROLLO ECONÓMICO Y SOCIAL DE LA NACIÓN.	680	1	3	3	4
1.1.5.1. GARANTIZAR EL DERECHO DEL PUEBLO A ESTAR INFORMADO VERAZ Y OPORTUNAMENTE, ASÍ COMO AL LIBRE EJERCICIO DE LA INFORMACIÓN Y COMUNICACIÓN.	681	1	3	3	5
1.1.5.2. FORTALECER EL USO RESPONSABLE Y CRÍTICO DE LOS MEDIOS DE COMUNICACIÓN PÚBLICOS, PRIVADOS Y COMUNITARIOS COMO INSTRUMENTOS DE FORMACIÓN DE VALORES BOLIVARIANOS.	682	1	3	3	5
1.1.5.3. CONSOLIDAR LA REGULACIÓN Y CONTRALORÍA SOCIAL DE LOS MEDIOS DE COMUNICACIÓN COMO HERRAMIENTA PARA EL FORTALECIMIENTO DEL PODER POPULAR.	683	1	3	3	5
1.1.5.5. FOMENTAR LA INVESTIGACIÓN Y FORMACIÓN SOBRE LA COMUNICACIÓN COMO PROCESO HUMANO Y HERRAMIENTA DE TRANSFORMACIÓN Y CONSTRUCCIÓN SOCIAL.	685	1	3	3	5
1.1.5.6. DESARROLLAR REDES DE COMUNICACIÓN Y MEDIOS DE EXPRESIÓN DE LA PALABRA, LA IMAGEN Y LAS VOCES DE NUESTROS PUEBLOS, CON MIRAS AL FORTALECIMIENTO DE LOS PROCESOS DE INTEGRACIÓN Y UNIDAD LATINOAMERICANA Y CARIBEÑA.	686	1	3	3	5
1.1.5.7. ACTUALIZAR Y DESARROLLAR DE FORMA PERMANENTE LAS PLATAFORMAS TECNOLÓGICAS DE COMUNICACIÓN E INFORMACIÓN, GARANTIZANDO EL ACCESO A LA COMUNICACIÓN OPORTUNA Y ÉTICA A FIN DE CONTRIBUIR A LA SATISFACCIÓN DE LAS NECESIDADES PARA EL VIVIR BIEN DE NUESTRO PUEBLO, ENTRE OTRAS.	687	1	3	3	5
1.1.5.8. CONSOLIDAR LA ADECUACIÓN TECNOLÓGICA DEL SISTEMA PÚBLICO DE COMUNICACIÓN CON EL MARCO DE LA IMPLEMENTACIÓN DE LA TELEVISIÓN DIGITAL ABIERTA Y EL USO DE LAS NUEVAS TIC.	688	1	3	3	5
1.2.10.3. CONSOLIDAR Y PROFUNDIZAR INSTANCIAS DE PARTICIPACIÓN POLÍTICA DEL PUEBLO Y DE LOS TRABAJADORES PETROLEROS Y MINEROS.	689	1	3	4	16
1.2.2.2. ASEGURAR UNA PARTICIPACIÓN MAYORITARIA DE PDVSA EN LAS EMPRESAS MIXTAS.	691	1	3	4	7
1.2.3.1. CONSOLIDAR Y FORTALECER UNA EMPRESA ESTATAL PARA LA EXPLOTACIÓN DE LOS RECURSOS MINEROS.	692	1	3	4	8
1.2.5.1. FORTALECER LAS ACCIONES EMPRENDIDAS PARA EL CONTROL EFECTIVO DE LAS ACTIVIDADES CONEXAS ESTRATÉGICAS DE LA INDUSTRIA PETROLERA.	693	1	3	4	10
1.2.5.2. CONSOLIDAR EL CONTROL EFECTIVO DE LAS ACTIVIDADES CLAVE DE LA CADENA DE VALOR DE PETRÓLEO Y GAS.	694	1	3	4	10
1.2.6.1. DEFENDER LAS POLÍTICAS PARA LA JUSTA VALORIZACIÓN DEL PETRÓLEO.	695	1	3	4	11
1.3.3.1. REGULARIZAR Y CONTROLAR LA PRODUCCIÓN DE MINERALES ESTRATÉGICOS.	696	1	3	5	21
1.2.12.1. DEFENDER LA PROPIEDAD DE LA NACIÓN SOBRE LOS RECURSOS ESTRATÉGICOS NO PETROLEROS, ASÍ COMO EL DESARROLLO SUSTENTABLE Y SOSTENIBLE DE LAS CAPACIDADES DE APROVECHAMIENTO DE LOS MISMOS, EN SUS PROCESOS DE TRANSFORMACIÓN Y AGREGACIÓN DE VALOR NACIONAL.	697	1	3	4	18
1.2.10.4. FORTALECER LOS PLANES ESTRATÉGICOS DE CONTINGENCIA EN EL SECTOR DE HIDROCARBUROS, MINERÍA Y GAS, QUE INCORPOREN LA PARTICIPACIÓN DEL PODER POPULAR PARA CONTRARRESTAR POSIBLES SABOTAJES.	698	1	3	4	16
1.2.12.3. GARANTIZAR LA INCORPORACIÓN DE LOS RECURSOS NATURALES ESTRATÉGICOS AL PROCESO PRODUCTIVO, DE FORMA EFICIENTE Y SUSTENTABLE PARA LA SATISFACCIÓN Y ACCESO DEMOCRÁTICO DE LA POBLACIÓN A LOS BIENES Y SERVICIOS PARA EL VIVIR BIEN.	699	1	3	4	18
1.1.5.9. CONFORMAR UN SISTEMA DE MEDIOS QUE CONTRIBUYA A LA ORGANIZACIÓN SECTORIAL PARA LA DEFENSA INTEGRAL DE LA PATRIA, CON ÉNFASIS EN LA CONSOLIDACIÓN DE NUEVOS MEDIOS Y FORMAS DE PRODUCIR CONTENIDOS EN LA FRONTERA CON RELEVANCIA DE LOS VALORES PATRIÓTICOS Y SOCIALISTAS.	700	1	3	3	5
1.3.3.2. FORTALECER EL RÉGIMEN DE RECAUDACIÓN Y FISCALIZACIÓN DE LA ACTIVIDAD MINERA.	701	1	3	5	21
1.5.2.6. GARANTIZAR LA CREACIÓN Y APROPIACIÓN DEL CONOCIMIENTO PARA EL DESARROLLO, PRODUCCIÓN Y BUEN USO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE LA INFORMACIÓN.\n	702	1	3	7	42
1.3.5.1. MANTENER Y AMPLIAR EL FONDO CONJUNTO CHINO - VENEZOLANO, COMO ESTRATEGIA PARA AFIANZAR UNA NUEVA GEOPOLÍTICA, BASADA EN LA DIVERSIFICACIÓN DE MERCADOS, Y COMO MECANISMO PARA LA ASIGNACIÓN DE RECURSOS DIRIGIDOS AL DESARROLLO DE PROYECTOS  ESTRATÉGICOS EN MATERIA SOCIAL, DE INFRAESTRUCTURA, INDUSTRIA, AGRICULTURA Y ENERGÍA,\nENTRE OTROS.	703	1	3	5	23
1.3.5.2. PROMOVER LA CREACIÓN DE MECANISMOS DE COOPERACIÓN BILATERAL CON SOCIOS ESTRATÉGICOS, MEDIANTE LOS CUALES SE RECIBAN RECURSOS FINANCIEROS QUE SEAN CANCELADOS A TRAVÉS DEL SUMINISTRO DE CRUDOS Y PRODUCTOS.	704	1	3	5	23
1.3.3.3. REORDENAR Y ESTABLECER LAS TASAS DE REGALÍA APLICABLES A LA LIQUIDACIÓN DE LOS DISTINTOS MINERALES.	705	1	3	5	21
1.3.3.4. REVISAR Y REGULARIZAR LOS CONVENIOS DE REGALÍA ESPECÍFICOS PARA CADA UNO DE LOS MINERALES.	706	1	3	5	21
1.3.4.1. CREAR ENTES ESTATALES PARA LA COMERCIALIZACIÓN DE LOS MINERALES.	707	1	3	5	22
1.3.8.1. FORTALECER EL FONDO DE AHORRO NACIONAL DE LA CLASE OBRERA, PARA GENERAR Y MANEJAR INSTRUMENTOS FINANCIEROS QUE PERMITAN OBTENER LOS RECURSOS NECESARIOS PARA CUBRIR LA DEUDA ACTUAL QUE MANTIENE EL ESTADO POR CONCEPTO DE PRESTACIONES SOCIALES DE EMPLEADOS DEL SECTOR PÚBLICO.	712	1	3	5	26
1.3.8.2. IMPULSAR EL FONDO DE AHORRO POPULAR, COMO MECANISMO DE AHORRO Y PARTICIPACIÓN EN LA INDUSTRIA PETROLERA.	713	1	3	5	26
1.2.12.2. DESARROLLAR LA PROSPECTIVA, INVENTARIO INTEGRAL SOBRE UNA PLATAFORMA TECNOLÓGICA NACIONAL, ASÍ COMO LA APROPIACIÓN DE TÉCNICAS PARA EL APROVECHAMIENTO EFICIENTE Y SUSTENTABLE DE LOS RECURSOS NATURALES, EN FUNCIÓN DE LOS INTERESES SOBERANOS DE LA NACIÓN.	714	1	3	4	18
1.3.9.1. ADECUAR Y FORTALECER LOS MECANISMOS DE CONTROL IMPOSITIVO PARA MEJORAR LA EFICIENCIA EN LA RECAUDACIÓN DE LOS TRIBUTOS NACIONALES Y VIABILIZAR FUTUROS ACUERDOS COMERCIALES.	715	1	3	5	27
1.3.10.1. DESARROLLAR UN NUEVO SISTEMA CAMBIARIO Y DE ASIGNACIÓN DE DIVISAS QUE NOS PERMITAN ALCANZAR MÁXIMA TRANSPARENCIA, CONTROL, EFICIENCIA Y EFICACIA EN LA ASIGNACIÓN DE DIVISAS.	716	1	3	5	28
1.3.10.3. IMPLEMENTAR EL PLAN GENERAL DE DIVISAS DE LA NACIÓN QUE PERMITA OPTIMIZAR, JERARQUIZAR Y CONTROLAR LA ASIGNACIÓN DE DIVISAS A LOS DISTINTOS SECTORES DE LA ECONOMÍA NACIONAL.	717	1	3	5	28
1.3.10.4. CREAR LA CORPORACIÓN NACIONAL DE COMERCIO EXTERIOR A FIN DE CONCENTRAR ESFUERZOS EN POTENCIAR NUESTRA CAPACIDAD PARA LA OBTENCIÓN Y PROCURA NACIONAL E INTERNACIONAL DE BIENES E INSUMOS BÁSICOS, REQUERIDOS PARA LA SATISFACCIÓN DE LAS NECESIDADES DE NUESTRA POBLACIÓN.	718	1	3	5	28
1.3.10.6. INCREMENTAR LOS NIVELES DE INVERSIÓN PÚBLICA EN SECTORES ESTRATÉGICOS COMO APALANCAMIENTO PARA EL DESARROLLO SOCIO PRODUCTIVO.	719	1	3	5	28
1.4.1.1. INCREMENTAR LA SUPERFICIE CULTIVADA PARA VEGETALES DE CICLO CORTO EN AL MENOS UN 43%, PASANDO DE 2,88 MM DE HECTÁREAS A 4,12 MM DE HECTÁREAS ANUALES AL FINAL DE PERÍODO, CONSIDERANDO EL USO RACIONAL DEL RECURSO SUELO Y LAS TECNOLOGÍAS DE CASA DE CULTIVO.	720	1	3	3	4
1.4.1.2. AMPLIAR LA SUPERFICIE AGRÍCOLA BAJO RIEGO.\n	721	1	3	6	29
1.4.1.3. FORTALECER EL USO OPORTUNO DE LAS HERRAMIENTAS GEOGRÁFICAS COMO INSTRUMENTO DE SISTEMATIZACIÓN Y DIFUSIÓN DE LA GESTIÓN Y ANÁLISIS DEL DESARROLLO RURAL INTEGRAL DEL PAÍS.\n	722	1	3	6	29
1.4.1.7. CONTRIBUIR CON LA SOBERANÍA ALIMENTARIA EN EL PAÍS MEDIANTE EL FORTALECIMIENTO EL SISTEMA DE TRANSPORTE Y LA CONECTIVIDAD ACUÁTICA Y AÉREA.	726	1	3	6	29
1.4.1.7. CONTRIBUIR CON LA SOBERANÍA ALIMENTARIA EN EL PAÍS MEDIANTE EL FORTALECIMIENTO EL SISTEMA DE TRANSPORTE Y LA CONECTIVIDAD ACUÁTICA Y AÉREA.	727	1	3	6	29
1.4.2.1. INCORPORAR AL PARQUE DE MAQUINARIAS AGRÍCOLAS, PRIVILEGIANDO LA ORGANIZACIÓN COLECTIVA PARA SU USO, EN BASE AL DESARROLLO DE LA INDUSTRIA NACIONAL DE ENSAMBLAJE Y FABRICACIÓN: TRACTORES AGRÍCOLAS, COSECHADORAS E IMPLEMENTOS PARA LA SIEMBRA.\n	728	1	3	6	30
1.4.2.2. FORTALECER LOS PROGRAMAS DE MANTENIMIENTO Y CONSTRUCCIÓN DE VIALIDAD Y ELECTRIFICACIÓN RURAL, CON LA CREACIÓN DE BRIGADAS Y UNIDADES DE MECANIZACIÓN VIAL POR PARTE DE LA MILICIA NACIONAL BOLIVARIANA, LOS CONSEJOS COMUNALES Y CAMPESINOS, LAS REDES DE PRODUCTORES LIBRES Y ASOCIADOS, LAS ALCALDÍAS, LAS GOBERNACIONES Y EL INSTITUTO NACIONAL DE DESARROLLO RURAL.\n	729	1	3	6	30
1.4.2.3. ESTABLECER REDES DE TRANSPORTE COMUNAL, FINANCIADAS Y ADMINISTRADAS POR EL ESTADO, CON EL FIN DE MINIMIZAR COSTOS AL PRODUCTOR EN EL TRASLADO DE INSUMOS Y COSECHA.\n	730	1	3	6	30
1.4.2.5. DISEÑAR Y EJECUTAR UN PLAN PARA LA REACTIVACIÓN DE MAQUINARIAS, EQUIPOS E IMPLEMENTOS AGRÍCOLAS.\n	731	1	3	6	30
1.3.10.2. CREAR EL CENTRO NACIONAL DE COMERCIO EXTERIOR CON EL FIN DE DESARROLLAR E INSTRUMENTAR LA POLÍTICA NACIONAL EN MATERIA DE DIVISAS, EXPORTACIONES E IMPORTACIONES, ARTICULANDO DICHAS POLÍTICAS EN FUNCIÓN DEL DESARROLLO NACIONAL.	732	1	3	5	28
1.3.10.5. DISEÑAR LA PLANIFICACIÓN DE LA INVERSIÓN PÚBLICA PARA EL EJERCICIO DEL PRESUPUESTO ANUAL, CON EL FIN DE DAR CONSISTENCIA A LA POLÍTICA FISCAL CON LOS OBJETIVOS ECONÓMICOS Y SOCIALES DE LA NACIÓN.	733	1	3	5	28
1.3.6.2. FORTALECER LOS ACUERDOS EN EL MARCO DE PETROCARIBE, CON LA FINALIDAD DE ELIMINAR LAS BARRERAS DEL ACCESO A LOS RECURSOS ENERGÉTICOS, POR LA VÍA DE UN NUEVO ESQUEMA DE INTERCAMBIO COMERCIAL FAVORABLE, EQUITATIVO Y JUSTO.	734	1	3	5	24
2.2.1.1. UNIVERSALIZAR LA SEGURIDAD SOCIAL PARA TODOS Y TODAS.\n	735	1	4	11	134
1.4.2.4. APOYAR Y PROMOVER LA CREACIÓN Y FORTALECIMIENTO DE LAS REDES DE CAMPESINOS, ENTRE OTRAS FORMAS DE ORGANIZACIÓN PARA LA PRODUCCIÓN AGRÍCOLA, ASÍ COMO SU FORMACIÓN INTEGRAL PERMANENTE EN LOS SECTORES PRODUCTORES DEL PAÍS.\n	736	1	3	6	30
1.4.2.6. INCREMENTAR LA PRODUCCIÓN Y PROTECCIÓN NACIONAL DE LAS SEMILLAS DE RUBROS ESTRATÉGICOS, A FIN DE SATISFACER LOS REQUERIMIENTOS DE LOS PLANES NACIONALES DE SIEMBRA PARA CONSUMO, PROTEGIENDO A LA POBLACIÓN DEL CULTIVO Y CONSUMO DE PRODUCTOS TRANSGÉNICOS Y OTROS PERJUDICIALES A LA SALUD.\n	737	1	3	6	30
1.4.2.7. INCREMENTAR LA PRODUCCIÓN NACIONAL DE BIOINSUMOS PARA IMPULSAR MODELOS DE PRODUCCIÓN SUSTENTABLES.	738	1	3	6	30
1.4.3.1. AUMENTO DE LA PRODUCCIÓN NACIONAL AGROPECUARIA (VEGETAL, PECUARIA Y ACUÍCOLA-PESQUERA) EN UN 80%, PARA ALCANZAR 42 MM DE TN/AÑO.\n	739	1	3	6	32
1.4.3.2. DESARROLLAR UN DIAGNÓSTICO DE LOS REQUERIMIENTOS DE ALIMENTO, DE LAS CAPACIDADES DE PRODUCCIÓN QUE PERMITAN GARANTIZAR EL ACCESO A LA TIERRA, LA TECNOLOGÍA SOBERANA Y LOS INSUMOS ADECUADOS.\n	740	1	3	6	32
1.4.3.3. IMPULSAR UNA PRODUCCIÓN AGRÍCOLA SIN AGROTÓXICOS, BASADA EN LA DIVERSIDAD AUTÓCTONA Y EN UNA RELACIÓN ARMÓNICA CON LA NATURALEZA.\n	741	1	3	6	32
1.4.3.4. INCREMENTAR LA PRODUCCIÓN DE CEREALES, EN AL MENOS UN 100%, PARA LLEGAR A 7 MM DE TN/AÑO; A TRAVÉS DEL PLAN CEREALERO NACIONAL.\n	742	1	3	6	32
1.4.3.5. INCREMENTAR LA PRODUCCIÓN DE LEGUMINOSAS EN 95%, PARA ALCANZAR 200 MIL TN/AÑO; DE OLEAGINOSAS EN 30% PARA ALCANZAR 1,5 MM TN/AÑO; DE CULTIVOS TROPICALES EN 165%, PARA ALCANZAR 17 MM TN/AÑO; DE HORTALIZAS EN 40%, PARA ALCANZAR 2,5 MM TN/AÑO; DE FRUTALES EN 20%, PARA ALCANZAR 4 MM TN/AÑO; DE RAÍCES Y TUBÉRCULOS EN 25%, PARA ALCANZAR 2,5 MM TN/AÑO; A TRAVÉS DEL PLANES ESPECIALES DE PRODUCCIÓN.\n	743	1	3	6	32
1.4.3.6. INCREMENTAR LA PRODUCCIÓN PECUARIA EN AL MENOS 40%, PARA ALCANZAR 7 MM DE TN/AÑO; A TRAVÉS DEL PLAN PECUARIO NACIONAL.\n	744	1	3	6	32
1.4.3.7. ELEVAR LA PRODUCCIÓN DE CARNE DE BOVINO EN AL MENOS 45%, PARA ALCANZAR 740 MIL TN/AÑO; DE LECHE EN 50%, PARA ALCANZAR 4 MM DE TN/AÑO; DE HUEVOS DE CONSUMO EN 40%, PARA LLEGAR A 370 MIL TN/AÑO; DE POLLO EN 43%, PARA ALCANZAR 1,7 MM DE TN/AÑO; DE PORCINOS EN 75%, PARA ALCANZAR LAS 400 MIL TN/AÑO; DE OVINOS Y CAPRINOS EN 450%, PARA ALCANZAR 66 MIL TN/AÑO; OTRAS ESPECIES EN 35%, PARA ALCANZAR 370 MIL TN/AÑO.\n	745	1	3	6	32
1.4.3.9. AMPLIAR LA FRONTERA AGRÍCOLA Y CONSOLIDAR EL DESARROLLO RURAL EN ÁREAS CON GRAN POTENCIAL AGRÍCOLA E HÍDRICO, MEDIANTE LA TRANSFERENCIA TECNOLÓGICA E INVERSIÓN PARA EL SANEAMIENTO DE SUELOS CON ESTRUCTURA DE DRENAJE, RIEGO, PLANTAS DE PROCESAMIENTO Y ALMACENAMIENTO DE ALIMENTOS, REHABILITACIÓN DE INFRAESTRUCTURA AGRÍCOLA Y SOCIAL.\n	747	1	3	6	32
1.4.3.10. FORTALECER LA PRODUCCIÓN NACIONAL EN NUEVOS RUBROS, O RUBROS EN LOS CUALES LA PRODUCCIÓN NACIONAL ES RELATIVAMENTE DÉBIL, PARA CUBRIR 30% DE LA DEMANDA NACIONAL EN ACEITES Y GRASAS, Y 50% DE DERIVADOS LÁCTEOS.	748	1	3	6	32
1.4.4.1. INICIAR, CONTINUAR Y CONSOLIDAR PROYECTOS DE DESARROLLO RURAL INTEGRAL, TALES COMO: DELTA DEL ORINOCO EN ISLAS COCUINAS, MANAMITO Y GUARA; PÍRITU-BECERRA; EJE ELORZA-MANTECAL, ENTRE OTROS.\n	749	1	3	6	33
1.4.4.2. CONSOLIDAR EL MODELO PRODUCTIVO SOCIALISTA EN PROYECTOS, UNIDADES DE PROPIEDAD SOCIAL AGRÍCOLAS (UPSA), GRANDES Y MEDIANOS SISTEMAS DE RIEGO, EMPRESAS SOCIALISTAS GANADERAS Y FUNDOS ZAMORANOS ADSCRITOS AL MINISTERIO DEL PODER POPULAR CON COMPETENCIA EN MATERIA DE AGRICULTURA Y TIERRAS. 	750	1	3	6	33
1.4.5.1. IMPULSAR LA CONFORMACIÓN, ORGANIZACIÓN, PLANIFICACIÓN, FINANCIAMIENTO Y COMPRAS A REDES DE PRODUCTORES LIBRES Y ASOCIADOS (REPLA’S) EN EL ENTORNO DE LAS PLANTAS AGROINDUSTRIALES, PARA GARANTIZAR LA TRANSFORMACIÓN DEL MODELO AGRÍCOLA ACTUAL HACIA LA AGRICULTURA PLANIFICADA BAJO LOS PRINCIPIOS SOCIALISTAS.\n	751	1	3	6	34
1.5.1.7. TRANSFORMAR LA PRAXIS CIENTÍFICA A TRAVÉS DE LA INTERACCIÓN ENTRE LAS DIVERSAS FORMAS DE CONOCIMIENTO, ABRIENDO LOS ESPACIOS TRADICIONALES DE PRODUCCIÓN DEL MISMO PARA LA GENERACIÓN DE SABERES COLECTIVIZADOS Y NUEVOS CUADROS CIENTÍFICOS INTEGRALES.\n	780	1	3	7	41
1.4.5.2. CONSOLIDAR EL SISTEMA AGROINDUSTRIAL VENEZOLANO BASADO EN LA CONSTRUCCIÓN PLANIFICADA DE PLANTAS AGROINDUSTRIALES, Y CREACIÓN EN SU ENTORNO DE REDES DE PRODUCCIÓN DE LAS MATERIAS PRIMAS REQUERIDAS Y REDES DE DISTRIBUCIÓN DE LOS PRODUCTOS TERMINADOS, COMO ESTRATEGIA PRINCIPAL DEL INJERTO SOCIALISTA. INCLUYENDO ENTRE OTROS: PLANTAS PROCESADORAS DE LECHE, MATADEROS FRIGORÍFICOS, ALMACENAMIENTO DE CEREALES, OLEAGINOSAS Y SEMILLAS, CASAS DE LABORES PESQUERAS.	752	1	3	6	34
2.2.11.2. DESARROLLAR PLANES DE APOYO, PROTECCIÓN Y PROMOCIÓN DE LA LACTANCIA MATERNA, ASÍ COMO LA CREACIÓN DE REDES DE LACTARIOS DE LECHE MATERNA.\n	818	1	4	11	143
1.4.6.1. EXPANDIR LAS REDES DE DISTRIBUCIÓN SOCIALISTA DE ALIMENTOS, TALES COMO MERCAL, CVAL, PDVAL, BICENTENARIO Y PROGRAMAS DE DISTRIBUCIÓN GRATUITA Y RED DE DISTRIBUCIÓN DE ALIMENTOS PREPARADOS, TALES COMO LAS AREPERAS Y RESTAURANTES VENEZUELA.\n	753	1	3	6	36
1.4.6.2. CREAR CENTROS DE ACOPIO Y REDES DE DISTRIBUCIÓN COMUNAL, Y FORTALECER LOS MERCADOS COMUNALES PARA GARANTIZAR LA VENTA A PRECIO JUSTO DE ALIMENTOS SIN INTERMEDIARIOS.\n	754	1	3	6	36
1.4.6.3. FORTALECER Y MODERNIZAR EL SISTEMA DE REGULACIÓN SOCIAL Y ESTATAL PARA COMBATIR LA USURA Y LA ESPECULACIÓN EN LA COMPRA Y DISTRIBUCIÓN DE LOS ALIMENTOS, DADO SU CARÁCTER DE BIENES ESENCIALES PARA LA VIDA HUMANA.\n	755	1	3	6	36
1.4.6.4. ESTABLECER UNA RED NACIONAL DE CENTROS DE DISTRIBUCIÓN DE HORTALIZAS Y FRUTALES CON SUS RESPECTIVAS REDES DE TRANSPORTE.\n	756	1	3	6	36
1.4.6.5. FORTALECER LOS SISTEMAS DE CONTROL DE CALIDAD ASOCIADOS A LOS SERVICIOS DE ALMACENAJE, EMPAQUE, DISTRIBUCIÓN, Y EXPENDIO AL MAYOR Y DETAL DE ALIMENTOS, QUE GARANTICE LAS CONDICIONES ÓPTIMAS DEL PRODUCTO.\n	757	1	3	6	36
1.4.6.6. FORTALECER EL ACCESO A LOS PROGRAMAS Y PROYECTOS DE EDUCACIÓN AL PRODUCTOR Y AL CONSUMIDOR DE ARTÍCULOS ALIMENTICIOS DECLARADOS DE PRIMERA NECESIDAD, A TRAVÉS DE LA AMPLIACIÓN Y MEJORA DE LOS MECANISMOS DE DIFUSIÓN.\n	758	1	3	6	36
1.4.6.7. FORTALECER EL SISTEMA DE TRANSPORTE DE CARGA QUE FACILITE EL FLUJO DESDE LOS CENTROS DE PRODUCCIÓN A LOS CENTROS DE ACOPIO Y DISTRIBUCIÓN.	759	1	3	6	36
1.4.7.1. FORTALECER EL COMPONENTE TECNOLÓGICO DE LAS EMPRESAS AGROINDUSTRIALES QUE CONFORMAN LA CORPORACIÓN VENEZOLANA DE ALIMENTOS, PARA OPTIMIZAR LA PRODUCTIVIDAD EN FUNCIÓN DE LAS CAPACIDADES ACTUALES Y LAS POTENCIALIDADES DE CADA UNO DE SUS COMPONENTES.\n	760	1	3	6	37
1.7.2.2. CREAR LA ESCUELA POPULAR ITINERANTE PARA LA EDUCACIÓN DEL PUEBLO EN MATERIA DE DEFENSA INTEGRAL.	761	1	3	9	53
1.4.7.2 ACTIVAR FORMAS DE ORGANIZACIÓN POPULAR, PARTIENDO DE LAS BASES CAMPESINAS E INCLUYENDO LAS MILICIAS BOLIVARIANAS, CON EL FIN DE SER INCORPORADAS A LOS PROCESOS DE DISEÑO, EJECUCIÓN Y SEGUIMIENTO DE POLÍTICAS AGRÍCOLAS DEL GOBIERNO BOLIVARIANO.\n	762	1	3	6	37
1.4.7.3. DESTINAR LAS TIERRAS RESCATADAS PRIORITARIAMENTE A LA PRODUCCIÓN DE SEMILLAS DE ACUERDO CON SUS RESPECTIVAS CARACTERÍSTICAS CLIMÁTICAS, CONSIDERANDO LAS TÉCNICAS TRADICIONALES Y COSTUMBRES DE CULTIVO DE LA REGIÓN.\n	763	1	3	6	37
1.4.7.4. CREAR, CULMINAR Y CONSOLIDAR FÁBRICAS DE PLANTAS Y MÁQUINAS PARA EL PROCESAMIENTO AGROINDUSTRIAL (TRACTORES, COSECHADORAS), CENTROS GENÉTICOS DE PRODUCCIÓN PECUARIA Y ACUÍCOLAS, ENTRE OTROS. 	764	1	3	6	37
1.4.8.1. CONSTITUIR EMPRESAS MIXTAS DE EXPORTACIÓN CON PAÍSES MIEMBROS DEL ALBA Y MERCOSUR Y OTROS ALIADOS EXTRARREGIONALES.\n	765	1	3	6	38
1.4.8.2. DISEÑAR Y EJECUTAR UNA POLÍTICA DE EXPORTACIONES DE PRODUCTOS AGRÍCOLAS CON VALOR AGREGADO A LOS PAÍSES DEL CARIBE Y AL NORTE DE BRASIL.\n	766	1	3	6	38
1.4.8.3. DEFINIR, EN EL MARCO DE LOS ACUERDOS INTERNACIONALES Y DE INTEGRACIÓN, POLÍTICAS DE PROTECCIÓN COMERCIAL DE LA AGRICULTURA NACIONAL.\n	767	1	3	6	38
1.4.8.4. DISEÑAR MEDIDAS DE FOMENTO PARA LA CREACIÓN O REACTIVACIÓN DEL SECTOR PRODUCTIVO NACIONAL CON MIRAS A LA EXPORTACIÓN, CON ESPECIAL ATENCIÓN A LAS PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, COOPERATIVAS Y OTRAS FORMAS SOCIATIVAS.	768	1	3	6	38
1.4.9.1. PROMOVER A TRAVÉS DE LAS ASAMBLEAS AGRARIAS A NIVEL REGIONAL, CONJUNTAMENTE CON PEQUEÑAS ORGANIZACIONES AGROPRODUCTIVAS, CONSEJOS CAMPESINOS Y LAS REDES DE PRODUCTORES Y PRODUCTORAS LIBRES Y ASOCIADOS, EL DESARROLLO PARTICIPATIVO EN LOS PLANES PRODUCCIÓN, APROVECHANDO ASÍ LAS CAPACIDADES TÉCNICAS Y CULTURALES DE CADA REGIÓN.	769	1	3	6	39
1.4.10.1. PROMOVER LA INNOVACIÓN Y PRODUCCIÓN DE INSUMOS TECNOLÓGICOS PARA LA PEQUEÑA AGRICULTURA, AUMENTANDO LOS ÍNDICES DE EFICACIA Y PRODUCTIVIDAD.\n	770	1	3	6	40
1.4.10.2. FOMENTAR LA ORGANIZACIÓN Y FORMACIÓN DEL PODER POPULAR Y LAS FORMAS COLECTIVAS PARA EL DESARROLLO DE LOS PROCESOS PRODUCTIVOS A NIVEL LOCAL, A TRAVÉS DE LA EXPANSIÓN DE LAS ESCUELAS Y CURSOS DE FORMACIÓN DE CUADROS.\n	771	1	3	6	40
1.4.10.3. IMPULSAR EL DESARROLLO Y UTILIZACIÓN DE TECNOLOGÍAS DE BAJOS INSUMOS, REDUCIENDO LAS EMISIONES NOCIVAS AL AMBIENTE Y PROMOVIENDO LA AGRICULTURA A PEQUEÑA ESCALA Y SIN AGROTÓXICOS.\n	772	1	3	6	40
1.4.10.4. OTORGAR EL RECONOCIMIENTO AL CONUCO COMO FUENTE HISTÓRICA, PATRIMONIO DE NUESTRA AGROBIODIVERSIDAD Y PRINCIPAL RESERVA DE GERMOPLASMAS AUTÓCTONOS VIVOS.	773	1	3	6	40
1.5.1.1. DESARROLLAR UNA ACTIVIDAD CIENTÍFICA, TECNOLÓGICA Y DE INNOVACIÓN, TRANSDISCIPLINARIA ASOCIADA DIRECTAMENTE A LA ESTRUCTURA PRODUCTIVA NACIONAL, QUE PERMITA DAR RESPUESTA A PROBLEMAS CONCRETOS DEL SECTOR, FOMENTANDO EL DESARROLLO DE PROCESOS DE ESCALAMIENTO INDUSTRIAL ORIENTADOS AL APROVECHAMIENTO DE LAS POTENCIALIDADES, CON EFECTIVA TRANSFERENCIA DE CONOCIMIENTOS PARA LA SOBERANÍA TECNOLÓGICA.\n	774	1	3	7	41
1.5.1.2. CREAR UNA RED NACIONAL DE PARQUES TECNOLÓGICOS PARA EL DESARROLLO Y APLICACIÓN DE LA CIENCIA, LA TECNOLOGÍA Y LA INNOVACIÓN EN ESOS ESPACIOS TEMÁTICOS Y EN LOS PARQUES INDUSTRIALES EN GENERAL.\n	775	1	3	7	41
1.5.1.3. FORTALECER Y ORIENTAR LA ACTIVIDAD CIENTÍFICA, TECNOLÓGICA Y DE INNOVACIÓN HACIA EL APROVECHAMIENTO EFECTIVO DE LAS POTENCIALIDADES Y CAPACIDADES NACIONALES PARA EL DESARROLLO SUSTENTABLE Y LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES, ORIENTANDO LA INVESTIGACIÓN HACIA ÁREAS ESTRATÉGICAS DEFINIDAS COMO PRIORITARIAS PARA LA SOLUCIÓN DE LOS PROBLEMAS SOCIALES.\n	776	1	3	7	41
1.5.1.4. CREAR ESPACIOS DE INNOVACIÓN ASOCIADAS A UNIDADES SOCIOPRODUCTIVAS EN COMUNIDADES ORGANIZADAS, APROVECHANDO PARA ELLO EL ESTABLECIMIENTO DE REDES NACIONALES Y REGIONALES DE COOPERACIÓN CIENTÍFICOTECNOLÓGICA, A FIN DE FORTALECER LAS CAPACIDADES DEL SISTEMA NACIONAL DE CIENCIA, TECNOLOGÍA E INNOVACIÓN.\n	777	1	3	7	41
1.5.1.5. GARANTIZAR EL ACCESO OPORTUNO Y USO ADECUADO DE LAS TELECOMUNICACIONES Y TECNOLOGÍAS DE INFORMACIÓN, MEDIANTE EL DESARROLLO DE LA INFRAESTRUCTURA NECESARIA, ASÍ COMO DE LAS APLICACIONES INFORMÁTICAS QUE ATIENDAN NECESIDADES SOCIALES.\n	778	1	3	7	41
1.5.1.6. FOMENTAR LA CONSOLIDACIÓN DE LOS ESPACIOS DE PARTICIPACIÓN POPULAR EN LA GESTIÓN PÚBLICA DE LAS ÁREAS TEMÁTICAS Y TERRITORIALES RELACIONADAS CON LA CIENCIA, LA TECNOLOGÍA Y LA INNOVACIÓN.\n	779	1	3	7	41
1.7.1.3. REGLAMENTAR Y DIFUNDIR LOS PARÁMETROS QUE REGIRÁN LOS PROCESOS DE MOVILIZACIÓN Y REQUISICIÓN.\n	815	1	3	9	52
1.5.1.8. IMPULSAR LA FORMACIÓN PARA LA CIENCIA, TECNOLOGÍA E INNOVACIÓN, A TRAVÉS DE FORMAS DE ORGANIZACIÓN Y SOCIALIZACIÓN DEL CONOCIMIENTO CIENTÍFICO PARA LA CONSOLIDACIÓN DE ESPACIOS DE PARTICIPACIÓN COLECTIVA.	781	1	3	7	41
1.5.1.8. IMPULSAR LA FORMACIÓN PARA LA CIENCIA, TECNOLOGÍA E INNOVACIÓN, A TRAVÉS DE FORMAS DE ORGANIZACIÓN Y SOCIALIZACIÓN DEL CONOCIMIENTO CIENTÍFICO PARA LA CONSOLIDACIÓN DE ESPACIOS DE PARTICIPACIÓN COLECTIVA.	782	1	3	7	41
1.5.2.1. ACTUALIZAR Y ORIENTAR LOS PROGRAMAS FORMATIVOS INTEGRALES Y PERMANENTES HACIA LAS NECESIDADES Y DEMANDAS DEL SISTEMA PRODUCTIVO NACIONAL, CON EL FIN DE GARANTIZAR LA FORMACIÓN TÉCNICA, PROFESIONAL Y OCUPACIONAL DEL TRABAJO.\n	783	1	3	7	42
1.5.2.2. PROPICIAR EL PROGRAMA LA ESCUELA EN LA FÁBRICA, O UNIDAD PRODUCTIVA A EFECTOS NO SÓLO DE MEJORAR LOS NIVELES DE PREPARACIÓN PARA EL TRABAJO, SINO MÁS AÚN LA CULTURA DEL MISMO, LA ORGANIZACIÓN EN CONSEJOS DE OBREROS Y EL PUNTO Y CÍRCULO COMO ELEMENTOS SUSTANCIALES DEL CAMBIO DEL MODELO PRODUCTIVO.\n	784	1	3	7	42
1.5.2.3. CONSOLIDAR EL DESPLIEGUE DE LA INFRAESTRUCTURA EDUCATIVA DEL PAÍS, EN LOS CENTROS UNIVERSITARIOS, TÉCNICOS, MEDIOS Y OCUPACIONALES, TANTO EN LAS UNIDADES DE PRODUCCIÓN COMO EN LOS PARQUES INDUSTRIALES.\n	785	1	3	7	42
1.5.2.4. DESARROLLAR APLICACIONES INFORMÁTICAS QUE ATIENDAN NECESIDADES SOCIALES.\n	786	1	3	7	42
1.5.2.5. GENERAR Y DIFUNDIR A TRAVÉS DE LAS TIC CONTENIDOS BASADOS EN VALORES NACIONALES, MULTIÉTNICOS Y PLURICULTURALES DE NUESTROS PUEBLOS Y, CON ELLOS, LOS PRINCIPIOS INHERENTES AL SOCIALISMO BOLIVARIANO.\n	787	1	3	7	42
1.5.2.7. AMPLIAR LA CAPACIDAD CIENTÍFICO-TÉCNICA Y HUMANÍSTICA PARA GARANTIZAR LA SEGURIDAD Y SOBERANÍA EN LA PRODUCCIÓN DE LOS INSUMOS MATERIALES, ASÍ COMO LA PRODUCCIÓN TEÓRICO-METODOLÓGICA Y ARTÍSTICA, NECESARIAS PARA EL BUEN VIVIR, MEDIANTE EL INCREMENTO EN UN 70% EL FINANCIAMIENTO A LA INVESTIGACIÓN E INNOVACIÓN ORIENTADAS A PROYECTOS QUE APUNTALEN LA FELICIDAD DEL PUEBLO.	788	1	3	7	42
1.5.3.1. GARANTIZAR EL IMPULSO DE LA FORMACIÓN Y TRANSFERENCIA DE CONOCIMIENTO QUE PERMITA EL DESARROLLO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.\n	789	1	3	7	43
1.5.3.2. GARANTIZAR LA DEMOCRATIZACIÓN Y APROPIACIÓN DEL CONOCIMIENTO DEL PUEBLO EN MATERIA DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES A TRAVÉS DE PROGRAMAS EDUCATIVOS EN LOS CENTROS UNIVERSITARIOS, TÉCNICOS, MEDIOS Y OCUPACIONALES.\n	790	1	3	7	43
1.5.3.3. GARANTIZAR, EN LAS INSTITUCIONES DEL ESTADO, EL USO DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.\n	791	1	3	7	43
1.5.3.4. DESARROLLAR UNA POLÍTICA INTEGRAL QUE IMPULSE LA CREACIÓN DE CENTROS TECNOLÓGICOS EN CENTROS EDUCATIVOS, UNIVERSITARIOS, TÉCNICOS, MEDIOS QUE GARANTICEN PROCESOS FORMATIVOS INTEGRALES Y CONTINUOS EN MATERIA DE EQUIPOS ELECTRÓNICOS Y APLICACIONES INFORMÁTICAS EN TECNOLOGÍAS LIBRES Y ESTÁNDARES ABIERTOS.	792	1	3	7	43
1.5.4.1. FORTALECER EL USO PACÍFICO DE LA TECNOLOGÍA ESPACIAL PARA GARANTIZAR AL PAÍS EL MANEJO SOBERANO DE SUS TELECOMUNICACIONES Y DE HERRAMIENTAS ASOCIADAS QUE PERMITAN CONSOLIDAR EL DESARROLLO NACIONAL EN ÁREAS ESTRATÉGICAS COMO EDUCACIÓN, SALUD, SEGURIDAD Y ALIMENTACIÓN.\n	793	1	3	7	44
1.5.4.2. IMPULSAR LA MASIFICACIÓN DE LA TECNOLOGÍA ESPACIAL A TRAVÉS DE PROCESOS DE FORMACIÓN E INFRAESTRUCTURA NECESARIA QUE PERMITAN COLOCARLA AL SERVICIO DE LAS NECESIDADES DEL PUEBLO.	794	1	3	7	44
1.6.1.1. MANTENER ACTUALIZADOS LOS PLANES PARA LA DEFENSA TERRITORIAL Y DEFENSA INTEGRAL ADAPTADOS A LAS CARACTERÍSTICAS GEOESTRATÉGICAS Y SOCIOPOLÍTICAS DE NUESTRA PATRIA.\n	795	1	3	8	45
1.6.1.2. INCREMENTAR LA ACTIVIDAD OPERATIVA CÍVICOMILITAR EN LAS FRONTERAS PARA LA DEFENSA DE NUESTRO TERRITORIO, A FIN DE CONTROLAR Y NEUTRALIZAR EL CRIMEN TRASNACIONAL, ASÍ COMO LA ACCIÓN DE GRUPOS GENERADORES DE VIOLENCIA.\n	796	1	3	8	45
1.6.1.3. EFECTUAR LOS PROCESOS DE CREACIÓN, REESTRUCTURACIÓN, REEQUIPAMIENTO Y REUBICACIÓN DE LAS UNIDADES MILITARES, ATENDIENDO A LAS NECESIDADES DE LA DEFENSA INTEGRAL DE LA PATRIA Y SU SOBERANÍA.\n	797	1	3	8	45
1.6.1.4. PREPARAR AL PAÍS PARA LA DEFENSA INTEGRAL DE LA NACIÓN, INTEGRANDO LOS ESFUERZOS DEL PODER PÚBLICO, EL PUEBLO Y LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	798	1	3	8	45
1.6.1.5. INCREMENTAR LA PARTICIPACIÓN ACTIVA DEL PUEBLO PARA CONSOLIDAR LA UNIÓN CÍVICO-MILITAR.\n	799	1	3	8	45
1.6.1.6. FORTALECER LA FORMACIÓN DEL PUEBLO EN PRINCIPIOS Y VALORES DE INDEPENDENCIA, SOBERANÍA Y PATRIA, PARA SU PARTICIPACIÓN EN LA DEFENSA INTEGRAL DE LA NACIÓN.\n	800	1	3	8	45
1.6.3.1. CONSOLIDAR EL SISTEMA TERRITORIAL DE INTELIGENCIA Y CONTRAINTELIGENCIA MILITAR.\n	801	1	3	8	49
1.6.3.2. MASIFICAR DE MANERA ORDENADA LA BÚSQUEDA DE INFORMACIÓN ÚTIL PARA LA SEGURIDAD CIUDADANA Y DEFENSA DE LA PATRIA.\n	802	1	3	8	49
1.6.3.3. ACTUALIZAR Y ADAPTAR LOS PLANES DE ESTUDIO EN EL ÁREA DE INTELIGENCIA Y CONTRAINTELIGENCIA DE ACUERDO AL PENSAMIENTO MILITAR BOLIVARIANO.\n	803	1	3	8	49
1.6.3.4. ADECUAR EL MARCO JURÍDICO NECESARIO PARA DESARROLLAR LAS ÁREAS DE INTELIGENCIA Y CONTRAINTELIGENCIA DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA BAJO LOS PRINCIPIOS DE LA DEFENSA INTEGRAL DE LA NACIÓN.	804	1	3	8	49
1.6.4.1. INCREMENTAR EL DESARROLLO DE LA MILICIA TERRITORIAL CON LA FINALIDAD DE ASEGURAR LAS FUERZAS NECESARIAS PARA LA DEFENSA INTEGRAL DE LA NACIÓN.\n	805	1	3	8	50
1.6.4.2. INCREMENTAR Y FORTALECER EL EMPLEO DE LA MILICIA EN LAS FUNCIONES DE APOYO AL DESARROLLO NACIONAL.\n	806	1	3	8	50
1.6.4.3. FOMENTAR E INCREMENTAR LA CREACIÓN DE LOS CUERPOS COMBATIENTES EN TODAS LAS ESTRUCTURAS DEL ESTADO.\n	807	1	3	8	50
1.6.4.4. DISEÑAR ESTRATEGIAS PARA GARANTIZAR LA PARTICIPACIÓN DEL PUEBLO EN LA DEFENSA INTEGRAL DE LA NACIÓN, TALES COMO PLANES DE ADIESTRAMIENTO A CIUDADANAS Y CIUDADANOS EN LA CORRESPONSABILIDAD DE DEFENSA INTEGRAL DE LA NACIÓN.	808	1	3	8	50
1.6.5.1. MODERNIZAR, CONSERVAR, ALMACENAR Y MANTENER EL EQUIPAMIENTO Y LOS SISTEMAS DE ARMAS DE LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	809	1	3	8	51
1.6.5.2. FORTALECER EL SISTEMA DE APOYO LOGÍSTICO Y DE SANIDAD MILITAR DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	810	1	3	8	51
1.6.5.3. INCREMENTAR LAS RESERVAS DE MATERIALES, SISTEMAS Y EQUIPOS PARA EL SOSTENIMIENTO DE LA DEFENSA INTEGRAL DE LA NACIÓN.\n	811	1	3	8	51
1.6.5.4. INCREMENTAR LA ADQUISICIÓN DE SISTEMAS DE ARMAS Y MATERIALES PARA LA DOTACIÓN DE UNIDADES MILITARES.	812	1	3	8	51
1.7.1.1. PROMOVER EN LOS PODERES PÚBLICOS DEL ESTADO LA CREACIÓN Y DESARROLLO DE SUS PROPIOS SISTEMAS DE CONTINGENCIA.\n	813	1	3	9	52
1.7.1.2. REALIZAR EL INVENTARIO DEL POTENCIAL NACIONAL DISPONIBLE PARA EL APOYO INTEGRAL EN SITUACIONES DE ESTADO DE EXCEPCIÓN.\n	814	1	3	9	52
1.7.1.4. CREAR ESTRATEGIAS QUE GENEREN EL RECONOCIMIENTO POR PARTE DE LA POBLACIÓN SOBRE LOS CAMBIOS DE CONDICIONES ORDINARIAS A CONDICIONES EXTRAORDINARIAS, PARA LA ACTIVACIÓN Y MOVILIZACIÓN ORGANIZADA EN EL MARCO DE LA DEFENSA INTEGRAL DE LA PATRIA.\n	816	1	3	9	52
1.7.1.5. CREAR EL FONDO ESTRATÉGICO MILITAR, COMO ENTE FINANCIERO FORMALMENTE ESTRUCTURADO QUE SOLVENTE LAS CONTINGENCIAS PRESUPUESTARIAS.	817	1	3	9	52
1.7.2.1. INTEGRAR EL SISTEMA DE APOYO LOGÍSTICO TERRITORIAL (SALTE) AL PROCESO DE ARTICULACIÓN DE LA ESTRUCTURA DEL APARATO PRODUCTIVO E INFRAESTRUCTURA DE SERVICIOS DEL ESTADO, SEGÚN LA CONFORMACIÓN GEOGRÁFICA DE LAS REGIONES ESTRATÉGICAS DE DEFENSA INTEGRAL.\n	819	1	3	9	53
1.3.6.1. FORTALECER Y AMPLIAR LOS CONVENIOS DE COOPERACIÓN ENERGÉTICA (CCE) PARA MOTORIZAR EL ESTABLECIMIENTO DE RELACIONES DE INTERCAMBIO JUSTAS, SOLIDARIAS, EFICIENTES Y SIN INTERMEDIACIÓN EN LA LUCHA CONTRA LA POBREZA, REDUCIENDO LAS ASIMETRÍAS ECONÓMICAS Y SOCIALES.	820	1	3	5	24
1.3.6.4. FORTALECER EL ALBA COMO INSTRUMENTO PARA ALCANZAR UN DESARROLLO JUSTO, SOLIDARIO Y SUSTENTABLE; EL TRATO ESPECIAL Y DIFERENCIADO QUE TENGA EN CUENTA EL NIVEL DE DESARROLLO DE LOS DIVERSOS PAÍSES Y LA DIMENSIÓN DE SUS ECONOMÍAS; LA  COMPLEMENTARIEDAD ECONÓMICA Y LA COOPERACIÓN ENTRE LOS PAÍSES PARTICIPANTES, Y EL FOMENTO DE LAS INVERSIONES DE CAPITALES LATINOAMERICANOS EN LA PROPIA AMÉRICA LATINA Y EL CARIBE.	821	1	3	5	24
1.6.1.7. DISEÑAR PLANES ESTRATÉGICOS DE COOPERACIÓN ENTRE LAS INSTITUCIONES DEL GOBIERNO, LA FUERZA ARMADA NACIONAL BOLIVARIANA Y EL PODER POPULAR, A FIN DE GARANTIZAR EL DESARROLLO Y LA DEFENSA INTEGRAL DE LA NACIÓN.	822	1	3	8	45
2.1.1.1. DISEÑAR ESTRATEGIAS QUE PERMITAN GARANTIZAR LA PARTICIPACIÓN DEL PUEBLO, AUMENTANDO SU NIVEL DE CONCIENCIA PARA AFRONTAR CUALQUIER ESCENARIO QUE SE ORIGINE COMO CONSECUENCIA DE LA GUERRA ECONÓMICA.\n	823	1	4	10	55
2.1.1.3. DEMOCRATIZAR LOS MEDIOS DE PRODUCCIÓN, IMPULSANDO NUEVAS FORMAS DE PROPIEDAD, COLOCÁNDOLAS AL SERVICIO DE LA SOCIEDAD.\n	824	1	4	10	55
2.1.1.4. FORTALECER LA PLANIFICACIÓN CENTRALIZADA Y EL SISTEMA PRESUPUESTARIO PARA EL DESARROLLO Y DIRECCIONAMIENTO DE LAS CADENAS ESTRATÉGICAS DE LA NACIÓN.	825	1	4	10	55
2.1.3.1. GENERAR UN SISTEMA DE INTEGRACIÓN DE LAS REDES PRODUCTIVAS QUE PERMITA ARTICULAR LA CADENA DE VALOR PARA LA SATISFACCIÓN DE LAS NECESIDADES SOCIALES DE LA POBLACIÓN.	826	1	4	10	57
2.1.3.3. GENERAR UN NUEVO ESQUEMA DE INCENTIVOS QUE PERMITA LA OPTIMIZACIÓN EN LA ASIGNACIÓN DE RECURSOS E INCREMENTAR LA PRODUCCIÓN Y EL VALOR AGREGADO NACIONAL.\n	827	1	4	10	57
2.1.3.2. POTENCIAR EL APARATO PRODUCTIVO NACIONAL, ACTUALIZÁNDOLO TECNOLÓGICAMENTE Y ARTICULÁNDOLO AL NUEVO MODELO, PARA PROVEER LA BASE MATERIAL DE LA CONSTRUCCIÓN DEL SOCIALISMO.\n	828	1	4	10	57
2.1.3.4. FORTALECER SECTORES PRODUCTIVOS DONDE EL PAÍS PRESENTE VENTAJAS COMPARATIVAS, ORIENTANDO LOS EXCEDENTES COMO BASE ECONÓMICA ALTERNATIVA AL MODELO MONOEXPORTADOR.\n	829	1	4	10	57
2.1.3.5. CONFORMAR UN SISTEMA DE PARQUES INDUSTRIALES PARA EL FORTALECIMIENTO DE CADENAS PRODUCTIVAS, TEJIDO INDUSTRIAL, FACILIDADES LOGÍSTICAS, FORMACIÓN, TECNOLOGÍA Y SISTEMA DE DISTRIBUCIÓN DE INSUMOS Y PRODUCTOS CON PRECIOS JUSTOS. ESTOS NODOS TENDRÁN UNIDADES DE GESTIÓN INTEGRAL PARA CONCENTRAR SERVICIOS Y POTENCIAR NUEVAS FORMAS DE ORGANIZACIÓN DE LA PRODUCCIÓN.\n	830	1	4	10	58
2.1.3.6. DESARROLLAR BANCOS DE INSUMOS DENTRO DEL SISTEMA INDUSTRIAL PARA GARANTIZAR LA CANTIDAD Y EL TIEMPO DEL ACCESO A LAS MATERIAS PRIMAS E INSUMOS INDUSTRIALES CON PRECIOS JUSTOS, PARA UNA ESTRUCTURA SANA DEL SISTEMA ECONÓMICO INDUSTRIAL.\n	831	1	4	10	57
2.1.3.7. GENERAR ESPACIOS DE COMPLEMENTACIÓN PRODUCTIVA Y COMERCIAL CON PAÍSES ALIADOS Y ESTRATÉGICOS.	832	1	4	10	57
2.1.4.1. CONSTRUIR UNA CULTURA DEL TRABAJO QUE SE CONTRAPONGA AL RENTISMO MEDIANTE EL IMPULSO DE LA FORMACIÓN DESDE LA PRAXIS DEL TRABAJO, CONCIENCIA DEL TRABAJADOR Y TRABAJADORA, COMO SUJETOS ACTIVOS DEL PROCESO DE TRANSFORMACIÓN Y PARTICIPACIÓN DEMOCRÁTICA DEL TRABAJO, ORIENTADA A LOS MÁS ALTOS INTERESES NACIONALES.\n	833	1	4	10	58
2.1.4.2. PROPICIAR UN NUEVO MODELO DE GESTIÓN EN LAS UNIDADES PRODUCTIVAS, DE PROPIEDAD SOCIAL DIRECTA E INDIRECTA, QUE SEA EFICIENTE, SUSTENTABLE Y QUE GENERE RETORNABILIDAD SOCIAL Y/O ECONÓMICA DEL PROCESO PRODUCTIVO.\n	834	1	4	10	58
2.1.4.3. IMPULSAR LA CONFORMACIÓN DE CONSEJOS DE TRABAJADORES Y TRABAJADORAS EN LAS UNIDADES PRODUCTIVAS, EN EL MARCO DE LA CONSOLIDACIÓN Y FORTALECIMIENTO DE LA DEMOCRACIA PARTICIPATIVA Y PROTAGÓNICA.\n	835	1	4	10	58
2.1.4.4. PROMOVER EL DESARROLLO DE INSTANCIAS DE COORDINACIÓN ENTRE LOS CONSEJOS COMUNALES Y CONSEJOS DE TRABAJADORES Y TRABAJADORAS.\n	836	1	4	10	58
2.2.5.3. IMPULSAR LA FORMACIÓN, CAPACITACIÓN Y FINANCIAMIENTO\nPARA UNIDADES SOCIO-PRODUCTIVAS EN LAS COMUNIDADES INDÍGENAS, RESPETANDO SUS PRÁCTICAS Y FORMAS DE ORGANIZACIÓN TRADICIONALES.\n	869	1	4	11	137
2.1.4.5. DESARROLLAR UN SISTEMA DE ESTÍMULOS PARA EL FOMENTO DE LAS PEQUEÑAS Y MEDIANAS INDUSTRIAS PRIVADAS Y EMPRESAS CONJUNTAS, EN UN MARCO DE MÁXIMA CORRESPONSABILIDAD SOCIAL DEL APARATO PRODUCTIVO, RECONOCIENDO EL TRABAJO DE MUJERES Y HOMBRES EMPRENDEDORES.\n	837	1	4	10	58
2.1.4.6. CONTRIBUIR CON EL BIENESTAR SOCIOECONÓMICO DEL ENTORNO DONDE SE ASIENTEN LAS UNIDADES PRODUCTIVAS, APLICANDO LA ESTRATEGIA DE PUNTO Y CÍRCULO, DANDO CABIDA A LA PARTICIPACIÓN POPULAR EN PROCESOS SOCIALES Y ECONÓMICOS; ASÍ COMO DE CONTRALORÍA SOCIAL. LAS UNIDADES DE MAYOR ESCALA PROPICIARÁN RAMIFICACIONES DE INSUMOS A ESCALA COMUNAL, PARA COOPERAR EN LA SATISFACCIÓN DE LAS NECESIDADES DE NUESTRAS COMUNIDADES.	838	1	4	10	58
2.1.4.7. IMPULSAR NUEVAS FORMAS DE ORGANIZACIÓN DE LA PRODUCCIÓN A TRAVÉS DE LOS CONGLOMERADOS PRODUCTIVOS QUE PERMITA LA VINCULACIÓN DE LA INDUSTRIA NACIONAL DE UNA MISMA CADENA PRODUCTIVA, GENERANDO ECONOMÍA DE ESCALA, ASÍ COMO EL DESARROLLO DE LOS PRINCIPIOS DE SOLIDARIDAD Y COMPLEMENTARIEDAD ECONÓMICA PRODUCTIVA.\n	839	1	4	10	58
2.1.4.8. FOMENTAR LA EDUCACIÓN DEL CONSUMIDOR EN EL DESARROLLO DE SU ROL PROTAGÓNICO EN LA PLANIFICACIÓN, EJECUCIÓN Y FISCALIZACIÓN DE POLÍTICAS, EN EL MODELO ECONÓMICO PRODUCTIVO SOCIALISTA.\n	840	1	4	10	58
2.1.4.9. IMPULSAR EL PLAN NACIONAL DE PLENO ABASTECIMIENTOS GARANTIZANDO A LA POBLACIÓN VENEZOLANA EL ACCESO A LOS ALIMENTOS Y BIENES ESENCIALES.	841	1	4	10	58
2.1.5.1. GENERAR Y FORTALECER LAS CADENAS DE DISTRIBUCIÓN, ESTATALES, COMUNALES Y MIXTAS QUE REPRESENTEN ALTERNATIVAS EN LA DISTRIBUCIÓN Y AHORRO DIRECTO A LA POBLACIÓN DE LOS PRODUCTOS INTERMEDIOS Y DE CONSUMO FINAL.\n	842	1	4	10	59
2.1.5.2. PROPICIAR SISTEMAS DE TRANSPORTE Y DISTRIBUCIÓN QUE TIENDAN AL FLUJO DE MERCANCÍAS DIRECTO DESDE LAS UNIDADES DE PRODUCCIÓN AL CONSUMIDOR, CENTROS DE ACOPIO O UNIDADES DE PRODUCCIÓN INTERMEDIAS.\n	843	1	4	10	59
2.1.5.3. AMPLIAR Y ADECUAR LA RED DE ALMACENES (TANTO EN FRÍO COMO EN SECO) A NIVEL LOCAL, PARA EL FORTALECIMIENTO DE LAS UNIDADES PRODUCTIVAS SOCIALISTAS.	844	1	4	10	59
2.1.6.1. CONFIGURAR UNA ARQUITECTURA INSTITUCIONAL QUE ORGANICE LOS SECTORES PRODUCTIVOS DE PROPIEDAD SOCIAL DIRECTA O INDIRECTA A TRAVÉS DE CORPORACIONES PARA LA PLANIFICACIÓN CENTRALIZADA.\n	845	1	4	10	60
2.1.6.2. IMPLANTAR EL MODELO DE GESTIÓN SOCIALISTA EN LAS UNIDADES PRODUCTIVAS.	846	1	4	10	60
2.2.1.2. ASEGURAR LA GARANTÍA DE PRESTACIONES BÁSICAS UNIVERSALES RELATIVAS A LAS CONTINGENCIAS DE VEJEZ, SOBREVIVENCIA, PERSONAS CON DISCAPACIDAD, CESANTÍA Y DESEMPLEO, DERIVADAS DE LA VINCULACIÓN CON EL MERCADO DE TRABAJO.\n	847	1	4	11	133
2.2.1.3. GARANTIZAR LA FORMACIÓN COLECTIVA EN LOS CENTROS DE TRABAJO, FAVORECIENDO LA INCORPORACIÓN AL TRABAJO PRODUCTIVO, SOLIDARIO Y LIBERADOR.\n	848	1	4	11	133
2.2.1.4. AFIANZAR VALORES QUE RESGUARDEN LA IDENTIDAD, CONSTRUYAN SOBERANÍA Y DEFENSA DE LA PATRIA, A PARTIR DEL DISFRUTE FÍSICO, ESPIRITUAL E INTELECTUAL, Y EL RECONOCIMIENTO DE NUESTRO PATRIMONIO CULTURAL Y NATURAL.\n	849	1	4	11	133
2.2.1.5. PROMOVER LA ARMONIZACIÓN DE LA VIDA FAMILIAR Y LABORAL.\n	850	1	4	11	133
2.2.1.6. ASEGURAR EL DESARROLLO FÍSICO, COGNITIVO, MORAL Y UN AMBIENTE SEGURO Y SALUDABLE DE TRABAJO, EN CONDICIONES LABORALES Y DE SEGURIDAD SOCIAL GRATIFICANTES.	851	1	4	11	133
2.2.2.1. UNIFICAR EL NIVEL DE DIRECCIÓN NACIONAL, REGIONAL, ESTADAL, MUNICIPAL Y COMUNAL DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS.\n	852	1	4	11	133
2.2.9.2. REDUCIR LA POBREZA GENERAL A MENOS DEL 15% DE LOS HOGARES Y ERRADICAR LA POBREZA EXTREMA, POTENCIANDO EL DESARROLLO Y EXPANSIÓN DEL ALCANCE TERRITORIAL DE LAS MISIONES, GRANDES MISIONES Y MICROMISIONES QUE GARANTICEN AL PUEBLO LAS CONDICIONES PARA EL GOCE Y EJERCICIO DE TODOS LOS DERECHOS ECONÓMICOS, SOCIALES Y CULTURALES.\n	853	1	4	11	141
2.2.2.2. CREAR EL SERVICIO NACIONAL DE INFORMACIÓN DE MISIONES Y GRANDES MISIONES, QUE ESTABLEZCA UN REGISTRO ÚNICO DE LOS BENEFICIARIOS DE LAS MISIONES, PARA LA PLANIFICACIÓN, SEGUIMIENTO Y EVALUACIÓN DE LA EFECTIVIDAD DE LOS PROGRAMAS SOCIALES EN EL CUMPLIMIENTO DE SUS COMETIDOS, MEDIANTE: A) LA IDENTIFICACIÓN Y SITUACIÓN DE LA FAMILIA; B) LA VINCULACIÓN A LAS MISIONES Y OTROS PROGRAMAS SOCIALES; C) EL CATASTRO DE SERVICIOS E INSTALACIONES SOCIALES; D) EL SISTEMA DE MONITOREO DE LA SUPERACIÓN DE LA POBREZA.\n	854	1	4	11	134
2.2.2.3. FORTALECER EL TEJIDO SOCIAL DE LAS MISIONES, PARA GARANTIZAR LA PARTICIPACIÓN DEL PODER POPULAR EN TODAS LAS ETAPAS DE PLANIFICACIÓN, EJECUCIÓN, SEGUIMIENTO Y CONTROL, ASÍ COMO LA GENERACIÓN DE SALDOS ORGANIZATIVOS DE LA POBLACIÓN BENEFICIARIA.\n	855	1	4	11	134
2.2.2.4. COORDINAR DE MANERA CENTRALIZADA, EL PLAN DE FORMACIÓN, FINANCIAMIENTO Y PRODUCCIÓN DE TODA LA POLÍTICA SOCIAL, MEDIANTE LA INTEGRACIÓN DE LA INFRAESTRUCTURA SOCIAL, DEL PERSONAL Y DE LOS RECURSOS OPERATIVOS.	856	1	4	11	134
2.2.3.1. INCREMENTAR SOSTENIDAMENTE LA PRODUCCIÓN Y DISTRIBUCIÓN DE BIENES CULTURALES A NIVEL NACIONAL.\n	857	1	4	11	135
2.2.3.2. FORTALECER LAS EDITORIALES QUE INCLUYAN ESPACIOS DE PARTICIPACIÓN DEL PODER POPULAR EN LA POLÍTICA EDITORIAL MEDIANTE LA GENERACIÓN DE IMPRENTAS REGIONALES.\n	858	1	4	11	135
2.2.3.3. AUMENTAR LOS ESPACIOS Y LA INFRAESTRUCTURA CULTURAL A DISPOSICIÓN DEL PUEBLO, QUE PERMITAN EL DESARROLLO LOCAL DE LAS ARTES.\n	859	1	4	11	135
2.2.3.4. IMPULSAR Y AMPLIAR LA RED DE INTELECTUALES, ARTISTAS, CULTORES Y CULTORAS, Y LA ORGANIZACIÓN DE REDES COMUNITARIAS CULTURALES.\n	860	1	4	11	135
2.2.3.5. DESARROLLAR INVESTIGACIONES SOBRE LAS TRADICIONES CULTURALES QUE IMPULSEN EL CONOCIMIENTO Y PRÁCTICA CULTURAL.\n	861	1	4	11	135
2.2.3.6. VISIBILIZAR LA IDENTIDAD HISTÓRICO-COMUNITARIA EN CONEXIÓN CON LA MISIÓN CULTURA CORAZÓN ADENTRO.\n	862	1	4	11	135
2.2.3.7 CONSOLIDAR EL PROTAGONISMO POPULAR EN LAS MANIFESTACIONES CULTURALES Y DEPORTIVAS, CENTRADO EN LA CREACIÓN DE UNA CONCIENCIA GENERADORA DE TRANSFORMACIONES PARA LA CONSTRUCCIÓN DEL SOCIALISMO.	863	1	4	11	135
2.2.4.2. INCORPORAR LA PERSPECTIVA DE LA IGUALDAD DE GÉNERO EN LAS POLÍTICAS PÚBLICAS PROMOVIENDO LA NO DISCRIMINACIÓN Y LA PROTECCIÓN DE LOS GRUPOS SOCIALMENTE VULNERABLES.\n	864	1	4	10	58
2.2.4.3. GENERAR POLÍTICAS FORMATIVAS SOBRE LA PERSPECTIVA DE IGUALDAD DE GÉNERO Y DE DIVERSIDAD SEXUAL.\n	865	1	4	11	136
2.2.4.4. PROMOVER EL DEBATE Y REFLEXIÓN DE LOS DERECHOS DE LA COMUNIDAD SEXO-DIVERSA.\n\n\n	866	1	4	11	136
2.2.5.1. ACELERAR LA DEMARCACIÓN DE LOS TERRITORIOS INDÍGENAS, A TRAVÉS DE LA ENTREGA DE TÍTULOS DE PROPIEDAD DE TIERRAS A SUS COMUNIDADES.\n	867	1	4	11	137
2.2.5.2. GARANTIZAR LA ADJUDICACIÓN DE VIVIENDAS DIGNAS A LAS COMUNIDADES INDÍGENAS EN SITUACIÓN DE VULNERABILIDAD, RESPETANDO SU CULTURA Y TRADICIONES.\n	868	1	4	11	137
2.2.10.9. FORTALECER LA ATENCIÓN DE LA SALUD SEXUAL Y REPRODUCTIVA DE LA POBLACIÓN VENEZOLANA CON ÉNFASIS EN LOS SECTORES DE MAYOR VULNERABILIDAD Y EXCLUSIÓN.\n\n	903	1	4	11	142
2.2.5.4. AMPLIAR LA PRESENCIA DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS EN LAS COMUNIDADES INDÍGENAS, CON ABSOLUTO RESPETO A SUS COSTUMBRES, USOS, CULTURA, FORMAS DE ORGANIZACIÓN Y EJERCICIO DE LA AUTORIDAD ANCESTRAL.\n\n	870	1	4	11	137
\n2.2.6.1. PROFUNDIZAR LA MASIFICACIÓN DEPORTIVA.\n\n\n\n\n\n\n	871	1	4	11	138
2.2.6.2. CONSOLIDAR EL FONDO NACIONAL DEL DEPORTE, ACTIVIDAD FÍSICA Y EDUCACIÓN FÍSICA PARA IMPULSAR LA MASIFICACIÓN DEL DEPORTE.\n\n\n\n	872	1	4	11	138
2.2.6.3. AMPLIAR LA INFRAESTRUCTURA DE LA MISIÓN BARRIO ADENTRO DEPORTIVO Y DE TODOS LOS ESPACIOS DEPORTIVOS A NIVEL PARROQUIAL.\n	873	1	4	11	138
2.2.6.4. CONTRIBUIR A LA PRÁCTICA SISTEMÁTICA, MASIVA Y DIVERSIFICADA DE LA ACTIVIDAD FÍSICA EN LAS COMUNIDADES Y ESPACIOS PÚBLICOS.\n	874	1	4	11	138
2.2.11.7. PREVENIR Y CONTROLAR LAS CARENCIAS DE MICRONUTRIENTES Y PROMOCIÓN DE LA SEGURIDAD ALIMENTARIA EN LOS HOGARES.	875	1	4	11	143
2.2.6.5. FORTALECER EL DEPORTE DE ALTO RENDIMIENTO, CON APOYO INTEGRAL AL ATLETA Y HÉROES DEL DEPORTE, DESARROLLO DE LA MEDICINA Y LAS CIENCIAS APLICADAS AL DEPORTE DE ALTO RENDIMIENTO, DESARROLLO DE CENTROS DE ALTO RENDIMIENTO Y DE LA ESCUELA NACIONAL DE TALENTOS DEPORTIVOS.\n\n	876	1	4	11	138
2.2.7.1. PROMOVER LA ÉTICA SOCIALISTA EN LOS ESPACIOS DE FORMACIÓN, RECREACIÓN Y OCIO LIBRE DE LOS JÓVENES, ORIENTANDO ÉSTA HACIA LA PAZ, LA SOLIDARIDAD, UNA VIDA SANA Y LA CONVIVENCIA COMUNAL.\n	877	1	4	11	139
2.2.7.2. DESARROLLAR ESPACIOS INSTITUCIONALES DE FORMACIÓN Y ATENCIÓN INTEGRAL PARA JÓVENES EN SITUACIÓN DE VULNERABILIDAD.\n	878	1	4	11	139
2.2.7.3. FORTALECER LA ORGANIZACIÓN Y PARTICIPACIÓN PROTAGÓNICA DE LOS JÓVENES A TRAVÉS DE LA CONFORMACIÓN DE CONSEJOS DEL PODER POPULAR JUVENIL, ENTRE OTRAS INICIATIVAS.\n	879	1	4	11	139
2.2.7.4. PROMOVER UNA POLÍTICA DE INCLUSIÓN DE LOS JÓVENES AL SISTEMA PRODUCTIVO NACIONAL, CON ESPECIAL ÉNFASIS EN LOS JÓVENES DE SECTORES DE MENORES INGRESOS, INCENTIVANDO UNA CULTURA ECONÓMICA PRODUCTIVA SOCIALISTA.\n\n	880	1	4	11	139
2.2.8.1. AVANZAR EN LA TRANSFORMACIÓN DEL SISTEMA PENITENCIARIO, A TRAVÉS DE LA INCORPORACIÓN DE FAMILIARES DE LAS PERSONAS PRIVADAS DE LIBERTAD, CONSEJOS COMUNALES, ORGANIZACIONES SOCIALES Y CUALQUIER OTRA FORMA DE ORGANIZACIÓN, A LABORES PERTINENTES A LA MATERIA PENITENCIARIA.\n	881	1	4	11	140
2.2.8.2. COMBATIR LA IMPUNIDAD, EL RETARDO PROCESAL PENAL, EN COORDINACIÓN CON LOS PODERES PÚBLICOS INVOLUCRADOS.\n	882	1	4	11	140
2.2.8.3. MEJORAR Y CONSTRUIR INFRAESTRUCTURAS PARA LAS COMUNIDADES PENITENCIARIAS, INCORPORANDO ESPACIOS PARA EL TRABAJO PRODUCTIVO.	883	1	4	11	140
2.2.8.4. TRANSFORMAR EL SISTEMA DE JUSTICIA PENAL, GENERANDO ALTERNATIVAS PARA EL CUMPLIMIENTO DE LA PENA, ASÍ COMO OTROS BENEFICIOS PROCESALES QUE COADYUVE A LA CONFORMACIÓN DE UN NUEVO ORDEN DE ADMINISTRACIÓN DE JUSTICIA.\n	884	1	4	11	140
2.2.8.5. CREAR UN SISTEMA INTEGRAL DE APOYO POST PENITENCIARIO, CON ÉNFASIS EN PROGRAMAS SOCIOEDUCATIVOS Y LABORALES, GARANTIZANDO LA PRIVACIDAD DE LOS ANTECEDENTES PENALES.\n\n	885	1	4	11	140
2.2.9.1 ERRADICAR LA POBREZA EXTREMA.	886	1	4	11	141
2.2.9.3. REDUCIR LAS CONDICIONES DE VULNERABILIDAD SOCIAL A TRAVÉS DEL DESARROLLO Y CONSOLIDACIÓN DE LAS MISIONES, GRANDES MISIONES, TALES COMO LA GRAN MISIÓN EN AMOR MAYOR, MISIÓN MADRES DEL BARRIO, MISIÓN HIJOS E HIJAS DE VENEZUELA, MISIÓN ALIMENTACIÓN DE VENEZUELA, GRAN MISIÓN SABER Y TRABAJO, GRAN MISIÓN VIVIENDA VENEZUELA, JÓVENES DE LA PATRIA, AGROVENEZUELA, BARRIO ADENTRO I Y II; ASÍ COMO LAS MICROMISIONES Y OTROS PROGRAMAS SOCIALES, QUE PERMITAN LA MÁXIMA PROTECCIÓN A FAMILIAS VENEZOLANAS CONFORMADAS POR PERSONAS ADULTAS MAYORES, MUJERES EMBARAZADAS, NIÑOS, NIÑAS Y ADOLESCENTES O CON DISCAPACIDAD.\n	887	1	4	11	141
2.2.10.1. ASEGURAR LA SALUD DE LA POBLACIÓN, A TRAVÉS DEL FORTALECIMIENTO CONTINUO Y LA CONSOLIDACIÓN DE TODOS LOS NIVELES DE ATENCIÓN Y SERVICIOS DEL SISTEMA PÚBLICO NACIONAL DE SALUD, PRIORIZANDO EL NIVEL DE ATENCIÓN PRIMARIA PARA LA PROMOCIÓN DE ESTILOS Y CONDICIONES DE VIDA SALUDABLES EN TODA LA POBLACIÓN.\n	888	1	4	11	142
2.2.10.3. ARTICULAR BAJO LA RECTORÍA ÚNICA DEL SISTEMA PÚBLICO NACIONAL DE SALUD A TODOS LOS ÓRGANOS Y ENTES PRESTADORES DE SERVICIOS DE SALUD PÚBLICOS Y PRIVADOS.\n	889	1	4	11	142
2.2.10.4. DISMINUIR EL SOBREPESO Y EL SEDENTARISMO COMO FACTORES DE RIESGOS DE ENFERMEDADES PREVENIBLES, A TRAVÉS DE MECANISMOS QUE FOMENTEN LA ACTIVIDAD FÍSICA, MEJOREN LOS HÁBITOS ALIMENTICIOS Y PATRONES DE CONSUMO. PROMOVER LA DISMINUCIÓN A UN 12% DEL PORCENTAJE DE LA POBLACIÓN DE 7-14 AÑOS CON SOBREPESO (PESO-TALLA).\n	890	1	4	11	142
2.2.10.6. AUMENTAR AL 15% LA PRODUCCIÓN NACIONAL DE MEDICAMENTOS ESENCIALES REQUERIDOS POR EL SISTEMA PUBLICO NACIONAL DE SALUD.\n	891	1	4	11	142
2.2.10.7. AUMENTAR AL 10% LA PRODUCCIÓN NACIONAL DE MATERIAL MÉDICO QUIRÚRGICO REQUERIDO POR EL SISTEMA PÚBLICO NACIONAL DE SALUD.\n	892	1	4	11	142
2.2.11.4. CONSOLIDAR LAS CASAS DE ALIMENTACIÓN, PARA ADECUARLAS Y AMPLIARLAS COMO CENTROS DE FORMACIÓN Y ATENCIÓN NUTRICIONAL.\n	893	1	4	11	143
2.2.11.5. FORTALECER LOS PROGRAMAS DE ASISTENCIA ALIMENTARIA EN EL SISTEMA EDUCATIVO.\n	894	1	4	11	143
2.2.9.4. IMPULSAR LA CORRESPONSABILIDAD DEL PODER POPULAR EN LA LUCHA POR LA ERRADICACIÓN DE LA POBREZA EN TODAS SUS MANIFESTACIONES.\n\n	895	1	4	11	141
2.2.10.2. FOMENTAR LA CREACIÓN DE CENTROS Y SERVICIOS ESPECIALIZADOS EN EL SISTEMA PÚBLICO NACIONAL DE SALUD.\n	896	1	4	11	142
2.2.10.8. CONSOLIDAR Y EXPANDIR LA RED DE FARMACIAS POPULARES EN TODO EL TERRITORIO NACIONAL.\n	897	1	4	11	142
2.2.10.11. ARTICULAR TODOS LOS NIVELES DE PROTECCIÓN, PROMOCIÓN, PREVENCIÓN, ATENCIÓN INTEGRAL Y REHABILITACIÓN A LA SALUD INDIVIDUAL Y COLECTIVA EN EL MARCO DE ÁREAS DE SALUD INTEGRAL COMUNITARIAS.	898	1	4	11	142
2.2.11.1. FOMENTAR POLÍTICAS PARA INCREMENTAR LA LACTANCIA MATERNA EXCLUSIVA (LME) PARA CUBRIR AL MENOS EL 70% DE LA POBLACIÓN LACTANTE.\n\n	899	1	4	11	143
2.2.11.3. ASEGURAR LA ALIMENTACIÓN SALUDABLE DE LA POBLACIÓN, CON ESPECIAL ATENCIÓN EN LA PRIMERA INFANCIA (PRENATAL - 8 AÑOS).\n	900	1	4	11	143
2.2.11.6. PROMOVER HÁBITOS ALIMENTARIOS SALUDABLES Y PATRONES DE CONSUMO ADAPTADOS A LAS POTENCIALIDADES PRODUCTIVAS DEL PAÍS.\n	901	1	4	11	143
2.2.10.5. IMPULSAR LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR EN LOS ESPACIOS DE ARTICULACIÓN INTERSECTORIAL E INSTITUCIONALES PARA LA PROMOCIÓN DE LA CALIDAD DE VIDA Y LA SALUD, A TRAVÉS DEL: A) EL INCREMENTO DE LOS EGRESADOS DE LAS DISTINTAS PROFESIONES QUE SE ENCUENTRAN INTEGRADAS AL SISTEMA PÚBLICO NACIONAL DE SALUD, ALCANZANDO LOS 80.000 PROFESIONALES DE LA SALUD PARA 2019; B) LA PARTICIPACIÓN DE LOS ÓRGANOS DEL PODER POPULAR EN LA PLANIFICACIÓN, EJECUCIÓN, MONITOREO Y EVALUACIÓN DE LAS ACCIONES DE SALUD EN LAS ÁREAS DE SALUD INTEGRAL COMUNITARIA; Y C) LA CONSTITUCIÓN DE ORGANIZACIONES POPULARES EN SALUD, TALES COMO LOS COMITÉS DE SALUD.\n	902	1	4	11	142
2.2.10.10. REDUCIR CARGAS DE ENFERMEDAD, MORTALIDAD PREMATURA Y MORTALIDAD EVITABLE CON ÉNFASIS EN MORTALIDAD MATERNA, MORTALIDAD EN MENORES DE 5 AÑOS.\n	904	1	4	11	142
2.2.12.1. DESARROLLAR EN EL CURRÍCULO NACIONAL BOLIVARIANO OS CONTENIDOS DE LA EDUCACIÓN INTEGRAL Y LIBERADORA CON FUNDAMENTO EN LOS VALORES Y PRINCIPIOS DE LA PATRIA.\n\n	905	1	4	11	144
2.2.12.2. EXTENDER LA COBERTURA DE LA MATRÍCULA ESCOLAR A TODA LA POBLACIÓN, CON ÉNFASIS EN LAS POBLACIONES EXCLUIDAS, DE LA SIGUIENTE MANERA: A) ETAPA DE MATERNAL:  INCREMENTAR LA MATRÍCULA DE 13% HASTA EL 40%; B)ETAPA DE PREESCOLAR: UNIVERSALIZAR LA MATRÍCULA AL 100% DE COBERTURA; C) ETAPA PRIMARIA: CONSOLIDAR LA UNIVERSALIZACIÓN, AUMENTANDO AL <0%; D) EDUCACIÓN MEDIA GENERAL: INCREMENTAR LA MATRÍCULA AL 100% PARA LOGRAR QUE TODA LA POBLACIÓN ALCANCE UN NIVEL DE INSTRUCCIÓN PROMEDIO NO MENOR A EDUCACIÓN MEDIA GENERAL O MEDIA TÉCNICA; E) INCREMENTAR LA MATRÍCULA DE LA EDUCACIÓN TÉCNICA AL 40%.\n	906	1	4	11	144
2.2.12.3. PROFUNDIZAR LA TERRITORIALIZACIÓN Y PERTINENCIA DE LA EDUCACIÓN UNIVERSITARIA, A TRAVÉS DEL AUMENTO DE LA MATRÍCULA MUNICIPALIZADA EN UN 60%, CON INICIATIVAS COMO LAS MISIONES SUCRE Y ALMA MATER, ASÍ COMO LOS PROGRAMAS NACIONALES DE FORMACIÓN AVANZADA.\n	907	1	4	11	144
2.2.12.4. AMPLIAR LA INFRAESTRUCTURA Y LA DOTACIÓN ESCOLAR Y DEPORTIVA, GARANTIZANDO LA EJECUCIÓN DE UN PLAN DE CONSTRUCCIÓN, AMPLIACIÓN, REPARACIÓN Y MANTENIMIENTO PERMANENTE.\n	908	1	4	11	144
2.2.12.5. CONTINUAR INCORPORANDO TECNOLOGÍAS DE LA INFORMACIÓN Y DE LA COMUNICACIÓN AL PROCESO EDUCATIVO.\n	909	1	4	11	144
2.2.12.6. PROFUNDIZAR LA ACCIÓN EDUCATIVA, COMUNICACIONAL Y DE PROTECCIÓN DEL AMBIENTE.\n	910	1	4	11	144
2.2.12.7. DESARROLLAR LA EDUCACIÓN INTERCULTURAL BILINGÜE, PROMOVIENDO EL RESCATE Y LA PRESERVACIÓN DE LAS LENGUAS INDÍGENAS.\n	911	1	4	11	144
2.2.12.8. DESARROLLAR PROGRAMAS Y PROYECTOS DE FORMACIÓN-INVESTIGACIÓN QUE DEN RESPUESTA A LAS NECESIDADES Y POTENCIALIDADES PRODUCTIVAS PARA EL PROYECTO NACIONAL.\n	912	1	4	11	144
2.2.12.9. DESARROLLAR PROGRAMAS EN EDUCACIÓN EN LOS QUE SE INCORPOREN CONTENIDOS ENFOCADOS EN LOS CONOCIMIENTOS ANCESTRALES Y POPULARES.\n	913	1	4	11	144
2.2.12.12. CONSOLIDAR EL DERECHO CONSTITUCIONAL A LA EDUCACIÓN UNIVERSITARIA PARA TODAS Y TODOS, FORTALECIENDO EL INGRESO, PROSECUCIÓN Y EGRESO, INCREMENTANDO AL 100% LA INCLUSIÓN DE JÓVENES BACHILLERES AL SISTEMA DE EDUCACIÓN UNIVERSITARIA.	915	1	4	11	144
2.2.13.1. FORTALECER Y AMPLIAR EL SISTEMA DE MISIONES Y GRANDES MISIONES SOCIALISTAS PARA GARANTIZAR LA COBERTURA, CALIDAD, CORRESPONSABILIDAD Y EFICIENCIA EN LA SATISFACCIÓN DE LAS NECESIDADES DE LA POBLACIÓN.\n	916	1	4	11	145
2.2.13.2. DESARROLLAR, DESDE LAS GRANDES MISIONES, LOS SISTEMAS DE ACOMPAÑAMIENTO TERRITORIAL, PARA TRANSFORMAR LA VIDA DE FAMILIAS Y COMUNIDADES EN SITUACIÓN DE POBREZA Y DE RIESGO.\n	917	1	4	11	145
2.2.13.3. GENERAR SALDOS ORGANIZATIVOS DEL PODER POPULAR EN LAS MISIONES Y GRANDES MISIONES.\n\n	918	1	4	11	145
2.2.13.4. GARANTIZAR SISTEMAS DE FINANCIAMIENTO ESPECIAL PARA LA SOSTENIBILIDAD DE LAS MISIONES Y GRANDES MISIONES SOCIALISTAS.	919	1	4	11	145
2.5.1.1. DISEÑAR, JUNTO A LAS DIFERENTES ORGANIZACIONES DEL PODER POPULAR, NORMAS QUE DESARROLLEN LOS PRINCIPIOS CONSTITUCIONALES PARA EL EJERCICIO DE LA DEMOCRACIA DIRECTA.\n	920	1	4	14	153
2.5.1.2. ESTABLECER NUEVOS Y PERMANENTES MECANISMOSDE INTEGRACIÓN ENTRE ESTADO Y SOCIEDAD, FORTALECIENDO LA ORGANIZACIÓN Y LAS CAPACIDADES PARA LA DEFENSA INTEGRAL DE LA NACIÓN.\n	921	1	4	14	153
2.5.1.3. FORTALECER LOS SISTEMAS DE COMUNICACIÓN PERMANENTE, QUE PERMITAN LA INTERACCIÓN ENTRE LAS INSTITUCIONES PÚBLICAS Y EL PODER POPULAR PARA LA CONSTRUCCIÓN COLECTIVA DEL NUEVO ESTADO SOCIALISTA, BAJO EL PRINCIPIO DE “MANDAR, OBEDECIENDO”.\n\n	922	1	4	14	153
2.5.2.1. TRANSFERIR COMPETENCIAS DE LOS DISTINTOS NIVELES DEL PODER PÚBLICO A LAS COMUNAS, COMUNIDADES ORGANIZADAS Y DEMÁS ORGANIZACIONES DEL PODER POPULAR, BAJO LAS DIRECTRICES DEL CONSEJO FEDERAL DE GOBIERNO, CON EL MAYOR GRADO DE PLANIFICACIÓN PARA EL ADECUADO DESARROLLO TERRITORIAL.\n	923	1	4	14	154
4.1.8.1. CONSOLIDAR A VENEZUELA COMO PROVEEDOR DE COOPERACIÓN SOLIDARIA, SIN PRETENSIONES HEGEMÓNICAS Y CON APEGO AL PRINCIPIO DE AUTODETERMINACIÓN DE LOS PUEBLOS.	924	1	6	19	103
2.5.2.2. DESPLEGAR LA FUNCIÓN PLANIFICADORA DEL CONSEJO FEDERAL DE GOBIERNO, PROPICIANDO  LA COORDINACIÓN Y CONTROL DE LAS ACCIONES DEL PODER EJECUTIVO NACIONAL EN LAS DIFERENTES INSTANCIAS TERRITORIALES, POLÍTICO-ADMINISTRATIVAS Y COMUNALES, PARA EL ADECUADO DESARROLLO REGIONAL BAJO CRITERIOS DE SOSTENIBILIDAD Y SUSTENTABILIDAD, GUIADO POR LOS PRINCIPIOS SOCIALISTAS.\n	925	1	4	14	154
2.5.2.3. PROMOVER EL DESARROLLO DE LA PLANIFICACIÓN PARTICIPATIVA TERRITORIAL Y ECONÓMICA, A TRAVÉS DE LA ARTICULACIÓN PERMANENTE DE LOS PLANES COMUNITARIOS Y COMUNALES CON LOS PLANES LOCALES, REGIONALES Y NACIONALES.\n\n	926	1	4	14	154
2.5.3.1. ESTABLECER POLÍTICAS DE ESTÍMULO Y RECONOCIMIENTO A LOS SERVIDORES PÚBLICOS, ASÍ COMO DE LÍDERES POPULARES Y SOCIALES, QUE DESARROLLEN EL EJERCICIO DE SUS FUNCIONES EN EL MARCO DE LOS VALORES QUE COMPORTAN LA ÉTICA SOCIALISTA.\n	927	1	4	14	154
2.5.3.2. FORJAR UNA CULTURA REVOLUCIONARIA DEL SERVIDOR PÚBLICO, REGIDA POR LA NUEVA ÉTICA SOCIALISTA, PROMOVIENDO UNA ACTUACIÓN EN FUNCIÓN DE LA ACCIÓN DEL ESTADO, FUNDAMENTADO EN EL PRINCIPIO DE LA ADMINISTRACIÓN PÚBLICA AL SERVICIO DE LAS PERSONAS.\n	928	1	4	14	154
2.5.3.3. PROMOVER LA REVALORIZACIÓN DE LA CULTURA DEL SABER Y DEL TRABAJO CON VISIÓN SOCIALISTA, MEDIANTE LA CREACIÓN DE ESCUELAS DE FORMACIÓN DE CUADROS ADMINISTRATIVOS, POLÍTICOS Y TÉCNICOS EN LAS INSTITUCIONES DEL ESTADO, EN LAS EMPRESAS DE PROPIEDAD SOCIAL, EN LAS INSTANCIAS DEL PODER POPULAR Y EN LAS INSTITUCIONES PÚBLICAS, COMO MECANISMOS INDISPENSABLES PARA LA TRANSFORMACIÓN DEL ESTADO.\n	929	1	4	14	154
3.1.12.3. FOMENTAR EL DESARROLLO DE COMBUSTIBLES ALTERNATIVOS QUE REEMPLACEN PAULATINAMENTE EL CONSUMO DE DERIVADOS DEL PETRÓLEO.	930	1	5	15	76
2.5.4.6. PROMOVER LA ARTICULACIÓN E INTEGRACIÓN COHERENTE DE LOS INSTRUMENTOS JURÍDICOS EXISTENTES, QUE FAVOREZCA LA EFICIENCIA Y EFICACIA EN LA APLICACIÓN DE LA JUSTICIA.\n	931	1	4	14	157
2.5.5.5. DESPLEGAR LA POLICÍA NACIONAL BOLIVARIANA EN TODO EL TERRITORIO NACIONAL.\n\n	932	1	4	14	158
2.5.5.9. PROSEGUIR CON LA EXPANSIÓN DE LA UNES EN EL TERRITORIO NACIONAL, CON EL FIN DE AUMENTAR LA CAPACIDAD DE INVESTIGACIÓN Y FORMACIÓN DEL NUEVO MODELO POLICIAL Y LA PRODUCCIÓN DE SABER EN MATERIA DE SEGURIDAD CIUDADANA.\n	933	1	4	14	158
2.5.5.16. OPTIMIZAR LOS PROCESOS DE REGISTRO PÚBLICO Y DEL NOTARIADO PARA GARANTIZAR LA SEGURIDAD JURÍDICA DE LAS ACTUACIONES DE LOS USUARIOS, MEDIANTE LA PUBLICIDAD REGISTRAL Y FE PÚBLICA, DE PROCESOS EXPEDITOS Y OPORTUNOS, APEGADOS A LA LEY.	934	1	4	14	158
3.1.1.1. ALCANZAR CRUDO HASTA 3,3 MMBD PARA EL AÑO 2014 Y 6 MMBD PARA EL AÑO 2019.	998	1	5	15	65
2.5.4.1. FORTALECER EL SISTEMA DE ADMINISTRACIÓN DE JUSTICIA MEDIANTE LA DOTACIÓN DE LOS MEDIOS NECESARIOS PARA SU ÓPTIMO DESEMPEÑO, INCLUYENDO EL NIVEL DE INVESTIGACIÓN CRIMINAL QUE PERMITA COMBATIR LA IMPUNIDAD Y EL RETRASO PROCESAL.\n	935	1	4	14	157
2.5.4.3. MEJORAR LA INFRAESTRUCTURA EXISTENTE Y CONSTRUIR NUEVOS ESPACIOS FÍSICOS PARA AUMENTAR EL NÚMERO DE TRIBUNALES Y FISCALÍAS A NIVEL NACIONAL.\n	936	1	4	14	157
2.5.4.5. DESARROLLAR UNA CULTURA DE RESPONSABILIDAD EN LA ADMINISTRACIÓN DE JUSTICIA, IMPULSANDO LAS POLÍTICAS DE FORMACIÓN Y CAPACITACIÓN DE JUECES, JUEZAS Y FISCALES PÚBLICOS, EN FUNCIÓN DEL DERECHO A VIVIR BIEN.\n\n	937	1	4	14	157
2.5.4.7. APOYAR LA CREACIÓN DE MECANISMOS ALTERNATIVOS DE RESOLUCIÓN DE CONFLICTOS, MEDIANTE LA INSTALACIÓN DE CASAS DE LA JUSTICIA PENAL EN CADA UNO DE LOS MUNICIPIOS PRIORIZADOS.	938	1	4	14	157
2.5.5.2. CONSOLIDAR EL MOVIMIENTO POR LA PAZ Y LA VIDA PARA LA CONSTRUCCIÓN DE UNA CULTURA DE PAZ, MEDIANTE PROPUESTAS Y ACCIONES A FAVOR DE UNA CONVIVENCIA PACÍFICA, SEGURA, SOLIDARIA Y LIBERTARIA, A TRAVÉS DEL FORTALECIMIENTO DE LA ORGANIZACIÓN Y LA MOVILIZACIÓN POPULAR EN APOYO A LA GRAN MISIÓN A TODA VIDA VENEZUELA.\n	939	1	4	14	158
2.5.5.6. IMPLEMENTAR EL PLAN PATRIA SEGURA A NIVEL NACIONAL, PARA FORTALECER LA CAPACIDAD DEL ESTADO DE PROTECCIÓN A LOS CIUDADANOS Y CONSTRUIR LA PAZ DESDE\nADENTRO, EN CORRESPONSABILIDAD CON EL PODER POPULAR Y LA FUERZA ARMADA NACIONAL BOLIVARIANA.\n	940	1	4	14	158
2.5.5.11. CREAR UN ÁREA ESTRATÉGICA O CAMPO DE CONOCIMIENTO SOBRE SEGURIDAD CIUDADANA, A TRAVÉS DEL FONDO NACIONAL DE CIENCIA, INNOVACIÓN Y TECNOLOGÍA.\n	941	1	4	14	158
2.5.6.1. AVANZAR EN EL DESARROLLO DEL ORDENAMIENTO LEGAL DEL SISTEMA DE PLANIFICACIÓN PÚBLICA Y POPULAR.\n	942	1	4	14	159
2.5.6.5. PROMOVER AL SISTEMA NACIONAL DE PLANIFICACIÓN COMO INSTANCIA COORDINADORA, E INTEGRADORA DE LA ACTIVIDAD PLANIFICADORA, FAVORECIENDO LA POLÍTICA DE ORDENACIÓN DEL TERRITORIO DE ACUERDO A SUS CAPACIDADES Y RECURSOS FÍSICOS, NATURALES, AMBIENTALES Y PATRIMONIALES, DANDO RELEVANCIA A SU HISTORIA.\n	943	1	4	14	159
2.5.7.5. ASEGURAR LA FORMACIÓN SISTEMÁTICA EN ESTADÍSTICAS PÚBLICAS.\n	944	1	4	14	160
2.5.4.4. APOYAR LA IMPLEMENTACIÓN DE FISCALÍAS Y JUZGADOS MUNICIPALES EN TODO EL PAÍS.\n	945	1	4	14	157
3.1.2.5. PERFORAR EN LOS BLOQUES ASIGNADOS 10.550 POZOS HORIZONTALES DE PETRÓLEO, AGRUPADOS EN 520 MACOLLAS DE PRODUCCIÓN.	973	1	5	15	66
3.2.7.4. FORTALECER EL POSICIONAMIENTO INTERNACIONAL DE VENEZUELA COMO DESTINO TURÍSTICO, A TRAVÉS DE LA PROMOCIÓN TURÍSTICA.	974	1	5	16	87
2.5.5.3. IMPULSAR LOS COMITÉS Y CAMPAÑAS DE DESARME VOLUNTARIO DE LA POBLACIÓN, ASÍ COMO LA REINSERCIÓN PLENA EN LA SOCIEDAD DE QUIENES HAGAN ENTREGA VOLUNTARIA DE ARMAS, CON PROCEDIMIENTOS AJUSTADOS A DERECHO, PARA FORTALECER LAS POLÍTICAS PÚBLICAS DE SEGURIDAD CIUDADANA, ATACANDO LAS CAUSAS DEL DELITO Y GENERANDO CONDICIONES DE PAZ Y DE JUSTICIA DESDE DENTRO DE LAS COMUNIDADES.\n	946	1	4	14	158
2.5.5.7. CULMINAR EL PROCESO DE REFUNDACIÓN DEL CUERPO DE INVESTIGACIONES CIENTÍFICAS, PENALES Y CRIMINALÍSTICAS (CICPC).\n	947	1	4	14	158
2.5.5.10. ACTIVAR EL SISTEMA NACIONAL DE ATENCIÓN A LAS VÍCTIMAS.\n	948	1	4	14	158
2.5.5.13. OPTIMIZAR EL ESTABLECIMIENTO DE POLÍTICAS Y PLANES QUE PROMUEVAN UNA CULTURA HACIA LA PREVENCIÓN Y ATENCIÓN ANTE EVENTOS ADVERSOS, SUSTENTÁNDOSE EN LOS VALORES DE VOLUNTARIEDAD, SOLIDARIDAD Y DESPRENDIMIENTO.\n	949	1	4	14	158
2.5.6.2. REFORZAR EL FUNCIONAMIENTO DE LOS ÓRGANOS ENCARGADOS DE LA PLANIFICACIÓN Y COORDINACIÓN DE LAS POLÍTICAS PÚBLICAS, COMO GARANTÍA DE LA ASIGNACIÓN DE LOS RECURSOS PÚBLICOS ORIENTADOS A LA CONSECUCIÓN, COORDINACIÓN Y ARMONIZACIÓN DE PLANES Y PROYECTOS, A TRAVÉS DE LA TRANSFORMACIÓN DEL PAÍS, EL DESARROLLO TERRITORIAL EQUILIBRADO Y LA JUSTA DISTRIBUCIÓN DE LA RIQUEZA.\n	950	1	4	14	159
2.5.6.4. DESARROLLAR UN SISTEMA ÚNICO QUE INTEGRE LA FORMULACIÓN, EJECUCIÓN Y CONTROL DE LOS PLANES Y PROYECTOS VINCULADOS CON EL PRESUPUESTO PÚBLICO, QUE PERMITA EL SEGUIMIENTO OPORTUNO DE LAS METAS Y OBJETIVOS ESTABLECIDOS, PROMOVIENDO LA TRANSPARENCIA EN EL MANEJO DE LOS RECURSOS PÚBLICOS, BAJO CRITERIOS DE PRUDENCIA Y RACIONALIDAD ECONÓMICA.\n	951	1	4	14	159
2.5.7.4. DESARROLLAR INVESTIGACIONES ESTADÍSTICAS MEDIANTE EL SISTEMA INTEGRADO DE ESTADÍSTICAS SOCIALES Y ECONÓMICAS, PARA EL SEGUIMIENTO DE LAS POLÍTICAS Y MEDICIÓN DE IMPACTOS.\n	952	1	4	14	160
2.5.8.1. GARANTIZAR EL DESARROLLO DEL GOBIERNO ELECTRÓNICO, MEDIANTE LA NORMATIVA LEGAL E INFRAESTRUCTURA NECESARIA, COMO SISTEMA PARA FACILITAR LA PARTICIPACIÓN CIUDADANA Y LA GESTIÓN PÚBLICA EFICIENTE Y TRANSPARENTE.\n	953	1	4	14	161
2.1.1.2. INSERTAR NUEVOS ESQUEMAS PRODUCTIVOS QUE IRRADIEN EN SU ENTORNO RELACIONES DE PRODUCCIÓN E INTERCAMBIO COMPLEMENTARIO Y SOLIDARIO, AL TIEMPO QUE CONSTITUYAN TEJIDOS PRODUCTIVOS DE SOSTÉN DE UN NUEVO METABOLISMO SOCIALISTA. ESTOS INJERTOS PRODUCTIVOS TENDRÁN POLÍTICAS DE ASOCIACIÓN ENTRE SÍ BAJO FORMAS DE CONGLOMERADOS PARA MULTIPLICAR SU ESCALA.\n	954	1	4	10	55
2.5.4.2. PROMOVER LA JUSTICIA DE PAZ COMUNAL COMO HERRAMIENTA EFICAZ PARA RESPALDAR LA CONVIVENCIA PACÍFICA Y FAVORECER LA PRÁCTICA DE LA SOLIDARIDAD Y EL AMOR ENTRE LOS VENEZOLANOS Y LAS VENEZOLANAS.\n	955	1	4	14	157
2.5.5.1. EXPANDIR Y CONSOLIDAR LA PREVENCIÓN INTEGRAL Y CONVIVENCIA COMUNAL, EN CORRESPONSABILIDAD CON EL ESTADO, A TRAVÉS DEL DISEÑO, EJECUCIÓN Y MONITOREO DEL PLAN DE PREVENCIÓN INTEGRAL EN EL ÁMBITO NACIONAL, CON ESPECIAL ATENCIÓN A LOS JÓVENES DESOCUPADOS DE LOS SECTORES POPULARES; DE LA APLICACIÓN DE UN PLAN ESPECIAL DE VIGILANCIA DE PATRULLAJE; DE LA ACTIVACIÓN DEL SERVICIO DE POLICÍA COMUNAL EN ACCIÓN CONJUNTA CON LAS ORGANIZACIONES COMUNALES DE BASE; DE LA EJECUCIÓN DEL PLAN DE TRABAJO PARA LOGRAR EL CONTROL DE ARMAS, MUNICIONES Y DESARME; ASÍ COMO LA INTENSIFICACIÓN DEL PROGRAMA DE FORTALECIMIENTO DE LA INVESTIGACIÓN, APREHENSIÓN Y PROCESAMIENTO DE PERSONAS RESPONSABLES DE DELITOS.\n	956	1	4	14	158
2.5.5.4. FORTALECER LOS ÓRGANOS DE SEGURIDAD PÚBLICA Y CIUDADANA EN MATERIA DE CONTROL Y PREVENCIÓN DEL DELITO, MEDIANTE LA DOTACIÓN DE EQUIPAMIENTO INDIVIDUAL E INSTITUCIONAL A LOS CUERPOS DE POLICÍA Y LA TECNIFICACIÓN COMUNICACIONAL PARA UNA RESPUESTA RÁPIDA Y EFECTIVA.\n	957	1	4	14	158
2.5.5.8. CREAR Y SOCIALIZAR EL CONOCIMIENTO PARA LA CONVIVENCIA Y LA SEGURIDAD CIUDADANA, CONSTITUYENDO CENTROS COMUNALES INTEGRALES DE RESOLUCIÓN DE CONFLICTOS.\n	958	1	4	14	158
2.5.5.12. FORTALECER LOS ÓRGANOS EN MATERIA DE PROTECCIÓN CIVIL, ADMINISTRACIÓN DE DESASTRES Y EMERGENCIAS, PARA GARANTIZAR LA PROTECCIÓN CIUDADANA ANTE CUALQUIER SITUACIÓN QUE IMPLIQUE AMENAZA, VULNERABILIDAD O RIESGO.\n	959	1	4	14	158
2.5.5.14. MANTENER Y REFORZAR LA LUCHA FRONTAL CONTRA LA PRODUCCIÓN, TRÁFICO Y CONSUMO ILÍCITO DE DROGAS, LEGITIMACIÓN DE CAPITALES Y DELINCUENCIA ORGANIZADA, CONSIDERADOS ASUNTOS DE SEGURIDAD DE ESTADO, DE CONFORMIDAD CON LAS LEYES NACIONALES, CONVENIOS, ACUERDOS Y TRATADOS INTERNACIONES.\n	960	1	4	14	158
2.5.5.15. FORTALECER LOS PROCESOS EN MATERIA DE IDENTIFICACIÓN, MIGRACIÓN Y EXTRANJERÍA, MEDIANTE LA IMPLANTACIÓN DE ALTA TECNOLOGÍA, CON EL PROPÓSITO DE GARANTIZAR EL DERECHO A LA IDENTIDAD Y A LA SEGURIDAD JURÍDICA.\n	961	1	4	14	158
2.5.6.1. AVANZAR EN EL DESARROLLO DEL ORDENAMIENTO LEGAL DEL SISTEMA DE PLANIFICACIÓN PÚBLICA Y POPULAR.\n	962	1	4	14	159
2.5.6.3. OPTIMIZAR LOS PROCESOS DE DEFINICIÓN, FORMULACIÓN, EJECUCIÓN, CONTROL Y EVALUACIÓN DE LAS POLÍTICAS PÚBLICAS, REGULANDO LA RELACIÓN ENTRE LOS DISTINTOS NIVELES POLÍTICOS DEL PODER PÚBLICO, Y LA RELACIÓN DE ÉSTOS CON EL PODER POPULAR.\n	963	1	4	14	159
2.5.6.6. ESTABLECER MECANISMOS DE FORMACIÓN INTEGRAL EN MATERIA DE PLANIFICACIÓN A LOS SERVIDORES Y SERVIDORAS PÚBLICOS, ASÍ COMO A LOS VOCEROS DEL PODER POPULAR, ORIENTADOS AL FORTALECIMIENTO DE LAS CAPACIDADES TÉCNICAS PARA EL DESARROLLO DE PROYECTOS Y EL DISEÑO DE POLÍTICAS PÚBLICAS.\n\n	964	1	4	14	159
2.5.6.7. CONSOLIDAR LA DEMOCRACIA PROTAGÓNICA Y PARTICIPATIVA DEL PUEBLO, DANDO SIGNIFICANCIA AL PAPEL PLANIFICADOR DE LOS CONSEJOS COMUNALES, QUE SE INCORPORAN AL SISTEMA NACIONAL DE PLANIFICACIÓN PÚBLICA A TRAVÉS DEL CONSEJO DE PLANIFICACIÓN COMUNAL Y LAS INSTANCIAS DE PLANIFICACIÓN DE LOS CONSEJOS COMUNALES.	965	1	4	14	159
2.5.7.1. DESARROLLAR INDICADORES Y ESTADÍSTICAS CON EL PODER POPULAR PARA SER INCLUIDOS EN EL SISTEMA ESTADÍSTICO NACIONAL.	966	1	4	14	160
2.5.7.2. FORTALECER LA PRODUCCIÓN, INTEROPERABILIDAD E INTERCAMBIO DE INFORMACIÓN ESTADÍSTICA OFICIAL PRODUCIDA POR ORGANISMOS, ENTES Y EMPRESAS DEL ESTADO.\n	967	1	4	14	160
2.5.7.3. IMPULSAR EL DESARROLLO DE LA CARTOGRAFÍA CON FINES ESTADÍSTICOS Y EL MAPEO DE LAS POLÍTICAS SOCIALES.\n\n	968	1	4	14	160
2.5.7.6. DESARROLLAR UN NUEVO SISTEMA DE INDICADORES DEL VIVIR BIEN, QUE PERMITA UNA EFECTIVA EVALUACIÓN Y VISIBILIZACIÓN DE LOS AVANCES DE LA REVOLUCIÓN BOLIVARIANA.	969	1	4	14	160
2.5.8.2. ADECUAR Y FORTALECER LAS PLATAFORMAS DE LAS INSTITUCIONES DEL ESTADO COMO VÍA PARA MEJORAR LA EFICIENCIA EN EL INTERCAMBIO DE DATOS NECESARIO PARA EL DESARROLLO DEL GOBIERNO ELECTRÓNICO.\n	970	1	4	14	161
2.2.12.10. IMPULSAR LA TRANSFORMACIÓN UNIVERSITARIA Y LA FORMACIÓN TÉCNICO-PROFESIONAL, PARA SU VINCULACIÓN CON LOS OBJETIVOS DEL PROYECTO NACIONAL. \n	971	1	4	11	144
3.1.2.9. CONSTRUIR DOS CONDOMINIOS INDUSTRIALES, UNO EN EL ÁREA DE CARABOBO Y OTRO EN EL ÁREA DE JUNÍN, PARA EL SUMINISTRO DE SERVICIOS DE HIDRÓGENO, NITRÓGENO, AIRE COMPRIMIDO, VAPOR, AGUA INDUSTRIAL Y DE ENFRIAMIENTO, ALMACENAMIENTO DE COQUE Y AZUFRE, Y DISTRIBUCIÓN DE ELECTRICIDAD, A LOS NUEVOS MEJORADORES.	972	1	5	15	66
5.1.3.11. FOMENTAR MEDIOS DE PAGO ALTERNATIVOS QUE TRASCIENDAN EL USO DE MONEDAS (DE PAPEL Y METÁLICAS), FACILITANDO EL ESTABLECIMIENTO DEL COMERCIO JUSTO ENTRE LOS PUEBLOS SURAMERICANOS Y PAÍSES ALIADOS, A LA VEZ QUE SE MODIFIQUE LA INFLUENCIA DEL DÓLAR ESTADOUNIDENSE COMO PATRÓN REFERENCIAL EN EL COMERCIO INTERNACIONAL.	976	1	7	23	117
4.4.1.2. ESTABLECER LAS ALIANZAS NECESARIAS PARA NEUTRALIZAR LAS ACCIONES DE LAS POTENCIAS NEOCOLONIALES EN ORGANISMOS INTERNACIONALES.	977	1	6	22	112
5.2.1.4. MANTENER LA INDEPENDENCIA EN EL MANEJO DEL SISTEMA DE OBTENCIÓN, PURIFICACIÓN, ADMINISTRACIÓN Y SUMINISTRO DE AGUA POTABLE.	978	1	7	24	121
3.2.2.2. GENERAR UNA ESTRUCTURA DE SOSTÉN PRODUCTIVO, REDES REGIONALES, INFRAESTRUCTURA DE APOYO A LA PRODUCCIÓN, LOGÍSTICA Y DISTRIBUCIÓN QUE TIENDAN A CONSTRUIR ECONOMÍA DE ESCALA EN UNA NUEVA CULTURA ORGANIZATIVA.DESARROLLAR LA ESTRATEGIA DE CONGLOMERADOS Y ALIANZAS ESTRATÉGICAS A EFECTOS DE CANALIZAR LOS INSUMOS INDUSTRIALES ASÍ COMO LA DISTRIBUCIÓN DE LOS MISMOS, EN UNA DINÁMICA DE RUPTURA DEL METABOLISMO DEL CAPITAL. CONSTITUIR UNA RED DE TRANSPORTE ESTATAL ASÍ COMO UNA NUEVA LÓGICA AL SISTEMA DE TRANSPORTE NACIONAL QUE RACIONALICE LOS COSTOS Y GARANTICE LOS TIEMPOS DE LOS INSUMOS Y PRODUCTOS EN UN MARCO DE SOBERANÍA NACIONAL. ARTICULAR UN SISTEMA MULTIMODAL DE TRANSPORTE Y ALMACENAJE,RENTABLEY EFICIENTE PARA LA PRODUCCIÓN Y DISTRIBUCIÓN, A ESCALA NACIONAL E INTERNACIONAL. FORTALECER Y EXPANDIR REDES ALTERNAS DE DISTRIBUCIÓN DE PRODUCTOS SIN INTERMEDIACIÓN ESPECULATIVA. MODERNIZACIÓN DEL SISTEMA DE PUERTOS Y AEROPUERTOS ASÍ COMO NUEVAS INFRAESTRUCTURAS VOLCADAS SOBRE EL ORINOCO APURE.	979	1	5	16	82
3.4.3.7 CONFORMAR EL DISTRITO MOTOR BIRUACAACHAGUAS, ESTADOS GUÁRICO Y APURE.PROYECTO DINAMIZADOR: CENTRO DE CAÑA ETANOL, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	980	1	5	18	93
3.1.2.4. CONSTRUIR UNA NUEVA REFINERÍA EN EL COMPLEJO INDUSTRIAL JOSÉ ANTONIO ANZOÁTEGUI CON UNA CAPACIDAD DE PROCESAMIENTO DE 373 MBD Y LA PRIMERA ETAPA DE UNA NUEVA REFINERÍA EN CABRUTA, CON UNA CAPACIDAD DE PROCESAMIENTO DE 220 MBD	981	1	5	15	66
3.1.1.2. ALCANZAR EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	982	1	5	15	65
3.1.7.2. CONSOLIDAR Y DESARROLLAR LOS SEIS POLOS PETROQUÍMICOS PLANIFICADOS: ANA MARÍA CAMPOS, MORÓN,JOSÉ ANTONIO ANZOÁTEGUI, PARAGUANÁ, NAVAY, PUERTO DE NUTRIAS Y GÜIRIA.	983	1	5	15	71
3.3.2.5. CONSOLIDAR UN SISTEMA DEFENSIVO TERRITORIAL CAPAZ DE DIRIGIR AL PAÍS EN TIEMPO DE GUERRA DESDE TIEMPO DE PAZ, ESTRATÉGICAMENTE DEFENSIVO Y EMINENTEMENTE POPULAR.	984	1	5	17	89
3.4.1.11. MAXIMIZAR EL SISTEMA PORTUARIO Y AEROPORTUARIO QUE PERMITA EL FLUJO E INTERCAMBIO ENTRE LOS CENTROS POBLADOS.\n	985	1	5	18	91
NO APLICA	987	1	5	18	163
3.3.3.3. INCREMENTAR LA FORMACIÓN DE PROFESIONALES MILITARES Y CIVILES EN CONVENIOS CON PAÍSES HERMANOS,PARA CONTRIBUIR RECÍPROCAMENTE EN LA UNIDAD REGIONAL Y EN CÍVICO MILITAR.	988	1	5	17	90
5.3.2.5. IMPULSAR LA CREACIÓN DE ESPACIOS HISTÓRICOS CULTURALES COMUNITARIOS EN TODA LA GEOGRAFÍA NACIONAL.	989	1	7	25	126
3.1.6.4. INCREMENTAR LA CAPACIDAD DE EXTRACCIÓN DE LÍQUIDOS DE GAS NATURAL, DE ALTO VALOR COMERCIAL, EN 130 MBD, A TRAVÉS DE LOS PROYECTOS DE PROCESAMIENTO DE GAS EN EL ORIENTE DEL PAÍS.\n	990	1	5	15	70
4.1.9.1. FORTALECER TELESUR, GARANTIZANDO UNA MAYOR PRESENCIA REGIONAL Y MUNDIAL.	991	1	6	19	104
3.1.1.1. ALCANZAR LA CAPACIDAD DE PRODUCCIÓN DE CRUDO HASTA 3,3 MMBD PARA EL AÑO 2014 Y 6 MMBD PARA EL AÑO 2019.	992	1	5	15	65
3.1.1.2. ALCANZAR LA PRODUCCIÓN DE GAS NATURAL PARA EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	993	1	5	15	65
3.1.1.2. ALCANZAR LA PRODUCCIÓN DE GAS NATURAL PARA EL AÑO 2014 HASTA 7.830 MMPCD Y EN EL AÑO 2019 A 10.494 MMPCD.	994	1	5	15	66
3.3.2.2. CONSOLIDAR Y PROFUNDIZAR LA DOCTRINA BOLIVARIANA, EN NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA.	995	1	5	17	89
3.1.6.7. SATISFACER LA DEMANDA DE GAS DOMÉSTICO A TRAVÉS DEL AUMENTO DE CAPACIDAD ALMACENAJE DE GLP.	996	1	5	15	70
3.1.9.3. CREAR LA ESCUELA TÉCNICA PETROLERA SOCIALISTA PARA LA CAPACITACIÓN DE LOS TÉCNICOS MEDIOS REQUERIDOS EN LA INDUSTRIA PETROLERA.	997	1	5	15	73
3.1.2.1. DESARROLLAR LA PRODUCCIÓN DE LAS SIETE NUEVAS EMPRESAS MIXTAS YA ESTABLECIDAS DE PRODUCCIÓN Y PROCESAMIENTO DE LOS CRUDOS DE LA FORINOCO, PARA ALCANZAR LA CA2.090 MBD EN EL 2019.\n	999	1	5	15	66
3.1.2.2. ELEVAR LA PRODUCCIÓN,FAJA PETROLÍFERA DEL ORINOCO ACTUALMENTE DESARROLLADAS POR PDVSA Y LAS EMPRESA MIXTAS,2019, APLICANDO TECNOLOGÍAS QUE INCREMENTEN EL FACTOR DE RECOBRO.\n	1000	1	5	15	66
3.1.2.3. CONSTRUIR CINCO NUEVOS MEJORADORES PARA CONVERTIR EL CRUDO EXTRAPESADO DE LA FAJA PETROLÍFERA DEL ORINOCO EN 8º API EN CRUDO MEJORADO DE 32 A 42 API CON UNA CAPACIDAD TOTAL DE 1 MMBD DE PROCESAMIENTO.	1001	1	5	15	66
3.1.2.6. CONSTRUIR UNA CAPACIDAD DE ALMACENAMIENTO DE 20 MILLONES DE BARRILES DE CRUDO Y PRODUCTOS, Y EL TENDIDO DE 2.000 KM DE TUBERÍAS ENTRE OLEODUCTOS Y DILUENDUCTOS CON CAPACIDAD DE TRANSPORTAR 2,5 MMBD.\n	1002	1	5	15	66
3.1.2.7. CONSTRUIR UN TERMINAL DE AGUAS PROFUNDAS EN EL ESTADO SUCRE PARA LA RECEPCIÓN Y DESPACHO DE CRUDOS Y PRODUCTOS, CON UNA CAPACIDAD DE EXPORTACIÓN DE 2,0 MMBD, ASÍ COMO TRES TERMINALES FLUVIALES DE SÓLIDOS Y LÍQUIDOS EN EL RÍO ORINOCO PARA EL ALMACENAMIENTO DE 120 MIL TONELADAS DE COQUE Y 90 MIL TONELADAS DE AZUFRE, ASÍ COMO EL DESPACHO DE 250 MBD DE CRUDO, TODO ELLO EN ARMONÍA CON EL AMBIENTE.	1003	1	5	15	66
3.1.2.8. CONSTRUIR TRES PLANTAS TERMOELÉCTRICAS CON UNA CAPACIDAD TOTAL DE GENERACIÓN DE 2.100 MW, LAS CUALES EMPLEARÁN COQUE PETROLERO GENERADO POR EL PROCESO DE MEJORAMIENTO DE LOS CRUDOS DE LA FAJA PETROLÍFERA DEL ORINOCO, CONTRIBUYENDO ASÍ AL APROVECHAMIENTO DE LOS SUBPRODUCTOS GENERADOS Y AL MEJORAMIENTO DE LA MATRIZ ENERGÉTICA DE CONSUMO.	1004	1	5	15	66
3.1.2.10. CREAR CINCO (5) BASES PETROINDUSTRIALES SOCIALISTAS (BPISOS) EN LA ZONA DE LA FAJA PETROLÍFERA DEL ORINOCO, EN LAS ÁREAS DE PALITAL, CHAGUARAMAS, SAN DIEGO\nDE CABRUTICA, SOLEDAD Y SANTA RITA PARA DESARROLLAR ACTIVIDADES DE METALMECÁNICA,\nSERVICIOS A POZOS, QUÍMICOS Y SERVICIOS ESPECIALIZADOS A REFINACIÓN.	1005	1	5	15	66
3.1.2.11. DESARROLLAR FACILIDADES PORTUARIAS Y AÉREOPORTUARIAS EN EL EJE NORTE-SUR DEL RÍO ORINOCO.	1006	1	5	15	66
3.1.3.1. CONTINUAR LAS ACTIVIDADES DE PERFORACIÓN,REHABILITACIÓN Y REPARACIÓN DE POZOS, QUE PERMITAN MANTENER LA PRODUCCIÓN.	1007	1	5	15	67
3.1.3.2. MANTENER Y MEJORAR LOS PROYECTOS DE RECUPERACIÓN SECUNDARIA EXISTENTES E INCORPORAR NUEVOS PROYECTOS A TRAVÉS DE TECNOLOGÍAS DE INYECCIÓN DE AGUA Y GAS, INYECCIÓN CONTINÚA DE VAPOR Y SURFACTANTES. 	1008	1	5	15	67
3.1.3.3. MANTENER Y MEJORAR LOS NIVELES DE CONFIABILIDAD Y MANTENIBILIDAD DE LA INFRAESTRUCTURA EXISTENTE.	1009	1	5	15	67
3.1.4.1. DESARROLLAR LAS POTENCIALIDADES EXISTENTES EN EL CINTURÓN GASÍFERO DE VENEZUELA EN LOS PROYECTOS RAFAEL URDANETA Y MARISCAL SUCRE, PARA ALCANZAR UNA CAPACIDAD DE PRODUCCIÓN DE GAS DE 300 MMPCD PARA EL 2014 Y 2.030 MMPCD PARA EL AÑO 2019.	1010	1	5	15	68
3.1.6.3. AMPLIAR LA RED DE TRANSPORTE DE GAS HASTA ALCANZAR 3.648 KM DE GASODUCTOS ENTRE EXISTENTES Y NUEVOS COMO LOS GASODUCTOS JOSÉ FRANCISCO BERMÚDEZ (SINORGAS) Y EL NORTE LLANERO FASE I.	1011	1	5	15	70
3.1.7.4. INCREMENTAR EN UN 300% LA CAPACIDAD DE PRODUCCIÓN DE OLEFINAS Y RESINAS PLÁSTICAS TRADICIONALES, Y DESARROLLAR OTRAS CADENAS DE RESINAS PLÁSTICAS NECESARIAS\nPARA EL PAÍS, SUSTITUYENDO IMPORTACIONES.	1012	1	5	15	71
3.1.7.6. CONTINUAR EN EL MARCO DE LA GRAN MISIÓN VIVIENDA VENEZUELA, DESARROLLANDO LAS FÁBRICAS MODULARES DE VIVIENDAS Y ACCESORIOS (PETROCASAS), INSTALANDO EN DIFERENTES ZONAS DEL PAÍS DIEZ NUEVAS PLANTAS, PARA ALCANZAR UNA PRODUCCIÓN DE 50.000 VIVIENDAS/AÑO, 800.000 VENTANAS/AÑO Y 800.000 PUERTAS/AÑO.	1013	1	5	15	71
3.1.8.2. FORTALECER LOS PROCESOS DE CONSTRUCCIÓN DE PLATAFORMAS DE PERFORACIÓN Y PRODUCCIÓN DE LOS YACIMIENTOS COSTA AFUERA, A PARTIR DE LA EXPERIENCIA NACIONAL EN ESTA MATERIA, GARANTIZANDO LA DISPONIBILIDAD DE DICHOS EQUIPOS PARA EL DESARROLLO DE\nLA PRODUCCIÓN GASÍFERA, TAL COMO LA PLATAFORMA 4 DE FEBRERO QUE OPERA EN EL GOLFO DE PARIA, A FIN DE GARANTIZAR LA OPORTUNA DISPONIBILIDAD DE LOS EQUIPOS REQUERIDOS EN EL DESARROLLO DE MARISCAL SUCRE, CARDÓN IV Y PLATAFORMA DELTANA.	1014	1	5	15	72
3.1.8.3. IMPULSAR LAS ACTIVIDADES DE LAS EMPRESAS ESTATALES DE MANTENIMIENTO, PARA MEJORAR EL TIEMPO, SERVICIO Y COSTO DE LAS PARADAS DE PLANTA, EN EL SISTEMA DE  REFINACIÓN NACIONAL Y MEJORADORES.\n	1015	1	5	15	72
3.1.8.4. IMPULSAR EL PROCESAMIENTO DE SUBPRODUCTOS PETROLEROS, MEDIANTE LA CREACIÓN DE EMPRESAS ESTATALES, MIXTAS Y CONGLOMERADOS INDUSTRIALES PARA LA PRODUCCIÓN DE INSUMOS REQUERIDOS POR LAS INDUSTRIAS BÁSICAS, QUE PERMITAN INTEGRAR LAS CADENAS DE PETRÓLEO Y GAS NATURAL CON LAS DE HIERRO-ACERO Y BAUXITA-ALUMINIO, A TRAVÉS DE LA INSTALACIÓN DE PLANTAS DE CALCINACIÓN DEL COQUE, Y RECUPERACIÓN DE METALES DEL FLEXICOQUE Y COQUE VERDE, FERROVANADIO, BREA DE PETRÓLEO Y ORIMATITA, ENTRE LOS CASOS\nDE NEGOCIO IDENTIFICADOS.	1016	1	5	15	72
3.1.12.2. SINCRONIZAR LA PRODUCCIÓN DE LOS DISTINTOS COMBUSTIBLES CON LA DEMANDA INTERNA, ASEGURANDO LOS DÍAS DE COBERTURA REQUERIDOS Y SU DISPONIBILIDAD EN EL TERRITORIO NACIONAL.	1017	1	5	15	76
3.1.9.1. CONTINUAR CON EL DESARROLLO EN EL PAÍS DE LAS TECNOLOGÍAS PROPIAS DE MEJORAMIENTO DE CRUDOS PESADOS Y EXTRAPESADOS Y PROMOVER SU USO, A TRAVÉS DE PROCESOS\nDE MEJORAMIENTO EN SITIO, PROCESOS DE CONVERSIÓN PROFUNDA Y PROCESOS DE VISCO REDUCCIÓN.	1018	1	5	15	73
3.1.13.4. IMPULSAR EL USO DE TECNOLOGÍAS MÁS EFICIENTES PARA LA GENERACIÓN ELÉCTRICA, A TRAVÉS DE LOS CIERRES DE CICLOS COMBINADOS EN LAS PLANTAS TÉRMICAS.	1019	1	5	15	77
3.1.14.1. CONSOLIDAR LAS ALIANZAS ESTRATÉGICAS ENTRE LOS PAÍSES SIGNATARIOS DE LOS ACUERDOS DEL ALBA, PETROCARIBE, ACUERDOS DE COOPERACIÓN ENERGÉTICA Y CONVENIOS INTEGRALES DE COOPERACIÓN.	1020	1	5	15	78
3.1.11.4. REFORZAR EL SISTEMA DE AUTOSUFICIENCIA ELÉCTRICA EN LOS CAMPOS OPERACIONALES, ASEGURANDO AUTONOMÍA CON EL SISTEMA ELÉCTRICO NACIONAL Y ESQUEMAS FLEXIBLES PARA LA GENERACIÓN DE 1.260 MW.	1021	1	5	15	75
3.1.13.5. AMPLIAR Y MEJORAR EL USO DE LA RED DE TRANSMISIÓN Y DISTRIBUCIÓN DE ELECTRICIDAD, MEDIANTE LA IMPLEMENTACIÓN DE: A) PLAN ROBUSTO, QUE PERMITE AMPLIAR LA CAPACIDAD DE TRANSMISIÓN EN LAS SIGUIENTES SUBESTACIONES: SUBESTACIÓN SAN CARLOS II 400/115 KV, CHIVACOA II 400/115 KV, PORTUGUESA 400/115 KV, CARABOBO II 400/230 KV Y SU SISTEMA DE TRANSMISIÓN ASOCIADO, SVC EN LA SUBESTACIÓN HORQUETA 230 KV, LÍNEA N° 2 URIBANTE-EL VIGÍA II Y EL VIGIA II-BUENA VISTA AISLADA 400 KV, SISTEMA A 400 KV EN EL OCCIDENTE DEL PAÍS (EL VENADO-BUENA VISTA). EN SUBTRANSMISIÓN: AMPLIACIÓN DEL SISTEMA DE ENLACE TRANSMISIÓN-DISTRIBUCIÓN A 115/13.8-34.5 KV, PARA ATENDER LAS CARGAS DE LOS USUARIOS FINALES. EN DISTRIBUCIÓN: COMPENSAR A NIVEL DE DISTRIBUCIÓN LOS CIRCUITOS, PARA MEJORAR LOS FACTORES DE POTENCIA DE LAS CARGAS Y CONSTRUIR NUEVOS ALIMENTADORES PARA SUPLIR A LOS USUARIOS FINALES CON LA CALIDAD DE SERVICIO ADECUADA. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO EN LA REGIÓN OCCIDENTAL QUE AGRUPA LOS ESTADOS BARINAS,MÉRIDA, TÁCHIRA, APURE(ALTO APURE), TRUJILLO Y ZULIA, Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS: 45 SUBESTACIONES, 4.044 KM DE LÍNEAS DE TRANSMISIÓN, 7.096 KM DE LÍNEAS DE DISTRIBUCIÓN, 1.305 MVA EN DISTRIBUCIÓN Y 8.654 MW EN PLANTAS DE GENERACIÓN. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO EN LA REGIÓN CENTRAL, QUE AGRUPA LOS ESTADOS APURE, ARAGUA, CARABOBO, COJEDES, CAPITAL, FALCÓN, GUÁRICO, LARA, MIRANDA, PORTUGUESA, VARGAS Y YARACUY; Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS: 67 SUBESTACIONES, 4.075 KM DE LÍNEAS DE TRANSMISIÓN, 3.179 KM DE LÍNEAS DE DISTRIBUCIÓN, 8.488 MVA EN DISTRIBUCIÓN, 5.542 MW EN PLANTAS DE GENERACIÓN. AMPLIAR Y ADECUAR EL SISTEMA ELÉCTRICO ORIENTAL, QUE AGRUPA LOS ESTADOS ANZOÁTEGUI, BOLÍVAR, DELTA AMACURO, MONAGAS, NUEVA ESPARTA Y SUCRE, Y LA CONSTRUCCIÓN DE LAS SIGUIENTES OBRAS:48 SUBESTACIONES, 4.110 KM DE LÍNEAS DE TRANSMISIÓN, 4.743 KM DE LÍNEAS DE DISTRIBUCIÓN,\n1.083 MVA EN DISTRIBUCIÓN Y 6.780 MW EN PLANTAS DE GENERACIÓN.	1022	1	5	15	77
3.1.14.3. PROFUNDIZAR LAS RELACIONES DE COOPERACIÓN CON LOS PAÍSES EN LA REGIÓN, EN BASE A LOS PRINCIPIOS DE COMPLEMENTARIEDAD Y SOLIDARIDAD, CON EL PROPÓSITO DE PROVEERLE A LOS PAÍSES ALIADOS EL ACCESO A LA ENERGÍA.	1023	1	5	15	78
3.1.15.2. EXPLORAR NUEVOS YACIMIENTOS MINERALES EN EL ESCUDO DE GUAYANA, SISTEMA MONTAÑOSO DEL CARIBE,CORDILLERA DE LOS ANDES Y SIERRA DE PERIJÁ, CON LA PROSPECCIÓN GEOLÓGICA Y LA UTILIZACIÓN DE NUEVAS TECNOLOGÍAS DE BAJO IMPACTO AMBIENTAL.	1024	1	5	15	79
3.1.15.3. DUPLICAR LAS RESERVAS MINERALES DE BAUXITA, HIERRO, COLTÁN (NIOBIO Y TANTALITA), NÍQUEL, ROCA FOSFÓRICA, FELDESPATO Y CARBÓN, CON LA CERTIFICACIÓN DE LOS YACIMIENTOS UBICADOS EN EL ESCUDO DE GUAYANA, CORDILLERA DE LOS ANDES, SISTEMA MONTAÑOSO DEL CARIBE Y LA SIERRA DE PERIJÁ.	1025	1	5	15	79
3.1.15.4. DUPLICAR LAS RESERVAS MINERALES DE ORO Y DIAMANTE CON LA CERTIFICACIÓN DE LOS YACIMIENTOS UBICADOS EN EL ESCUDO DE GUAYANA, PARA SU UTILIZACIÓN COMO BIENES TRANSABLES PARA EL FORTALECIMIENTO DE LAS RESERVAS INTERNACIONALES.	1026	1	5	15	79
3.1.16.1. IMPULSAR EL DESARROLLO DE LA MINERÍA, PARTIENDO DE LA DEMANDA ENDÓGENA INDUSTRIAL COMO FUERZA MOTRIZ Y ARTICULANDO LA DEMANDA INTERNA CON LA DEMANDA INTERNACIONAL.	1027	1	5	15	80
3.1.16.2. INTEGRAR LAS ACTIVIDADES MINERAS, EXPLOTANDO RACIONALMENTE LOS YACIMIENTOS MINERALES, A TRAVÉS DEL DESARROLLO DE LOS CONOCIMIENTOS CIENTÍFICOS Y TECNOLÓGICOS, QUE PERMITA ELEVAR LA PRODUCTIVIDAD Y MEJORAR LA EFICIENCIA DE LA PRODUCCIÓN EN EL SECTOR.	1028	1	5	15	80
3.2.3.5. DESARROLLAR PROCESOS INDUSTRIALES A ESCALA COMUNAL VINCULADOS CON LAS DEMANDAS LAS GRANDES Y MEDIANAS INDUSTRIAS NACIONALES.	1102	1	5	16	83
3.1.16.3. INCREMENTAR LA PRODUCCIÓN DE ORO Y DIAMANTE, ACTUALIZANDO TECNOLÓGICAMENTE LAS EMPRESAS ESTATALES DE ORO, CONFORMANDO EMPRESAS MIXTAS EN LAS CUALES LA REPÚBLICA TENGA EL CONTROL DE SUS DECISIONES Y MANTENGA UNA PARTICIPACIÓN MAYORITARIA, Y ORGANIZANDO LA PEQUEÑA MINERÍA EN UNIDADES DE PRODUCCIÓN DE PROPIEDAD SOCIAL.	1029	1	5	15	80
3.1.16.4. CONFORMAR EMPRESAS MIXTAS PARA LA EXPLOTACIÓN Y PROCESAMIENTO DE BAUXITA, HIERRO, COLTÁN (NIOBIO Y TANTALITA), NÍQUEL, ROCA FOSFÓRICA, FELDESPATO Y CARBÓN; EN LAS CUALES LA REPÚBLICA TENGA EL CONTROL DE SUS DECISIONES Y MANTENGA UNA PARTICIPACIÓN MAYORITARIA.	1030	1	5	15	80
4.1.8.3. GARANTIZAR LA TRANSFERENCIA CIENTÍFICO-TECNOLÓGICA EN LA COOPERACIÓN, A FIN DE ALCANZAR LA INDEPENDENCIA ECONÓMICA PRODUCTIVA.\n	1031	1	6	19	103
3.2.7.2. FORTALECER A VENETUR COMO LA PRIMERA OPERADORA TURÍSTICA DEL PAÍS Y POSICIONAR A LA RED DE HOTELES VENETUR COMO LA PRINCIPAL ALTERNATIVA DE ALOJAMIENTO TURÍSTICO DE GRAN CALIDAD.	1156	1	5	16	87
3.1.4.2. ACELERAR LOS ESFUERZOS EXPLORATORIOS DEL CINTURÓN GASÍFERO DE VENEZUELA EN LAS ÁREAS BLANQUILLA, GOLFO DE VENEZUELA, ENSENADA DE BARCELONA, EL NORTE DE MARISCAL SUCRE Y FACHADA ATLÁNTICA, PARA LA BÚSQUEDA DE NUEVAS RESERVAS DE GAS NO ASOCIADO QUE PERMITA INCORPORAR RESERVAS DE GAS CON EXPECTATIVA EXPLORATORIA DE 135 BPC DE GAS NATURAL.	1032	1	5	15	68
3.1.5.2. ADECUAR Y EXPANDIR LAS REFINERÍAS EXISTENTES DE EL PALITO, PUERTO LA CRUZ Y COMPLEJO REFINADOR PARAGUANÁ.	1033	1	5	15	69
3.1.6.1. ADECUAR Y EXPANDIR LOS SISTEMAS DE TRANSPORTE POR POLIDUCTOS EXISTENTES, TALES COMO EL SISTEMA DE SUMINISTROS LOS ANDES (SUMANDES) Y EL SISTEMA SUMINISTRO ORIENTE (SISOR), Y LA CONSTRUCCIÓN DE NUEVOS POLIDUCTOS COMO PUERTO LA CRUZ- MATURÍN, BAJO GRANDE-PLANTA RAMÓN LAGUNA, EL VIGÍA-LA FRÍA, Y EL PALITO-BARQUISIMETO.	1034	1	5	15	70
3.1.6.6. FORTALECER Y AMPLIAR LA COBERTURA DE LA RED DE DISTRIBUCIÓN DE GAS METANO, CON EL FIN DE DESPLAZAR EL CONSUMO DE GAS LICUADO DE PETRÓLEO (GLP) Y BRINDAR MAYOR CALIDAD DE VIDA A LA POBLACIÓN Y MENOR CONTAMINACIÓN DEL AMBIENTE, A TRAVÉS DEL TENDIDO DE 8.625 KM DE REDES DE TUBERÍA Y 16.818 KM DE LÍNEAS INTERNAS PARA BENEFICIAR A 728.900 FAMILIAS.	1035	1	5	15	70
3.1.7.1. DIVERSIFICAR EL PROCESAMIENTO DE GAS NATURAL, NAFTAS Y CORRIENTES DE REFINACIÓN, PARA LA GENERACIÓN DE PRODUCTOS DE MAYOR VALOR AGREGADO Y LA ELIMINACIÓN DE IMPORTACIONES DE INSUMOS PARA REFINACIÓN.	1036	1	5	15	71
3.1.9.5. IMPULSAR LA FORMACIÓN TÉCNICA Y POLÍTICOIDEOLÓGICA, ASÍ COMO LA INVESTIGACIÓN Y LOS ENCUENTROS DE SOCIALIZACIÓN, PARA LA INDUSTRIALIZACIÓN DE LOS HIDROCARBUROS, A TRAVÉS DEL ESTABLECIMIENTO DE INSTITUCIONES EDUCATIVAS, CIENTÍFICAS Y TECNOLÓGICAS, QUE CONTRIBUYAN EN EL DESARROLLO DE LOS SECTORES DE TRANSFORMACIÓN AGUAS ABAJO.	1037	1	5	15	73
3.1.9.6. IMPULSAR LA INVESTIGACIÓN EN LAS ÁREAS DE COQUE Y MINERALES PROVENIENTES DEL PROCESAMIENTO DE LOS CRUDOS DE LA FAJA PETROLÍFERA DEL ORINOCO, PARA SU INDUSTRIALIZACIÓN.	1038	1	5	15	73
3.1.10.1. PROFUNDIZAR LAS ESTRATEGIAS DE DIVERSIFICACIÓN DE MERCADOS DE CRUDOS Y PRODUCTOS DERIVADOS HACIA MERCADOS QUE PERMITAN LA MEJOR VALORIZACIÓN DEL CRUDO VENEZOLANO Y ELIMINE LA DEPENDENCIA DEL MERCADO NORTEAMERICANO.	1039	1	5	15	74
3.1.10.3. INCREMENTAR LA EXPORTACIÓN DE CRUDO HACIA ASIA, EN ESPECIAL CHINA, INDIA Y JAPÓN PARA ALCANZAR UN VOLUMEN DE EXPORTACIÓN DE 3.162 MBD EN EL 2019.	1040	1	5	15	74
3.1.11.1. INTENSIFICAR LAS ACCIONES NECESARIAS PARA GARANTIZAR LA DISPONIBILIDAD DE LOS RECURSOS HUMANOS,LOGÍSTICOS Y FINANCIEROS REQUERIDOS PARA EJECUTAR LOS PLANES, PROGRAMAS Y PROYECTOS DE PETRÓLEOS DE VENEZUELA Y SUS EMPRESAS MIXTAS.\n	1041	1	5	15	75
3.1.11.2. INCREMENTAR LA CONFIABILIDAD Y DISPONIBILIDAD DE LA INFRAESTRUCTURA DE RECOLECCIÓN, TRATAMIENTO, ALMACENAMIENTO, EMBARQUE, MEDICIÓN Y REFINACIÓN DE HIDROCARBUROS DE PETRÓLEOS DE VENEZUELA Y SUS EMPRESAS MIXTAS.	1042	1	5	15	75
3.1.11.3. GARANTIZAR LA CAPACITACIÓN Y FORMACIÓN DEL TALENTO HUMANO PARA EJECUTAR EFICIENTEMENTE LAS ACTIVIDADES DE LA CADENA DE VALOR DE LOS HIDROCARBUROS EN PETRÓLEOS DE VENEZUELA.	1043	1	5	15	75
3.1.12.5. EJECUTAR LOS PROYECTOS DE ADECUACIÓN, REHABILITACIÓN, CONSTRUCCIÓN Y MANTENIMIENTO DE INSTALACIONES Y EQUIPOS DEL SISTEMA ELÉCTRICO.	1044	1	5	15	76
3.1.13.1. FORTALECER Y AMPLIAR EL SISTEMA ELÉCTRICO NACIONAL.	1045	1	5	15	77
3.1.13.2. DIVERSIFICAR LA MATRIZ DE INSUMOS PARA LA GENERACIÓN ELÉCTRICA, FAVORECIENDO EL USO DEL GAS NATURAL, EL COQUE Y OTRAS FUENTES DE ENERGÍA.	1046	1	5	15	77
3.1.13.3. COMPLETAR EL DESARROLLO HIDROELÉCTRICO DEL PAÍS, A TRAVÉS DE LA CULMINACIÓN DE LOS COMPLEJOS HIDROELÉCTRICOS UBICADOS EN EL CARONÍ Y EN LOS ANDES.	1047	1	5	15	77
3.1.13.6. SATISFACER LOS REQUERIMIENTOS DE DEMANDA DE ELECTRICIDAD MEDIANTE EL SESARROLLO DE INFRAESTRUCTURA ELÉCTRICA, CON CRITERIOS DE EFICIENCIA, USO RACIONAL, CALIDAD, CONTINUIDAD, CONFIABILIDAD, RESPETO AL MEDIO AMBIENTE, SEGURIDAD Y SUSTENTABILIDAD ECONÓMICA FINANCIERA.	1048	1	5	15	77
3.1.16.8. CREAR EL FONDO DE DESARROLLO SOCIAL MINERO CON APORTES FINANCIEROS DE LA ACTIVIDAD MINERA, PARA GARANTIZAR LA SEGURIDAD SOCIAL DEL TRABAJADOR.	1049	1	5	15	80
3.2.1.3. EXPANDIR Y DESARROLLAR LA PRODUCCIÓN PRIMARIA Y APROVECHAMIENTO FORESTAL DEL PAÍS, AMPLIANDO LAS PLANTACIONES EN VOLUMEN Y TERRITORIALMENTE, E INFRAESTRUCTURA DE TRANSFORMACIÓN EN TODA LA CADENA PRODUCTIVA, PARA MUEBLES, VIVIENDAS, PAPEL E INSUMOS DE OTROS PROCESOS INDUSTRIALES; ELEVANDO LA SUPERFICIE PLANTADA DE 500 MIL HA A 2 MILLONES DE HA, ASÍ COMO SU TRANSFORMACIÓN INTEGRAL EN EL PAÍS Y SANEAMIENTO Y PREVENCIÓN EN LAS SUPERFICIES PLANTADAS. DIVERSIFICAR LA PLANTACIÓN Y PRODUCCIÓN FORESTAL. ALCANZAR 1.167 MIL M  DE MADERA PROCESADA EN EL 2014 Y LOS 3.160 MIL M 33 EN EL 2016, ESTABILIZÁNDOSE HASTA 2019. PROYECTAR LAS CAPACIDADES PARA UN CONSUMO ANUAL DE 6,8 MILLONES DE M/AÑO PARA EL PERIODO 2020-2030. 	1050	1	5	16	81
3.2.1.5. DESARROLLAR EL APROVECHAMIENTO SOBERANO TANTO EN LA EXTRACCIÓN COMO EN EL PROCESAMIENTO DE LOS MINERALES NO METÁLICOS; TÉCNICAS DE MAXIMIZACIÓN DEL RENDIMIENTO  CUIDADO AMBIENTAL, EN ESPECIAL DE LAS CADENAS DE CEMENTO Y AGREGADOS DE CONSTRUCCIÓN, VIDRIO E INSUMOS PRODUCTIVOS ESPECIALES (FELDESPATO, CAOLÍN,CAL, CAL SIDERÚRGICA, YESO, CALIZA, SÍLICE, SODA ASH, ENTRE OTROS) Y NUEVOS DESARROLLOS COMO EL COLTÁN.	1051	1	5	16	81
3.1.4.3. ACELERAR LA INCORPORACIÓN DE CONDENSADO, HIDROCARBURO DE ALTO VALOR COMERCIAL, QUE GENERA LAS ACTIVIDADES DE EXPLOTACIÓN DE LOS RECURSOS DE HIDROCARBUROS\nCOSTA AFUERA, LA CUAL APORTARÁ MÁS DE 64MBD AL 2019.\n	1052	1	5	15	68
3.1.5.1. ADECUAR Y EXPANDIR EL SISTEMA DE REFINACIÓN NACIONAL DE 1,3 MMBD EN EL 2013 A 1,8 MMBD EN EL 2019, IMPULSANDO UN MAYOR PROCESAMIENTO DE LOS CRUDOS PESADOS Y EXTRAPESADOS DE LA FAJA PETROLÍFERA DEL ORINOCO, Y ADAPTARLO A LAS EXIGENCIAS DE CALIDAD DE PRODUCTOS EN LOS MERCADOS NACIONAL E INTERNACIONAL.	1053	1	5	15	69
3.1.5.3. CONSTRUIR DOS NUEVAS REFINERÍAS, BATALLA DE SANTA INÉS DE 100 MBD Y PETROBICENTENARIO DE 373 MBD, PARA BALANCEAR EL SUMINISTRO DEL MERCADO INTERNO E INCREMENTAR EL CONTENIDO DE PRODUCTOS EN LA CESTA DE EXPORTACIÓN DE VENEZUELA.	1054	1	5	15	69
3.1.6.2. ADECUAR Y AMPLIAR LA RED DE PLANTAS DE DISTRIBUCIÓN DE COMBUSTIBLES, IMPULSANDO LA CONSTRUCCIÓN DE NUEVOS SISTEMAS,ASÍ COMO LA ADECUACIÓN DE LOS EXISTENTES; ENTRE ELLAS: EL GUAMACHE, EN LA ISLA DE MARGARITA, Y PUERTO PESQUERO GÜIRIA, Y LA CONSTRUCCIÓN DE NUEVAS PLANTAS, COMO PLANTA DEL OESTE DE CARACAS, GUATIRE, CATIA LA MAR, BATALLA SANTA INÉS, CABRUTA Y JOSE.	1055	1	5	15	70
3.1.7.3. INCREMENTAR LA PRODUCCIÓN DE FERTILIZANTES NITROGENADOS Y FOSFATADOS EN UN 43%, LO CUAL CUBRIRÁ LA DEMANDA NACIONAL Y CONVERTIRÁ A VENEZUELA EN UN EXPORTADOR DE FERTILIZANTES PARA TODA LA REGIÓN.	1056	1	5	15	71
3.1.8.1. INCREMENTAR LA CAPACIDAD DE ENSAMBLAJE Y FABRICACIÓN EN EL PAÍS DE TALADROS Y EQUIPOS DE SERVICIOS A POZOS, A TRAVÉS DE EMPRESAS COMO LA INDUSTRIA CHINA VENEZOLANA DE TALADROS (ICVT), ASÍ COMO LA CAPACIDAD DE FABRICACIÓN NACIONAL DE TUBULARES, VÁLVULAS Y OTROS BIENES DE USO EN OPERACIONES PETROLERAS.	1057	1	5	15	72
3.1.9.2. POSICIONAR EL USO DE TECNOLOGÍAS DE RECUPERACIÓN SECUNDARIA Y TERCIARIA DE CRUDOS PESADOS Y EXTRAPESADOS, PARA INCREMENTAR EL FACTOR DE RECOBRO EN LOS YACIMIENTOS, TALES COMO INYECCIÓN CONTINUA DE VAPOR, COMBUSTIÓN IN SITU E INYECCIÓN DE SURFACTANTES.	1058	1	5	15	73
3.1.9.4. IMPLEMENTAR A NIVEL NACIONAL LA UNIVERSIDAD DE LOS HIDROCARBUROS, A FIN DE CUMPLIR CON LA FORMACIÓN TÉCNICA Y POLÍTICO-IDEOLÓGICA DE CUADROS PARA LAS ÁREAS DE DESARROLLO PETROLERO, EN PARTICULAR PARA LA FAJA PETROLÍFERA DEL ORINOCO Y COSTA AFUERA.	1059	1	5	15	73
3.1.10.2. PROFUNDIZAR LA ESTRATEGIA DE INTEGRACIÓN Y POSICIONAMIENTO DE VENEZUELA\nEN LATINOAMÉRICA Y EL CARIBE, MEDIANTE LA CONSTRUCCIÓN DE UN CIRCUITO DE REFINACIÓN QUE ARTICULE CON LAS REFINERÍAS EN VENEZUELA PARA CONTRARRESTAR LA INFLUENCIA EN LA FORMACIÓN DE PRECIOS DE LOS COMBUSTIBLES QUE TIENEN OTROS PAÍSES,ASI COMO EN INCREMENTAR LA EXPORTACIÓN DE CRUDOS Y PRODUCTOS HACIA ESTAS REGIONES PARA ALCANZAR UN VOLUMEN DE 1.335 MBD EN EL 2019.	1060	1	5	15	74
3.1.11.5. OPTIMIZAR LA CAPACIDAD DE MANEJO DE OPERACIONES ACUÁTICAS EN EL LAGO DE MARACAIBO Y TODAS LAS EMBARCACIONES PETROLERAS A NIVEL NACIONAL.	1061	1	5	15	75
3.1.11.6. PROMOVER LA FABRICACIÓN E INCREMENTAR LA CAPACIDAD NACIONAL DE ENSAMBLAJE Y MANTENIMIENTO DE TALADROS, ASÍ COMO LA CAPACIDAD DE TRANSPORTE Y LOGÍSTICA QUE PERMITA REDUCIR LOS TIEMPOS IMPRODUCTIVOS, ATENDER LOS PLANES DE CRECIMIENTO Y FORTALECER EL CONTROL DE LAS ACTIVIDADES MEDULARES.	1062	1	5	15	75
3.1.12.1. DIVERSIFICAR LA MATRIZ DE ENERGÍA PRIMARIA Y ADECUAR EL CONSUMO ENERGÉTICO A LOS MEJORES ESTÁNDARES DE EFICIENCIA, INCORPORANDO COQUE, CARBÓN Y ENERGÍAS ALTERNATIVAS.	1063	1	5	15	76
3.1.12.4. REFORZAR PLANES DE CONTINGENCIA EN MATERIA DE PRODUCCIÓN Y DISPONIBILIDAD ENERGÉTICA, PARA ATENDER OPORTUNAMENTE LOS EVENTOS DE FUERZA MAYOR.	1064	1	5	15	76
3.1.13.7. FOMENTAR EL USO EFICIENTE DE LA ENERGÍA ELÉCTRICA, A TRAVÉS DE UNA CULTURA DE CONSUMO EFICIENTE Y LA UTILIZACIÓN DE FUENTES ALTERNAS Y RENOVABLES.	1065	1	5	15	77
3.1.13.8. GARANTIZAR EL SUMINISTRO ELÉCTRICO PARA LOS PROYECTOS ASOCIADOS CON LAS MISIONES SOCIALES, CON ÉNFASIS EN LA GRAN MISIÓN VIVIENDA VENEZUELA, ASÍ COMO PARA\nNUEVOS PROYECTOS SOCIOPRODUCTIVOS PREVISTOS EN ESTE PLAN.	1066	1	5	15	77
3.1.13.9. IMPULSAR Y GARANTIZAR LA SEGURIDAD INTEGRAL Y EL RESGUARDO DE LAS INSTALACIONES DEL SISTEMA ELÉCTRICO.	1067	1	5	15	77
3.1.14.2. PROFUNDIZAR LAS ALIANZAS POLÍTICAS Y ECONÓMICAS CON AQUELLOS PAÍSES CON POSICIONAMIENTO GEOESTRATÉGICO FAVORABLE Y CUYOS INTERESES CONVERJAN CON LOS DE NUESTRA NACIÓN, FAVORECIENDO LA CONSTRUCCIÓN DE UN MUNDO PLURIPOLAR.	1068	1	5	15	78
3.1.15.1. INCREMENTAR EL NIVEL DE PROSPECCIONES GEOLÓGICAS PARA AUMENTAR LA CERTIFICACIÓN DE RESERVAS DE MINERALES A NIVEL NACIONAL.\n	1069	1	5	15	79
3.1.16.6. PROMOVER EL DESARROLLO DE TECNOLOGÍAS MINERAS QUE DISMINUYAN EL IMPACTO AMBIENTAL,LOS VOLÚMENES DE MATERIAL RESIDUAL Y EL PROCESAMIENTO SUPERFICIAL DEL MATERIAL ÚTIL; APROVECHANDO EL POTENCIAL DE LAS UNIVERSIDADES E INSTITUTOS DEL PAÍS Y LOS CONVENIOS DE TRANSFERENCIA TECNOLÓGICA FIRMADOS CON PAÍSES ALIADOS.	1070	1	5	15	80
3.1.16.7. ORGANIZAR LA PEQUEÑA MINERÍA, CONCENTRADA EN LA EXPLOTACIÓN DE ORO Y DIAMANTE, EN UNIDADES DE PRODUCCIÓN DONDE EL ESTADO BRINDE APOYO TECNOLÓGICO Y FINANCIERO PARA PROTEGER LA SALUD DE LOS TRABAJADORES, LOS RECURSOS NATURALES Y EL MEDIO AMBIENTE.	1071	1	5	15	80
3.2.1.4. INDUSTRIALIZAR EL SECTOR CONSTRUCCIÓN PARA ATENDER LA SATISFACCIÓN DEL DESARROLLO DE VIVIENDAS,EDIFICACIONES, EQUIPAMIENTO URBANO E INFRAESTRUCTURA.COMPONENTES ELÉCTRICOS, BOMBILLOS DE BAJO CONSUMO ELÉCTRICO, SALAS DE BAÑO, HERRAJES, PIEZAS DE FUNDICIÓN DE TAMAÑO MEDIO, GRIFERÍA, GRUPOS DE DUCHAS, UNIONES Y CONEXIONES DE BRONCE, PINTURA: EQUIPOS Y MAQUINARIAS DE CONSTRUCCIÓN; TECNIFICACIÓN E INDUSTRIALIZACIÓN DE SISTEMAS CONSTRUCTIVOS, ENTRE OTROS.	1072	1	5	16	81
3.2.1.9. APLICAR MECANISMOS DE FOMENTO Y REGULACIÓN  PARA FORTALECER EL APARATO PRODUCTIVO NACIONAL EN LOS SECTORES ESTRATÉGICOS.	1073	1	5	16	81
3.2.3.1. ESTABLECER ALIANZAS ESTRATÉGICAS EN UN MUNDO PLURIPOLAR QUE GARANTICEN LA TRANSFERENCIA TECNOLÓGICA Y LA MEJORA Y HUMANIZACIÓN DE LOS PROCESOS PRODUCTIVOS.	1074	1	5	16	83
3.1.6.5. INCREMENTAR LA CAPACIDAD DE COMPRESIÓN DE GAS PARA SU UTILIZACIÓN EN EL SECTOR INDUSTRIAL Y DOMÉSTICO, ASÍ COMO EN LAS OPERACIONES DE PRODUCCIÓN DE LA INDUSTRIA PETROLERA MEDIANTE LA CONSTRUCCIÓN DE LA INFRAESTRUCTURA NECESARIA QUE GARANTICE EL MANEJO OPORTUNO DE NUEVOS REQUERIMIENTOS.	1075	1	5	15	70
3.1.6.8. REACONDICIONAR E INCREMENTAR LA CAPACIDAD DE ALMACENAMIENTO DE CRUDO MEDIANTE LA ADECUACIÓN Y EXPANSIÓN DE LA INFRAESTRUCTURA EXISTENTE.	1076	1	5	15	70
3.1.7.5. EXPANDIR EN 87% LA CAPACIDAD INSTALADA DEL SECTOR PRODUCTOR DE QUÍMICOS, HACIENDO ÉNFASIS EN LA PRODUCCIÓN DE AROMÁTICOS Y EL DESARROLLO DE LAS CADENAS AGUAS ABAJO DEL METANOL Y LA UREA.	1077	1	5	15	71
3.2.1.10. IMPULSAR EL ESTABLECIMIENTO DE NORMAS EN LOS ACUERDOS COMERCIALES BILATERALES Y REGIONALES,ORIENTADAS A FORTALECER LAS CAPACIDADES PRODUCTIVAS NACIONALES Y TRANSFERENCIA TECNOLÓGICA, ASÍ COMO LA COMPLEMENTARIEDAD DE LAS CADENAS PRODUCTIVAS REGIONALES Y DE LA NUEVA GEOPOLÍTICA INTERNACIONAL PARA FORTALECER EL APARATO PRODUCTIVO NACIONAL, E IGUALMENTE A CORREGIR EL DAÑO O AFECTACIÓN DE LA PRODUCCIÓN NACIONAL CAUSADA POR EL INCREMENTO DE IMPORTACIONES O LA PRESENCIA DE PRÁCTICAS DESLEALES EN LAS MISMAS.	1079	1	5	16	81
4.3.3.2. ACOMPAÑAR LA ORGANIZACIÓN Y REALIZACIÓN DE FOROS INTERNACIONALES DE MOVIMIENTOS SOCIALES Y ORGANIZACIONES POPULARES, CON EL FIN DE RECOGER SUS REIVINDICACIONES Y PROPUESTAS PARA INCORPORARLAS EN LA AGENDA POLÍTICA GLOBAL.	1080	1	6	21	110
3.2.2.3. DESARROLLAR PARQUES Y DEMÁS ÁREAS DE AGLOMERACIÓN INDUSTRIAL COMO NODOS DEL NUEVO SISTEMA PRODUCTIVO NACIONAL Y DE COMPLEMENTARIEDAD CON LOS PROYECTOS DE INTEGRACIÓN DE NUESTRA AMÉRICA.	1081	1	5	16	82
3.2.3.4. FOMENTAR EL USO DE TECNOLOGÍA Y EL COMERCIO ELECTRÓNICO SEGURO EN EL INTERCAMBIO DE SERVICIOS, MATERIAS PRIMAS, BIENES SEMI-ELABORADOS Y PRODUCTOS FINALES, COMO APORTE A LA REDUCCIÓN DE LOS ESLABONES DE LAS CADENAS DE COMERCIALIZACIÓN DE BIENES Y SERVICIOS BÁSICOS PARA LA POBLACIÓN, CONTRIBUYENDO AL ACERCAMIENTO ENTRE PRODUCTORES Y COMPRADORES, ASÍ COMO NUEVAS FORMAS ORGANIZATIVAS QUE ENFRENTEN EL MERCADO ESPECULATIVO.	1082	1	5	16	83
3.2.4.4. DESARROLLAR EL DISEÑO, DESARROLLO DE MATERIA LES, INGENIERÍA DE PROCESOS PARA LA PRODUCCIÓN DE BIENES DE CAPITAL Y FÁBRICAS MADRES (FÁBRICAS DE FÁBRICAS). 	1083	1	5	16	84
4.1.9.2. EXPANDIR EL ALCANCE DE LA RADIO DEL SUR COMO HERRAMIENTA COMUNICACIONAL PARA LA VISIBILIZACIÓN DE LOS PROCESOS POLÍTICOS DE LA REGIÓN.	1084	1	6	19	104
4.3.1.4. ESTABLECER ALIANZAS ESTRATÉGICAS CON LA REPÚBLICA DE LA INDIA Y LA REPÚBLICA DE SUDÁFRICA.\n	1157	1	6	21	108
5.1.2.4. FOMENTAR UN NUEVO ESQUEMA DE VALORES,ORIENTADO AL RESPETO Y PRESERVACIÓN DE LA NATURALEZA,QUE TRANSFORME LA CONCIENCIA COLECTIVA, SOBRE LOS PATRONES CAPITALISTAS DE PRODUCCIÓN Y CONSUMO.	1185	1	7	23	116
3.2.5.2. AMPLIAR EL HORIZONTE PRODUCTIVO MEDIANTE LA CONSTRUCCIÓN DE LOS SIGUIENTES PROYECTOS ESTRUCTURANTES DE LA CADENA HIERRO-ACERO: A) FÁBRICA DE TUBOS SIN COSTURA; B) SIDERÚRGICA NACIONAL JOSÉ IGNACIO DE ABREU E LIMA; C) PLANTAS RECUPERADORAS DE MATERIAS PRIMAS; D) EN FERROMINERA DEL ORINOCO: PLANTA DE CONCENTRACIÓN DE MINERAL DE HIERRO (CUARCITAS FRIABLES), AMPLIACIÓN DEL MUELLE DE PALÚA, AUMENTO DE CAPACIDAD DE TRANSPORTE FERROVIARIO A 42 MM TN, DOTACIÓN DE MAQUINARIA, EQUIPOS Y REPUESTOS PARA MINAS; E) FORTALECIMIENTO Y DESARROLLO DEL SISTEMA DE TRANSFORMACIÓN NACIONAL PARA INCORPORAR VALOR AGREGADO.	1085	1	5	16	85
3.2.5.8. DESARROLLAR LOS SIGUIENTES PROYECTOS EN CONCEPTUALIZACIÓN EN EL SECTOR AUTOMOTRIZ: A) FÁBRICA DE AUTOBUSES TANTO PARA REQUERIMIENTO NACIONAL COMO CAPACIDAD DE EXPORTACIÓN; B) NUEVAS CAPACIDADES EN PRODUCCIÓN DE CAMIONES DE CARGA PESADA; C) PLANTAS DE MAQUINARIA DE CONSTRUCCIÓN Y VIALIDAD D) NUEVAS ALIANZAS ESTRATÉGICAS PARA LA PRODUCCIÓN DE MOTOS Y MOTORES FUERA DE BORDA E) ALIANZA ESTRATÉGICA PARA LA AMPLIACIÓN DE CAPACIDADES EN PRODUCCIÓN AUTOMOTRIZ. LAS CAPACIDADES A GENERAR EN CAMIONES, AUTOBUSES, CARROS DE PASAJERO Y TRACTORES SERÁN CON PERFIL DE SATISFACCIÓN PLENA DEL MERCADO NACIONAL Y EXPORTACIÓN; EN ALIANZA CON LA NUEVA GEOPOLÍTICA MULTIPOLAR Y LAS ZONAS ECONÓMICAS DEL ALBA, PETROCARIBE Y MERCOSUR.	1086	1	5	16	85
5.1.6.3. REALIZAR ESTUDIOS PARA EL DESARROLLO DE FUENTES ENERGÉTICAS MARINAS ESPECÍFICAMENTE LA OLAMOTRIZ Y LA MAREOMOTRIZ; CON EL FIN DE APROVECHAR LA POTENCIALIDAD DE NUESTRAS EXTENSAS COSTAS.\n	1087	1	7	23	120
3.2.5.16. CONTINUAR AFIANZANDO EL DESARROLLO Y AMPLIACIÓN  DE LOS PROYECTOS RELATIVOS A LA FABRICACIÓN DE PRODUCTOS DEL ÁREA DE INFORMÁTICA Y CELULARES, CON CRECIENTE INCORPORACIÓN DE VALOR AGREGADO NACIONAL, TRANSFERENCIA TECNOLÓGICA Y ESQUEMAS DE EXPORTACIÓN HACIA PAÍSES ALIADOS, ESPECIALMENTE EN EL MARCO DE MERCOSUR.	1088	1	5	16	85
3.3.1.4. REFORZAR LOS VÍNCULOS DE INTEGRACIÓN DE NUESTRA PATRIA CON PAÍSES HERMANOS PARA COMPARTIR CAPACIDADES Y CONOCIMIENTOS EN FUNCIÓN DEL VIVIR BIEN DE NUESTRO PUEBLO.	1089	1	5	17	88
3.2.5.21. DESARROLLAR LAS CAPACIDADES INDUSTRIALES DE CONSTRUCCIÓN DE MAQUINARIA, EQUIPOS E INFRAESTRUCTURA DEL PAÍS Y DE LA REGIÓN. DESARROLLO DE SOPORTE A LA AGROINDUSTRIA. EQUIPAMIENTO AGRÍCOLA Y ALIMENTOS CONCENTRADOS. HACER ESPECIAL ÉNFASIS EN LA CADENA DEL FRÍO.	1090	1	5	16	85
3.2.5.23. CREAR NUEVOS CANALES Y FORMAS DE DISTRIBUCIÓN-COMERCIALIZACIÓN A LOS PRODUCTOS Y SERVICIOS DE MANUFACTURA NACIONAL CON CALIDAD CERTIFICADA QUE PERMITAN EL BENEFICIO DE UN AMPLIO SECTOR DE LA POBLACIÓN DE MANERAECONÓMICA, CONSTANTE Y EFICIENTE, Y PROMOVER LA FIDELIDAD DE LOS BENEFICIARIOS AL SELLO “HECHO EN VENEZUELA”.	1091	1	5	16	85
3.2.5.24. GENERAR Y FORTALECER LOS SUBSISTEMAS DE NORMALIZACIÓN, METROLOGÍA Y EVALUACIÓN DE LA CONFORMIDAD DEL SISTEMA NACIONAL DE LA CALIDAD, REQUERIDOS PARA EL DESARROLLO DE LOS ESLABONES PRODUCTIVOS Y CONCRECIÓN DE LOS PROYECTOS DE LAS FABRICAS SOCIALISTAS IMPULSADOS POR EL ESTADO EN LA CONSTRUCCIÓN DEL SOCIALISMO BOLIVARIANO.	1092	1	5	16	85
3.2.6.3. FORTALECER LA FORMACIÓN INTEGRAL TURÍSTICA A NIVEL NACIONAL, A TRAVÉS DEL CRECIMIENTO DEL COLEGIO UNIVERSITARIO HOTEL ESCUELA DE LOS ANDES VENEZOLANOS Y EL ESTABLECIMIENTO DE LAS REDE DE ESCUELAS DE OFICIOS EN TURISMO.	1093	1	5	16	86
3.3.1.2. FOMENTAR LA TRANSFERENCIA TECNOLÓGICA EN CADA FASE DE DOTACIÓN DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA A TRAVÉS DE LA ACTIVACIÓN DE NUEVAS INDUSTRIAS Y ENTES GENERADORES DE BIENES Y SERVICIOS.	1094	1	5	17	88
3.3.2.3. DESARROLLAR UN SISTEMA DE ENTRENAMIENTO Y PREPARACIÓN COMBATIVA MÁS EFICIENTE Y DE ACUERDO A NUESTRA REALIDAD.	1095	1	5	17	89
3.3.3.1. PREPARAR Y ADIESTRAR A LOS INTEGRANTES DE NUESTRA FUERZA ARMADA NACIONAL BOLIVARIANA BAJO LA PREMISA FUNDAMENTAL DE LOS IDEALES BOLIVARIANOS DE INTEGRACIÓN, SOBERANÍA, INDEPENDENCIA, PARTIENDO DEL CONCEPTO DE GUERRA POPULAR PROLONGADA, ASIMÉTRICA Y DE RESISTENCIA.	1096	1	5	17	90
3.1.16.5. CONFORMAR EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, FOMENTANDO LA TRANSFORMACIÓN DE MINERALES NO METÁLICOS, DE USO PRINCIPAL PARA LA CONSTRUCCIÓN DE OBRAS CIVILES, TALES COMO ARCILLAS BLANDAS, ARENAS, GRAVAS, GRANZÓN, GRANITO, GRANODIORITA, ESQUISTOS, MÁRMOL,GNEIS, CAL, YESO Y SAL.	1097	1	5	15	80
3.2.1.1. EXPANDIR Y FORTALECER LAS CAPACIDADES DE EXTRACCIÓN Y PROCESAMIENTO PRIMARIO Y DESARROLLO AGUAS ABAJO DE LAS CADENAS DE HIERRO-ACERO Y ALUMINIO. DESCONCENTRAR LA LOCALIZACIÓN DE ACERÍAS Y CONSTRUIRLAS EN DISTINTAS REGIONES DEL PAÍS, PARA OPTIMIZAR LAS DISTANCIAS DE DISTRIBUCIÓN Y SENTIDO GEOESTRATÉGICO, ATENDIENDO PARÁMETROS DE EFICIENCIA ENERGÉTICA Y SUSTENTABILIDAD AMBIENTAL, ASÍ COMO EL DESARROLLO AGUAS ABAJO DE NUEVOS PRODUCTOS. ALCANZAR LA META DE EXTRACCIÓN DE 30 MM TN DE MINERAL DE HIERRO Y 9 MM TN DE ACERO LÍQUIDO EN 2019, LO QUE IMPLICA LA INSTALACIÓN DE UNA CAPACIDAD DE 4 MM TN EN ACERÍAS NUEVAS Y EN LAS QUE ESTÁN CONSTRUCCIÓN, ASÍ COMO LAS CONSECUENTES DE REDUCCIÓN DIRECTA. EN EL CASO DEL ALUMINIO, RECUPERAR CAPACIDAD DE EXTRACCIÓN Y TRANSPORTE DE BAUXITA, ASÍ COMO ALCANZAR LOS VALORES NECESARIOS DE LA PRODUCCIÓN DE ALÚMINA, AJUSTANDO LA ESTRUCTURA DE COSTOS PARA HACERLA EFICIENTE. A TALES EFECTOS, GENERAR LA ESTRUCTURA DE SOPORTE DE LA PRODUCCIÓN ASOCIADA A LOS INSUMOS: PLANTAS DE COQUE CALCINADO, CAL, REFRACTARIOS, FLUORURO DE ALUMINIO, ENTRE OTROS; ASÍ COMO LA  INDUSTRIA DE TRANSFORMACIÓN DE ALTO VALOR AGREGADO.	1098	1	5	16	81
3.2.1.2. DESARROLLAR LA PRODUCCIÓN PRIMARIA Y CONSTRUIR LOS EJES ESTRATÉGICOS EN LA QUÍMICA PETROQUÍMICA, ASÍ COMO LAS CADENAS ASOCIADAS DE PRODUCTOS DERIVADOS; COMO BASE DE LA INDUSTRIALIZACIÓN EN LA GENERACIÓN DE BIENES DE CONSUMO INTERMEDIOS Y FINALES; AL TIEMPO QUE LA INDUSTRIA DE MAQUINARIAS ASOCIADAS PARA TALES FINES.	1099	1	5	16	81
3.2.1.6. CONSTRUIR UN AMPLIO TEJIDO INDUSTRIAL, ASOCIADO A UNA ARQUITECTURA DE REDES DE SINERGIAS PRODUCTIVAS, ZONAS ESPECIALES DE DESARROLLO Y PARQUES Y NODOS INDUSTRIALES, ORIENTADO A BIENES ESENCIALES DE CONSUMO FINAL Y/O GENERACIÓN DE VALOR. 	1100	1	5	16	81
3.2.2.1. CONFIGURAR UN ESQUEMA DE ESPECIALIZACIÓN ESPACIAL PRODUCTIVA, A PARTIR DE LAS VENTAJAS DE LOCALIZACIÓN BASADAS EN EL USO RACIONAL Y EFICIENTE DE LOS RECURSOS DISPONIBLES CON CRITERIOS DE INDEPENDENCIA,SOBERANÍA Y EQUILIBRIO INTERREGIONAL, CONSTITUYENDO EL EJE FUNCIONAL DE LAS ESCALAS DE PLANIFICACIÓN ESPACIAL DEL PAÍS Y EL SISTEMA DE CIUDADES.	1101	1	5	16	82
3.2.4.2. DESARROLLAR ECONOMÍAS DE ESCALA Y COMPLEMENTARIEDAD EN EL TEJIDO PRODUCTIVO\nSOCIAL A OBJETO DE CONSTRUIR UN NUEVO METABOLISMO ECONÓMICO, CONTRARIO A LA LÓGICA DEL CAPITAL, IMPLEMENTANDO UN SISTEMA DE APORTES DE LOS EXCEDENTES DE LAS EMPRESAS DE PROPIEDAD SOCIAL DIRECTA E INDIRECTA, EN EL MARCO DE LA PLANIFICACIÓN NACIONAL.	1103	1	5	16	84
4.1.9.3. FOMENTAR LAS REDES DE CADENAS INFORMATIVAS ALTERNATIVAS Y COMUNITARIAS EN LA REGIÓN, ASÍ COMO LAS REDES SOCIALES.	1104	1	6	19	104
5.1.2.2. PRIORIZAR LOS INTERESES COMUNES SOBRE LOS INDIVIDUALES, DESDE UNA PERSPECTIVA CENTRADA EN EL EQUILIBRIO CON LA NATURALEZA Y EL RESPETO DE LAS  GENERACIONES PRESENTES Y FUTURAS.\n	1184	1	7	23	116
3.2.5.7. DESARROLLAR EL SECTOR AUTOMOTRIZ, FORTALECIENDO LOS SIGUIENTES PROYECTOS EN OPERACIÓN: A) FÁBRICA DE ASIENTOS AUTOMOTRICES; B) FÁBRICA DE ESTAMPADOS, TROQUELADOS Y SOLDADURAS DE ELECTROPUNTOS PARA PIEZAS AUTOMOTRICES; C) PLANTA DE TRANSFORMACIÓN DE VIDRIO AUTOMOTRIZ; D) ENSAMBLADORAS DE VEHÍCULOS; E) ENSAMBLADORAS DE TRACTORES ASÍ COMO EMPRESAS MIXTAS CON EL SECTOR PRODUCTIVO NACIONAL; F) ENSAMBLADORAS DE CAMIONES Y LAS ALIANZAS ESTRATÉGICAS CON EL SECTOR PRIVADO  NACIONAL; G) PRODUCCIÓN DE MOTOS Y H) ENSAMBLADORA DE BICICLETAS Y FORTALECIMIENTO DEL SECTOR DE ENSAMBLAJE; I) PRODUCCIÓN DE PARTES Y PIEZAS.	1105	1	5	16	85
3.2.5.15. DESARROLLAR NUEVOS PROYECTOS Y ALIANZAS PARA LA PRODUCCIÓN DE FÁRMACOS E INSUMOS PARA EL SECTOR SALUD CON EL FIN DE CUBRIR LA DEMANDA NACIONAL Y DE LOS PAÍSES DEL ALBA Y ATENDER POTENCIALIDADES DE PETROCARIBE Y MERCOSUR. DESARROLLAR LA PRODUCCIÓN DE PRODUCTOS DE LÁTEX COMO GUANTES Y PRESERVATIVOS. DESARROLLO DE FÁRMACOS E  INSUMOS PARA LA SANIDAD ANIMAL Y VEGETAL.	1106	1	5	16	85
4.1.6.4. FORMAR Y DESTACAR A LOS CUADROS QUE IMPULSARÁN LOS ACUERDOS BILATERALES DE COOPERACIÓN Y LOS ESPACIOS ESTRATÉGICOS DE INTEGRACIÓN Y UNIÓN REGIONAL.	1107	1	6	19	101
3.2.5.18. CONSOLIDAR LA CONSTRUCCIÓN Y PUESTA EN MARCHA DE LOS SIGUIENTES PROYECTOS EN LA CADENA PRODUCTIVA FORESTAL-PAPEL: A) EMPRESA DE PRODUCCIÓN DE PAPEL PRENSA PARA ALCANZAR LAS 250 MIL TN/AÑO; B) MODERNIZACIÓN Y AMPLIACIÓN DE CAPACIDADES PÚBLICAS, CON PROYECTOS TALES COMO SACOS PARA CEMENTO Y PAPEL HIGIÉNICO PARA ALCANZAR LA SATISFACCIÓN PLENA DE LAS NECESIDADES NACIONALES; Y C) ALIANZAS ESTRATÉGICAS PARA PRODUCCIÓN DE IMPLEMENTOS ESCOLARES; D) CULMINACIÓN DEL SISTEMA DE ASERRADEROS Y PLANTA DE TABLEROS; E) CARRETES Y PALETAS DE MADERA; Y F) MUEBLES Y COMPONENTES  DE CONSTRUCCIÓN.	1108	1	5	16	85
3.2.6.2. FORTALECER LA PROMOCIÓN TURÍSTICA NACIONAL,A TRAVÉS DE POLÍTICAS Y PROGRAMAS DE TURISMO SOCIAL Y COMUNITARIO, PARTICULARMENTE LA PROMOCIÓN DE LOS DESTINOS TURÍSTICOS DEPRIMIDOS Y LOS EMPRENDIMIENTOS AGRO Y ECO TURÍSTICOS.	1109	1	5	16	86
3.2.7.5. DESARROLLAR LA INFRAESTRUCTURA Y SERVICIOS DE APOYO A LA ACTIVIDAD TURÍSTICA, MEDIANTE EL FORTALECIMIENTO DE VIALIDAD, PUERTOS Y AEROPUERTOS.	1110	1	5	16	87
3.3.1.3. INCREMENTAR EL DESARROLLO DE LAS TECNOLOGÍAS PROPIAS DE NUESTRA INDUSTRIA MILITAR, PARA ASEGURAR AUTONOMÍA Y SOBERANÍA EN EL ESPACIO AÉREO, NAVAL Y TERRESTRE.\n	1111	1	5	17	88
3.3.2.1. MEJORAR Y ADAPTAR LOS DISEÑOS CURRICULARES EN CORRESPONDENCIA CON LA ÉTICA BOLIVARIANA, EL CONCEPTO DE GUERRA POPULAR PROLONGADA Y ASIMÉTRICA Y LAS NUEVAS CONCEPCIONES Y NECESIDADES DEL SECTOR MILITAR.	1112	1	5	17	89
3.3.3.2. INTEGRAR ACTIVAMENTE LOS PLANES Y DISEÑOS CURRICULARES DE LAS ACADEMIAS MILITARES Y UNIVERSIDADES,PARA PONERLAS AL SERVICIO DEL DESARROLLO NACIONAL Y LA DEFENSA INTEGRAL DE LA PATRIA.	1113	1	5	17	90
3.4.1.4. CONSOLIDAR EL PLAN NACIONAL DE AGUAS PARA MEJORAR, REFORZAR Y ESTABLECER EL SUMINISTRO DE AGUA EN TODO EL PAÍS Y ESPECIALMENTE EN COMUNIDADES POPULARES, CON LA PARTICIPACIÓN PROTAGÓNICA DE LOS COMITÉS DE AGUA Y OTRAS ORGANIZACIONES DEL PODER POPULAR. 	1114	1	5	18	91
3.4.1.6. PROMOVER Y ACELERAR EL DESARROLLO INTEGRAL SUSTENTABLE DE LA FAJA PETROLÍFERA DEL ORINOCO, DE ACUERDO A LA POTENCIALIDAD PRODUCTIVA Y EL VIVIR BIEN DE SUS HABITANTES.	1115	1	5	18	91
3.2.5.20. CONTINUAR EL IMPULSO A LA FABRICACIÓN NACIONAL DE ELECTRODOMÉSTICOS, CONSOLIDANDO PROYECTOS EXISTENTES Y AMPLIANDO E INCENTIVANDO NUEVOS PROYECTOS Y LA PRODUCTIVIDAD DEL SECTOR. INCENTIVAR LA PARTICIPACIÓN ESTATAL Y ALIANZA CON PRIVADOS NACIONALES E INTERNACIONALES. DESARROLLAR ÉNFASIS ESPECIAL EN LA PRODUCCIÓN DE LOS COMPONENTES E INSUMOS. INSTALACIÓN DE CAPACIDADES EN VENEZUELA PARA LA EXPORTACIÓN A LOS PAÍSES DEL ALBA, MERCOSUR Y PETROCARIBE. DESARROLLAR EL CENTRO DE INGENIERÍA APLICADA Y DE MATERIALES.	1127	1	5	16	85
3.2.5.22. AMPLIAR LAS CAPACIDADES DE PRODUCCIÓN DE INSUMOS QUÍMICOS PARA LA INDUSTRIA A EFECTOS DE DISMINUIR LA DEPENDENCIA DEL COMPONENTE IMPORTADO,APROVECHANDO LAS POTENCIALIDADES NACIONALES Y GENERACIÓN DE CADENA DE VALOR.	1128	1	5	16	85
3.4.1.12. DESARROLLAR UNA TAXONOMÍA TERRITORIAL QUE ARTICULE LAS COMUNAS PRODUCTIVAS CON LOS DISTRITOS MOTORES INDUSTRIALES, DONDE LAS ZONAS ECONÓMICAS ESPECIALES SERÁN UNA VARIANTE ESPECÍFICA DE ESTA PARA POTENCIAR Y DIRECCIONAR TENSORES DEL DESARROLLO. LA ECONOMÍA DE ESCALA SUPONDRÁ UNA ESTRUCTURA DE RED PRODUCTIVA QUE SINCRONICE LAS DEMANDAS INDUSTRIALES CON LAS POTENCIALIDADES Y DESARROLLO DE ACTIVIDADES EN LAS COMUNAS PRODUCTIVAS. AL MISMO TIEMPO DESARROLLAR SOBRE ESTA ESTRUCTURA DE SOSTÉN UN TRAMADO DE PARQUES INDUSTRIALES PARA EL DESARROLLO NACIONAL Y COMO PIVOTES INTERCONECTADOS PARA LA INTEGRACIÓN PRODUCTIVA BOLIVARIANA DE NUESTRA AMÉRICA, DEFINIENDO LOS ESLABONES DE CADENAS PRODUCTIVAS COMPARTIDAS Y ESTRATÉGICAS PARA LAS NECESIDADES SOCIALES DE NUESTRO PUEBLO; EN ESPECIAL EN EL ÁREA DE SALUD, ALIMENTACIÓN, EDUCACIÓN, VESTIDO, ENERGÍA Y VIVIENDA.	1116	1	5	18	91
3.4.3.6 CONFORMAR EL DISTRITO MOTOR CAICARA-CABRUTA, ESTADOS BOLÍVAR Y GUÁRICO. PROYECTOS DINAMIZADORES: TERCER PUENTE SOBRE EL RÍO ORINOCO Y UPS ALGODONES DEL ORINOCO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	1117	1	5	18	93
3.2.1.7. AMPLIAR LA CAPACIDAD INSTALADA, MODERNIZAR Y FOMENTAR LA APROPIACIÓN TECNOLÓGICA EN LA PRODUCCIÓN DE ENVASES Y EMPAQUES, TANTO PARA LA SOBERANÍA ALIMENTARIA COMO PARA LA INDUSTRIA EN GENERAL. DESARROLLO SOBERANO DE LA INDUSTRIA DE PLASTICUBIERTA, DIFERENTES RESINAS Y CARTONES PARA ABASTECER LAS DEMANDAS NACIONALES DEL SECTOR DE ALIMENTOS. DESARROLLO DE APLICACIONES VINCULADAS A INSUMOS AGRÍCOLAS E INDUSTRIALES A PARTIR DE LOS SECTORES DE PETROQUÍMICA Y PAPEL, A EFECTOS DE ABASTECER INTEGRALMENTE LAS DEMANDAS NACIONALES Y EXPORTAR EN: SACOS DE CEMENTO, FERTILIZANTES Y MATERIALES DE CONSTRUCCIÓN. DESARROLLO DE TECNOLOGÍAS Y APLICACIONES EN VIDRIO, PLÁSTICO, CARTÓN Y ALUMINIO PARA LA INDUSTRIA FARMACÉUTICA, ASÍ COMO DE HIGIENE Y CUIDADO PERSONAL, TANTO EN CONSUMO NACIONAL COMO EXPORTACIÓN AL ALBA, CARIBE Y MERCOSUR, ESPECIALMENTE.	1118	1	5	16	81
3.2.1.8. PRIVILEGIAR LA ADQUISICIÓN DE PRODUCTOS INDUSTRIALES NACIONALES, ASÍ COMO ESTIMULAR SU PRODUCCIÓN PARA LA EJECUCIÓN DE LOS PROYECTOS NACIONALES.	1119	1	5	16	81
3.2.1.11. IMPULSAR MECANISMOS Y PRÁCTICAS DE VIGILANCIA TECNOLÓGICA PARA LA PROTECCIÓN DE MARCAS Y PATENTES VENEZOLANAS EN EL EXTRANJERO, INCLUYENDO EL MONITOREO Y LAS ACCIONES DEFENSIVAS NECESARIAS PARA LA SALVAGUARDA DE ESTE PATRIMONIO INTANGIBLE DE LOS VENEZOLANOS Y LAS VENEZOLANAS.	1120	1	5	16	81
3.2.4.1. DISEÑAR E IMPLANTAR UNA ARQUITECTURA FINANCIERA EFICIENTE Y SOBERANA, ORIENTADA A APALANCAR EL PROCESO DE INDUSTRIALIZACIÓN NACIONAL EN LA PLANIFICACIÓN, EVALUACIÓN DE VIABILIDAD, FONDOS DE PREINVERSIÓN, EJECUCIÓN Y ACOMPAÑAMIENTO DEL NUEVO APARATO PRODUCTIVO:A) ARTICULANDO Y FORTALECIENDO LOS FONDOS DE DESARROLLO INDUSTRIAL SOBERANO PARA EL NUEVO TEJIDO INDUSTRIAL; B) IMPULSANDO EL FINANCIAMIENTO PROPIO Y CON MECANISMOS INTERNACIONALES SOBERANOS A LOS PROYECTOS INDUSTRIALES ESTRUCTURANTES; C) FORTALECIENDO LOS BANCOS E INSTRUMENTOS FINANCIEROS DE SEGUNDO PISO PARA LA INVERSIÓN Y EXPANSIÓN DEL SISTEMA PRODUCTIVO; D) GENERANDO UNA POLÍTICA PARA LOS RECURSOS DE LA BANCA A EFECTOS DE DEMOCRATIZAR EL ACCESO A LOS RECURSOS PARA LOS DISTINTOS ACTORES ECONÓMICOS, EN ESPECIAL LAS PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS COMUNALES, MIXTAS, PRIVADAS Y ESTATALES; Y E) FOMENTANDO LOS MECANISMOS INSTITUCIONALES PARA EL SEGUIMIENTO EN LA DISTRIBUCIÓN JUSTA Y ACCESO DE LOS RECURSOS DE LA CARTERA DE CRÉDITO A LA MANUFACTURA.	1121	1	5	16	84
3.2.5.19. DESARROLLAR LOS SIGUIENTES PROYECTOS EN EL SECTOR TEXTIL-CALZADO: A) TENERÍAS PARA PROCESAMIENTO DE PIELES; B) DESARROLLO CONGLOMERADO TEXTIL Y DEL CALZADO, PARA TODA LA CADENA PRODUCTIVA; C) INCREMENTAR LA PRODUCCIÓN PRIMARIA DE ALGODÓN Y SU PROCESAMIENTO; D) FORTALECER LA PRODUCCIÓN DE HILADOS, TEJIDOS DE ALGODÓN, ASÍ COMO LA CONFECCIÓN DE PRENDAS Y CALZADOS E) PRODUCCIÓN DE SUELAS; F) DESARROLLAR TEJIDOS CON MEZCLA SINTÉTICA; G) DESARROLLAR LOS COMPONENTES ASOCIADOS A LOS INSUMOS INDUSTRIALES DEL SECTOR.	1155	1	5	16	85
3.2.5.4. AFIANZAR LOS SIGUIENTES PROYECTOS EN OPERACIÓN EN EL SECTOR ALUMINIO: CAPACIDADES DE PRODUCCIÓN PRIMARIA: A) FÁBRICA DE ALUMINIO PRIMARIO ALCASA; B) FÁBRICA DE ALUMINIO PRIMARIO VENALUM; C) CERTIFICACIÓN Y PRODUCCIÓN DE BAUXITA BAUXILUM; CAPACIDADES DE TRANSFORMACIÓN; D) TRANSFORMADORAS DE ALUMINIO ASOCIADAS A CAPACIDADES DE EXTRUSIÓN, LAMINACIÓN E INYECCIÓN; E) FÁBRICA DE RINES A AFECTOS DE OTORGAR VALOR AGREGADO A LA MATERIA PRIMA; F) FÁBRICA DE PAPEL DE ALUMINIO Y ENVASES; G) FÁBRICA DE CABLES DESNUDOS Y RECUBIERTOS DE ALUMINIO; H) CENTROS DE INSUMOS DE MATERIA PRIMA PARA EL SECTOR PRIVADO Y PÚBLICO NACIONAL; I) POLÍTICA NACIONAL DE FOMENTO Y FORTALECIMIENTO DEL SECTOR TRANSFORMADOR NACIONAL; J) DESARROLLO INDUSTRIAL DE LOS INSUMOS DEL SECTOR Y APROVECHAMIENTO DE SUBPRODUCTOS; Y K) DESARROLLO DE NUEVAS ALEACIONES DE ALUMINIO E INGENIERÍA DE MATERIALES PARA LAS DISTINTAS APLICACIONES INDUSTRIALES Y VARIANTES DE ALTA TECNOLOGÍA.	1122	1	5	16	85
3.2.5.6. DESARROLLAR LOS SIGUIENTES PROYECTOS EN EL SECTOR ALUMINIO: A) ADECUACIÓN TECNOLÓGICA DE ALCASA Y DE VENALUM PARA INCREMENTO DE PRODUCCIÓN DE ALUMINIO PRIMARIO; B) EN CABELUM, AMPLIACIÓN DE CAPACIDAD PARA PRODUCCIÓN DE ALAMBRÓN Y CONDUCTORES ELÉCTRICOS; PLANTA DE CONDUCTORES ELÉCTRICOS AISLADOS DE COBRE Y ALUMINIO; FÁBRICA DE CONDUCTORES ELÉCTRICOS; CERTIFICACIÓN PARA EXPORTACIÓN AL MERCOSUR C) ADECUACIÓN TECNOLÓGICA Y AMPLIACIÓN DE RIALCA; D) EN BAUXILUM: ADECUACIÓN DE LA PLANTA DE PRODUCCIÓN DE ALÚMINA METALÚRGICA Y LA MINA DE BAUXITA, Y ADQUISICIÓN DE MAQUINARIA PESADA PARA EXTRACCIÓN Y ACARREO DE BAUXITA Y TRANSPORTE DE MATERIAL; E) INCREMENTO DE CAPACIDAD DE PRODUCCIÓN DE CONDUCTORES ELÉCTRICOS DE ALUMINIO DESNUDO; Y F) DESARROLLO TECNOLÓGICO PARA LA INCORPORACIÓN DE FIBRA ÓPTICA EN EL NÚCLEO DE LOS CABLES COMO OFERTA DE LOS PRODUCTOS A GENERAR.	1123	1	5	16	85
3.2.5.9. AFIANZAR EL DESARROLLO DEL SECTOR AUTOMOTRIZ,LOGRANDO NIVELES CRECIENTES DE SOBERANÍA CON: A) LA INCORPORACIÓN DE PARTES Y PIEZAS NACIONALES Y LA APROPIACIÓN DEL CONOCIMIENTO CIENTÍFICO-TECNOLÓGICO; B) EL FORTALECIMIENTO TECNOLÓGICO Y PRODUCTIVO DEL SECTOR AUTOPARTISTA NACIONAL; C) EL DESARROLLO DEL CENTRO DE INGENIERÍA AUTOMOTRIZ: DESARROLLO DE LA PRODUCCIÓN DE PARTES Y PIEZAS DE MANERA DE INCORPORAR MÁS DEL 50% DEL VALOR PARA EL 2015 Y MÁS DEL 60% PARA EL 2019.	1124	1	5	16	85
3.2.5.11. AFIANZAR LOS SIGUIENTES PROYECTOS: A) FÁBRICAS DE ESTRUCTURAS LIGERAS DE ACERO GALVANIZADO PARA USO EN CONSTRUCCIÓN; B) EMPRESA DE INSUMOS BÁSICOS PARA LA CONSTRUCCIÓN DE VIVIENDAS; C) FÁBRICA DE PRODUCCIÓN DE VIDRIO PLANO; F) COMPLEJO INDUSTRIAL DE CERÁMICAS. G) FÁBRICA DE PANELES PREFABRICADOS PARA LA CONSTRUCCIÓN; F) SISTEMA DE ASERRADEROS ASOCIADOS A MADERAS DEL ORINOCO, G) FORMA ORGANIZATIVA DEL CONGLOMERADO DE MADERA A EFECTOS DE CUBRIR LAS DEMANDAS DE LA GRAN MISIÓN VIVIENDA EN TANTO PUERTAS Y MUEBLES; H) DESARROLLO DE LA PLANTA DE PANELES DE MADERA.	1125	1	5	16	85
3.2.5.13. AMPLIAR Y CONSOLIDAR EL SECTOR DE PAÑALES Y TOALLAS SANITARIAS Y TOALLINES, CON LA PARTICIPACIÓN DE EMPRESAS DEL ESTADO, PRIVADAS Y MIXTAS; A EFECTOS DE SATISFACER PARA EL 2019 TODO EL REQUERIMIENTO NACIONAL. 	1126	1	5	16	85
3.2.6.1. POTENCIAR A VENEZUELA COMO MULTIDESTINO,GARANTIZANDO EL AUMENTO DEL TURISMO RECEPTIVO, INCREMENTANDO ASÍ EL INGRESO DE DIVISAS AL PAÍS Y FORTALECIENDO LOS DESTINOS NO TRADICIONALES.\n	1129	1	5	16	86
3.2.3.2. IMPULSAR UN DESARROLLO TECNOLÓGICO SOBERANO A PARTIR DE LAS NECESIDADES DE NUESTRA INDUSTRIA, PARA HACER VIABLE EL APROVECHAMIENTO EFICIENTE Y SUSTENTABLE DE LOS RECURSOS Y ESTRUCTURAS DE COSTO APROPIADAS.	1130	1	5	16	83
3.2.3.3. GARANTIZAR PROCESOS FORMATIVOS INTEGRALES Y CONTINUOS DE LOS TRABAJADORES PARA ADOPTAR TÉCNICAS Y TECNOLOGÍAS QUE HAGAN MÁS EFICIENTE LA PRODUCCIÓN Y HUMANIZAR EL PROCESO DE TRABAJO: A) ESTANDARIZANDO EL PROGRAMA DE LA ESCUELA EN LA FÁBRICA COMO POLÍTICA DE FORMACIÓN Y TRABAJO LIBERADOR; B) PROPICIANDO LA POLÍTICA DEL PUNTO Y CÍRCULO COMO MÉTODO DE TRABAJO, PARA EL FORTALECIMIENTO DE LA BASE PRODUCTIVA DEL ENTORNO, ARTICULACIÓN SOCIAL Y LOS ENCADENAMIENTOS PRODUCTIVOS; C) ABRIENDO LA ESCUELA EN LA FÁBRICA A LAS COMUNIDADES ALEDAÑAS CON PARTICIPACIÓN DE LOS TRABAJADORES COMO FACILITADORES Y MULTIPLICADORES DEL PROCESO; D) DESARROLLANDO PROYECTOS ASOCIADOS A SUBPRODUCTOS Y DESECHOS PARA GENERAR ACTIVIDAD ECONÓMICA A PARTIR DEL RECICLAJE; Y E) AMPLIAR LAS PLATAFORMAS DE FORMACIÓN TÉCNICA Y PROFESIONAL PARA EL TRABAJO.\n	1131	1	5	16	83
3.2.4.3. MANTENER E INCREMENTAR LOS SISTEMAS DE COMPRAS PÚBLICAS CON EL OBJETIVO DE IMPULSAR EL DESARROLLO DEL APARATO PRODUCTIVO NACIONAL MEDIANTE EL FLUJO CIRCULAR DEL CAPITAL HACIA CONGLOMERADOS, PEQUEÑAS Y MEDIANAS EMPRESAS, EMPRESAS COMUNALES, EN TANTO QUE MOTORES DE LA UBICACIÓN DIRECTA DE LOS BIENES Y SERVICIOS PRODUCIDOS, FAVORECIENDO ASÍ LA ECONOMÍA A NIVEL REGIONAL.	1132	1	5	16	84
3.2.5.14. INCREMENTAR LAS CAPACIDADES PRODUCTIVAS DE LOS PRODUCTOS DE HIGIENE PERSONAL Y DEL HOGAR HACIENDO ÉNFASIS EN JABONES, CHAMPÚ, DESODORANTE, MÁQUINAS DE AFEITAR, PAPEL SANITARIO, PASTA DE DIENTE, A EFECTOS DE SATISFACER CON PRODUCCIÓN NACIONAL LA DEMANDA INTERNA.	1133	1	5	16	85
4.3.1.7. IMPULSAR EL LIDERAZGO EN EL SENO DEL MOVIMIENTO DE PAÍSES NO ALINEADOS (MNOAL), A PROPÓSITO DE LA CELEBRACIÓN DE LA XVII CUMBRE DE JEFES DE ESTADO Y DE GOBIERNO EN VENEZUELA.\n	1134	1	6	21	108
3.2.5.12. CONSOLIDAR EL SECTOR PLÁSTICO, EMPAQUES Y ENVASES, LO QUE PERMITIRÁ SATISFACER LAS NECESIDADES DEL PAÍS, HACIENDO ÉNFASIS EN LOS ENVASES DE VIDRIO, PLÁSTICO,ALUMINIO, PLASTICUBIERTA, CARTÓN Y BOLSAS. ESTO A SU VEZ PERMITIRÁ LA GENERACIÓN DE NUEVAS VERTIENTES DE MAYOR VALOR AGREGADO DE USO EN TELEFONÍA, INFORMÁTICA, VEHÍCULOS Y ELECTRODOMÉSTICOS CÓNSONOS CON LA PRESERVACIÓN DEL AMBIENTE. DESARROLLAR EL SECTOR DEL CARTÓN.	1152	1	5	16	85
4.2.2.2. ADELANTAR INICIATIVAS REGIONALES Y SUBREGIONALES, COMO CARTAS SOCIALES Y CULTURALES, DECLARACIONES,PACTOS Y DOCUMENTOS GUBERNAMENTALES, QUE SURGEN DE LA PARTICIPACIÓN POPULAR SON ASUMIDOS EN LA NUEVA INSTITUCIONALIDAD NUESTRO AMERICANA.	1153	1	6	20	107
3.2.5.17. CONSOLIDAR Y AMPLIAR DESARROLLO DE PROYECTOS EN EL SECTOR DE MAQUINARIA Y EQUIPOS, TALES COMO: A) FÁBRICAS DE MAQUINARIA PESADA PARA LA CONSTRUCCIÓN; B) FÁBRICAS DE EQUIPOS PARA PROCESAMIENTO DE ALIMENTOS; C) FÁBRICAS DE EQUIPOS DE REFRIGERACIÓN INDUSTRIAL.	1154	1	5	16	85
4.1.6.3. PROFUNDIZAR LA ESTRATEGIA DE DIÁLOGO POLÍTICO AL MÁS ALTO NIVEL Y DE ENCADENAMIENTOS PRODUCTIVOS CON LA HERMANA REPÚBLICA DE COLOMBIA, DANDO CUMPLIMIENTO AL MANDATO DE UNIÓN DE EL LIBERTADOR SIMÓN BOLÍVAR.	1237	1	6	19	101
3.2.5.1. AFIANZAR LA CADENA PRODUCTIVA HIERRO-ACERO A EFECTOS DE ESTABILIZAR LAS PRODUCCIÓN, CON BASE EN LAS CAPACIDADES INSTALADAS Y CREAR NUEVAS CAPACIDADES, DE ACUERDO CON LA META DE EXTRACCIÓN DE MINERAL DE HIERRO DE 30 MM TN PARA EL 2019, CERTIFICACIÓN DE RESERVAS Y LA GENERACIÓN DE VALOR AGREGADO NACIONAL: A) FÁBRICA DE CABILLAS Y BOBINAS DE ACERO DE SIDOR, ASÍ COMO COMPONENTES DE ALTO VALOR AGREGADO, NECESIDAD NACIONAL Y POTENCIAL EXPORTADOR; B) FORTALECIMIENTO DEL COMPLEJO SIDERÚRGICO NACIONAL EN SU CAPACIDAD DE ACERÍA Y LAMINACIÓN ASÍ COMO RAMIFICACIÓN REGIONAL; C) PRODUCCIÓN Y REPARACIÓN DE VÁLVULAS PETROLERAS Y SINERGIAS ENTRE LAS PLANTAS EXISTENTES ASÍ COMO EN TUBOS SIN COSTURA; D) FÁBRICA DE PIEZAS FORJADAS PARA LA INDUSTRIA PETROLERA Y DEL ALUMINIO; E) EJECUCIÓN ORGANIZATIVA DE LA CORPORACIÓN DEL HIERRO ACERO Y ECONOMÍA DE ESCALA EN LA PROCURA Y COMERCIALIZACIÓN SOBERANA; F) CENTRO DE INSUMOS DE MATERIAS PRIMAS PARA EL SECTOR TRANSFORMADOR NACIONAL TANTO PÚBLICO COMO PRIVADO; G)INSTALACIÓN DE LÍNEA DE DECAPADO Y GALVANIZADO PARA ATENDER LA DEMANDA NACIONAL Y FOMENTO DE BASE EXPORTADORA; H) INSTALACIÓN DE CAPACIDADES NACIONALES PARA EL APROVECHAMIENTO DEL LAMINADO EN CALIENTE EXISTENTE Y PROYECTADO; I) PRODUCCIÓN NACIONAL DE PERFILES; J) DESARROLLO DE PRODUCCIÓN NACIONAL DE ACERO INOXIDABLE PARA EL MERCADO NACIONAL Y LA NUEVA BASE EXPORTADORA; Y K) DESARROLLO INDUSTRIAL DE LOS INSUMOS DEL SECTOR Y APROVECHAMIENTO DE SUBPRODUCTOS.	1135	1	5	16	85
4.2.1.1. ORIENTAR DESDE EL MÁS ALTO NIVEL DE LAS ORGANIZACIONES NACIONALES Y REGIONALES, LA GENERACIÓN Y DIVULGACIÓN DE CONTENIDOS EDUCATIVOS SOBRE LA IDENTIDAD NACIONAL Y LA DIVERSIDAD DE LOS PUEBLOS.	1136	1	6	20	106
4.3.1.2. IMPULSAR EL ACERCAMIENTO Y LA COORDINACIÓN ENTRE LOS NUEVOS MECANISMOS DE UNIÓN LATINOAMERICANA Y CARIBEÑA (ALBA, UNASUR, CELAC) Y EL GRUPO DE PAÍSES BRICS, CON EL FIN DE DAR MAYOR CONTUNDENCIA A LA VOZ DE LOS PUEBLOS DEL SUR EN LA AGENDA GLOBAL.	1137	1	6	21	108
3.2.5.3. FORTALECER EL POTENCIAL DE EMPRESAS EXISTENTES DE LA CADENA HIERRO-ACERO: A) EN SIDOR: RECUPERACIÓN DE LÍNEA DE DECAPADO, MÁQUINA DE COLADA CONTINUA,LÍNEA DE VALLAS ELECTROSOLDADAS ASÍ COMO OTROS COMPONENTES DE GENERACIÓN DE VALOR; B) ALIANZA ESTRATÉGICA PARA LA PRODUCCIÓN DE ELECTRODOS; C) RED DE TRENES DE LAMINACIÓN DE  ESCALA REGIONAL PARA INCORPORAR LA PRODUCCIÓN DE 500 MIL TN DE CABILLAS A NIVEL NACIONAL; D) CONSTRUCCIÓN DE UN SISTEMA COMPLEMENTARIO SIDERÚRGICO DE HRD, EN PLANTAS DE 1 A 1,5 MM TN, PARA DAR VALOR AGREGADO A LAS NUEVAS CAPACIDADES DE EXTRACCIÓN DE MINERAL QUE SE DESARROLLARÁN; E) AMPLIACIÓN Y CONSTRUCCIÓN DE PLANTA DE CAL PARA LA PRODUCCIÓN SIDERÚRGICA; F) CENTROS NACIONALES DE ACOPIO DE CHATARRA FERROSA Y POLÍTICA DE PROTECCIÓN COMO INSUMO ESTRATÉGICO NACIONAL; Y G) RECUPERACIÓN DE CAPACIDAD DE PRODUCCIÓN DE PELLAS Y BRIQUETAS ASÍ COMO GENERACIÓN DE NUEVOS BALANCES DE MATERIALES.\n	1138	1	5	16	85
3.2.5.5. CULMINAR EN LOS PLAZOS ESTABLECIDOS LA CONSTRUCCIÓN DEL PROYECTO EMPRESA DE SERVICIOS DE LAMINACIÓN DEL ALUMINIO (SERLACA). 	1139	1	5	16	85
3.2.7.1. PROMOVER EL CRECIMIENTO DEL TURISMO INTERNO, A TRAVÉS DE POLÍTICAS Y PROGRAMAS DE TURISMO SOCIAL Y COMUNITARIO, INCREMENTANDO DE MANERA SOSTENIDA EL NÚMERO DE MOVIMIENTOS TURÍSTICOS INTERNOS ASÍ COMO LA INVERSIÓN EN DESARROLLO Y MEJORAMIENTO DE INFRAESTRUCTURA Y SERVICIOS TURÍSTICOS.	1140	1	5	16	87
3.2.7.3. FOMENTAR LA INVERSIÓN NACIONAL E INTERNACIONAL EN EL SECTOR TURÍSTICO, A  TRAVÉS DEL ESTÍMULO A LOS PRESTADORES DE SERVICIOS TURÍSTICOS ACTUALES Y POTENCIALES DE MANERA DE MEJORAR DE MANERA SOSTENIDA LA INFRAESTRUCTURA Y LOS SERVICIOS TURÍSTICOS.	1141	1	5	16	87
3.3.1.1. AFIANZAR LA COOPERACIÓN CON PAÍSES HERMANOS EN CORRESPONDENCIA CON LAS NECESIDADES INHERENTES A LA DEFENSA INTEGRAL DE LA PATRIA.	1142	1	5	17	88
3.3.2.4. COMUNICAR LA NUEVA CONCEPCIÓN DE DEFENSA INTEGRAL.	1143	1	5	17	89
5.1.6.2. AUMENTAR LA GENERACIÓN DE ENERGÍA SOLAR MEDIANTE LA INSTALACIÓN DE FÁBRICAS DE PANELES SOLARES,QUE ATIENDAN PRIORITARIAMENTE LA DEMANDA ENERGÉTICA DE LAS POBLACIONES AISLADAS.	1260	1	7	23	120
3.4.1.3. FORTALECER Y MEJORAR LOS SISTEMAS DE AGUA POTABLE A LO LARGO DEL TERRITORIO NACIONAL, MANTENIENDO E INCREMENTANDO LA CONTINUIDAD DEL SERVICIO DE AGUA POTABLE A 250 LITROS POR PERSONA, MEDIANTE LA CULMINACIÓN Y CONSTRUCCIÓN DE CIEN ACUEDUCTOS A NIVEL NACIONAL, PARA GARANTIZAR LA PRODUCCIÓN DE 4.000 MILLONES DE METROS CÚBICOS DE AGUA POTABLE, ENTRE OTROS: ACUEDUCTO TUY 4, LUISA CÁCERES DE ARISMENDI, AMPLIACIÓN DEL SISTEMA REGIONAL DEL CENTRO Y ACUEDUCTO BARCELONAGUANTA-LECHERÍA.	1144	1	5	18	91
3.4.1.7. MEJORAR LA FUNCIONALIDAD DE LA RED DE CENTROS URBANOS, ARTICULÁNDOLOS AL NUEVO MODELO PRODUCTIVO: A) IMPULSANDO UN SISTEMA DE CIUDADES POLICÉNTRICO;B) MEJORANDO, AMPLIANDO Y CONSOLIDANDO LOS SISTEMAS DE INTERCONEXIÓN ENTRE LOS CENTROS POBLADOS, EN VIALIDAD, TRANSPORTE POLIMODAL, PUERTOS, AEROPUERTOS TELECOMUNICACIONES; C) FOMENTANDO EL CRECIMIENTO TRANSFORMACIÓN SUSTENTABLE DE LOS PRINCIPALES CENTROS URBANOS, LAS CIUDADES INTERMEDIAS Y LOS CENTROS POBLADOS MENORES, CON ESPECIALIZACIÓN PRODUCTIVA Y NUEVOS DESARROLLOS HABITACIONALES.\n	1145	1	5	18	91
3.4.1.8. PROMOVER EL DESARROLLO SUSTENTABLE DEL ARCO MINERO, CON EL CONTROL SOBERANO Y HEGEMÓNICO DEL ESTADO EN LA CADENA PRODUCTIVA DEL SECTOR Y SUS ACTIVIDADES CONEXAS, PROMOVIENDO EL DESARROLLO DE TECNOLOGÍAS PROPIAS QUE PERMITAN UNA EXPLOTACIÓN RACIONAL, Y CON BASE EN LA DEFINICIÓN DE UNIDADES DE GESTIÓN TERRITORIAL PARA LA COORDINACIÓN DE POLÍTICAS PÚBLICAS, PRESERVANDO EL ACERVO HISTÓRICO Y SOCIOCULTURAL.	1146	1	5	18	91
3.4.1.9. IMPULSAR LA CONSOLIDACIÓN DE UN SISTEMA DE ÁREAS INDUSTRIALES, CONFIGURÁNDOLAS EN VERDADEROS POLOS DE DESARROLLO EN LAS REGIONES: A) CONSOLIDACIÓN DEL SISTEMA DE PARQUES INDUSTRIALES; B) DESARROLLO DE LOS POLOS PETROQUÍMICOS; C) DESARROLLO DE LAS BASES PETROINDUSTRIALES SOCIALISTAS, DE SOPORTE A LOS EMPRENDIMIENTOS PETROLEROS	1147	1	5	18	91
3.4.1.10. PRESERVAR LAS CUENCAS HIDROGRÁFICAS Y LOS CUERPOS DE AGUA.	1148	1	5	18	91
3.2.5.10. AFIANZAR Y DESARROLLAR LOS SIGUIENTES PROYECTOS DEL SECTOR DE MATERIALES DE CONSTRUCCIÓN: A) FÁBRICA DE GRIFERÍAS; B) FÁBRICA PRODUCTORA DE CAL; C) EN CEMENTO LAS EMPRESAS CEMENTOS DE VENEZUELA, INDUSTRIAS VENEZOLANAS DEL CEMENTO, FÁBRICA NACIONAL DE CEMENTO, CEMENTO “CERRO AZUL” Y CEMENTO ANDINO; PLANTA DE MORTEROS ASÍ COMO NUEVA PLANTA DE CEMENTO EN LOS ARANGUES; LA EXPANSIÓN PRODUCTIVA IMPLICA ADICIONALMENTE SEGUNDA LÍNEA EN SAN SEBASTIÁN DE LOS REYES Y CUMAREBO; Y LA MODIFICACIÓN DEL EQUIPAMIENTO EN CUMAREBO, PARA ALCANZAR LAS 16 MM TN EN EL 2017; D) DESARROLLO DE LA CADENA DE VALOR DEL CEMENTO EN EL CONCRETO Y COMPONENTES DE LA CONSTRUCCIÓN PREFABRICADOS A PARTIR DEL CEMENTO Y FÁBRICA DE MORTEROS SECOS; E) FORTALECIMIENTO Y EXPANSIÓN DE SANITARIOS Y CERÁMICOS Y DE LA CADENA DE INSUMOS ASOCIADOS, A OBJETO DE CUBRIR LOS REQUERIMIENTOS DE LA GRAN MISIÓN VIVIENDA Y CAPACIDADES DE EXPORTACIÓN; Y F) FÁBRICA DE PARTES E INSUMOS INDUSTRIALES.	1150	1	5	16	85
4.1.7.2. GENERAR UNA POLÍTICA PERMANENTE DE FINANCIAMIENTO SOLIDARIO PARA EL IMPULSO DE ENCADENAMIENTOS ECONÓMICOS PRODUCTIVOS DE NUESTRA AMÉRICA, A FIN DE DE ALCANZAR LA INDEPENDENCIA ECONÓMICA, PRODUCTIVA Y ALIMENTARIA REGIONAL.	1151	1	6	19	102
5.2.1.5. PROTEGER LAS CUENCAS HIDROGRÁFICAS DEL PAÍS Y TODOS LOS RECURSOS NATURALES PRESENTES EN ELLAS, PROMOVIENDO SU GESTIÓN INTEGRAL, HACIENDO ESPECIAL ÉNFASIS EN LAS SITUADAS AL SUR DEL ORINOCO.	1179	1	7	24	121
3.4.1.1. INCREMENTAR LA SINERGIA ENTRE REGIONES, MEDIANTE LOS EJES DE INTEGRACIÓN Y DESARROLLO NORTE LLANERO,APURE-ORINOCO, OCCIDENTAL Y ORIENTAL, A TRAVÉS DE: A) DESARROLLO DE CORREDORES DE INFRAESTRUCTURA DE TRANSPORTE MULTIMODAL, DE ENERGÍA Y DE TELECOMUNICACIONES EN LOS EJES DE INTEGRACIÓN Y DESARROLLO, CONSTITUYÉNDOSE EL EJE NORTE LLANERO EN ARTICULADOR ENTRE ÁREAS PRODUCTIVAS Y DE CONSUMO NACIONAL; B) IMPLANTACIÓN DE INDUSTRIAS DE TRANSFORMACIÓN Y DE PARQUES INDUSTRIALES TEMÁTICOS EN EL EJE NORTE LLANERO; C) CONFORMAR Y DESARROLLAR OCHO DISTRITOS MOTORES DE DESARROLLO PARA LA FAJA PETROLÍFERA DEL ORINOCO, LOS CUALES PERMITIRÁN PROMOVER, POTENCIAR Y ACELERAR EL DESARROLLO TERRITORIAL EN LA FAJA; D) IMPULSAR EL DESARROLLO INTEGRAL DE ÁREAS GEOGRÁFICAS, QUE POR SUS CARACTERÍSTICAS Y UBICACIÓN, SON CONSIDERADAS ESTRATÉGICAS PARA LOS INTERESES NACIONALES, PROCURANDO QUE EN LAS MISMAS TENGA LUGAR UNA EXPANSIÓN PRODUCTIVA Y UN CORRECTO APROVECHAMIENTO DE LOS RECURSOS NATURALES, A TRAVÉS DE LAS ZONAS ECONÓMICAS ESPECIALES.	1158	1	5	18	91
3.4.1.2. ORDENAR EL TERRITORIO Y ASEGURAR LA BASE DE SUSTENTACIÓN ECOLÓGICA, MEDIANTE LA FORMULACIÓN E IMPLEMENTACIÓN DE PLANES PARA LAS DISTINTAS ESCALAS TERRITORIALES, LA PRESERVACIÓN DE CUENCAS HIDROGRÁFICAS Y CUERPOS DE AGUA, LA CONSERVACIÓN Y PRESERVACIÓN DE AMBIENTES NATURALES, EL IMPULSO DE PROGRAMAS DE MANEJO INTEGRAL DE DESECHOS SÓLIDOS Y LA CULTURA DE LOS PUEBLOS.	1159	1	5	18	91
3.4.1.5. CONTINUAR INCREMENTANDO Y MEJORANDO LOS SISTEMAS DE RECOLECCIÓN Y TRATAMIENTO DE LAS AGUAS SERVIDAS EN TODO EL TERRITORIO NACIONAL, GARANTIZANDO EL VERTIDO ADECUADO A LOS DISTINTOS CUERPOS DE AGUA.	1160	1	5	18	91
3.4.3.2. FOMENTAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, EN ÁREAS QUE REQUIERAN ATENCIÓN PRIORITARIA,HACIENDO ÉNFASIS EN EL REORDENAMIENTO TERRITORIAL PARTICIPATIVO EN CORRESPONDENCIA CON EL INTERÉS NACIONAL.	1161	1	5	18	93
3.4.3.8. CONFORMAR EL DISTRITO MOTOR PARIA, ESTADO SUCRE. PROYECTOS DINAMIZADORES: PROYECTO GASÍFERO PETROLERO, DELTA-CARIBE ORIENTAL, PLATAFORMA DELTANA, EMPRESA MIXTA SOCIALISTA CACAO DEL ALBA, DE ESPECIALIZACIÓN AGRÍCOLA-TURÍSTICA.	1162	1	5	18	93
3.4.3.10. CONFORMAR EL DISTRITO MOTOR SANTA ELENA DE UAIRÉN-IKABARÚ, ESTADOS BOLÍVAR Y AMAZONAS. PROYECTO DINAMIZADOR: TRANSPORTE AÉREO Y FLUVIAL, DE ESPECIALIZACIÓN AGROECOLÓGICA Y TURÍSTICA.	1163	1	5	18	93
3.4.3.13. CONFORMAR EL DISTRITO MOTOR EL DILUVIO DEL PALMAR, ESTADO ZULIA. PROYECTO DINAMIZADOR: SISTEMA DE RIEGO EL DILUVIO, DE ESPECIALIZACIÓN AGRÍCOLA.	1164	1	5	18	93
3.4.4.1. PROMOVER LA CREACIÓN DE ZONAS DE CONCENTRACIÓN AGRÍCOLA CON GRANDES POTENCIALIDADES, CON LA FINALIDAD DE GARANTIZAR LA SEGURIDAD ALIMENTARIA NACIONAL Y LA PRODUCCIÓN DE RUBROS AGROPECUARIOS TALES COMO EL MAÍZ, EL ARROZ, LA SOYA, EL ALGODÓN,  EL GANADO,PECES Y AVES.	1165	1	5	18	162
5.1.3.3. CREAR SISTEMAS URBANOS ECOLÓGICOS, CON DISEÑOS ARQUITECTÓNICOS EQUILIBRADOS CON LOS ECOSISTEMAS NATURALES QUE REDUZCAN LOS NIVELES DE CONTAMINACIÓN AMBIENTAL.	1166	1	7	23	117
3.4.3.1. IMPULSAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, FUNDAMENTADA EN CRITERIOS DE DESARROLLO DE POTENCIALIDADES PRODUCTIVAS SUSTENTABLES, ASÍ COMO LA OCUPACIÓN DEL TERRITORIO EN ÁREAS ESTRATÉGICAS.	1167	1	5	18	93
3.4.3.12. CONFORMAR EL DISTRITO MOTOR LOS TACARIGUAS-LAS TEJERÍAS. ESTADOS ARAGUA Y CARABOBO. PROYECTOS DINAMIZADORES: ENSAMBLADORA DE VEHÍCULOS IRÁN VENEZUELA Y CHINA-VENEZUELA, SOLUCIÓN ESTRUCTURAL DEL CRECIMIENTO DEL LAGO DE TACARIGUA, DE  ESPECIALIZACIÓN INDUSTRIAL, AMBIENTAL Y AGRÍCOLA.	1168	1	5	18	93
3.4.3.18. DISTRITO MOTOR URBANO CIUDAD BELÉN, UBICADO EN EL ESTADO MIRANDA, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	1169	1	5	18	93
3.4.4.2. DESARROLLAR LAS PLANICIES CENTRALES DEL RÍO ORINOCO.	1170	1	5	18	162
3.4.5.2. CONSTRUIR LA INFRAESTRUCTURA VIAL NECESARIA QUE PERMITA CONECTAR LAS ZONAS INDUSTRIALES CON LAS ZONAS DE EXPLOTACIÓN DE RECURSOS, Y MEJORAR LAS CONDICIONES DE LAS CARRETERAS EN LAS ZONAS RURALES Y AGRÍCOLAS.	1171	1	5	18	94
3.4.5.3. MEJORAR EL SERVICIO PÚBLICO A LOS USUARIOS Y DESPLAZAR EL VIEJO PARQUE AUTOMOTOR QUE GENERA UN ALTO CONSUMO DE COMBUSTIBLE: A) PROMOVIENDO LA CREACIÓN DE EMPRESAS DE TRANSPORTE BAJO EL ESQUEMA DE PROPIEDAD SOCIAL DIRECTA O INDIRECTA; Y B) INCORPORANDO PROGRESIVAMENTE ENERGÍAS LIMPIAS EN LAS UNIDADES DE TRANSPORTE PÚBLICO Y PRIVADO.	1172	1	5	18	94
4.1.1.1. FORTALECER EL PAPEL DE VANGUARDIA DEL ALBA EN EL PROCESO DE UNIDAD DE NUESTRA AMÉRICA, DINAMIZANDO LOS NUEVOS ESPACIOS COMO LA UNASUR Y LA CELAC,EN TORNO A LOS PRINCIPIOS DE SOBERANÍA, COOPERACIÓN,COMPLEMENTACIÓN Y SOLIDARIDAD.\n	1173	1	6	19	96
4.1.1.3. CONSTRUIR LA ZONA ECONÓMICA DEL ALBA, FORTALECIENDO EL PAPEL DEL SISTEMA UNITARIO DE COMPENSACIÓN REGIONAL (SUCRE) Y DEL BANCO DEL ALBA EN LA ESTRATEGIA DE COMPLEMENTARIEDAD ECONÓMICA, FINANCIERA,PRODUCTIVA Y COMERCIAL DE LA REGIÓN.\n	1174	1	6	19	96
4.1.2.1. PROFUNDIZAR LA ALIANZA ENTRE VENEZUELA Y LOS PAÍSES DEL CARIBE, MEDIANTE LA INICIATIVA PETROCARIBE, CONSOLIDANDO UNA UNIÓN CARIBEÑA INDEPENDIENTE Y SOBERANA PARA EL DESARROLLO INTEGRAL DE SUS PUEBLOS,BUSCANDO CORREGIR LAS ASIMETRÍAS ENERGÉTICAS EXISTENTES FUNDAMENTÁNDOSE EN LOS PRINCIPIOS DE COOPERACIÓN Y SOLIDARIDAD, AVANZANDO HACIA LA CREACIÓN DE UNA ZONA ECONÓMICA PETROCARIBE (ZEP) QUE CONSIDERE A TODOS LOS PAÍSES MIEMBROS DEL CARICOM.	1175	1	6	19	97
4.1.2.2. PROMOVER LA COORDINACIÓN ENTRE LA ZONA ECONÓMICA DEL ALBA (ECOALBA), LA ZONA ECONÓMICA PETROCARIBE (ZEP) Y EL MERCOSUR, CON EL FIN DE CREAR UNA ZONA ECONÓMICA CARIBEÑA SURAMERICANA. 	1176	1	6	19	97
4.1.3.1. CONSOLIDAR LA MISIÓN MERCOSUR PARA DESARROLLAR LAS ÁREAS DE CAPACITACIÓN Y FORMACIÓN PARA LA EXPORTACIÓN; INVESTIGACIÓN, INNOVACIÓN Y TRANSFERENCIA TECNOLÓGICA; INVERSIÓN PARA LA PRODUCCIÓN Y PROMOCIÓN DE LA EXPORTACIÓN; PROFUNDIZACIÓN DE LA INDUSTRIALIZACIÓN; Y ADECUACIÓN DE INFRAESTRUCTURA PORTUARIA Y AEROPORTUARIA.	1177	1	6	19	98
4.1.6.2. INTENSIFICAR LOS PROYECTOS GRAN NACIONALES DE LA UNIÓN ECONÓMICA CON LOS PAÍSES DEL ALBA Y DE COMPLEMENTACIÓN PRODUCTIVA CON LOS PAÍSES DEL MERCOSUR.	1178	1	6	19	101
4.1.8.2. ORIENTAR LA COOPERACIÓN CON LOS PAÍSES ALIADOS DE LA REGIÓN, COMO MOTOR DE IMPULSO DEL MODELO SOCIO-PRODUCTIVO SOCIALISTA.	1238	1	6	19	103
4.3.2.2. ESTABLECER ALIANZAS CON LAS CADENAS DE COMUNICACIÓN E INFORMACIÓN DE LOS POLOS EMERGENTES DEL MUNDO, PARA ASEGURAR EL CONOCIMIENTO MUTUO Y LA INFORMACIÓN VERAZ SOBRE NUESTRAS REALIDADES, SIN EL FILTRO DEFORMADOR DE LAS GRANDES EMPRESAS DE COMUNICACIÓN DE LAS POTENCIAS IMPERIALISTAS.	1180	1	6	21	109
4.3.3.1. PROMOVER LA PARTICIPACIÓN DE LAS REDES GLOBALES DE MOVIMIENTOS SOCIALES EN LOS GRANDES FOROS Y CUMBRES INTERNACIONALES.	1181	1	6	21	110
4.4.1.3. LLEVAR A NIVELES NO VITALES LA PARTICIPACIÓN DE LAS INSTITUCIONES FINANCIERAS INTERNACIONALES EN LOS PROYECTOS DE DESARROLLO NACIONAL.	1182	1	6	22	112
4.4.3.1. INCREMENTAR LA REPRESENTACIÓN DE DIVISAS EMERGENTES EN LAS RESERVAS MONETARIAS INTERNACIONALES DE LA REPÚBLICA, ASÍ COMO LA UTILIZACIÓN DE ESTE TIPO DE DIVISAS EN EL COMERCIO INTERNACIONAL DE VENEZUELA.	1183	1	6	22	114
5.1.3.1 PROMOVER LA INVESTIGACIÓN, LA INNOVACIÓN Y LA PRODUCCIÓN DE INSUMOS TECNOLÓGICOS DE BAJO IMPACTO AMBIENTAL, ASÍ COMO EL RESCATE DE TECNOLOGÍAS ANCESTRALES PARA LA PRODUCCIÓN Y PROCESAMIENTO AGRÍCOLA Y PECUARIO, ENTRE OTROS, AUMENTANDO LOS ÍNDICES DE EFICACIA Y PRODUCTIVIDAD.	1186	1	7	23	117
3.4.3.3. IMPULSAR LA CREACIÓN DE DISTRITOS MOTORES DE DESARROLLO, FOMENTANDO LA EJECUCIÓN DE OBRAS Y SERVICIOS ESENCIALES EN LAS REGIONES Y COMUNIDADES DE MENOR DESARROLLO RELATIVO, DISMINUYENDO LAS ASIMETRÍAS ENTRE LAS GRANDES CIUDADES Y MEJORANDO EL HÁBITAT COMUNITARIO.	1187	1	5	18	93
3.4.3.4. DECRETAR Y DESARROLLAR OCHO (8) DISTRITOS MOTORES DE LA FAJA PETROLÍFERA DEL ORINOCO; CON EL FIN DE APALANCAR EL DESARROLLO PETROLERO ASÍ COMO SUS POTENCIALIDADES ADICIONALES, ELEMENTOS GEOHISTÓRICOS, RELACIONES FUNCIONALES, CAPACIDADES SOCIO-PRODUCTIVAS. LOS DISTRITOS MOTORES SON: MAPIRE-SANTA CRUZ DEL ORINOCO,CIUDAD BOLÍVAR-SOLEDAD FALCONERO, SANTA RITA-CAICARA DEL ORINOCO, PALITAL-CHAGUARAMAS, TEMBLADOR, SANTA MARÍA DE IPIRE Y ZUATA-SAN DIEGO DE CABRUTICA\n	1188	1	5	18	93
3.4.3.5. CONFORMAR EL DISTRITO MOTOR BARLOVENTO, ESTADO MIRANDA. ÁREA CON PRIORIDAD DE TRATAMIENTO EN LA CUENCA DEL RÍO TUY, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	1189	1	5	18	93
3.4.3.11. CONFORMAR EL DISTRITO MOTOR ORTIZ-CALABOZO, ESTADOS GUÁRICO Y ARAGUA.  PROYECTOS DINAMIZADORES: UPS AGROALIMENTARIA, COMPLEJO AGROINDUSTRIALRÍO TIZNADO Y PROYECTO RÍO GUÁRICO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	1190	1	5	18	93
3.4.3.15 CONFORMAR EL DISTRITO MOTOR ORICHUNA-MATIYURE, ESTADO APURE. PROYECTO DINAMIZADOR: UPS GANADERAS, DE ESPECIALIZACIÓN AGROPECUARIA.	1191	1	5	18	93
3.4.3.17. DISTRITO MOTOR URBANO CIUDAD CARIBIA, UBICADO EN DISTRITO CAPITAL Y EL ESTADO VARGAS, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	1192	1	5	18	93
3.4.5.5. COMPLEMENTAR EL SISTEMA DE PUERTOS Y AEROPUERTOS NACIONALES, CON EL FIN DE ATENDER LOS REQUERIMIENTOS DE MANEJO DE CARGA NACIONAL E INTERNACIONAL: A) DESARROLLANDO LA INFRAESTRUCTURA Y SERVICIOS QUE PERMITAN LA NAVEGACIÓN A LO LARGO DEL RÍO ORINOCO Y EL RÍO APURE COMO CANALES FUNDAMENTALES DE COMUNICACIÓN, SIN DEPREDAR EL MEDIO AMBIENTE; B) DESARROLLANDO UN SISTEMA DE PUERTOS CON NODOS REGIONALES EN LOS EJES DE INTEGRACIÓN Y DESARROLLO ORIENTAL, OCCIDENTAL Y APURE-ORINOCO; Y C) CONFIGURANDO UN SISTEMA LOGÍSTICO NACIONAL QUE PROPORCIONE LOS SERVICIOS Y FACILIDADES NECESARIOS PARA EL CABOTAJE NACIONAL E IMPULSO DE LA INTERMODALIDAD.	1193	1	5	18	94
3.4.5.6. FORTALECER LAS EMPRESAS ESTATALES DIRIGIDAS AL TRANSPORTE ACUÁTICO, AÉREO Y TERRESTRE, DE MANERA TAL QUE PERMITA MEJORAR EL SERVICIO PÚBLICO TANTO DE PERSONAS, COMO DE MATERIAS PRIMAS, BIENES INTERMEDIOS Y PRODUCTOS TERMINADOS, CON ELEVADA EFICIENCIA, BAJOS COSTOS Y TARIFAS JUSTAS.	1194	1	5	18	94
4.3.1.5. PROFUNDIZAR LAS RELACIONES DE COOPERACIÓN POLÍTICA Y ECONÓMICA CON TODOS LOS PAÍSES DE NUESTRA AMÉRICA, Y CON AQUELLOS PAÍSES DE ÁFRICA, ASIA, EUROPA Y OCEANÍA CUYOS GOBIERNOS ESTÉN DISPUESTOS A TRABAJAR CON BASE EN EL RESPETO Y LA COOPERACIÓN MUTUA.\n	1195	1	6	21	108
3.4.6.3. IMPLEMENTAR PLANES DE MEJORA Y DOTACIÓN DE SERVICIOS PÚBLICOS BÁSICOS: A) CONSTRUYENDO NUEVOS SISTEMAS DE DISTRIBUCIÓN DE AGUA POTABLE Y DE SANEAMIENTO DE AGUAS SERVIDAS EN LOS ASENTAMIENTOS; B) MEJORANDO LOS SISTEMAS DE DISTRIBUCIÓN LOCAL DE ELECTRICIDAD; C) ACELERANDO EL PLAN DE DISTRIBUCIÓN DE GAS DOMÉSTICO; D) INCORPORANDO LOS NUEVOS DESARROLLOS Y LAS ZONAS SIN SERVICIO A LA RED DE TELECOMUNICACIONES; E) MEJORANDO LOS SISTEMAS LOCALES DE ACCESIBILIDAD PEATONAL Y VEHICULAR; F) FOMENTANDO Y FORTALECIENDO EL USO DEL TRANSPORTE COLECTIVO; Y G) HABILITANDO NUEVOS TERRENOS CON SERVICIOS BÁSICOS PARA LA CONSTRUCCIÓN DE DESARROLLOS HABITACIONALES.	1196	1	5	18	95
4.1.6.1. PROFUNDIZAR LA IDENTIDAD POLÍTICA CON LOS GOBIERNOS Y PUEBLOS HERMANOS DE LOS PAÍSES MIEMBROS DEL ALBA Y DEL MERCOSUR, PARA SEGUIR IMPULSANDO POLÍTICAS DE JUSTICIA Y SOLIDARIDAD EN NUESTRA AMÉRICA.	1197	1	6	19	101
4.2.1.3. DEFENDER LA PRESENCIA DE LAS MINORÍAS ÉTNICAS Y LOS PUEBLOS ORIGINARIOS EN LAS INSTANCIAS DE TOMA DE DECISIONES NUESTRO AMERICANAS.	1198	1	6	20	106
4.3.1.1. ESTABLECER UNA ALIANZA CON EL GRUPO DE PAÍSES BRICS COMO NÚCLEO QUE AGRUPA A LOS PODERES EMERGENTES FUNDAMENTALES EN LA CONSOLIDACIÓN DEL MUNDO PLURIPOLAR.	1199	1	6	21	108
5.1.6.1. DESARROLLAR PROYECTOS DE GENERACIÓN DE ENERGÍA EÓLICA, PARA INCREMENTAR SU PARTICIPACIÓN EN LA MATRIZ ENERGÉTICA.	1200	1	7	23	120
4.3.1.6. INTENSIFICAR EL ACERCAMIENTO CON LOS MECANISMOS DE INTEGRACIÓN ECONÓMICA Y POLÍTICA DEL ASIA Y DEL ÁFRICA, TALES COMO ANSA/ASEAN Y CEDEAO/ECOWAS,PARTICIPANDO EN CALIDAD DE OBSERVADORES Y PROMOVIENDO LOS CONTACTOS CON LOS MECANISMOS DE UNIÓN E INTEGRACIÓN LATINOAMERICANA Y CARIBEÑA.	1201	1	6	21	108
4.3.1.8. IMPULSAR FOROS DE UNIÓN INTERREGIONALES SUR SUR, COMO EL AMÉRICA DEL SUR-ÁFRICA (ASA) Y EL AMÉRICA DEL SUR-PAÍSES ÁRABES (ASPA).	1202	1	6	21	108
4.3.4.1. MANTENER POLÍTICA ACTIVA Y LIDERAZGO, CONJUNTAMENTE CON LOS PAÍSES PROGRESISTAS DE LA REGIÓN, EN EL LLAMADO A LA URGENTE Y NECESARIA REFORMA DEL SISTEMA INTERAMERICANO DE DERECHOS HUMANOS, POR SER BASTIÓN ALTAMENTE POLITIZADO DEL IMPERIALISMO ESTADOUNIDENSE.	1203	1	6	21	111
4.4.2.2. REDUCIR LA PARTICIPACIÓN DE LAS POTENCIAS NEOCOLONIALES EN EL FINANCIAMIENTO DE PROYECTOS ESTRATÉGICOS PARA EL DESARROLLO NACIONAL.\n	1204	1	6	22	113
5.1.1.1. GARANTIZAR LA SOBERANÍA Y PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR ORGANIZADO PARA LA TOMA DE DECISIONES, DESDE EL INTERCAMBIO DE CONOCIMIENTOS, RACIONALIDADES Y FORMAS DE VIDA, PARA CONSTRUIR EL ECOSOCIALISMO.\n	1205	1	7	23	115
3.4.6.5. ASOCIAR ACTIVIDADES PRODUCTIVAS DE BAJO IMPACTO AMBIENTAL A LOS PLANES Y PROYECTOS URBANOS,GENERANDO TRABAJO LIBERADOR PARA LOS NUEVOS HABITANTES, IMPULSANDO LA DIVERSIFICACIÓN PRODUCTIVA.\n	1235	1	5	18	95
5.1.1.3. IMPULSAR Y GARANTIZAR NUEVOS PROCESOS DE PRODUCCIÓN Y VALORIZACIÓN DE CONOCIMIENTOS CIENTÍFICOS,ANCESTRALES, TRADICIONALES Y POPULARES, ASÍ COMO NUEVAS RELACIONES ENTRE ELLOS, CON ESPECIAL ATENCIÓN A LAS PRÁCTICAS DE LOS GRUPOS SOCIALES INVISIBILIZADOS Y DISCRIMINADOS POR EL CAPITALISMO Y EL NEOCOLONIALISMO.	1206	1	7	23	115
5.1.2.1. IMPULSAR Y DESARROLLAR UNA VISIÓN DE DERECHOS DE LA MADRE TIERRA, COMO REPRESENTACIÓN DE LOS DERECHOS DE LAS GENERACIONES PRESENTES Y FUTURAS, ASÍ COMO DE RESPETO A LAS OTRAS FORMAS DE VIDA.	1207	1	7	23	116
5.1.2.3. PROMOVER LA IGUALDAD SUSTANTIVA ENTRE GÉNEROS, PERSONAS, CULTURAS Y COMUNIDADES.	1208	1	7	23	116
5.1.3.7. PROMOVER LA CONFORMACIÓN DE REDES LOCALES,NACIONALES E INTERNACIONALES PARA EL IMPULSO DEL MODELO ECOSOCIALISTA.	1209	1	7	23	117
5.1.3.9. IMPLEMENTAR POLÍTICAS DE FINANCIAMIENTO PARA EL DESARROLLO DE UNIDADES PRODUCTIVAS, PROMOVIENDO EL USO DE TECNOLOGÍAS AMIGABLES CON EL AMBIENTE.\n	1210	1	7	23	117
3.4.3.9. CONFORMAR EL DISTRITO MOTOR SUR DEL LAGO,ESTADOS ZULIA Y MÉRIDA. PROYECTO DINAMIZADOR UPS DE DISTRIBUCIÓN, DE ESPECIALIZACIÓN AGROINDUSTRIAL.\n	1211	1	5	18	93
3.4.3.14 CONFORMAR EL DISTRITO MOTOR FLORENTINO (BOCONÓ-BARINAS), ESTADO BARINAS Y TRUJILLO. PROYECTOS DINAMIZADORES: AUTOPISTA BOCONÓ-BARINAS, CENTRO DE MEJORAMIENTO GENÉTICO FLORENTINO, DE ESPECIALIZACIÓN AGROINDUSTRIAL.	1212	1	5	18	93
3.4.3.16 CONFORMAR EL DISTRITO MOTOR URBANO CIUDAD TIUNA, UBICADO EN DISTRITO CAPITAL Y EL ESTADO BOLIVARIANO DE MIRANDA, PARA DESARROLLAR EL NUEVO MODELO DE CIUDAD SOCIALISTA.	1213	1	5	18	93
3.4.5.1. MANTENER Y CONSTRUIR LAS CARRETERAS, AUTOPISTAS Y TRONCALES, CONECTANDO LAS GRANDES Y MEDIANAS CIUDADES A LO LARGO DEL TERRITORIO NACIONAL.	1214	1	5	18	94
3.4.5.4. CULMINAR LA CONSTRUCCIÓN Y REHABILITACIÓN DE LOS TRAMOS FERROVIARIOS EN EJECUCIÓN Y DESARROLLAR NUEVOS TRAMOS COMO COLUMNA VERTEBRAL DE LOS EJES DE INTEGRACIÓN Y DESARROLLO, PARA EL TRANSPORTE DE PASAJEROS, PRODUCTOS AGRÍCOLAS, INDUSTRIALES Y BIENES COMERCIALES.	1215	1	5	18	94
3.4.6.4. MEJORAR Y CONSTRUIR EL EQUIPAMIENTO URBANO NECESARIO PARA GARANTIZAR LA ACCESIBILIDAD A SERVICIOS VIALES, EDUCATIVOS, DE SALUD, DEPORTIVOS, SOCIALES, CULTURALES, DE ESPARCIMIENTO Y DE SEGURIDAD.	1216	1	5	18	95
4.1.1.2. FORTALECER LOS MECANISMOS DE CONCERTACIÓN POLÍTICA DEL BLOQUE ALBA EN LOS SISTEMAS INTERAMERICANO Y MUNDIAL, HACIA SU TRANSFORMACIÓN INTEGRAL.	1217	1	6	19	96
4.1.4.1. GARANTIZAR LA PARTICIPACIÓN ACTIVA EN LOS CONSEJOS DE UNASUR, PARA ALCANZAR EL IMPULSO DE POLÍTICAS Y ACCIONES QUE BENEFICIEN A LOS PUEBLOS DE NUESTRA AMÉRICA, PROMOVIENDO LA INTEGRACIÓN SOCIOCULTURAL, ECONÓMICA, ENERGÉTICA Y DE INFRAESTRUCTURA SURAMERICANA EN EL MARCO DEL FORTALECIMIENTO DE LA SOBERANÍA E INDEPENDENCIA DE LOS PUEBLOS.\n	1218	1	6	19	99
4.1.9.4. DIFUNDIR DE FORMA PERMANENTE INFORMACIÓN VERAZ PRODUCIDA POR LOS PAÍSES DEL ALBA Y PAÍSES ALIADOS DEL SUR.	1219	1	6	19	104
4.2.2.1. FOMENTAR EN EL ÁMBITO NUESTRO AMERICANO,CONVENIOS DE INTEGRACIÓN CULTURAL, EDUCATIVA, SOCIAL,CIENTÍFICO-TECNOLÓGICA, ENTRE OTROS.	1220	1	6	20	107
4.3.2.1. FORTALECER LAS CADENAS MULTIESTATALES Y REDES COMUNITARIAS DE TELEVISIÓN Y RADIO, JUNTO CON SUS RESPECTIVAS PLATAFORMAS ELECTRÓNICAS, EXPANDIENDO SU ALCANCE, SU OFERTA EN DIFERENTES IDIOMAS Y LA VARIEDAD Y CALIDAD DE SUS CONTENIDOS, CON EL FIN DE PROYECTAR LA VERDAD DE LOS PUEBLOS Y ROMPER EL BLOQUEO INFORMATIVO Y LA CENSURA  IMPUESTAS POR LAS CORPORACIONES TRANSNACIONALES DE LA COMUNICACIÓN.	1221	1	6	21	109
4.4.2.1. LLEVAR A NIVELES NO VITALES EL INTERCAMBIO COMERCIAL Y EL RELACIONAMIENTO  CON LOS CIRCUITOS FINANCIEROS DOMINADOS POR LAS POTENCIAS NEOCOLONIALES.\n	1222	1	6	22	113
4.4.2.5. LLEVAR A NIVELES NO VITALES LA PARTICIPACIÓN TECNOLÓGICA DE LAS POTENCIAS IMPERIALES EN PROYECTOS DE DESARROLLO NACIONAL.	1223	1	6	22	113
4.4.2.6. ELIMINAR LA PARTICIPACIÓN TECNOLÓGICA DE LAS POTENCIAS IMPERIALES EN SECTORES ESTRATÉGICOS PARA SOBERANÍA NACIONAL.\n	1224	1	6	22	113
4.4.3.3. INCREMENTAR LA PARTICIPACIÓN ECONÓMICA TECNOLÓGICA DE POLOS EMERGENTES DEL MUNDO EN PROYECTOS DE DESARROLLO NACIONAL.\n	1225	1	6	22	114
4.4.3.4. ESTABLECER ALIANZAS PARA LA COORDINACIÓN POLÍTICA Y EL INTERCAMBIO ECONÓMICO ENTRE MECANISMOS DE UNIÓN DEL SUR DE LOS DIFERENTES CONTINENTES, CON ESPECIAL ÉNFASIS EN EL GRUPO DE PAÍSES BRICS.\n	1226	1	6	22	114
5.1.3.2. PROMOVER LA GENERACIÓN Y APROPIACIÓN SOCIAL DEL CONOCIMIENTO, TECNOLOGÍA E INNOVACIÓN QUE PERMITAN LA CONSERVACIÓN Y EL APROVECHAMIENTO SUSTENTABLE, JUSTO Y EQUITATIVO DE LA DIVERSIDAD BIOLÓGICA, GARANTIZANDO LA SOBERANÍA DEL ESTADO SOBRE SUS RECURSOS NATURALES.	1227	1	7	23	117
5.1.4.1. PROMOVER EL USO SUSTENTABLE Y SOSTENIBLE DE LOS RECURSOS NATURALES EN LOS PROCESOS DE PRODUCCIÓN,CIRCULACIÓN Y CONSUMO DE LOS BIENES, PRODUCTOS Y SERVICIOS, ASÍ COMO LA DISMINUCIÓN DE DESECHOS, FOMENTANDO CAMPAÑAS PERMANENTES DE CONCIENCIACIÓN.	1228	1	7	23	118
5.2.1.7. GARANTIZAR EL CONTROL SOBERANO SOBRE EL CONOCIMIENTO, EXTRACCIÓN, DISTRIBUCIÓN, COMERCIALIZACIÓN Y USOS DE LOS MINERALES ESTRATÉGICOS, DE MANERA SOSTENIBLE, EN FUNCIÓN DE LOS MÁS ALTOS INTERESES NACIONALES.	1229	1	7	24	121
5.2.3.2. DEFENDER LOS DERECHOS TERRITORIALES Y LA SOBERANÍA DEL ESTADO VENEZOLANO EN LAS NEGOCIACIONES RELACIONADAS CON LA ADMINISTRACIÓN DE LOS ESPACIOS MARINOS, SUBMARINOS Y OCEÁNICOS, ASÍ COMO DE LA DIVERSIDAD BIOLÓGICA PRESENTE EN ESOS ESPACIOS.	1230	1	7	24	123
5.3.4.2. EJECUTAR UN PLAN NACIONAL E INTERNACIONAL DE DIFUSIÓN DE LA CULTURA TRADICIONAL Y DE LA MEMORIA HISTÓRICA Y CONTEMPORÁNEA.\n	1231	1	7	25	128
5.4.2.3. POSICIONAR A VENEZUELA COMO REFERENTE MUNDIAL EN LA LUCHA POR EL CUMPLIMIENTO DE LOS ACUERDOS ESTABLECIDOS Y DE SU IMPULSO POR LA CONSTRUCCIÓN DE UN NUEVO SISTEMA ECOSOCIALISTA.	1232	1	7	26	130
3.4.6.1. IMPULSAR EL DESARROLLO DE CIUDADES INCLUYENTES Y SUSTENTABLES: A) IMPLEMENTANDO LA CIUDAD COMPACTA COMO MODELO DE DESARROLLO URBANO SUSTENTABLE,CON EDIFICACIONES DE BAJA ALTURA Y ALTA DENSIDAD; B) FOMENTANDO LA ECONOMÍA DE ESPACIOS Y RECURSOS COMO MEDIO PARA LOGRAR EL CRECIMIENTO URBANO EQUILIBRADO; Y C) DEMOCRATIZANDO LA ACCESIBILIDAD DE TODA LA POBLACIÓN EN CIUDADES, PRIVILEGIANDO EL USO DEL TRANSPORTE COLECTIVO, ESPACIOS ADECUADOS PARA LA CIRCULACIÓN CIUDADANA EN LA TRAMA URBANA, IMPLEMENTANDO PLANES DE HABILITACIÓN DE ESPACIOS PÚBLICOS EN LOS CENTROS POBLADOS Y REHABILITANDO LAS EDIFICACIONES DE EQUIPAMIENTO URBANO EXISTENTES.	1233	1	5	18	95
3.4.6.2. CONTINUAR EL DESARROLLO DE LA GRAN MISIÓN VIVIENDA VENEZUELA Y DESPLEGAR LA GRAN MISIÓN BARRIO NUEVO BARRIO TRICOLOR PARA ABATIR EL DÉFICIT HABITACIONAL ACUMULADO: A) CONSTRUYENDO 2.650.000 VIVIENDAS NUEVAS, DISTRIBUIDAS DE TAL MANERA QUE SE CONSOLIDEN LOS EJES DE DESARROLLO INTEGRAL, LOS POLOS DE DESARROLLO Y LOS DISTRITOS MOTORES; B) PROMOVIENDO LA AUTOCONSTRUCCIÓN; C) MEJORANDO Y AMPLIANDO 1.000.000 DE VIVIENDAS, PARA CONSOLIDAR ASENTAMIENTOS EXISTENTES; Y D) FORTALECIENDO LA CONSTRUCCIÓN DE VIVIENDAS EN EL ÁMBITO RURAL PARA MEJORAR LAS CONDICIONES DE VIDA DE LA FAMILIA CAMPESINA.	1234	1	5	18	95
4.1.9.5. GARANTIZAR LA PRODUCCIÓN PERMANENTE DE CONTENIDOS, PARA DIFUNDIR A TRAVÉS DE MEDIOS DE COMUNICACIÓN REGIONALES LOS AVANCES ECONÓMICOS, SOCIALES, POLÍTICOS Y CULTURALES DE LA REVOLUCIÓN BOLIVARIANA.\n	1239	1	6	19	104
4.1.9.6. DESARROLLAR CAPACIDADES DE PRODUCCIÓN DE CONTENIDOS AUDIOVISUALES EN FORMATO DIGITAL DESDE Y PARA LA PUESTA EN MARCHA DE LA TELEVISIÓN DIGITAL ABIERTA (TDA) A NIVEL NACIONAL Y PARA EL INTERCAMBIO REGIONAL.	1240	1	6	19	104
4.2.1.2. AUMENTAR LA PRESENCIA DE LA TEMÁTICA SOBRE LA IDENTIDAD NACIONAL Y LA DIVERSIDAD DE LOS PUEBLOS EN LOS CONTENIDOS CURRICULARES, PROGRAMACIÓN AUDIOVISUAL Y EVENTOS NACIONALES E INTERNACIONALES.	1241	1	6	20	106
4.3.1.3. ELEVAR A UN NIVEL SUPERIOR LAS ALIANZAS ESTRATÉGICAS CON LA REPÚBLICA POPULAR CHINA, LA FEDERACIÓN DE RUSIA, LA REPÚBLICA FEDERATIVA DEL BRASIL, LA REPÚBLICA DE BELARÚS Y LA REPÚBLICA ISLÁMICA DE IRÁN CON EL FIN DE SEGUIR CONSOLIDANDO EL PODER NACIONAL.	1242	1	6	21	108
4.4.1.1. DENUNCIAR LOS TRATADOS MULTILATERALES, ASÍ COMO TAMBIÉN LOS TRATADOS Y ACUERDOS BILATERALES QUE LIMITEN LA SOBERANÍA NACIONAL FRENTE A LOS INTERESES DE LAS POTENCIAS NEOCOLONIALES, TALES COMO LOS TRATADOS DE PROMOCIÓN Y PROTECCIÓN DE INVERSIONES.	1243	1	6	22	112
4.4.2.3. LLEVAR A NIVELES NO VITALES LA CONEXIÓN DE VENEZUELA CON LAS REDES DE COMUNICACIÓN E INFORMACIÓN DOMINADAS POR LAS POTENCIAS NEOCOLONIALES.	1244	1	6	22	113
4.4.2.4. ELIMINAR LA DEPENDENCIA DE SECTORES ESTRATÉGICOS PARA EL DESARROLLO NACIONAL DE REDES DE COMUNICACIÓN E INFORMACIÓN CONTROLADAS POR LAS POTENCIAS NEOCOLONIALES.	1245	1	6	22	113
4.4.3.2. EFECTUAR LA PORCIÓN MAYORITARIA DEL INTERCAMBIO ECONÓMICO Y COMERCIAL CON POLOS EMERGENTES DEL MUNDO NUEVO.	1246	1	6	22	114
5.1.1.2. DESARROLLAR UNA POLÍTICA INTEGRAL DE CONSERVACIÓN, APROVECHAMIENTO SUSTENTABLE, PROTECCIÓN Y DIVULGACIÓN CIENTÍFICA DE LA DIVERSIDAD BIOLÓGICA Y DE LOS RESERVORIOS DE AGUA DEL PAÍS.	1247	1	7	23	115
5.1.3.4. PROMOVER EL DESARROLLO DE ACTIVIDADES DE TURISMO SUSTENTABLE Y SOSTENIBLE PARA EL DISFRUTE DE LA POBLACIÓN.	1248	1	7	23	117
5.1.3.6. PRESERVAR Y MANEJAR LAS ÁREAS ESTRATÉGICAS PARA LA CONSERVACIÓN, TALES COMO LAS ABRAES, POR LOS BENEFICIOS VITALES QUE SE DERIVAN DE SU CONSERVACIÓN Y SU CONTRIBUCIÓN A LA SUPREMA FELICIDAD SOCIAL.	1249	1	7	23	117
5.1.3.8. PROMOVER PRÁCTICAS DE CONSERVACIÓN DEL AMBIENTE EN LA ACTIVIDAD SOCIO-PRODUCTIVA, SUPERANDO EL CRITERIO DE “EFICIENCIA ECONÓMICA” POR SER UNA PRÁCTICA DESVINCULADA DE LA RACIONALIDAD EN EL USO DE LOS RECURSOS NATURALES.	1250	1	7	23	117
5.1.4.3. DESARROLLAR NORMATIVAS LEGALES QUE PROMUEVAN LA IMPLEMENTACIÓN DEL REÚSO EN EL PAÍS.	1251	1	7	23	118
5.1.5.3. AUMENTAR LA DENSIDAD DE ÁREAS VERDES POR HABITANTE, MEDIANTE LA CONSTRUCCIÓN DE PARQUES Y ESPACIOS DE SOCIALIZACIÓN NATURALES.	1252	1	7	23	119
5.1.5.5. ESTABLECER A LA CHATARRA FERROSA Y NO FERROSA COMO UN INSUMO DE INTERÉS NACIONAL PARA EL PROCESO PRODUCTIVO, A EFECTO DE ATENDER LA ESTRUCTURA DE COSTOS DE LOS PRODUCTOS Y EL CUIDADO DEL AMBIENTE ASÍ COMO EFICIENCIA ENERGÉTICA. 	1253	1	7	23	119
5.2.1.3. PROFUNDIZAR, ARTICULADAMENTE ENTRE INSTANCIAS DEL PODER PÚBLICO Y EL PODER POPULAR, LA PROTECCIÓNINTEGRAL DEL AGUA COMO UN DEBER, HACIENDO USO RESPONSABLE DE LA MISMA E IMPULSANDO ESPACIOS NACIONALES E INTERNACIONALES DE DISCUSIÓN SOBRE SU USO  Y DEMOCRATIZACIÓN.	1254	1	7	24	121
5.2.1.6. CONTINUAR IMPULSANDO EL RECONOCIMIENTO DEL ACCESO AL AGUA POTABLE COMO UN DERECHO HUMANO EN TODOS LOS ÁMBITOS NACIONALES E INTERNACIONALES.	1255	1	7	24	121
5.2.2.1. ACTIVAR ALIANZAS ESTRATÉGICAS PARA LA LUCHA CONTRA LA MERCANTILIZACIÓN DE LA NATURALEZA EN TODOS LOS ÁMBITOS NACIONALES E INTERNACIONALES.	1256	1	7	24	122
5.1.3.5. CONSTITUIR UN SISTEMA NACIONAL, REGIONAL Y LOCAL PARA EL APROVECHAMIENTO DE RESIDUOS Y DESECHOS, PARA LA CREACIÓN DE INSUMOS ÚTILES PARA EL VIVIR BIEN,DÁNDOLE PRIORIDAD A SU USO COMO MATERIAS PRIMAS SECUNDARIAS PARA LA INDUSTRIA NACIONAL.\n	1257	1	7	23	117
5.1.3.10. RESCATAR LOS SABERES ANCESTRALES DE LOS PUEBLOS ORIGINARIOS SOBRE LOS PROCESOS PRODUCTIVOS, PARA EL DESARROLLO DE TECNOLOGÍAS SUSTENTABLES QUE INCIDAN EN LOS NUEVOS ESQUEMAS DE RELACIONAMIENTO INTERNACIONAL.	1258	1	7	23	117
5.1.3.12. FACILITAR EL ACCESO A LOS PEQUEÑOS Y MEDIANOS PRODUCTORES Y A LAS FORMAS ASOCIATIVAS DE PROPIEDAD Y DE PRODUCCIÓN, PARA SU INSERCIÓN EFECTIVA EN LAS CADENAS DE VALOR INTRARREGIONALES, CON SOSTENIBILIDAD AMBIENTAL.	1259	1	7	23	117
5.2.1.2. PROMOVER LA CONSERVACIÓN Y EL USO SUSTENTABLE DE LA DIVERSIDAD BIOLÓGICA, EN UN MARCO REGIONAL, CONTINENTAL Y MUNDIAL ORIENTADO A LA INTEGRACIÓN, SOBERANÍA Y EL VIVIR BIEN.\n	1261	1	7	24	121
5.2.2.2. IMPULSAR EL DESARROLLO DE UNA VISIÓN DESDE EL SUR QUE PERMITA FORTALECER LA DEFENSA DE LOS INTERESES REGIONALES EN MATERIA AMBIENTAL.	1262	1	7	24	122
5.3.1.2. PROMOVER LA PRODUCCIÓN DE CONTENIDO EDUCATIVO, TALES COMO TEXTOS ESCOLARES, PARA GENERAR CONSCIENCIA HISTÓRICA Y FORMAR CRÍTICAMENTE LAS NUEVAS GENERACIONES.\n	1263	1	7	25	125
5.3.2.2. PROMOVER LA ORGANIZACIÓN DEL PODER POPULAR PARA EL REGISTRO E INTERPRETACIÓN DE LA MEMORIA HISTÓRICA  Y LA DIFUSIÓN Y EXPRESIÓN DE LAS CULTURAS POPULARES.	1264	1	7	25	126
5.3.4.3. FOMENTAR Y GARANTIZAR LA PRODUCCIÓN INDEPENDIENTE Y COMUNITARIA DE LAS ARTES.\n	1265	1	7	25	128
5.4.2.1. PROMOVER LA ADECUACIÓN TECNOLÓGICA PARA UNA TRANSFORMACIÓN DEL SECTOR PRODUCTIVO, DE MANERA SUSTENTABLE, CON ESPECIAL ÉNFASIS EN EL SECTOR ENERGÉTICO, AGRÍCOLA Y PECUARIO, INCORPORANDO EL PRINCIPIO DE PREVENCIÓN Y MANEJO DE LOS DESECHOS SÓLIDOS Y PELIGROSOS.\n	1266	1	7	26	130
5.4.3.1. COORDINAR ACCIONES CON TODOS LOS ENTES NACIONALES ENCARGADOS DE LA PLANIFICACIÓN TERRITORIAL Y LA GESTIÓN DE DESASTRES, CON UNA VISIÓN PROSPECTIVA DEL INCREMENTO DE TEMPERATURA PREVISTO PARA LOS PRÓXIMOS 20 AÑOS, EN FUNCIÓN DE LAS  PROMESAS DE MITIGACIÓN QUE LOGREN CONSOLIDARSE EN EL MARCO DE LA ORGANIZACIÓN DE LAS NACIONES UNIDAS.	1267	1	7	26	131
5.4.3.2. CALCULAR LOS COSTOS DERIVADOS DE LAS PÉRDIDAS Y DAÑOS RESULTANTES DE SITUACIONES EXTREMAS CLIMÁTICAS, INCLUYENDO SEGUROS Y REASEGUROS PARA SECTORES SENSIBLES ESPECÍFICOS (COMO LA AGRICULTURA), LAS CUALES DEBERÁN SUMARSE A LA DEUDA ECOLÓGICA DE LOS PAÍSES INDUSTRIALIZADOS.	1268	1	7	26	131
5.3.1.1. INVOLUCRAR A LAS INSTITUCIONES PÚBLICAS Y AL PODER POPULAR EN LA PRODUCCIÓN DE CRÍTICAS CONTUNDENTES A LAS FORMAS CULTURALES Y A LAS RECONSTRUCCIONES HISTÓRICAS DOMINANTES.\n	1269	1	7	25	125
5.1.4.2. FOMENTAR EL RE USO DE LOS RESIDUOS PARA SU UTILIZACIÓN COMO MATERIAS PRIMAS O BIENES FINALES; A TRAVÉS DE LA CONFORMACIÓN DE CIRCUITOS QUE INCLUYAN LA CLASIFICACIÓN DE RESIDUOS POR PARTE DE TODA LA POBLACIÓN,ESTABLECIENDO CENTROS DE ACOPIO Y UNIDADES PRODUCTIVAS TRANSFORMADORAS.	1270	1	7	23	118
5.1.5.1. PROMOVER CIUDADES ENERGÉTICAMENTE EFICIENTES, MEDIANTE EL USO DE TECNOLOGÍAS AHORRADORAS DE ENERGÍA, ASÍ COMO BASADAS EN EL USO DE ENERGÍAS LIMPIAS (EÓLICAS,  SOLARES, GAS, ENTRE OTRAS).	1271	1	7	23	119
5.1.5.2. DESARROLLAR SISTEMAS DE TRANSPORTE PÚBLICO EFICIENTES EN EL USO DE RECURSOS Y DE BAJO IMPACTO AMBIENTAL.\n	1272	1	7	23	119
5.1.5.4. PROMOVER SISTEMAS CONSTRUCTIVOS NO CONTAMINANTES Y SISTEMAS DE VIVIENDAS ECOEFICIENTES.\n	1273	1	7	23	119
5.2.1.1. MANTENER EL LIDERAZGO EN LAS NEGOCIACIONES INTERNACIONALES MULTILATERALES Y REGIONALES, RELACIONADAS CON LOS RESPECTIVOS MARCOS JURÍDICOS SECTORIALES AMBIENTALES.	1274	1	7	24	121
5.2.2.3. IMPULSAR EN LOS ORGANISMOS DE INTEGRACIÓN SURAMERICANA ALBA, CELAC, UNASUR, MERCORSUR, PETROCARIBE, ASÍ COMO EN LOS DIVERSOS ESPACIOS INTERNACIONALES A LOS QUE ASISTE VENEZUELA, EL CONCEPTO DE BAJO IMPACTO AMBIENTAL DE FORMA TRANSVERSAL EN TODAS LAS ACCIONES EMPRENDIDAS.	1275	1	7	24	122
5.2.4.1. MANTENER VIGILANCIA DEL DESARROLLO DE LA AGENDA DEL CONSEJO DE SEGURIDAD DE LAS NACIONES UNIDAS PARA EVITAR LA INJERENCIA EN LOS TEMAS AMBIENTALES Y HUMANOS, Y  SU TRATAMIENTO COMO TEMAS DE SEGURIDAD CIUDADANA INTERNACIONAL, LO CUAL ATENTA CONTRA LA SOBERANÍA DE LOS PUEBLOS.\n	1276	1	7	24	124
5.2.4.2. FORTALECER LOS DEBATES SUSTANTIVOS EN TEMAS ECONÓMICOS, SOCIALES Y AMBIENTALES EN TODOS LOS ÁMBITOS INTERNACIONALES, REGIONALES Y MULTILATERALES, PARA QUE LAS DECISIONES SE TOMEN DE MANERA INCLUSIVA Y TRANSPARENTE, SIN ORIENTACIONES DE CORTE NEOCOLONIAL  POR PARTE DE LOS PAÍSES DESARROLLADOS, PROMOVIENDO LA INCORPORACIÓN DEL PODER POPULAR Y EN PARTICULAR LOS MOVIMIENTOS SOCIALES EN ESTOS ESPACIOS.\n	1277	1	7	24	124
5.3.2.1. FORTALECER LOS PROCESOS QUE VISIBILICEN LA IDENTIDAD HISTÓRICO-COMUNITARIA, IDENTIFICANDO LOS ESPACIOS DE EXPRESIÓN Y FORMAS POPULARES DE REPRODUCCIÓN DE LA MEMORIA HISTÓRICA, Y FOMENTANDO LA EXPRESIÓN DE LAS DIVERSAS MANIFESTACIONES CULTURALES TRADICIONALES.	1278	1	7	25	126
5.3.2.3. GARANTIZAR LA PROTECCIÓN DEL PATRIMONIO CULTURAL POPULAR Y DE LA MEMORIA HISTÓRICA, A TRAVÉS DE LA FORMACIÓN INTEGRAL PERMANENTE Y CONTINUA DE LOS PROMOTORES CULTURALES DEL PODER POPULAR.	1279	1	7	25	126
5.3.3.2. INCORPORAR A LAS ORGANIZACIONES POPULARES EN EL DISEÑO DE LAS POLÍTICAS CULTURALES, IMPULSANDO INICIATIVAS COMO LOS COMITÉS DE CULTURA DE LOS CONSEJOS COMUNALES ENTRE OTRAS.	1280	1	7	25	127
5.4.1.1. DESMONTAR LOS ESQUEMAS DE MERCADOS INTERNACIONALES DE CARBONO QUE LEGITIMAN LA COMPRA DE DERECHOS DE CONTAMINACIÓN Y LA IMPUNE DESTRUCCIÓN DEL PLANETA.	1281	1	7	26	129
5.4.1.3. IMPULSAR Y APOYAR ACCIONES QUE PROMUEVAN LA JUSTICIA INTERNACIONAL CON RELACIÓN AL INCUMPLIMIENTO DE LOS PAÍSES DESARROLLADOS DE SUS OBLIGACIONES EN EL MARCO DEL PROTOCOLO DE KYOTO.	1282	1	7	26	129
5.4.2.2. IMPULSAR A NIVEL REGIONAL E INTERNACIONAL COMPROMISOS POR PARTE DE TODOS LOS PAÍSES Y MEDIDAS NACIONALES DE MITIGACIÓN QUE CONTRIBUYAN A CORREGIR EL DETERIORO AMBIENTAL QUE GENERA EL CAMBIO CLIMÁTICO GLOBAL.\n	1283	1	7	26	130
5.4.3.3. FOMENTAR EL DESARROLLO DE PLANES MUNICIPALES Y LOCALES DE ADAPTACIÓN PARA ESCENARIOS DE MANEJO DE RIESGO QUE INVOLUCREN DIRECTAMENTE LA CORRESPONSABILIDAD ENTRE EL ESTADO Y EL PODER POPULAR.	1284	1	7	26	131
5.2.3.1. REIMPULSAR LA COOPERACIÓN CON LOS PAÍSES FRONTERIZOS EN TEMAS DE GESTIÓN AMBIENTAL Y ZONAS ECOLÓGICAS DE INTERÉS COMÚN CONFORME A LOS PRINCIPIOS DEL DERECHO INTERNACIONAL, RESPETANDO LA SOBERANÍA NACIONAL.\n	1285	1	7	24	123
5.3.2.4. INVOLUCRAR A LOS MUSEOS Y OTRAS INSTITUCIONES DE INTERÉS HISTÓRICO Y CULTURAL, EN EL PLAN DE CONSERVACIÓN Y VALORIZACIÓN DEL PATRIMONIO CULTURAL E HISTÓRICO POPULAR.	1286	1	7	25	126
5.3.3.1. IMPULSAR DEBATES DENTRO DE LAS ORGANIZACIONES DEL PODER POPULAR SOBRE LA VIVENCIA CULTURAL Y LAS IDENTIDADES, PARA EL ANÁLISIS DE LA SITUACIÓN ACTUAL Y LOS CAMBIOS QUE SE NECESITAN EN LA CONSTRUCCIÓN DEL ECOSOCIALISMO.\n	1287	1	7	25	127
5.3.3.3. DESARROLLAR ESTRATEGIAS DE LIBERACIÓN Y EMANCIPACIÓN CULTURAL, PONIENDO ESPECIAL ÉNFASIS EN GRUPOS SOCIALES ESPECIALMENTE VULNERABLES, TALES COMO LOS GRUPOS SEXO DIVERSOS, MUJERES, ESTUDIANTES, NIÑOS Y NIÑAS, AFRODESCENDIENTES, ENTRE OTROS, CON LA FINALIDAD DE GARANTIZAR EL RESPETO DE SUS DERECHOS E IDENTIDADES.	1288	1	7	25	127
5.3.4.1. PRODUCIR Y DIFUNDIR MATERIALES SOBRE LA HISTORIA DE LOS GRUPOS HISTÓRICAMENTE INVISIBILIZADOS Y LA MEMORIA HISTÓRICA Y CULTURAL DE NUESTRA AMÉRICA, ESPECIALMENTE EN LAS BIBLIOTECAS PÚBLICAS Y ESCOLARES, ASÍ COMO EN LOS MEDIOS MASIVOS DE COMUNICACIÓN.\n	1289	1	7	25	128
5.4.1.2. PROMOVER E IMPULSAR EL FORTALECIMIENTO DEL RÉGIMEN JURÍDICO CLIMÁTICO VIGENTE, CON ÉNFASIS EN LAS RESPONSABILIDADES HISTÓRICAS DE LOS PAÍSES DESARROLLADOS.	1290	1	7	26	129
5.4.1.4. INICIAR UN PROCESO DE TRANSFORMACIÓN DE LAS DISPOSICIONES LEGALES NACIONALES PARA GARANTIZAR LA ADMINISTRACIÓN Y LA PROTECCIÓN DEL PATRIMONIO NATURAL, EN  LA CONSTRUCCIÓN DEL ECOSOCIALISMO.	1291	1	7	26	129
2.4.1.3. PROMOVER LA ÉTICA Y LOS VALORES SOCIALISTAS, LA FORMACIÓN Y AUTOFORMACIÓN, LA DISCIPLINA CONSCIENTE BASADA EN LA CRÍTICA Y LA AUTOCRÍTICA, LA PRÁCTICA DE LA SOLIDARIDAD Y EL AMOR, LA CONCIENCIA DEL DEBER SOCIAL Y LA LUCHA CONTRA LA CORRUPCIÓN Y EL BUROCRATISMO.\n	1292	1	4	13	151
2.5.3.4. EJECUTAR UN PROCESO DE REORGANIZACIÓN DE LA ADMINISTRACIÓN PÚBLICA, HOMOLOGANDO Y DIGNIFICANDO LAS CONDICIONES DE LOS SERVIDORES PÚBLICOS, DE ACUERDO A SUS ROLES Y COMPETENCIAS, PARA POTENCIAR Y AMPLIAR SUS CAPACIDADES, CON MIRAS A DESARROLLAR EL MODELO ECONÓMICO PRODUCTIVO SOCIALISTA.\n	1293	1	4	14	155
2.3.1.1 PROMOVER, CONSOLIDAR Y EXPANDIR LA ORGANIZACIÓN DEL PODER POPULAR EN EL ÁMBITO TERRITORIAL Y SECTORIAL, EN LA FIGURA DE LAS DISTINTAS INSTANCIAS DE PARTICIPACIÓN.\n	1294	1	4	12	146
2.3.3.3. IMPULSAR LA CREACIÓN DE UNIDADES DE ACOMPAÑAMIENTO TÉCNICO INTEGRAL ESTADALES, DOTANDO AL PODER POPULAR ORGANIZADO DE HERRAMIENTAS TÉCNICAS ÚTILES PARA UNA GESTIÓN COMUNAL EFICIENTE, EFICAZ, EFECTIVA Y DE CALIDAD.\n	1295	1	4	12	148
2.3.1.2. PROMOVER LA ORGANIZACIÓN DEL PODER POPULAR EN EL SISTEMA DE AGREGACIÓN COMUNAL PARA LA CONSTRUCCIÓN DEL ESTADO SOCIAL DE DERECHO Y DE JUSTICIA A TRAVÉS DE INSTANCIAS COMO CONSEJOS COMUNALES, SALAS DE BATALLA SOCIAL, COMUNAS SOCIALISTAS, CIUDADES COMUNALES, FEDERACIONES Y CONFEDERACIONES COMUNALES, ENTRE OTROS.\n	1296	1	4	12	146
2.3.1.3. ACELERAR LA CONFORMACIÓN LOS CONSEJOS COMUNALES A NIVEL NACIONAL, GARANTIZANDO LA COBERTURA DEL 70% DE LA POBLACIÓN TOTAL VENEZOLANA ORGANIZADA EN CONSEJOS COMUNALES  PARA EL AÑO 2019.\n	1297	1	4	12	146
2.3.1.4. PROMOVER LA CONFORMACIÓN DE LAS SALAS DE BATALLA SOCIAL, COMO HERRAMIENTA DE ARTICULACIÓN ENTRE EL PUEBLO ORGANIZADO Y EL ESTADO.\n	1298	1	4	12	146
2.3.1.5. AFIANZAR LA CONFORMACIÓN DE LAS COMUNAS SOCIALISTAS, PARA LA CONSOLIDACIÓN DEL PODER POPULAR, DE ACUERDO A LAS CARACTERÍSTICAS DEMOGRÁFICAS DE LOS EJES DE DESARROLLO TERRITORIAL, PARA ALCANZAR 3.000 COMUNAS EL AÑO 2019.\n	1299	1	4	12	146
2.3.1.6. CONFORMAR LAS FEDERACIONES Y CONFEDERACIONES COMUNALES PARA EL FORTALECIMIENTO DE LAS CAPACIDADES CREADORAS DEL PODER POPULAR, EN LOS ÁMBITOS TERRITORIALES, SOCIOPRODUCTIVOS, POLÍTICOS, ECONÓMICOS, SOCIALES, CULTURALES, ECOLÓGICOS Y DE SEGURIDAD Y DEFENSA DE LA SOBERANÍA NACIONAL.\n	1300	1	4	12	146
2.3.1.7. IMPULSAR LA ORGANIZACIÓN COMUNAL DE LOS PUEBLOS INDÍGENAS, GARANTIZANDO LA CONSTITUCIÓN DE 40 COMUNAS INDÍGENAS SOCIALISTAS PARA EL AÑO 2019.\n\n	1301	1	4	12	146
2.3.2.1. DESARROLLAR EL SISTEMA ECONÓMICO COMUNAL CON LAS DISTINTAS FORMAS DE ORGANIZACIÓN SOCIO-PRODUCTIVA: EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, UNIDADES FAMILIARES, GRUPOS DE INTERCAMBIO SOLIDARIO Y DEMÁS FORMAS ASOCIATIVAS PARA EL TRABAJO.\n	1302	1	4	12	147
2.3.2.2. PROMOVER LA CREACIÓN Y FORTALECIMIENTO DE EMPRESAS DE PROPIEDAD SOCIAL DIRECTA, PARA CONTRIBUIR A LA GENERACIÓN DE UN NUEVO TEJIDO PRODUCTIVO DIVERSIFICADO Y SUSTENTABLE PARA LA CONSTRUCCIÓN DEL SOCIALISMO BOLIVARIANO.\n	1303	1	4	12	147
2.3.2.3. DESARROLLAR UNA NUEVA ARQUITECTURA FINANCIERA, CONFIGURANDO REDES DE ORGANIZACIONES ECONÓMICO-FINANCIERAS, QUE GESTIONEN LOS RECURSOS FINANCIEROS Y NO FINANCIEROS, RETORNABLES Y NO RETORNABLES, ADMINISTRADAS POR LAS COMUNIDADES Y DIFERENTES ORGANIZACIONES DEL PODER POPULAR.\n	1304	1	4	12	147
2.3.2.4. FORTALECER EL SISTEMA ECONÓMICO COMUNAL, MEDIANTE PROCESOS DE TRANSFERENCIA DE EMPRESAS DE PROPIEDAD SOCIAL INDIRECTA A INSTANCIAS DEL PODER POPULAR, ASÍ COMO EL FORTALECIMIENTO DE LAS INSTANCIAS DE FINANCIAMIENTO Y LA INTEGRACIÓN DE CADENAS PRODUCTIVAS Y DE VALOR.\n	1305	1	4	12	147
2.3.2.5. CONFORMAR BANCOS COMUNALES QUE PERMITAN CONSOLIDAR LA NUEVA ARQUITECTURA FINANCIERA DEL PODER POPULAR.\n	1306	1	4	12	147
2.3.2.6. PROMOVER LA CONFORMACIÓN DE LOS CONSEJOS DE ECONOMÍA COMUNAL EN LAS COMUNAS Y LOS COMITÉS DE ECONOMÍA COMUNAL EN LOS CONSEJOS COMUNALES.\n	1307	1	4	12	147
2.3.2.7. REGISTRO Y CONFORMACIÓN DE TODAS LAS EMPRESAS DE PROPIEDAD SOCIAL DIRECTA COMUNAL, EMPRESAS DE PROPIEDAD SOCIAL INDIRECTA COMUNAL, UNIDADES PRODUCTIVAS FAMILIARES Y GRUPOS DE INTERCAMBIO SOLIDARIOS EXISTENTES EN EL PAÍS.\n\n	1308	1	4	12	147
2.3.3.1. LOGRAR LA CONSOLIDACIÓN DE UN SISTEMA DE ARTICULACIÓN ENTRE LAS DIFERENTES INSTANCIAS DEL PODER POPULAR, CON EL FIN DE TRASCENDER DE LA ACCIÓN LOCAL AL ÁMBITO DE LO REGIONAL Y NACIONAL, RUMBO A LA CONSTRUCCIÓN DE UN SUBSISTEMA DE COMUNAS, DISTRITOS MOTORES DE DESARROLLO Y EJES DE DESARROLLO TERRITORIAL.\n	1309	1	4	12	148
2.3.3.2. INSTAURAR LA NOCIÓN DE CORRESPONSABILIDAD EN TORNO AL PROCESO DE PLANIFICACIÓN COMUNAL, REGIONAL Y TERRITORIAL PARA IMPULSAR LA PARTICIPACIÓN CORRESPONSABLE DE LA ORGANIZACIÓN POPULAR EN EL ESTUDIO Y ESTABLECIMIENTO DE LOS LINEAMIENTOS Y ACCIONES ESTRATÉGICAS PARA EL DESARROLLO DE PLANES, OBRAS Y SERVICIOS EN LAS COMUNIDADES Y REGIONES.\n	1310	1	4	12	148
2.3.3.4. PROMOVER LA ORGANIZACIÓN DE LAS UNIDADES DE CONTRALORÍA SOCIAL DE LOS CONSEJOS COMUNALES, PARA GARANTIZAR LA MÁXIMA EFICIENCIA DE LAS POLÍTICAS PÚBLICAS.\n	1311	1	4	12	148
2.3.3.5. DESARROLLAR LINEAMIENTOS Y ACCIONES ESTRATÉGICAS PARA LA TRANSFERENCIA DE COMPETENCIAS EN LA GESTIÓN DE PLANES, OBRAS Y SERVICIOS EN LAS COMUNIDADES Y REGIONES.\n\n	1312	1	4	12	148
2.3.4.1. PROMOVER INSTANCIAS ORGANIZATIVAS DEL PODER POPULAR, TALES COMO LOS COMITÉS DE PREVENCIÓN, PROTECCIÓN SOCIAL, DEPORTE Y RECREACIÓN DE LOS CONSEJOS COMUNALES, PARA ATENDER A LA POBLACIÓN EN SITUACIÓN DE VULNERABILIDAD.\n	1313	1	4	12	149
2.3.4.2. DESARROLLAR PLANES INTEGRALES COMUNITARIOS Y POLÍTICAS ORIENTADAS A INCLUIR A LAS PERSONAS EN SITUACIÓN DE VULNERABILIDAD.\n	1314	1	4	12	149
2.3.4.3. FOMENTAR EL EJERCICIO DE LA CONTRALORÍA SOCIAL EN EL ÁMBITO COMUNITARIO COMO GARANTÍA DEL CUMPLIMIENTO DE POLÍTICAS DE INCLUSIÓN SOCIAL.\n	1315	1	4	12	149
2.3.4.5. APLICAR PROGRAMAS DE FORMACIÓN Y DEBATE PERMANENTE EN MATERIA DE PREVENCIÓN SOCIAL CON LA PARTICIPACIÓN DE LOS VOCEROS Y VOCERAS DEL PODER POPULAR.\n	1316	1	4	12	149
2.3.4.6. INCORPORAR AL PODER POPULAR EN LA RECUPERACIÓN Y CREACIÓN DE ESPACIOS PÚBLICOS PARA EL DESARROLLO DE ACTIVIDADES CULTURALES, RECREATIVAS Y PREVENTIVAS, TALES COMO LAS CANCHAS DE PAZ Y OTRAS DE PREVENCIÓN Y RECREACIÓN EN LAS COMUNIDADES.\n	1317	1	4	12	149
2.3.4.7. IMPULSAR LA CREACIÓN Y DESARROLLO DE LAS MESAS COMUNALES DEL SISTEMA NACIONAL DE MISIONES Y GRANDES MISIONES SOCIALISTAS, GARANTIZANDO LA PARTICIPACIÓN DE ORGANIZACIONES DEL PODER POPULAR EN LA GESTIÓN DE LOS PROGRAMAS SOCIALES.\n\n	1318	1	4	12	149
2.3.5.1. DESARROLLAR PROGRAMAS DE FORMACIÓN Y SOCIALIZACIÓN QUE FORTALEZCAN LA CAPACIDAD DE GESTIÓN DEL PODER POPULAR EN COMPETENCIAS QUE LE SEAN TRANSFERIDAS EN LOS ÁMBITOS POLÍTICO, ECONÓMICO, SOCIAL, JURÍDICO Y EN ÁREAS ESTRATÉGICAS PARA EL DESARROLLO NACIONAL.\n	1319	1	4	12	150
2.3.5.2. DESARROLLAR PROGRAMAS PERMANENTES DE FORMACIÓN SOCIOPOLÍTICA Y TÉCNICO-PRODUCTIVA, A TRAVÉS DE LA ESCUELA PARA EL FORTALECIMIENTO DEL PODER POPULAR, ENTRE OTROS ESPACIOS.\n	1320	1	4	12	150
2.3.5.3. INCORPORAR FACILITADORES PROVENIENTES DE LAS DIFERENTES ORGANIZACIONES DEL PODER POPULAR COMO SUJETOS PRINCIPALES EN LOS PROCESOS DE FORMACIÓN.\n	1321	1	4	12	150
2.3.5.4. ESTABLECER ESPACIOS DE FORMACIÓN EN LAS COMUNAS Y SALAS DE BATALLA SOCIAL, GESTIONADOS POR LAS PROPIAS COMUNIDADES, PARA EL APRENDIZAJE Y SOCIALIZACIÓN DE CONOCIMIENTO.\n	1322	1	4	12	150
2.3.5.5. CONTRIBUIR A LA FORMACIÓN TÉCNICO-PRODUCTIVA PARA EL DESARROLLO LOCAL Y EL FORTALECIMIENTO DE LAS CAPACIDADES PRODUCTIVAS DEL PODER POPULAR.	1323	1	4	12	150
2.4.1.1. PRESERVAR LOS VALORES TRADICIONALES DEL PUEBLO VENEZOLANO, DE HONESTIDAD, RESPONSABILIDAD, VOCACIÓN DE TRABAJO, AMOR AL PRÓJIMO, SOLIDARIDAD, VOLUNTAD DE SUPERACIÓN, Y DE LA LUCHA POR LA EMANCIPACIÓN; MEDIANTE SU PROMOCIÓN PERMANENTE Y A TRAVÉS DE TODOS LOS MEDIOS DISPONIBLES, COMO DEFENSA CONTRA LOS ANTIVALORES DEL MODELO CAPITALISTA, QUE PROMUEVE LA EXPLOTACIÓN, EL CONSUMISMO, EL INDIVIDUALISMO Y LA CORRUPCIÓN, Y QUE SON EL ORIGEN DE LA VIOLENCIA CRIMINAL QUE AGOBIA A LA SOCIEDAD VENEZOLANA.\n	1324	1	4	13	151
2.4.1.2. DESARROLLAR UNA BATALLA FRONTAL CONTRA LAS DIVERSAS FORMAS DE CORRUPCIÓN, FORTALECIENDO LAS INSTITUCIONES DEL ESTADO, FOMENTANDO LA PARTICIPACIÓN PROTAGÓNICA DEL PODER POPULAR, PROMOVIENDO LA TRANSPARENCIA Y LA AUTOMATIZACIÓN DE LA GESTIÓN PÚBLICA, ASÍ COMO LOS MECANISMOS LEGALES DE SANCIÓN PENAL, ADMINISTRATIVA, CIVIL Y DISCIPLINARIA CONTRA LAS LESIONES O EL MANEJO INADECUADO DE LOS FONDOS PÚBLICOS.\n	1325	1	4	13	151
2.4.1.4. ADECUAR LOS PLANES DE ESTUDIO EN TODOS LOS NIVELES PARA LA INCLUSIÓN DE ESTRATEGIAS DE FORMACIÓN DE VALORES SOCIALISTAS Y PATRIÓTICOS.\n\n	1326	1	4	13	151
2.4.2.1. AMPLIAR LOS MECANISMOS DE CONTRALORÍA SOCIAL PARA RESGUARDAR LOS INTERESES COLECTIVOS, FOMENTANDO LA NUEVA ÉTICA REVOLUCIONARIA EN EL DESEMPEÑO DE LAS FUNCIONES PÚBLICAS.\n	1327	1	4	13	152
2.4.2.2. MULTIPLICAR LOS MECANISMOS QUE PERMITAN AL PODER POPULAR EJERCER SU CAPACIDAD Y POTESTAD EN LA PREVENCIÓN, VIGILANCIA, SUPERVISIÓN Y ACOMPAÑAMIENTO EN LA GESTIÓN DE LOS FONDOS PÚBLICOS, ORGANISMOS DE LA ADMINISTRACIÓN PÚBLICA Y EN LAS MISMAS INSTANCIAS DEL PODER POPULAR.\n	1328	1	4	13	152
2.4.2.3. DESARROLLAR JORNADAS Y PROCEDIMIENTOS DE INTERPELACIÓN POPULAR SOBRE LA GESTIÓN DE LOS SERVIDORES PÚBLICOS.	1329	1	4	13	152
2.5.3.6. SUPRIMIR LOS REQUERIMIENTOS INNECESARIOS EXIGIDOS A LOS CIUDADANOS Y CIUDADANAS PARA LA REALIZACIÓN DE TRÁMITES ADMINISTRATIVOS, A TRAVÉS DE LA MASIFICACIÓN DE TECNOLOGÍAS Y UNIFICACIÓN DE CRITERIOS, ERRADICANDO DEFINITIVAMENTE LA ACTIVIDAD DE LOS GESTORES.\n\n	1330	1	4	14	155
2.5.3.5. IMPULSAR MECANISMOS DE CONTROL Y SANCIÓN; POLÍTICOS, ADMINISTRATIVOS Y PENALES, SEGÚN SEA EL CASO, PARA LOS SERVIDORES PÚBLICOS QUE INCURRAN EN HECHOS DE CORRUPCIÓN U OTRAS CONDUCTAS Y HECHOS SANCIONADOS POR LAS LEYES.\n	1331	1	4	14	155
\.


--
-- Name: objetivo_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('objetivo_general_id_seq', 1, false);


--
-- Data for Name: objetivo_historico; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY objetivo_historico (objetivo_historico, id, plan_patria) FROM stdin;
I. DEFENDER, EXPANDIR Y CONSOLIDAR EL BIEN MÁS PRECIADO QUE HEMOS RECONQUISTADO DESPUÉS DE 200 AÑOS: LA INDEPENDENCIA NACIONAL.	3	1
II. CONTINUAR CONSTRUYENDO EL SOCIALISMO BOLIVARIANO DEL SIGLO XXI, EN VENEZUELA, COMO ALTERNATIVA AL SISTEMA DESTRUCTIVO Y SALVAJE DEL CAPITALISMO Y CON ELLO ASEGURAR "LA MAYOR SUMA DE FELICIDAD POSIBLE,LA MAYOR SUMA DE SEGURIDAD SOCIAL Y LA MAYOR SUMA DE ESTABILIDAD" POLÍTICA PARA NUESTRO PUEBLO.	4	1
III. CONVERTIR A VENEZUELA EN UN PAÍS POTENCIA EN LO SOCIAL, LO  ECONÓMICO Y LO POLÍTICO DENTRO DE LA GRAN POTENCIA NACIENTE DE AMÉRICA LATINA Y EL CARIBE, QUE GARANTICEN LA CONFORMACIÓN DE UNA ZONA DE PAZ EN NUESTRA AMÉRICA.	5	1
IV. CONTRIBUIR AL DESARROLLO DE UNA NUEVA GEOPOLÍTICA INTERNACIONAL EN LA CUAL TOME CUERPO EL MUNDO MULTICÉNTRICO Y PLURIPOLAR QUE PERMITA LOGRAR EL EQUILIBRIO DEL UNIVERSO Y GARANTIZAR LA PAZ PLANETARIA EN EL PLANETA.	6	1
V. CONTRIBUIR CON LA PRESERVACIÓN DE LA VIDA EN EL PLANETA Y LA SALVACIÓN DE LA ESPECIE HUMANA.	7	1
\.


--
-- Name: objetivo_historico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('objetivo_historico_id_seq', 5, true);


--
-- Data for Name: objetivo_nacional; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY objetivo_nacional (objetivo_nacional, id, plan_patria, objetivo_historico) FROM stdin;
1.1. GARANTIZAR LA CONTINUIDAD Y CONSOLIDACIÓN DE LA REVOLUCIÓN BOLIVARIANA.	3	1	3
5.2. PROTEGER Y DEFENDER LA SOBERANÍA PERMANENTE DEL ESTADO SOBRE LOS RECURSOS NATURALES PARA EL BENEFICIO SUPREMO DE NUESTRO PUEBLO, QUE SERÁ SU PRINCIPAL GARANTE.	24	1	7
5.3. DEFENDER Y PROTEGER EL PATRIMONIO HISTÓRICO Y CULTURAL VENEZOLANO Y NUESTROAMERICANO.	25	1	7
1.2. PRESERVAR Y CONSOLIDAR LA SOBERANÍA SOBRE LOS RECURSOS PETROLEROS Y DEMÁS RECURSOS NATURALES ESTRATÉGICOS.	4	1	3
1.3. GARANTIZAR EL MANEJO SOBERANO DEL INGRESO NACIONAL.	5	1	3
1.4. LOGRAR LA SOBERANÍA ALIMENTARIA PARA GARANTIZAR EL SAGRADO DERECHO A LA ALIMENTACIÓN DE NUESTRO PUEBLO.	6	1	3
1.5. DESARROLLAR NUESTRAS CAPACIDADES CIENTÍFICO-TECNOLÓGICAS VINCULADAS A LAS NECESIDADES DEL PUEBLO.	7	1	3
1.6. FORTALECER EL PODER DEFENSIVO NACIONAL PARA PROTEGER LA INDEPENDENCIA Y LA SOBERANÍA NACIONAL, ASEGURANDO LOS RECURSOS Y RIQUEZAS DE NUESTRO PAÍS PARA LAS FUTURAS GENERACIONES.	8	1	3
1.7. ADECUAR EL APARATO ECONÓMICO PRODUCTIVO, LA INFRAESTRUCTURA Y LOS SERVICIOS DEL ESTADO INCREMENTANDO LA CAPACIDAD DE RESPUESTA A LAS NECESIDADES DEL PUEBLO ANTE POSIBLES ESTADOS DE EXCEPCIÓN EN EL MARCO DE LA DEFENSA INTEGRAL DE LA NACIÓN.	9	1	3
2.1. PROPULSAR LA TRANSFORMACIÓN DEL SISTEMA ECONÓMICO, EN FUNCIÓN DE LA TRANSICIÓN AL SOCIALISMO BOLIVARIANO, TRASCENDIENDO EL MODELO RENTISTA PETROLERO CAPITALISTA HACIA EL MODELO ECONÓMICO PRODUCTIVO SOCIALISTA, BASADO EN EL DESARROLLO DE LAS FUERZAS PRODUCTIVAS.	10	1	4
2.2. CONSTRUIR UNA SOCIEDAD IGUALITARIA Y JUSTA.	11	1	4
2.3. CONSOLIDAR Y EXPANDIR EL PODER POPULAR Y LA DEMOCRACIA SOCIALISTA.	12	1	4
2.4. CONVOCAR Y PROMOVER UNA NUEVA ORIENTACIÓN ÉTICA, MORAL Y ESPIRITUAL DE LA SOCIEDAD, BASADA EN LOS VALORES LIBERADORES DEL SOCIALISMO.	13	1	4
2.5. LOGRAR LA IRRUPCIÓN DEFINITIVA DEL NUEVO ESTADO DEMOCRÁTICO Y SOCIAL, DE DERECHO Y DE JUSTICIA.	14	1	4
3.1  CONSOLIDAR EL PAPEL DE VENEZUELA COMO POTENCIA ENERGÉTICA MUNDIAL.	15	1	5
3.2. DESARROLLAR EL PODERÍO ECONÓMICO EN BASE AL APROVECHAMIENTO ÓPTIMO DE LAS POTENCIALIDADES QUE OFRECEN NUESTROS RECURSOS PARA LA GENERACIÓN DE LA MÁXIMA FELICIDAD DE NUESTRO PUEBLO, ASÍ COMO DE LAS BASES MATERIALES PARA LA CONSTRUCCIÓN DE NUESTRO SOCIALISMO BOLIVARIANO.	16	1	5
3.3. AMPLIAR Y CONFORMAR EL PODERÍO MILITAR PARA LA DEFENSA DE LA PATRIA.	17	1	5
3.4. PROFUNDIZAR EL DESARROLLO DE LA NUEVA GEOPOLÍTICA NACIONAL.	18	1	5
4.1  CONTINUAR DESEMPEÑANDO UN PAPEL PROTAGÓNICO EN LA CONSTRUCCIÓN DE LA UNIÓN LATINOAMERICANA Y CARIBEÑA.	19	1	6
4.2. AFIANZAR LA IDENTIDAD NACIONAL Y NUESTROAMERICANA.	20	1	6
4.3. CONTINUAR IMPULSANDO EL DESARROLLO DE UN MUNDO MULTICÉNTRICO Y PLURIPOLAR SIN DOMINACIÓN IMPERIAL Y CON RESPETO A LA AUTODETERMINACIÓN DE LOS PUEBLOS.	21	1	6
4.4. DESMONTAR EL SISTEMA NEOCOLONIAL DE DOMINACIÓN IMPERIAL.	22	1	6
5.1. CONSTRUIR E IMPULSAR EL MODELO ECONÓMICO PRODUCTIVO ECO-SOCIALISTA, BASADO EN UNA RELACIÓN ARMÓNICA ENTRE EL HOMBRE Y LA NATURALEZA, QUE GARANTICE EL USO Y APROVECHAMIENTO RACIONAL, ÓPTIMO Y SOSTENIBLE DE LOS RECURSOS NATURALES, RESPETANDO LOS PROCESOS Y CICLOS DE LA NATURALEZA.	23	1	7
5.4. CONTRIBUIR A LA CONFORMACIÓN DE UN GRAN MOVIMIENTO MUNDIAL PARA CONTENER LAS CAUSAS Y REPARAR LOS EFECTOS DE CAMBIO CLIMÁTICO QUE OCURREN COMO CONSECUENCIA DEL MODELO CAPITALISTA DEPREDADOR.	26	1	7
\.


--
-- Name: objetivo_nacional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('objetivo_nacional_id_seq', 126, true);


--
-- Data for Name: observaciones_acciones; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY observaciones_acciones (id, organo, id_accion, revisado, estructura, observaciones, estatus, fecha_elaboracion, cierre, ano_fiscal) FROM stdin;
2	71	13	71	01-08-01-00	SIN OBSERVACIONES	4	2016-05-02	1	2016
1	76	4	76	01-04-07-00	SIN OBSERVACIÓN	4	2016-05-02	1	2016
3	53	47	53	01-07-00-00	SIN OBSERVACIONES	4	2016-05-02	1	2016
4	53	48	53	01-07-00-00	SIN OBSERVACIONES	4	2016-05-02	1	2016
5	75	7	75	01-17-00-00	SIN OBSERVACIONES	4	2016-05-10	1	2016
6	75	10	75	01-17-00-00	SIN OBSERVACIONES	4	2016-05-10	1	2016
7	74	11	74	01-13-00-00	SIN OBSERVACIONES	4	2016-05-16	1	2016
8	74	12	74	01-13-00-00	SIN OBSERVACIÓN	4	2016-05-16	1	2016
9	70	14	70	01-07-03-00	SIN OBSERVACIÓN	4	2016-05-16	1	2016
10	70	15	70	01-07-03-00	SIN OBSERVACIÓN	4	2016-05-16	1	2016
11	68	16	68	02-01-02-00	SIN OBSERVACIÓN	4	2016-05-16	1	1
12	68	16	68	02-01-02-00	SIN OBSERVACIÓN	4	2016-05-16	1	1
13	68	17	68	02-01-02-00	SIN OBSERVACIÓN	4	2016-05-16	1	2016
14	67	19	67	13-01-02-00	SIN OBSERVACIÓN	4	2016-05-30	1	2016
15	67	18	67	13-01-02-00	SIN OBSERVACIONES	4	2016-05-30	1	2016
16	66	20	66	12-01-02-00	SIN OBSERVACIONES	4	2016-05-31	1	2016
17	66	21	66	12-01-02-00	SIN OBSERVACION	4	2016-05-31	1	1
18	65	22	65	11-01-06-00	SIN OBSERVACIÓN	4	2016-05-31	1	2016
19	64	23	64	13-05-00-00	SIN OBSERVACIÓN	4	2016-05-31	1	2016
20	64	24	64	13-05-00-00	SIN OBSERVACION	4	2016-05-31	1	2016
21	63	25	63	04-01-00-00	SIN  OBSERVACIONES	4	2016-06-13	1	2016
22	62	26	62	13-04-00-00	SIN OBSERVACIONES	4	2016-06-13	1	2016
23	62	27	62	13-04-00-00	SIN OBSERVACIONES	4	2016-06-13	1	2016
24	61	28	61	12-01-00-00	SIN OBSERVACIONES	4	2016-06-13	1	2016
25	60	30	60	13-01-00-00	SIN OBSERVACION	4	2016-06-13	1	2016
26	60	31	60	13-01-00-00	SIN OBSERVACION	4	2016-06-13	1	2016
27	59	32	59	01-10-00-00	SIN OBSERVACIÓN 	4	2016-06-13	1	2016
28	59	33	59	01-10-00-00	SIN OBSERVACION	4	2016-06-13	1	2016
29	58	34	58	02-01-00-00	SIN OBSERVACION	4	2016-06-13	1	2016
30	58	35	58	02-01-00-00	SIN OBSERVACIÓN	4	2016-06-13	1	2016
31	57	36	57	01-06-00-00	SIN OBSERVACIÓN	4	2016-06-14	1	2016
32	57	37	57	01-06-00-00	SIN OBSERVACIONES	4	2016-06-14	1	2016
33	56	40	56	02-04-00-00	SIN OBSERVACIONES	4	2016-06-14	1	2016
34	56	42	56	02-04-00-00	SIN OBSERVACIONES	4	2016-06-14	1	1
35	42	62	42	01-04-01-00	SIN OBSERVACIONES	4	2016-06-16	1	2016
\.


--
-- Name: observaciones_acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('observaciones_acciones_id_seq', 35, true);


--
-- Data for Name: observaciones_acciones_proy; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY observaciones_acciones_proy (id, organo, id_accion, revisado, estructura, observaciones, estatus, fecha_elaboracion, cierre, ano_fiscal) FROM stdin;
\.


--
-- Name: observaciones_acciones_proy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('observaciones_acciones_proy_id_seq', 1, false);


--
-- Data for Name: organos_entes; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY organos_entes (user_create, user_update, nom_ins, siglas, tipo_ins, tipo_estructura, nom_resp, cedula, tlf, cargo, sector, correo, direccion, id) FROM stdin;
\N	\N	DIRECCIÓN DE RECURSOS HUMANOS	GBARRHH	4	2	MANUEL VIVAS	14401555	(0243) 237-8011	DIRECTOR DE RECURSOS HUMANOS	1	coordpresupuestorrhh@gmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA, EDIFICIO CORPOINDUSTRIA PISO 3	16
\N	\N	DIRECCIÓN DE INFORMACIÓN, PRENSA Y RELACIONES PÚBLICAS	DIPRP	4	2	MARBELLIS LINARES	16203831	(0243) 233-6413	DIRECTORA	1	cherilobrien@hotmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA, EDIFICIO CORPOINDUSTRIA PISO 7	15
\N	\N	DESPACHO DEL GOBERNADOR	SDESPACHO	4	2	JOSELIT RAMIREZ	17664322	(0416) 646-2126	SECRETARIO DE DESPACHO	1	ramirezjoselit@gmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA, EDIFICIO CORPOINDUSTRIA PISO 7	14
\N	\N	CUERPO DE BOMBEROS Y BOMBERAS Y ADMINISTRACIÓN DE EMERGENCIAS DE CARÁCTER CIVIL	CBEA	1	2	OSCAR ROMERO	9686251	(0243) 235-9687	PRIMER COMANDANTE	2	BOMBEROSARAGUA@HOTMAIL.COM	PROLONGACION DE LA AVENIDA ARAGUA FRENTE AL PARQUE METROPOLITANO CUARTEL CENTRAL DE BOMBEROS	13
\N	\N	CONTRALORÍA GENERAL DEL ESTADO ARAGUA	CDEA	1	1	JULIO CESAR TERAN CAÑIZALES	11611764	(0243) 232-8609	CONTRALOR	1	contraloriadearagua.@hotmail.com	CALLE PÁEZ ESTE, ENTRE BRIÓN Y BERMÚDEZ AL LADO DEL CONSEJO LEGISLATIVO, EN LA CIUDAD DE MARACAY, ESTADO ARAGUA.	12
\N	\N	CONSULTORÍA JURÍDICA DEL GOBIERNO BOLIVARIANO DE ARAGUA	CJGBA	4	2	FELIPE CONTRERAS	11314203	(0243) 233-6320	CONSULTOR JURÍDICO	1	consultoriajuridica.gobaragua@hotmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA, EDIFICIO CORPOINDUSTRIA PISO 6	11
\N	\N	CENTRO DE CAPACITACIÓN DEL CONSTRUCTOR POPULAR	CCCP	2	6	(G/D) RAMON JESUS VIÑAS GARCIA	7011445	(0243) 234-1364	DIRECTOR GENERAL	11	planificacionsacccp@gmail.com	AV. 15 CON AV. 8/CALLE CARLOS BLACK, EL PIÑONAL, POLIGONAL 28, CASA DEL PODER POPULAR, MARACAY	7
\N	\N	CONSEJO LEGISLATIVO DEL ESTADO ARAGUA	CLEA	1	1	SUMIRE FERRARA	11182340	(0243) 232-4921	PRESIDENTA	1	despachoclea@gmail.com	CALLE PAEZ/ BERMUDEZ Y BRION MARACAY	10
\N	\N	CENTRO RECREACIONAL PARQUE CARLOS RAÚL VILLANUEVA	FRCRV	2	6	JOSE CALZADILLA	14455960	(0424) 306-4388	DIRECTOR	6	presupuestofrcrv@hotmail.com	AV. ROTARIA URB. CANTA RANA, AL LADO DE HOTEL MARACAY	9
\N	\N	ASOCIACIÓN CIVIL BIBLIOTECAS VIRTUALES DE ARAGUA	BVA	2	6	PABLO JOSE GUZMAN	9682691	(0412) 241-1737	PRESIDENTE	1	pmguzman@gmail.com	AV. SUCRE COMPLEJO CULTURAL SANTOS MICHELENA EDIFICIO BIBLIOTECAS VIRTUALES	6
\N	\N	CENTRO DE INVESTIGACIÓN Y CAPACITACIÓN TECNOLÓGICA SOCIALISTA DEL ESTADO ARAGUA	CINCATESA	3	6	LCDO. DANIEL FRANCISCO PERDOMO BRICEÑO	14983882	(0244) 322-5530	PRESIDENTE	5	cincatesa.presidencia@gmail.com	AV. BICENTENARIA CRUCE CON AV.PRINCIPAL VISTA HERMOSA, LA VICTORIA EDO. ARAGUA	8
\N	\N	ASOCIACIÓN CIVIL ARAGUA FC CLUB DE FÚTBOL Y FÚTBOL SALA	SCAFC	2	2	G/B DOUGLAS BALLESTERO	9148203	(0243) 553-1562	PRESIDENTE	1	dangonzalezm12@gmail.com	CALLE CAMPO ELIAS ESTADIOS HERMANOS GHERSI SECTOR LA DEMOCRACIA	5
\N	\N	ARCHIVO GENERAL DEL ESTADO ARAGUA	AGE	1	2	GERARDO SALAZAR	13869183	(0416) 312-3218	JEFE DE ARCHIVO GENERAL DEL ESTADO ARAGUA	1	archivo_general_del_estado@hotmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA, EDIFICIO CORPOINDUSTRIA	4
\N	\N	ARAGUEÑA DE MOTOS AVA	MOTOAVA	3	5	PATRICIA GRIFFIN	17374254	(0414) 052-9158	PRESIDENTA	5	patriciagriffinm@gmail.com	SAN VICENTE CALLE ANTON PHILLIS	3
\N	\N	ARAGUA MINAS Y CANTERAS (ARAMICA S.A.)	ARAMICA	3	6	PEDRO MALDONADO	13207446	(0243) 247-0233	PRESIDENTE	4	planificacion.aramica@gmail.com	CALLE YARACUY C/C AV. MARIÑO SUR SECTOR SAN IGNACIO MARACAY	2
\N	\N	ALIMENTOS ARAGUA SOCIALISTA S.A	ALAS	3	6	DOUGLAS BALLESTERO	9148203	(0243) 269-3512	PRESIDENTE	4	presidenciaalasaragua@gmail.com	AV. INTERCOMUNAL TURMERO LA MORITA	1
\N	\N	CONSTRUCCIONES ARAGUA, S.A.	CONSTRUA	3	6	ADNAN EL MAAZ- EL MAAZ	10786509	(0424) 309-8012	PRESIDENTE	11	construaragua13@gmail.com	BARRIO LIBERTAD, CALLE EL SAMÁN C/C CALLE SAN JOSÉ, S/N	17
\N	\N	CORPORACIÓN DE SALUD DEL ESTADO ARAGUA	CORPOSALUD	2	6	MERQUISEDEC PEREZ	12854535	(0412) 757-2458	DIRECTORA PLANIFICACIÓN Y PRESUPUESTO	12	dppcorposaludaragua@hotmail.com	AV. LAS DELICIAS, FRENTE AL CIRCULO MILITAR	18
\N	\N	DIRECCIÓN DE TECNOLOGÍA Y SISTEMAS	DTS	4	2	LUIS MEDINA	14712283	(0243) 233-6655	DIRECTOR	1	wvargas@aragua.gob.ve	AV. LAS DELICIAS C/C AGUSTIN ZERPA, EDIF. CORPOINDUSTRIA PISO 4 ALA ESTE 	19
\N	\N	FONDO PARA EL DESARROLLO ECONÓMICO Y SOCIAL DEL ESTADO ARAGUA	FONDESA	2	6	SAIRIS COROMOTO ESPINOZA GOMEZ	7786391	(0243) 247-5262	DIRECTORA	5	sespinoza.fondesa@gmail.com	AV. MARIÑO SUR, CENTRO EMPRESARIAL UNIARAGUA PB, LOCAL 11 MARACAY ESTADO ARAGUA.	20
\N	\N	FUNDACIÓN ARAGUA REBELDE	FAR	2	6	YOLANDA CARMONA	6147273	(0416) 543-3730	PRESIDENTA	9	yolanaa24@gmail.com	AV BOLIVAR PARQUE DE FERIA DE SAN JACINTO	21
\N	\N	FUNDACIÓN A TODA VIDA ARAGUA	FATVA	2	6	REINALDO HIDALGO	9513609	(0424) 101-4780	PRESIDENTE	2	jfatodavida@gmail.com	AV. SUCRE, BVA, SEDE DE MISIÓN A TODA VIDA ARAGUA	22
\N	\N	FUNDACIÓN DE PARQUES ARAGUA	FUNDAPARQU	2	6	BERENICE BERNAL	13991764	(0243) 237-7609	PRESIDENTA	2	s.proteccionambientalaragua@gmail.com	SEDE GOBERNACIÓN EDO. ARAGUA, PISO 06 SECRETARIA AMBIENTE (SSPPPOTA)	23
\N	\N	FUNDACIÓN FONDO EDITORIAL LETRAS DE ARAGUA	FFELA	2	6	YOMAR MELÉNDEZ	11089872	(0426) 515-8923	PRESIDENTE	1	ffeletrasdearagua@gmail.com	AVENIDA LAS DELICIAS DE MARACAY, EDIFICIO GOBERNACIÓN, PISO 7	24
\N	\N	FUNDACIÓN ORQUESTA JUVENIL E INFANTIL DEL ESTADO ARAGUA	FOJIA	2	6	CESAR RANGEL	11652125	(0243) 232-2460	PRESIDENTE	9	ymendez@fundamusical.org.ve	AV. 19 DE ABRIL. COMPLEJO CULTURAL SANTOS MICHELENA. EDIF. 3 Y 4 MARACAY EDO. ARAGUA	25
\N	\N	FUNDACIÓN ORQUESTA SINFÓNICA DE ARAGUA	OSA	2	6	PROF. WILFREDO ANGULO	10110306	(0424) 314-7130	PRESIDENTE JUNTA DIRECTIVA	9	villamizarcontreras@gmail.com	AV. LAS DELICIAS URBANIZACIÓN CANTARRANA HOTEL MARACAY	26
\N	\N	FUNDACIÓN PARA EL DESARROLLO DEL ESTADO ARAGUA	FUNDARAGUA	2	6	ROMMER CONDERO	9679472	(0243) 711-0671	PRESIDENTE	1	fundaragua@gmail.com	AV. ROTARIA EDF. HOTEL DE GOL MARACAY PISO PB URB/ CONTARRANA 	27
\N	\N	FUNDACIÓN REGIONAL EL NIÑO SIMÓN ARAGUA	FRNSA	2	6	RODAINA AAMER	16512363	(0243) 234-7477	PRESIDENTA	13	comunicacionesfrnsa@gmail.com	AV, CONSTITUCIÓN, SEDE DE FRNSA, URB. SAN JACINTO, MARACAY EDO. ARAGUA	28
\N	\N	FUNDACIÓN SISTEMA BOLIVARIANO DE TELEVISIÓN DE ARAGUA	FSBTA	2	6	JESUS ESTEBAN TRAPIELLO	416907	(0243) 233-3250	PRESIDENTE	1	telearagua@gmail.com	CENTRO COMERCIAL LA CAPILLA II NIVEL PB LOCAL 6 SECTOR EL CENTRO. MARACAY ARAGUA	30
\N	\N	INDUSTRIA TECNOLÓGICA ARAWAK 	ARAWAK	3	2	LUCAS MORENO	11687651	(0243) 237-2099	PRESIDENTE	5	arawaksecretaria@gmail.com	SAN VICENTE II CONGLOMERADO MANUEL OLIVARES BETANCOURT GALPON A1  CALLE F MARACAY ARAGUA	31
\N	\N	NSTITUTO ARAGÜEÑO DE LA JUVENTUD	INSAJUV	2	6	DANIEL PERDOMO	1498388	(0426) 138-7619	DIRECTOR	13	danieljpsuv@hotmail.com	CALLE 3, PARQUE ARAGUA. EDIF. "INSAJUV" 	32
\N	\N	INSTITUTO AUTÓNOMO DE TURISMO DEL ESTADO ARAGUA	IATUR	2	6	BERENICE BERNAL	13991764	(0243) 242-2284	PRESIDENTA	6	iaturaragua1@hotmail.com	AVENIDA LAS DELICIAS FINAL URBANIZACIÓN CANTARRANA HOTEL MARACAY	33
\N	\N	INSTITUTO AUTONÓMO PARA EL DESARROLLO DE LAS COSTAS DE ARAGUA	COSTARAG	2	2	ROMMER CORDERO	9679472	(0243) 241-7420	PRESIDENTE	1	costaraguagob@gmail.com	MUNICIPIO GIRARDOT	34
\N	\N	INSTITUTO AUTÓNOMO PARA EL DESARROLLO DEL MUNICIPIO MARIO BRICEÑO IRAGORRY	IADMBI	2	6	ING. NESTOR CALDERA	12123456	(0416) 468-3845	PRESIDENTE	1	iadmbi@gmail.com	AV PRINCIPAL LOCAL SSPP CARLOS ESCARRA SECTOR 11 UD 15 CAÑA DE AZUCAR	35
\N	\N	INSTITUTO AUTONÓMO PARA EL DESARROLLO DEL MUNICIPIO SAN SEBASTIÁN	IADMSS	2	6	FELIX ROMERO	20587641	(0416) 541-6546	PRESIDENTE	1	iadmss1585@gmail.com	SAN SEBASTIAN DE LOS REYES	36
\N	\N	INSTITUTO DE CULTURA ARAGUA	ICA	2	6	GUAQUIRIMA CASTRO	17366198	(0243) 233-3423	PRESIDENTA	9	plancultura2013@gmail.com	AVENIDA 19 DE ABRIL COMPLEJO CULTURAL SANTOS MICHELENA	37
\N	\N	INSTITUTO DE LA MUJER  DE ARAGUA	IMA	2	6	MAIGUALIDA GUTIÉRREZ	7191862	(0243) 247-4722	PRESIDENTA	13	institutodelamujeraragua@gmail.com	AVENIDA BOLÍVAR OESTE C/C CARABOBO	38
\N	\N	INSTITUTO DE LA POLICÍA DEL ESTADO ARAGUA	INPOARAGUA	2	5	COMISIONADO JEFE (CPNB) EULISES MANUEL FARIAS VALDERRAMA	6293224	(0412) 670-0986	DIRECTOR GENERAL	2	directorgeneral.2011@gmail.com	AV. CONSTITUCIÓN ESTE EDIF EST. CENTRAL ANTONIO JOSÉ DE SUCRE	39
\N	\N	INSTITUTO OFICIAL DE BENEFICIENCIA PÚBLICA Y ASISTENCIA SOCIAL LOTERIA DE ARAGUA	IOBPASL	3	6	CHAMEL MOUSAFFI	12609870	(0243) 234-8735	DIRECTOR GENERAL	13	loteriadearagua@hotmail.com	AVENIDA FUERZAS AEREAS EDIFICIO 71 LOTERIA DE ARAGUA AL LADO CENTRO MÉDICO SAN JOSÉ	41
\N	\N	INSTITUTO REGIONAL DEL DEPORTE DE ARAGUA	IRDA	2	6	CARLOS GUILLEN	11989851	(0243) 554-1368	PRESIDENTE	1	planificacionypresupuestoirda@gmail.com	AV. MARACAIBO C/C CALLE CAMPO ELIAS EDIFICIO IRDA	42
\N	\N	OFICINA DE TRANSFERENCIA ESTADO PODER POPULAR	TEPP	1	2	TULIO FEBRES CARBONELL	16201356	(0243) 233-3268	DIRECTOR (E)	1	tep.transferencia@gmail.com	AV ALVAREZ ZERPA, C/C LAS DELICIAS, ANTIGUA SEDE CORPOINDUSTRIA PISO 5 ALA ESTE	43
\N	\N	PROCURADURÍA GENERAL DEL ESTADO 	PGEA	1	2	CLELIA PEREZ	14959441	(0243) 232-7103	PROCURADORA GENERAL DEL ESTADO BOLIVARIANO DE ARAG	1	procuraduriaaragua@hotmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA,  EDIFICIO CORPOINDUSTRIA PISO 5	44
\N	\N	PROVEEDURÍA SOCIALISTA DEL TRANSPORTE ARAGÜEÑO S.A	PSTA	3	6	LUIS CARABALLO	12123456	(0244) 555-2233	PRESIDENTE	5	proveeduriasocialista2013@gmail.com	AV. INTERCOMUNAL MARACAY-TURMERO, LOCAL: HYPERBARATO, LOCAL: S/N	45
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA EL COMERCIO Y DESARROLLO ECONÓMICO	SEDEC	1	2	YSMEL ROMER SERRANO FLOREZ	13148780	(0426) 445-8206	SECRETARIO	5	sedec.aragua@gmail.com	CALLE BOYACA C/C LIBERTAD SECTOR CENTRO MARACAY.	47
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA EL DESARROLLO AGRARIO	SSPPDA	1	2	LUISIANA JOSEFINA PALACIOS PAREDES	12928053	(0426) 531-1761	SECRETARIA DE DESARROLLO AGRARIO	3	secretaria.agrario@gmail.com	EDIFICIO GOBERNACION NIVEL MEZZANINA	48
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA EL DESARROLLO CIENTÍFICO Y TECNOLÓGICO	SSDCT	1	2	PABLO JOSÉ GUZMAN	9682691	(0412) 241-1737	SECRETARIO	10	pmguzman@gmail.com	AV SUCRE COMPLEJO CULTURAL SANTOS MICHELENA EDF. BIBLIOTECA VIRTUAL PISO 2	49
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA EL TURISMO	SSPPT	1	2	BERENICE BERNAL IRIBARREN	13991764	(0416) 646-2112	SECRETARIA	6	bernal.berenice@gmail.com	FINAL AVENIDA ROTARIA ENTRE AVENIDA LAS DELICIAS Y PROLONGACIÓN DE LA SUCRE, HOTEL GOLF MARACAY	50
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA CULTURA	SSPPPC	1	6	GUAIQUIRIMA CASTRO	17366198	(0243) 233-3954	SECRETARIA SECTORIAL DE CULTURA	9	plancultura2013@gmail.com	AVENIDA 19 DE ABRIL, COMPLEJO CULTURAL SANTOS MICHELENA, MARACAY	51
\N	\N	SECRETARÍA  SECTORIAL DEL PODER POPULAR PARA LA EDUCACIÓN	SSPPEA	1	2	LEONARDO ALVARADO	12611998	(0243) 232-7182	SECRETARIO	8	planificacion.ssppea@gmail.com	AV  ZERPA,  C/C LAS DELICIAS  EDIF CORPOINDUSTRIA PISO 2 	52
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA  HACIENDA, ADMINISTRACIÓN Y FINANZAS	SSPPHAF	1	2	NEUDY FIGUERA	14327652	(0243) 233-0802	SECRETARIA	1	neudynanezka@hotmail.com	AV. AGUSTIN ALVAREZ ZERPA ANTIGUA EDIF. CORPOINDUSTRIA PISO 4 ALA OESTE	53
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA INFRAESTRUCTURA Y EL DESARROLLO URBANÍSTICO	SSPPIDU	1	6	ADNAN EL MAAZ EL MAAZ	10786509	(0243) 233-6576	SECRETARIO	11	controldegestiona.c@gmail.com	AV LAS DELICIAS. EDIF CONRPOINDUSTRIA PISO 5 ALA OESTE	54
\N	\N	SECRETARIA SECTORIAL DEL PODER POPULAR PARA LA PLANIFICACIÓN, PRESUPUESTO Y CONTROL DE GESTIÓN	SSPPPPCG	1	2	CESAR OTERO DUNO	7174407	(0414) 455-6757	SECRETARIO	1	SPPPPCG@GMAIL.COM	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA,  EDIFICIO CORPOINDUSTRIA  PISO 4	57
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA JUVENTUD	SSPPJ	1	2	JESUS PEREZ	16537822	(0243) 232-1431	SECRETARIO	13	chuyvzla4f@gmail.com	URB PARQUE ARAGUA CALLE 3 EDIF INSAJUV	55
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA MISIÓN A TODA VIDA ARAGUA	SFATVA	1	2	REINALDO HIDALGO	9513609	(0424) 010-4780	SECRETARIO	2	secretariatecnica.reynaldo@gmail.com	AV ALVAREZ ZERPA C/C LAS DELICIAS ANTIGUA SEDE CORPOINDUSTRIA ALA ESTE, MARACAY	56
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA PREVENCIÓN Y SEGURIDAD CIUDADANA	SSPPPSC	1	6	JUAN ERNESTO SULBARAN QUINTERO	10915206	(0243) 237-7410	SECRETARIO	2	seguridadciudadana.aragua@gmail.com	EDIFICIO GOBERNACIÓN ANTIGUO CORPOINDUSTRIA. AV. LAS DELICIAS	58
\N	\N	SECRETARÍA  SECTORIAL DEL PODER POPULAR PARA LA PROTECCIÓN AMBIENTAL Y EL ORDENAMIENTO TERRITORIAL	SSPAOT	1	2	EDWARDS V. CASTILLO R.	6355303	(0416) 907-0144	SECRETARIO	1	s.proteccionambientalaragua@gmail.com	AV. AGUSTIN SERPA, EDIF CORPOINDUSTRIA PISO 6	59
\N	\N	SECRETARÍA GENERAL DE GOBIERNO	SGG	1	2	CARYL LYNN BERTHO DE ACOSTA	8943716	(0243) 246-1492	SECRETARIA DE GOBIERNO	1	gobiernodeAragua@gmail.com	AV AGUSTIN ZERPA,  AV LAS DELICIAS, ANTIGUO EDIF. CORPOINDUSTRIA PISO 6 ALA ESTE	46
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA MINAS Y CANTERAS	SSPPMC	1	3	PEDRO MALDONADO	13207446	(0243) 247-0233	SECRETORIO SECTORIAL	4	secretariademinas@gmail.com	AV. MARINO SUR C/C CALLE YARACUY, N°201, SAN IGNACIO	63
\N	\N	SERVICIO AUTÓNOMO BOLIVARIANO AEROPUERTO DE ARAGUA TACARIGUA	SABAAT	2	6	VICTOR JULIO PALENCIA ALARCON	3844651	(0414) 443-0520	DIRECTOR GENERAL	11	atacarigua@gmail.com	CARRETERA NACIONAL MARACAY-MARIARA	65
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA PROTECCIÓN Y DESARROLLO SOCIAL	SSPDS	1	3	KATIANA HERNÁNDEZ	0000000	(0243) 233-5534	SECRETARIA SECTORIAL	13	desarrollosocialplanificacion@hotmail.com	AV. JOSÉ ATONIOPÁEZ EDIF.CORPOINDUSTRIA PISO 3 	60
\N	\N	SERVICIO AUTÓNOMO  DE GERIATRÍA Y GERONTOLOGÍA	SAGER	2	6	ABOG. VANESSA PACIFICO	17366944	(0243) 232-3630	DIRECTORA	12	de.sager@gmail.com	AVENIDA BOLÍVAR ESTE, EDIF HOSPITAL DE DIA DR. CORNELIO VEGAS. MARACAY.	66
\N	\N	SERVICIO AUTÓNOMO DE PROTECCIÓN Y ATENCIÓN DE NIÑOS, NIÑAS Y ADOLESCENTES DE ARAGUA	SAPANNA	2	6	MIGUEL ANGEL JIMENEZ RIVAS	6400460	(0416) 543-5160	DIRECTOR GENERAL	13	injuba@gmail.com	SECTOR LOS OLIVOS NUEVOS CALLE SOUBLETTE Nº4	67
\N	\N	SERVICIO AUTONÓMO PROTECCIÓN CIVIL Y ADMINISTRACIÓN DE DESASTRE DEL ESTADO ARAGUA	PCAD	2	6	LCDO. SALVADOR BASILE	12340734	(0243) 246-7204	DIRECTOR	2	antelizvic@hotmail.com	AV MARIÑO, BARRIO LIBERTADOR NRO 53 - MARACAY	68
\N	\N	SERVICIO AUTÓNOMO  SISTEMA INTEGRADO 	SASIAE 	2	6	LARRY JORDAN	15954307	(0412) 311-0591	DIRECTOR	2	jordan130683@hotmail.com	AV. DR. PEDRO JOSÉ OVALLES C/C LA ARBOLEDA	69
\N	\N	SISTEMA DE SALUD INTEGRADO DEL GOBIERNO BOLIVARIANO DE ARAGUA	SSIGA	2	6	MANUEL VIVAS	14401555	(0416) 624-9460	PRESIDENTE 	1	manuelvivas@hotmail.com	AV. SUCRE, COMPLEJO CULTURAL SANTOS MICHELENA, EDIF. SSIGA	71
\N	\N	SECRETARÍA SECTORIAL DEL PODER POPULAR PARA LA SALUD	SPPS	1	2	LUIS LOPEZ CHEJADE	11355337	(0414) 745-5278	SECRETARIO	12	dppcorposaludaragua@hotmail.com	AV LAS DELICIAS FRENTE AL CIRCULO MILITAR	61
\N	\N	SUMINISTROS Y PROCURAS ARAGUA	SUPRARAGUA	3	6	JOSÉ LUIS SILVA ORTA	0000000	(0243) 231-5095	PRESIDENTE	5	supraraguasa@gmail.com	SEDE GOBIERNO BOLIVARIANO DE ARAGUA, NIVEL MEZANINA	72
\N	\N	UNIDAD DE AUDITORIA INTERNA	UAI	4	2	ANDRES FELIPE HERNANDEZ VASQUEZ	14806561	(0243) 233-6880	AUDITOR INTERNO (E)	1	auditoriainternagba@gmail.com	AVENIDA LAS DELICIAS C/C AGUSTÍN ZERPA,  EDIFICIO CORPOINDUSTRIA  PISO 6, ALA ESTE	74
\N	\N	UNIDAD DE ENLACE Y COORDINACIÓN CON EL SISTEMA DE MISIONES	UEM	1	2	OSCAR BRICEÑO	10626152	(0416) 642-6818	DIRECTOR	1	araguapotenciamisiones@gmail.com	UD: 15 SECTOR II EDIF  DE LA SECRETARIA  SECTORIAL PARA EL FORTALECIMIENTO DEL PODER POPULAR, PLANTA BAJA  URB. CAÑA DE AZUCAR	75
\N	\N	FUNDACIÓN SISTEMA BOLIVARIANO DE RADIODIFUSION DE ARAGUA 	FSBRA	2	6	JESUS ESTEBAN TRAPIELLO	416907	(0243) 247-4943	PRESIDENTE	1	telearagua@gmail.com	CENTRO COMERCIAL LA CAPÍLLA 2 NIVEL PB LOCAL 6, SECTOR CENTRO DE MARACAY -ARAGUA.	29
\N	\N	SERVICIO TRIBUTARIO DE ARAGUA	SETA	2	6	KARINA CARPIO BEJARANO	562568	(0243) 808-6265	SUPERINTENDENTE	1	plan_controlseta@hotmail.com	AV. 10 DE DICIEMBRE ENTRE JUNIN Y SUCRE, EDIFICIO SETA	70
\N	\N	 TRANSPORTE DEL GOBIERNO BOLIVARIANO DE ARAGUA	TRANSARAGU	3	6	HIPOLITO ABREU	11158385	(0243) 269-8133	PRESIDENTE	11	ponce.reinaldo@gmail.com	ASENTAMIENTO CAMPESINO EL TIERRAL, CALLE PRINCIPAL SECTOR 4, PARCELA 21 MUNICIPIO MARIÑO.	73
\N	\N	SECRETARÍA SECTORIAL PARA EL FORTALECIMIENTO DEL PODER POPULAR	SSFPP	1	2	ROSA LEÓN BRABO	15734904	(0243) 247-9326	SECRETARIA SECTORIAL	13	planificacionypresupuesto64@gmail.com	CAÑA DE AZUCAR S/11 UD 15	64
\N	\N	SECRETARIA  SECTORIAL DEL PODER POPULAR  PARA LOS ASUNTOS DE LA MUJER E IGUALDAD DE GENERO	SSPPAMIG	1	3	MAIGUALIDA GUTIERREZ	7191862	(0243) 233-0802	SECRETARIA SECTORIAL	13	secretariadelamujer.aragua@gmail.com	AVENIDA LAS DELICIAS, EDIFICIO GOBERNACIÓN, PISO 6, MARACAY, EDO. ARAGUA	62
\N	\N	INSTITUTO DEL PODER POPULAR PARA LA VIVIENDA Y HÁBITAT DIGNO DEL ESTADO ARAGUA	VIDA	2	6	G/D RAMÓN VIÑAS	7011445	(0424) 334-0901	PRESIDENTE	11	vidaplanificacion@hotmail.com	AV. MIRADA, ANTIGUO HOTEL JARDÍN, FRENTE A LA PLAZA BOLÍVAR	40
\N	\N	VÍAS DE ARAGUA, S.A.	VASA	3	6	G/B LUIS ALBERTO GODOY	5042902	(0243) 233-2853	PRESIDENTE	1	viasdearagua@gmail.com	AVENIDA AGUSTIN ALVAREZ ZERPA, EDIFICIO GOBERNACION DEL ESTADO ARAGUA, ANTIGUO EDIFICIO CORPOINDUSTRIA PISO 7 OFICINA 10 SECTOR LAS DELICIAS, MARACAY ESTADO ARAGUA	76
\.


--
-- Name: organos_entes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('organos_entes_id_seq', 76, true);


--
-- Data for Name: partida_presupuestaria; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY partida_presupuestaria (partida_presupuestaria, codigo, id) FROM stdin;
GASTOS DE PERSONAL	4.01	4
MATERIALES, SUMINISTROS Y MERCANCÍAS	4.02	1
SERVICIOS NO PERSONALES	4.03	2
ACTIVOS REALES	4.04	3
ACTIVOS FINANCIEROS	4.05	5
TRANSFERENCIAS Y DONACIONES	4.07	6
SERVICIO DE LA DEUDA PÚBLICA	4.10	7
DISMINUCIÓN DE PASIVOS	4.11	8
DISMINUCIÓN DE PATRIMONIO	4.12	9
RECTIFICACIONES AL PRESUPUESTO	4.98	10
\.


--
-- Data for Name: partida_presupuestaria_centralizada; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY partida_presupuestaria_centralizada (accion_centralizada, partida_presupuestaria, codigo, id) FROM stdin;
3	6	4.07 	3
2	1	4.02 	2
2	2	4.03 	1
4	4	4.01 	4
5	5	4.05 	5
4	2	4.03 	6
5	6	4.07 	7
5	7	4.10 	8
5	8	4.11 	9
7	2	4.03 	10
2	3	4.04 	11
7	6	4.07 	12
2	5	4.05 	13
2	6	4.07 	14
2	8	4.11 	15
2	9	4.12 	16
2	10	4.98 	17
\.


--
-- Name: partida_presupuestaria_centralizada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('partida_presupuestaria_centralizada_id_seq', 17, true);


--
-- Name: partida_presupuestaria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('partida_presupuestaria_id_seq', 10, true);


--
-- Data for Name: plan_gobierno; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY plan_gobierno (plan_gobierno, codigo, id) FROM stdin;
PLAN DE GOBIERNO PARA EL PERÍODO: 2013-2017	01	1
\.


--
-- Name: plan_gobierno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('plan_gobierno_id_seq', 1, true);


--
-- Data for Name: plan_patria; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY plan_patria (plan_patria, codigo, id) FROM stdin;
SEGUNDO PLAN SOCIALISTA DE DESARROLLO ECONÓMICO Y SOCIAL DE LA NACIÓN 2013-2019	01	1
\.


--
-- Name: plan_patria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('plan_patria_id_seq', 2, true);


--
-- Data for Name: proyecto_registro; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY proyecto_registro (id, codigo, fecha_elaboracion, reg_registro, estatus, ente, domicilio, cargo, tlf, responsable, correo, nom_proyecto, ubicacion, inicio, fin, f_financiamiento, ano_fiscal, indicador_g, duracion, identificador, etapa, m_verificacion, ambito, especifique_amb, plan_patria, objetivo_historico, objetivo_nacional, objetivo_estrategico, objetivo_general, plan_gobierno, linea_estrategica, area_inversion, sector, tipo_inversion, desc_problema, obj_general, imp_impacto, ben_femeninos, ben_masculinos, total_ben, req_acciones, acc_institucion, acc_especifique, con_acciones, con_institucion, con_especifique, en_acciones, en_institucion, en_especifique, estimado_fem, estimado_mas, estimado_t_direc, estimado_t_indirec, reg_res, fecha_revision, estruc_presupuestaria, observaciones, descripcion_proy, cierre, accion) FROM stdin;
\.


--
-- Name: proyecto_registro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('proyecto_registro_id_seq', 1, false);


--
-- Data for Name: sectores; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY sectores (sector, codigo, id) FROM stdin;
SEGURIDAD Y DEFENSA	02	2
AGRICOLA	03	3
ENERGIA, MINAS Y PETROLEO	04	4
INDUSTRIA Y COMERCIO	05	5
CIENCIA Y TECNOLOGIA	10	10
DESARROLLO URBANO, VIVIENDA Y SERVICIOS CONEXOS	11	11
SALUD	12	12
DIRECCIÓN SUPERIOR DE GOBIERNO	01	1
EDUCACIÓN	08	8
TURISMO Y RECREACIÓN	06	6
TRANSPORTE Y COMUNICACIÓN	07	7
CULTURA Y COMUNICACIÓN	09	9
DESARROLLO SOCIAL Y PARTICIPACIÓN	13	13
\.


--
-- Name: sectores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('sectores_id_seq', 13, true);


--
-- Data for Name: sub_modulo; Type: TABLE DATA; Schema: public; Owner: conaplan1
--

COPY sub_modulo (sub_modulo, id, id_modulo, url, posicion, activo, usuario_creado, usuario_actualizado, fecha_creado, fecha_actualizado) FROM stdin;
Permiso de acceso	43	6	ff	2	t	\N	\N	\N	\N
Registro de Usuarios	42	6	ControllersUser/listar	1	t	\N	\N	\N	\N
Partidas Presupuestaria	44	5	partida_presupuestaria/ControllersPartidaPresupuestaria	1	t	\N	\N	\N	\N
Sectores	45	5	sectores/ControllersSectores	2	t	\N	\N	\N	\N
Organos / Entes	46	5	entes/ControllersEntes	3	t	\N	\N	\N	\N
Tipos de Estructura	47	5	estructura/ControllersEstructura	4	t	\N	\N	\N	\N
Acciones centralizada	48	5	accion_centralizada/ControllersAccionCentralizada	5	t	\N	\N	\N	\N
Acciones Específicas	49	5	accion_especifica/ControllersAccionEspecifica	6	t	\N	\N	\N	\N
Partidas Centralizadas	50	5	partida_presupuestaria_centralizada/ControllersPartidaPresupuestariaCentralizada	7	t	\N	\N	\N	\N
Planes de Gobierno	51	5	plan_gobierno/ControllersPlanGobierno	8	t	\N	\N	\N	\N
Lineas Estratégicas	52	5	linea_estrategica/ControllersLineaE	9	t	\N	\N	\N	\N
Objetivos Específicos	53	5	objetivo_especifico/ControllersObjE	10	t	\N	\N	\N	\N
Planes de la patria	54	5	plan_patria/ControllersPlanPatria	11	t	\N	\N	\N	\N
Objetivos Históricos	55	5	objetivo_historico/ControllersObjH	12	t	\N	\N	\N	\N
Objetivos Nacionales	56	5	objetivo_nacional/ControllersObjN	13	t	\N	\N	\N	\N
Objetivos Estratégicos	57	5	objetivo_estrategico/ControllersObjE	14	t	\N	\N	\N	\N
Objetivos Generales	58	5	objetivo_general/ControllersObjG	15	t	\N	\N	\N	\N
Registro de Acciones	1	1	acciones/registro/ControllersRegistro	1	t	\N	\N	\N	\N
Registro de Ante Proyectos	37	2	acciones/proyecto/ControllersProyecto	1	t	\N	\N	\N	\N
Acciones / Proyectos	40	4	reportes/generacion/ControllersReportes/generacion_pdf	1	t	\N	\N	\N	\N
Observaciones / Fuente de Financiamiento	3	1	acciones/observaciones/ControllersObservaciones	2	t	\N	\N	\N	\N
Observaciones / Fuente de Financiamiento	38	2	acciones/observaciones/ControllersObservacionesProy	2	t	\N	\N	\N	\N
Reportes Generales	41	4	red	2	f	\N	\N	\N	\N
\.


--
-- Name: sub_modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: conaplan1
--

SELECT pg_catalog.setval('sub_modulo_id_seq', 1, false);


--
-- Name: accion_centralizada_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY accion_centralizada
    ADD CONSTRAINT accion_centralizada_pkey PRIMARY KEY (id);


--
-- Name: acciones_registro_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY acciones_registro
    ADD CONSTRAINT acciones_registro_pkey PRIMARY KEY (id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: distribucion_acc_especifica_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY distribucion_acc_especifica
    ADD CONSTRAINT distribucion_acc_especifica_pkey PRIMARY KEY (id);


--
-- Name: imp_presupuestaria_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY imp_presupuestaria
    ADD CONSTRAINT imp_presupuestaria_pkey PRIMARY KEY (id);


--
-- Name: linea_estrategica_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY linea_estrategica
    ADD CONSTRAINT linea_estrategica_pkey PRIMARY KEY (id);


--
-- Name: modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id);


--
-- Name: objetivo_estrategico_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY objetivo_estrategico
    ADD CONSTRAINT objetivo_estrategico_pkey PRIMARY KEY (id);


--
-- Name: objetivo_historico_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY objetivo_historico
    ADD CONSTRAINT objetivo_historico_pkey PRIMARY KEY (id);


--
-- Name: objetivo_nacional_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY objetivo_nacional
    ADD CONSTRAINT objetivo_nacional_pkey PRIMARY KEY (id);


--
-- Name: organos_entes_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY organos_entes
    ADD CONSTRAINT organos_entes_pkey PRIMARY KEY (id);


--
-- Name: partida_presupuestaria_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY partida_presupuestaria
    ADD CONSTRAINT partida_presupuestaria_pkey PRIMARY KEY (id);


--
-- Name: plan_gobierno_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY plan_gobierno
    ADD CONSTRAINT plan_gobierno_pkey PRIMARY KEY (id);


--
-- Name: plan_patria_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY plan_patria
    ADD CONSTRAINT plan_patria_pkey PRIMARY KEY (id);


--
-- Name: proyecto_registro_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY proyecto_registro
    ADD CONSTRAINT proyecto_registro_pkey PRIMARY KEY (id);


--
-- Name: sectores_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY sectores
    ADD CONSTRAINT sectores_pkey PRIMARY KEY (id);


--
-- Name: sub_modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: conaplan1; Tablespace: 
--

ALTER TABLE ONLY sub_modulo
    ADD CONSTRAINT sub_modulo_pkey PRIMARY KEY (id);


--
-- Name: accion_centralizada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY accion_especifica
    ADD CONSTRAINT accion_centralizada_fkey FOREIGN KEY (accion_centralizada) REFERENCES accion_centralizada(id);


--
-- Name: accion_centralizada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY partida_presupuestaria_centralizada
    ADD CONSTRAINT accion_centralizada_fkey FOREIGN KEY (accion_centralizada) REFERENCES accion_centralizada(id);


--
-- Name: id_acc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_acc_especifica
    ADD CONSTRAINT id_acc_fkey FOREIGN KEY (id_acc) REFERENCES distribucion_acc_especifica(id);


--
-- Name: id_acc_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY imp_presupuestaria
    ADD CONSTRAINT id_acc_reg_fkey FOREIGN KEY (id_acc_reg) REFERENCES acciones_registro(id);


--
-- Name: id_acc_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_actividad
    ADD CONSTRAINT id_acc_reg_fkey FOREIGN KEY (id_acc_reg) REFERENCES acciones_registro(id);


--
-- Name: id_acc_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_actividad
    ADD CONSTRAINT id_acc_reg_fkey FOREIGN KEY (id_acc_reg) REFERENCES acciones_registro(id);


--
-- Name: id_acc_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_financiera
    ADD CONSTRAINT id_acc_reg_fkey FOREIGN KEY (id_acc_reg) REFERENCES acciones_registro(id);


--
-- Name: id_accion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY observaciones_acciones
    ADD CONSTRAINT id_accion_fkey FOREIGN KEY (id_accion) REFERENCES acciones_registro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: id_accion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY observaciones_acciones_proy
    ADD CONSTRAINT id_accion_fkey FOREIGN KEY (id_accion) REFERENCES proyecto_registro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: linea_estrategica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT linea_estrategica_fkey FOREIGN KEY (linea_estrategica) REFERENCES linea_estrategica(id);


--
-- Name: modulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY sub_modulo
    ADD CONSTRAINT modulo_fkey FOREIGN KEY (id_modulo) REFERENCES modulo(id);


--
-- Name: objetivo_estrategico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT objetivo_estrategico_fkey FOREIGN KEY (objetivo_estrategico) REFERENCES objetivo_estrategico(id);


--
-- Name: objetivo_historico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_nacional
    ADD CONSTRAINT objetivo_historico_fkey FOREIGN KEY (objetivo_historico) REFERENCES objetivo_historico(id);


--
-- Name: objetivo_nacional_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_estrategico
    ADD CONSTRAINT objetivo_nacional_fkey FOREIGN KEY (objetivo_nacional) REFERENCES objetivo_nacional(id);


--
-- Name: partida_presupuestaria_centralizada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY partida_presupuestaria_centralizada
    ADD CONSTRAINT partida_presupuestaria_centralizada_fkey FOREIGN KEY (partida_presupuestaria) REFERENCES partida_presupuestaria(id);


--
-- Name: pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_acc_especifica
    ADD CONSTRAINT pk_fkey FOREIGN KEY (pk) REFERENCES proyecto_registro(id);


--
-- Name: pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY distribucion_trimestral_imp_pre
    ADD CONSTRAINT pk_fkey FOREIGN KEY (pk) REFERENCES proyecto_registro(id);


--
-- Name: plan_gobierno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY linea_estrategica
    ADD CONSTRAINT plan_gobierno_fkey FOREIGN KEY (plan_gobierno) REFERENCES plan_gobierno(id);


--
-- Name: plan_patria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY objetivo_historico
    ADD CONSTRAINT plan_patria_fkey FOREIGN KEY (plan_patria) REFERENCES plan_patria(id);


--
-- Name: sectores_fkey; Type: FK CONSTRAINT; Schema: public; Owner: conaplan1
--

ALTER TABLE ONLY organos_entes
    ADD CONSTRAINT sectores_fkey FOREIGN KEY (sector) REFERENCES sectores(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: conaplan1
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM conaplan1;
GRANT ALL ON SCHEMA public TO conaplan1;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

