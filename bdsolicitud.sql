-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2021 a las 20:04:58
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsolicitud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_accion`
--

CREATE TABLE `tbl_accion` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `codigo` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_accion`
--

INSERT INTO `tbl_accion` (`id`, `creado`, `nombre`, `codigo`) VALUES
(1, '2021-08-31 17:31:54', 'INICIADO', 'INICIADO'),
(2, '2021-08-31 17:32:05', 'EN_TRAMITE', 'EN_TRAMITE'),
(3, '2021-09-01 20:51:57', 'IMPRIMIR', 'IMPRIMIR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_app`
--

CREATE TABLE `tbl_app` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigo` varchar(255) COLLATE latin1_bin NOT NULL,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `icono` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_app`
--

INSERT INTO `tbl_app` (`id`, `creado`, `codigo`, `nombre`, `icono`) VALUES
(1, '2021-08-30 21:32:08', 'config', 'Configuración', 'fa fa-cog'),
(2, '2021-08-31 16:49:50', 'doc', 'Documento', 'fa fa-folder'),
(3, '2021-09-02 16:23:10', 'proc', 'Procesos', 'fa fa-archive'),
(4, '2021-09-02 19:05:28', 'sol', 'Solicitudes', 'fa fa-file');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_app_menu`
--

CREATE TABLE `tbl_app_menu` (
  `id` int(10) NOT NULL,
  `id_app` int(10) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_app_menu`
--

INSERT INTO `tbl_app_menu` (`id`, `id_app`, `id_menu`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 1, 6),
(4, 1, 13),
(5, 2, 14),
(6, 2, 15),
(7, 3, 16),
(8, 3, 17),
(9, 3, 18),
(10, 3, 19),
(11, 4, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_archivo`
--

CREATE TABLE `tbl_archivo` (
  `id` int(11) NOT NULL,
  `ruta` varchar(255) COLLATE latin1_bin NOT NULL,
  `peso` int(11) NOT NULL,
  `formato` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_archivo`
--

INSERT INTO `tbl_archivo` (`id`, `ruta`, `peso`, `formato`, `creado`, `nombre`, `id_usuario`, `id_documento`) VALUES
(8, 'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/2/', 39, 'image/jpeg', '2021-09-07 17:31:49', 'DUI.jpg', 1, 2),
(9, 'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/4/', 39, 'image/jpeg', '2021-09-07 17:47:30', 'DUI1.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_campotipo`
--

CREATE TABLE `tbl_campotipo` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_bin NOT NULL,
  `tipo` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `validacion` varchar(255) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_campotipo`
--

INSERT INTO `tbl_campotipo` (`id`, `creado`, `nombre`, `descripcion`, `tipo`, `validacion`) VALUES
(1, '2021-09-01 18:35:06', 'Hospital', 'nombre del hospital donde nacio', '', ''),
(2, '2021-09-01 18:37:17', 'Email', 'correo personal', 'email', ''),
(3, '2021-09-01 18:38:40', 'Fecha de Defuncion', 'Fecha de Defunción de la persona', 'date', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_campotipo_proceso`
--

CREATE TABLE `tbl_campotipo_proceso` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_campotipo` int(10) NOT NULL,
  `id_proceso` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_campotipo_proceso`
--

INSERT INTO `tbl_campotipo_proceso` (`id`, `creado`, `id_campotipo`, `id_proceso`) VALUES
(2, '2021-08-31 19:47:36', 1, 1),
(3, '2021-09-01 18:37:29', 2, 1),
(4, '2021-09-01 18:38:47', 3, 2),
(5, '2021-09-07 15:40:10', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_campotipo_proceso_solicitud`
--

CREATE TABLE `tbl_campotipo_proceso_solicitud` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_solicitud` int(11) NOT NULL,
  `id_campotipo_proceso` int(10) NOT NULL,
  `valor` text COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_campotipo_proceso_solicitud`
--

INSERT INTO `tbl_campotipo_proceso_solicitud` (`id`, `creado`, `id_solicitud`, `id_campotipo_proceso`, `valor`) VALUES
(2, '2021-09-01 19:29:05', 4, 2, 'el salvador'),
(3, '2021-09-01 19:29:05', 4, 3, 'ser@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoriadocumento`
--

CREATE TABLE `tbl_categoriadocumento` (
  `id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_categoriadocumento`
--

INSERT INTO `tbl_categoriadocumento` (`id`, `creado`, `nombre`) VALUES
(1, '2021-08-31 17:04:21', 'Personales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_conf_general`
--

CREATE TABLE `tbl_conf_general` (
  `id` int(11) NOT NULL,
  `parametro` varchar(255) COLLATE latin1_bin NOT NULL,
  `valor` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` varchar(255) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_conf_general`
--

INSERT INTO `tbl_conf_general` (`id`, `parametro`, `valor`, `creado`, `descripcion`) VALUES
(1, 'INTENTOS_CLAVE', '5', '2021-08-31 15:45:04', '<p>Parametro que sirve para el n&uacute;mero de intentos de clave erronea antes de bloquear al usuario</p>'),
(2, 'PADRE', 'Barra', '2021-08-31 15:45:24', '<p>Parametro que sirve como men&uacute; padre de todos</p>'),
(3, 'ACCION_INICIO', 'INICIADO', '2021-09-01 16:00:26', '<p>Accion de inicio para telemetrias</p>'),
(4, 'MAX_ARCHIVO', '80000', '2021-09-07 16:31:35', '<p>Tama&ntilde;o m&aacute;ximo de archivo de subida</p>'),
(5, 'TIPO_ARCHIVO', 'jpg', '2021-09-07 16:54:31', '<p>Tipo de archivo permitido para suibida</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamento`
--

CREATE TABLE `tbl_departamento` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `numero` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_documento`
--

CREATE TABLE `tbl_documento` (
  `id` int(11) NOT NULL,
  `id_tipodocumento` int(11) NOT NULL,
  `id_categoriadocumento` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_documento`
--

INSERT INTO `tbl_documento` (`id`, `id_tipodocumento`, `id_categoriadocumento`, `creado`) VALUES
(2, 1, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_email`
--

CREATE TABLE `tbl_email` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) COLLATE latin1_bin NOT NULL,
  `id_tipo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_email`
--

INSERT INTO `tbl_email` (`id`, `creado`, `email`, `id_tipo`) VALUES
(1, '2021-08-31 16:30:07', 'ser45argueta@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estacion`
--

CREATE TABLE `tbl_estacion` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `codigo` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_estacion`
--

INSERT INTO `tbl_estacion` (`id`, `creado`, `nombre`, `codigo`) VALUES
(1, '2021-08-31 17:33:27', 'recepción de Solicitud', 'Inbox'),
(2, '2021-08-31 17:33:49', 'Revisión de Solicitud', 'CHECK'),
(3, '2021-08-31 17:34:02', 'Impresión de Documentación', 'PRINT'),
(4, '2021-08-31 17:34:27', 'Entrega de Solicitudes', 'OUTBOX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `opcion` varchar(255) COLLATE latin1_bin NOT NULL,
  `enlace` varchar(255) COLLATE latin1_bin NOT NULL,
  `imagen` varchar(255) COLLATE latin1_bin NOT NULL,
  `padre` int(11) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `opcion`, `enlace`, `imagen`, `padre`, `creado`) VALUES
(4, 'Barra', '#', '', NULL, '2021-08-30 21:40:50'),
(5, 'Menu', 'seguridad/menu/', 'fa fa-list', 6, '2021-08-30 21:26:17'),
(6, 'Sistema', '#', 'fa fa-cogs', 4, '2021-08-30 21:17:28'),
(7, 'Personas', 'seguridad/persona/', 'fa fa-user', 6, '2021-08-30 21:35:11'),
(8, 'Roles', 'seguridad/rol/', 'fa fa-archive', 6, '2021-09-07 15:11:57'),
(9, 'Aplicaciones', 'seguridad/app/', 'fa fa-desktop', 6, '2021-09-07 15:13:37'),
(10, 'Parámetros Generales', 'seguridad/configral/', 'fa fa-cogs', 6, '2021-09-07 15:12:13'),
(11, 'Usuarios', 'seguridad/usuario/', 'fa fa-users', 6, '2021-09-07 15:11:46'),
(13, 'Tipo', 'seguridad/tipo/', 'fa fa-list-alt', 6, '2021-08-31 16:24:29'),
(14, 'Tipos Documentos', 'documento/tipodocumento/', 'fa fa-file', 4, '2021-09-07 15:14:21'),
(15, 'Categoría de Documento', 'documento/categoriadocumento/', 'fa fa-folder', 4, '2021-09-07 15:14:40'),
(16, 'Proceso', 'telemetria/proceso/', 'fa fa-cogs', 4, '2021-08-31 17:13:56'),
(17, 'Acción', 'telemetria/accion/', 'fa fa-retweet', 4, '2021-08-31 17:15:20'),
(18, 'Estación', 'telemetria/estacion/', 'fa fa-building', 4, '2021-08-31 17:12:57'),
(19, 'Campos Adicionales', 'telemetria/campotipo/', 'fa fa-align-justify', 4, '2021-08-31 19:44:42'),
(20, 'Partida de Nacimiento', '#', 'fa fa-archive', 4, '2021-09-02 14:54:57'),
(21, 'Estación Revisión', 'telemetria/solicitudes/listar/2/Partida_Nac', '', 20, '2021-09-02 14:57:16'),
(22, 'Estación Impresión', 'telemetria/solicitudes/listar/3/Partida_Nac', '', 20, '2021-09-02 14:57:27'),
(23, 'Estación Salida', 'telemetria/solicitudes/listar/4/Partida_Nac', '', 20, '2021-09-02 14:57:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu_rol`
--

CREATE TABLE `tbl_menu_rol` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_menu_rol`
--

INSERT INTO `tbl_menu_rol` (`id`, `id_rol`, `id_menu`, `creado`) VALUES
(1, 1, 4, '2021-08-30 21:09:57'),
(2, 1, 5, '2021-08-30 21:09:57'),
(3, 1, 6, '2021-08-30 21:22:14'),
(4, 1, 8, '2021-08-30 21:33:44'),
(5, 1, 7, '2021-08-30 21:33:44'),
(6, 1, 9, '2021-08-30 21:44:43'),
(7, 1, 10, '2021-08-30 21:44:44'),
(8, 1, 11, '2021-08-30 21:44:45'),
(10, 1, 13, '2021-08-31 16:23:48'),
(11, 1, 14, '2021-08-31 17:01:38'),
(12, 1, 15, '2021-08-31 17:01:39'),
(13, 1, 18, '2021-08-31 17:13:22'),
(14, 1, 17, '2021-08-31 17:13:22'),
(15, 1, 16, '2021-08-31 17:13:23'),
(16, 1, 19, '2021-08-31 19:44:57'),
(17, 1, 20, '2021-09-01 15:44:19'),
(18, 1, 21, '2021-09-02 14:56:23'),
(19, 1, 22, '2021-09-02 14:56:23'),
(20, 1, 23, '2021-09-02 14:56:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_minucipio`
--

CREATE TABLE `tbl_minucipio` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `codigo` int(10) NOT NULL,
  `id_departamento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motivo`
--

CREATE TABLE `tbl_motivo` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_motivo`
--

INSERT INTO `tbl_motivo` (`id`, `nombre`, `creado`, `descripcion`) VALUES
(1, 'Trabajo', '2021-09-01 18:53:28', 'cuestiones de trabajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `apellido` varchar(255) COLLATE latin1_bin NOT NULL,
  `genero` varchar(255) COLLATE latin1_bin NOT NULL,
  `dui` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `nit` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `pasaporte` varchar(255) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_persona`
--

INSERT INTO `tbl_persona` (`id`, `creado`, `nombre`, `apellido`, `genero`, `dui`, `nit`, `pasaporte`) VALUES
(1, '2021-08-30 21:36:03', 'Sergio', 'Argueta', 'MASCULINO', '0111', '01111', NULL),
(2, '2021-09-02 16:13:41', 'juan', 'castro', 'MASCULINO', NULL, NULL, NULL),
(3, '2021-09-02 16:13:48', 'marcela', 'ramirez', 'MASCULINO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona_direccion`
--

CREATE TABLE `tbl_persona_direccion` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `calle` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `numero` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  `id_municipio` int(10) NOT NULL,
  `direccion_complemento` varchar(255) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona_email`
--

CREATE TABLE `tbl_persona_email` (
  `id` int(10) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_email` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_persona_email`
--

INSERT INTO `tbl_persona_email` (`id`, `id_persona`, `id_email`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona_telefono`
--

CREATE TABLE `tbl_persona_telefono` (
  `id` int(10) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_persona_telefono`
--

INSERT INTO `tbl_persona_telefono` (`id`, `id_persona`, `id_telefono`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proceso`
--

CREATE TABLE `tbl_proceso` (
  `id` int(10) NOT NULL,
  `creado` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `descrpcion` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `codigo` varchar(255) COLLATE latin1_bin NOT NULL,
  `icono` varchar(255) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_proceso`
--

INSERT INTO `tbl_proceso` (`id`, `creado`, `nombre`, `descrpcion`, `codigo`, `icono`) VALUES
(1, '2021-08-31 17:42:55', 'Partida de Nacimiento', NULL, 'Partida_Nac', 'http://localhost:82/esqueleto/assets/imagenes/pn.jpeg'),
(2, '2021-09-01 17:30:22', 'Partida de Defunción', NULL, 'Partida_Def', 'http://localhost:82/esqueleto/assets/imagenes/pd.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proceso_categoriadocumento`
--

CREATE TABLE `tbl_proceso_categoriadocumento` (
  `id` int(11) NOT NULL,
  `creado` timestamp NULL DEFAULT NULL,
  `id_proceso` int(10) NOT NULL,
  `id_categoriadocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_proceso_categoriadocumento`
--

INSERT INTO `tbl_proceso_categoriadocumento` (`id`, `creado`, `id_proceso`, `id_categoriadocumento`) VALUES
(4, '2021-08-31 19:20:35', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proceso_estacion`
--

CREATE TABLE `tbl_proceso_estacion` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_proceso` int(10) NOT NULL,
  `id_estacion` int(10) NOT NULL,
  `ruta` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_proceso_estacion`
--

INSERT INTO `tbl_proceso_estacion` (`id`, `creado`, `id_proceso`, `id_estacion`, `ruta`) VALUES
(1, '2021-08-31 17:45:51', 1, 1, 1),
(2, '2021-08-31 17:46:05', 1, 2, 2),
(3, '2021-08-31 17:46:09', 1, 3, 3),
(4, '2021-08-31 17:46:13', 1, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proceso_estacion_accion`
--

CREATE TABLE `tbl_proceso_estacion_accion` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_proceso_estacion_origen` int(10) NOT NULL,
  `id_accion` int(10) NOT NULL,
  `id_proceso_estacion_destino` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_proceso_estacion_accion`
--

INSERT INTO `tbl_proceso_estacion_accion` (`id`, `creado`, `id_proceso_estacion_origen`, `id_accion`, `id_proceso_estacion_destino`) VALUES
(3, '2021-08-31 18:31:01', 1, 1, 2),
(4, '2021-09-01 20:52:15', 2, 2, 3),
(5, '2021-09-01 20:52:23', 3, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id`, `nombre`, `creado`) VALUES
(1, 'Administrador', '2021-08-30 20:44:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud`
--

CREATE TABLE `tbl_solicitud` (
  `id` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  `id_proceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud`
--

INSERT INTO `tbl_solicitud` (`id`, `creado`, `id_usuario`, `id_proceso`) VALUES
(1, '2021-09-01 19:23:36', 1, 0),
(2, '2021-09-01 19:24:15', 1, 0),
(3, '2021-09-01 19:25:00', 1, 0),
(4, '2021-09-01 19:29:04', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud_archivo`
--

CREATE TABLE `tbl_solicitud_archivo` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_archivo` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud_archivo`
--

INSERT INTO `tbl_solicitud_archivo` (`id`, `creado`, `id_archivo`, `id_solicitud`) VALUES
(7, '2021-09-07 17:31:49', 8, 2),
(8, '2021-09-07 17:47:30', 9, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud_bitacora`
--

CREATE TABLE `tbl_solicitud_bitacora` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_proceso_estacion_accion` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `comentario` text COLLATE latin1_bin,
  `id_solicitud` int(11) NOT NULL,
  `activa` varchar(2) COLLATE latin1_bin NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud_bitacora`
--

INSERT INTO `tbl_solicitud_bitacora` (`id`, `creado`, `id_proceso_estacion_accion`, `id_usuario`, `comentario`, `id_solicitud`, `activa`) VALUES
(1, '2021-09-02 14:44:49', 3, 1, 'Inicio de Solicitud de Proceso Partida de Nacimiento', 2, '0'),
(2, '2021-09-02 14:44:53', 3, 1, 'Inicio de Solicitud de Proceso Partida de Nacimiento', 3, '0'),
(3, '2021-09-02 14:44:56', 3, 1, 'Inicio de Solicitud de Proceso Partida de Nacimiento', 4, '0'),
(5, '2021-09-02 14:58:02', 4, 1, 'nuevo movimiento', 2, '0'),
(6, '2021-09-02 14:41:05', 4, 1, 'en tramite', 3, '1'),
(7, '2021-09-02 14:42:52', 4, 1, 'nuevo movimiento', 4, '1'),
(8, '2021-09-02 14:58:02', 5, 1, '', 2, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud_motivo`
--

CREATE TABLE `tbl_solicitud_motivo` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_solicitud` int(11) NOT NULL,
  `id_motivo` int(10) NOT NULL,
  `comentario` text COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud_motivo`
--

INSERT INTO `tbl_solicitud_motivo` (`id`, `creado`, `id_solicitud`, `id_motivo`, `comentario`) VALUES
(1, '2021-09-01 19:24:15', 2, 1, 'me la solicitan'),
(2, '2021-09-01 19:25:01', 3, 1, 'me la solicitan'),
(3, '2021-09-01 19:29:04', 4, 1, 'me la solicitan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud_persona`
--

CREATE TABLE `tbl_solicitud_persona` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_persona` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud_persona`
--

INSERT INTO `tbl_solicitud_persona` (`id`, `creado`, `id_persona`, `id_solicitud`) VALUES
(1, '2021-09-01 19:23:36', 1, 1),
(2, '2021-09-01 19:24:15', 1, 2),
(3, '2021-09-01 19:25:00', 1, 3),
(4, '2021-09-01 19:29:04', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitud_proceso`
--

CREATE TABLE `tbl_solicitud_proceso` (
  `id` int(10) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `id_proceso` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_solicitud_proceso`
--

INSERT INTO `tbl_solicitud_proceso` (`id`, `id_solicitud`, `id_proceso`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_telefono`
--

CREATE TABLE `tbl_telefono` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `telefono` varchar(255) COLLATE latin1_bin NOT NULL,
  `id_tipo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_telefono`
--

INSERT INTO `tbl_telefono` (`id`, `creado`, `telefono`, `id_tipo`) VALUES
(1, '2021-08-31 16:25:01', '71651268', 1),
(2, '2021-08-31 16:25:53', '71651268', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo`
--

CREATE TABLE `tbl_tipo` (
  `id` int(10) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_tipo`
--

INSERT INTO `tbl_tipo` (`id`, `creado`, `nombre`) VALUES
(1, '2021-08-31 16:24:38', 'Personal'),
(2, '2021-08-31 16:24:43', 'Trabajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipodocumento`
--

CREATE TABLE `tbl_tipodocumento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_tipodocumento`
--

INSERT INTO `tbl_tipodocumento` (`id`, `nombre`, `creado`) VALUES
(1, 'DUI', '2021-08-31 17:04:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE latin1_bin NOT NULL,
  `clave` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bloqueo` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) COLLATE latin1_bin NOT NULL DEFAULT 'ALL',
  `ultima_conexion` date DEFAULT NULL,
  `permisos` varchar(5) COLLATE latin1_bin NOT NULL DEFAULT 'CUDO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `id_persona`, `usuario`, `clave`, `creado`, `bloqueo`, `ip`, `ultima_conexion`, `permisos`) VALUES
(1, 1, 'admin', '9accd4fca049d37780248024f4d2f156', '2021-09-07 15:11:12', 0, 'ALL', '2021-09-07', 'CUDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuariobitacora`
--

CREATE TABLE `tbl_usuariobitacora` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `clave_anterior` varchar(255) COLLATE latin1_bin NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_bitacoraactualizar`
--

CREATE TABLE `tbl_usuario_bitacoraactualizar` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tabla` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_usuario_bitacoraactualizar`
--

INSERT INTO `tbl_usuario_bitacoraactualizar` (`id`, `id_usuario`, `data`, `creado`, `tabla`) VALUES
(1, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:44:59', 'tbl_usuario'),
(2, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:46:00', 'tbl_usuario'),
(3, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:46:37', 'tbl_usuario'),
(4, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:47:15', 'tbl_usuario'),
(5, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:51:48', 'tbl_usuario'),
(6, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:52:18', 'tbl_usuario'),
(7, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 20:56:15', 'tbl_usuario'),
(8, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 21:11:39', 'tbl_usuario'),
(9, 1, 'array (\n  \'opcion\' => \'menu\',\n  \'enlace\' => \'seguridad/menu/\',\n  \'imagen\' => \'\',\n  \'padre\' => \'6\',\n)', '2021-08-30 21:17:37', 'tbl_menu'),
(10, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-30\',\n)', '2021-08-30 21:34:18', 'tbl_usuario'),
(11, 1, 'array (\n  \'nombre\' => \'Sergio\',\n  \'apellido\' => \'Argueta\',\n  \'genero\' => \'MASCULINO\',\n)', '2021-08-30 21:36:03', 'tbl_persona'),
(12, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-31\',\n)', '2021-08-31 15:40:40', 'tbl_usuario'),
(13, 1, 'array (\n  \'parametro\' => \'INTENTOS_CLAVE\',\n  \'valor\' => \'5\',\n  \'descripcion\' => \'<p>Parametro que sirve para el n&uacute;mero de intentos de clave erronea antes de bloquear al usuario</p>\',\n)', '2021-08-31 15:45:05', 'tbl_conf_general'),
(14, 1, 'array (\n  \'parametro\' => \'PADRE\',\n  \'valor\' => \'Barra\',\n  \'descripcion\' => \'<p>Parametro que sirve como men&uacute; padre de todos</p>\',\n)', '2021-08-31 15:45:25', 'tbl_conf_general'),
(15, 1, 'array (\n  \'opcion\' => \'Parámetros Generales\',\n  \'enlace\' => \'seguridad/configral/\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'6\',\n)', '2021-08-31 15:46:43', 'tbl_menu'),
(16, 1, 'array (\n  \'opcion\' => \'Tipo\',\n  \'enlace\' => \'seguridad/tipo\',\n  \'imagen\' => \'fa fa-list-alt\',\n  \'padre\' => \'6\',\n)', '2021-08-31 16:24:05', 'tbl_menu'),
(17, 1, 'array (\n  \'ultima_conexion\' => \'2021-08-31\',\n)', '2021-08-31 16:24:14', 'tbl_usuario'),
(18, 1, 'array (\n  \'opcion\' => \'Tipo\',\n  \'enlace\' => \'seguridad/tipo/\',\n  \'imagen\' => \'fa fa-list-alt\',\n  \'padre\' => \'6\',\n)', '2021-08-31 16:24:30', 'tbl_menu'),
(19, 1, 'array (\n  \'opcion\' => \'Proceso\',\n  \'enlace\' => \'telemetria/proceso/\',\n  \'imagen\' => \'fa fa-cogs\',\n  \'padre\' => \'4\',\n)', '2021-08-31 17:13:56', 'tbl_menu'),
(20, 1, 'array (\n  \'opcion\' => \'Acción\',\n  \'enlace\' => \'telemetria/accion/\',\n  \'imagen\' => \'fa fa-retweet\',\n  \'padre\' => \'4\',\n)', '2021-08-31 17:15:20', 'tbl_menu'),
(21, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-01\',\n)', '2021-09-01 15:30:25', 'tbl_usuario'),
(22, 1, 'array (\n  \'opcion\' => \'Partida de Nacimiento\',\n  \'enlace\' => \'telemetria/lista/2/Partida_Nac\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'4\',\n)', '2021-09-01 15:50:10', 'tbl_menu'),
(23, 1, 'array (\n  \'opcion\' => \'Partida de Nacimiento\',\n  \'enlace\' => \'Solicitudes/lista/2/Partida_Nac\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'4\',\n)', '2021-09-01 15:52:24', 'tbl_menu'),
(24, 1, 'array (\n  \'opcion\' => \'Partida de Nacimiento\',\n  \'enlace\' => \'telemetria/solicitudes/listar/2/Partida_Nac\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'4\',\n)', '2021-09-01 15:54:16', 'tbl_menu'),
(25, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-01\',\n)', '2021-09-01 16:36:47', 'tbl_usuario'),
(26, 1, 'array (\n  \'opcion\' => \'Solicitudes\',\n  \'enlace\' => \'telemetria/solicitudes/\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'4\',\n)', '2021-09-01 16:42:55', 'tbl_menu'),
(27, 1, 'array (\n  \'codigo\' => \'Partida_Nac\',\n  \'nombre\' => \'Partida de Nacimiento\',\n)', '2021-09-01 17:38:06', 'tbl_proceso'),
(28, 1, 'array (\n  \'codigo\' => \'Partida_Def\',\n  \'nombre\' => \'Partida de Defunción\',\n)', '2021-09-01 17:38:20', 'tbl_proceso'),
(29, 1, 'array (\n  \'codigo\' => \'Partida_Def\',\n  \'nombre\' => \'Partida de Defunción\',\n  \'icono\' => \'http://localhost:82/esqueleto/assets/imagenes/pd.jpeg\',\n)', '2021-09-01 17:39:33', 'tbl_proceso'),
(30, 1, 'array (\n  \'nombre\' => \'Hospital\',\n  \'descripcion\' => \'nombre del hospital donde nacio\',\n  \'tipo\' => \'\',\n  \'validacion\' => \'\',\n)', '2021-09-01 18:35:06', 'tbl_campotipo'),
(31, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-01\',\n)', '2021-09-01 20:47:45', 'tbl_usuario'),
(32, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-02\',\n)', '2021-09-02 14:11:15', 'tbl_usuario'),
(33, 1, 'array (\n  \'activa\' => \'I\',\n)', '2021-09-02 14:40:43', 'tbl_solicitud_bitacora'),
(34, 1, 'array (\n  \'activa\' => \'I\',\n)', '2021-09-02 14:41:05', 'tbl_solicitud_bitacora'),
(35, 1, 'array (\n  \'activa\' => \'I\',\n)', '2021-09-02 14:42:52', 'tbl_solicitud_bitacora'),
(36, 1, 'array (\n  \'opcion\' => \'Partida de Nacimiento\',\n  \'enlace\' => \'#\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'4\',\n)', '2021-09-02 14:54:57', 'tbl_menu'),
(37, 1, 'array (\n  \'opcion\' => \'Estación Revisión\',\n  \'enlace\' => \'telemetria/solicitudes/listar/2/Partida_Nac\',\n  \'imagen\' => \'\',\n  \'padre\' => \'20\',\n)', '2021-09-02 14:57:16', 'tbl_menu'),
(38, 1, 'array (\n  \'opcion\' => \'Estación Impresión\',\n  \'enlace\' => \'telemetria/solicitudes/listar/3/Partida_Nac\',\n  \'imagen\' => \'\',\n  \'padre\' => \'20\',\n)', '2021-09-02 14:57:27', 'tbl_menu'),
(39, 1, 'array (\n  \'opcion\' => \'Estación Salida\',\n  \'enlace\' => \'telemetria/solicitudes/listar/4/Partida_Nac\',\n  \'imagen\' => \'\',\n  \'padre\' => \'20\',\n)', '2021-09-02 14:57:35', 'tbl_menu'),
(40, 1, 'array (\n  \'activa\' => \'0\',\n)', '2021-09-02 14:58:02', 'tbl_solicitud_bitacora'),
(41, 1, 'array (\n  \'codigo\' => \'proc\',\n  \'nombre\' => \'Procesos\',\n  \'icono\' => \'fa fa-archive\',\n)', '2021-09-02 16:23:10', 'tbl_app'),
(42, 1, 'array (\n  \'codigo\' => \'sol\',\n  \'nombre\' => \'Solicitudes\',\n  \'icono\' => \'fa fa-file\',\n)', '2021-09-02 19:05:28', 'tbl_app'),
(43, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-06\',\n)', '2021-09-06 17:07:26', 'tbl_usuario'),
(44, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-06\',\n)', '2021-09-06 17:29:50', 'tbl_usuario'),
(45, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-06\',\n)', '2021-09-06 17:30:36', 'tbl_usuario'),
(46, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-06\',\n)', '2021-09-06 17:45:41', 'tbl_usuario'),
(47, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-07\',\n)', '2021-09-07 15:11:12', 'tbl_usuario'),
(48, 1, 'array (\n  \'opcion\' => \'Usuarios\',\n  \'enlace\' => \'seguridad/usuario/\',\n  \'imagen\' => \'fa fa-users\',\n  \'padre\' => \'6\',\n)', '2021-09-07 15:11:46', 'tbl_menu'),
(49, 1, 'array (\n  \'opcion\' => \'Roles\',\n  \'enlace\' => \'seguridad/rol/\',\n  \'imagen\' => \'fa fa-archive\',\n  \'padre\' => \'6\',\n)', '2021-09-07 15:11:57', 'tbl_menu'),
(50, 1, 'array (\n  \'opcion\' => \'Parámetros Generales\',\n  \'enlace\' => \'seguridad/configral/\',\n  \'imagen\' => \'fa fa-cogs\',\n  \'padre\' => \'6\',\n)', '2021-09-07 15:12:13', 'tbl_menu'),
(51, 1, 'array (\n  \'opcion\' => \'Aplicaciones\',\n  \'enlace\' => \'seguridad/app/\',\n  \'imagen\' => \'fa fa-desktop\',\n  \'padre\' => \'6\',\n)', '2021-09-07 15:13:37', 'tbl_menu'),
(52, 1, 'array (\n  \'opcion\' => \'Tipos Documentos\',\n  \'enlace\' => \'documento/tipodocumento/\',\n  \'imagen\' => \'fa fa-file\',\n  \'padre\' => \'4\',\n)', '2021-09-07 15:14:21', 'tbl_menu'),
(53, 1, 'array (\n  \'opcion\' => \'Categoría de Documento\',\n  \'enlace\' => \'documento/categoriadocumento/\',\n  \'imagen\' => \'fa fa-folder\',\n  \'padre\' => \'4\',\n)', '2021-09-07 15:14:40', 'tbl_menu'),
(54, 1, 'array (\n  \'ultima_conexion\' => \'2021-09-07\',\n)', '2021-09-07 15:38:15', 'tbl_usuario'),
(55, 1, 'array (\n  \'parametro\' => \'TIPO_ARCHIVO\',\n  \'valor\' => \'jpg\',\n  \'descripcion\' => \'<p>Tipo de archivo permitido para suibida</p>\',\n)', '2021-09-07 16:54:31', 'tbl_conf_general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_bitacoraeliminar`
--

CREATE TABLE `tbl_usuario_bitacoraeliminar` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tabla` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_usuario_bitacoraeliminar`
--

INSERT INTO `tbl_usuario_bitacoraeliminar` (`id`, `id_usuario`, `tabla`, `creado`, `data`) VALUES
(1, 1, 'tbl_menu', '2021-08-31 15:41:06', 'stdClass::__set_state(array(\n   \'id\' => \'12\',\n   \'opcion\' => \'Institucion\',\n   \'enlace\' => \'seguridad/institucion/\',\n   \'imagen\' => \'fa fa-building\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:43:03\',\n))'),
(2, 1, 'tbl_documento', '2021-08-31 17:05:35', '1'),
(3, 1, 'tbl_proceso_categoriadocumento', '2021-08-31 19:20:32', '1'),
(4, 1, 'tbl_proceso_campotipo', '2021-08-31 19:47:33', '1'),
(5, 1, 'tbl_archivo', '2021-09-07 17:47:01', 'stdClass::__set_state(array(\n   \'id\' => \'6\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:28:34\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\''),
(6, 1, 'tbl_archivo', '2021-09-07 17:47:24', 'stdClass::__set_state(array(\n   \'id\' => \'7\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/4/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:30:35\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\''),
(7, 1, 'tbl_archivo', '2021-09-07 17:50:29', 'stdClass::__set_state(array(\n   \'id\' => \'10\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:49:14\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuari'),
(8, 1, 'tbl_archivo', '2021-09-07 17:52:08', 'stdClass::__set_state(array(\n   \'id\' => \'11\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:50:36\',\n   \'nombre\' => \'DUI2.jpg\',\n   \'id_usuari'),
(9, 1, 'tbl_archivo', '2021-09-07 17:53:51', 'stdClass::__set_state(array(\n   \'id\' => \'12\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:53:23\',\n   \'nombre\' => \'DUI3.jpg\',\n   \'id_usuari'),
(10, 1, 'tbl_archivo', '2021-09-07 17:58:12', 'stdClass::__set_state(array(\n   \'id\' => \'13\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:58:06\',\n   \'nombre\' => \'DUI4.jpg\',\n   \'id_usuari'),
(11, 1, 'tbl_archivo', '2021-09-07 17:59:41', 'stdClass::__set_state(array(\n   \'id\' => \'14\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:59:36\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario'),
(12, 1, 'tbl_archivo', '2021-09-07 18:00:08', 'stdClass::__set_state(array(\n   \'id\' => \'15\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 12:00:03\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuari'),
(13, 1, 'tbl_archivo', '2021-09-07 18:00:38', 'stdClass::__set_state(array(\n   \'id\' => \'16\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 12:00:33\',\n   \'nombre\' => \'DUI2.jpg\',\n   \'id_usuari');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_bitacoraingreso`
--

CREATE TABLE `tbl_usuario_bitacoraingreso` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data` varchar(255) COLLATE latin1_bin NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tabla` varchar(255) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_usuario_bitacoraingreso`
--

INSERT INTO `tbl_usuario_bitacoraingreso` (`id`, `id_usuario`, `data`, `creado`, `tabla`) VALUES
(1, 1, 'stdClass::__set_state(array(\n   \'id\' => \'6\',\n   \'opcion\' => \'Sistema\',\n   \'enlace\' => \'#\',\n   \'imagen\' => \'fa fa-cogs\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-30 15:17:28\',\n))', '2021-08-30 21:17:28', 'tbl_menu'),
(2, 1, 'stdClass::__set_state(array(\n   \'id\' => \'7\',\n   \'opcion\' => \'Personas\',\n   \'enlace\' => \'seguridad/personas\',\n   \'imagen\' => \'fa fa-user\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:32:51\',\n))', '2021-08-30 21:32:51', 'tbl_menu'),
(3, 1, 'stdClass::__set_state(array(\n   \'id\' => \'8\',\n   \'opcion\' => \'Roles\',\n   \'enlace\' => \'seguridad/rol\',\n   \'imagen\' => \'fa fa-users\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:33:19\',\n))', '2021-08-30 21:33:19', 'tbl_menu'),
(4, 1, 'stdClass::__set_state(array(\n   \'id\' => \'9\',\n   \'opcion\' => \'Aplicaciones\',\n   \'enlace\' => \'seguridad/app/\',\n   \'imagen\' => \'fa fa-archive\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:41:40\',\n))', '2021-08-30 21:41:41', 'tbl_menu'),
(5, 1, 'stdClass::__set_state(array(\n   \'id\' => \'10\',\n   \'opcion\' => \'Parámetros Generales\',\n   \'enlace\' => \'seguridad/configral/\',\n   \'imagen\' => \'\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:42:17\',\n))', '2021-08-30 21:42:17', 'tbl_menu'),
(6, 1, 'stdClass::__set_state(array(\n   \'id\' => \'11\',\n   \'opcion\' => \'Usuarios\',\n   \'enlace\' => \'seguridad/usuario/\',\n   \'imagen\' => \'\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:42:43\',\n))', '2021-08-30 21:42:43', 'tbl_menu'),
(7, 1, 'stdClass::__set_state(array(\n   \'id\' => \'12\',\n   \'opcion\' => \'Institucion\',\n   \'enlace\' => \'seguridad/institucion/\',\n   \'imagen\' => \'fa fa-building\',\n   \'padre\' => \'6\',\n   \'creado\' => \'2021-08-30 15:43:03\',\n))', '2021-08-30 21:43:03', 'tbl_menu'),
(8, 1, 'stdClass::__set_state(array(\n   \'id\' => \'13\',\n   \'opcion\' => \'Tipo\',\n   \'enlace\' => \'seguridad/tipo\',\n   \'imagen\' => \'fa fa-list-alt\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 10:23:22\',\n))', '2021-08-31 16:23:22', 'tbl_menu'),
(9, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 10:24:38\',\n   \'nombre\' => \'Personal\',\n))', '2021-08-31 16:24:38', 'tbl_tipo'),
(10, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 10:24:43\',\n   \'nombre\' => \'Trabajo\',\n))', '2021-08-31 16:24:43', 'tbl_tipo'),
(11, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 10:25:01\',\n   \'telefono\' => \'71651268\',\n   \'id_tipo\' => \'1\',\n))', '2021-08-31 16:25:01', 'tbl_telefono'),
(12, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 10:25:53\',\n   \'telefono\' => \'71651268\',\n   \'id_tipo\' => \'1\',\n))', '2021-08-31 16:25:53', 'tbl_telefono'),
(13, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'id_persona\' => \'1\',\n   \'id_telefono\' => \'2\',\n))', '2021-08-31 16:25:53', 'tbl_persona_telefono'),
(14, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 10:30:07\',\n   \'email\' => \'ser45argueta@gmail.com\',\n   \'id_tipo\' => \'1\',\n))', '2021-08-31 16:30:07', 'tbl_email'),
(15, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'id_persona\' => \'1\',\n   \'id_email\' => \'1\',\n))', '2021-08-31 16:30:07', 'tbl_persona_email'),
(16, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 10:49:50\',\n   \'codigo\' => \'doc\',\n   \'nombre\' => \'Documento\',\n   \'icono\' => \'fa fa-folder\',\n))', '2021-08-31 16:49:50', 'tbl_app'),
(17, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-08-31 10:50:14\',\n   \'codigo\' => \'Proc\',\n   \'nombre\' => \'Procesos\',\n   \'icono\' => \'fa fa-archive\',\n))', '2021-08-31 16:50:14', 'tbl_app'),
(18, 1, 'stdClass::__set_state(array(\n   \'id\' => \'14\',\n   \'opcion\' => \'Tipos Documentos\',\n   \'enlace\' => \'documento/tipodocumento/\',\n   \'imagen\' => \'fa fa-document\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 11:00:54\',\n))', '2021-08-31 17:00:54', 'tbl_menu'),
(19, 1, 'stdClass::__set_state(array(\n   \'id\' => \'15\',\n   \'opcion\' => \'Categoría de Documento\',\n   \'enlace\' => \'documento/categoriadocumento/\',\n   \'imagen\' => \'\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 11:01:21\',\n))', '2021-08-31 17:01:21', 'tbl_menu'),
(20, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'nombre\' => \'DUI\',\n   \'creado\' => \'2021-08-31 11:04:04\',\n))', '2021-08-31 17:04:04', 'tbl_tipodocumento'),
(21, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 11:04:21\',\n   \'nombre\' => \'Personales\',\n))', '2021-08-31 17:04:21', 'tbl_categoriadocumento'),
(22, 1, '1', '2021-08-31 17:05:33', 'tbl_documento'),
(23, 1, '1', '2021-08-31 17:05:36', 'tbl_documento'),
(24, 1, 'stdClass::__set_state(array(\n   \'id\' => \'16\',\n   \'opcion\' => \'Proceso\',\n   \'enlace\' => \'telemetria/proceso/\',\n   \'imagen\' => \'fa fa-building\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 11:12:10\',\n))', '2021-08-31 17:12:10', 'tbl_menu'),
(25, 1, 'stdClass::__set_state(array(\n   \'id\' => \'17\',\n   \'opcion\' => \'Acción\',\n   \'enlace\' => \'telemetria/accion/\',\n   \'imagen\' => \'fa fa-tweet\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 11:12:43\',\n))', '2021-08-31 17:12:43', 'tbl_menu'),
(26, 1, 'stdClass::__set_state(array(\n   \'id\' => \'18\',\n   \'opcion\' => \'Estación\',\n   \'enlace\' => \'telemetria/estacion/\',\n   \'imagen\' => \'fa fa-building\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 11:12:57\',\n))', '2021-08-31 17:12:57', 'tbl_menu'),
(27, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 11:31:54\',\n   \'nombre\' => \'INICIADO\',\n   \'codigo\' => \'INICIADO\',\n))', '2021-08-31 17:31:54', 'tbl_accion'),
(28, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 11:32:05\',\n   \'nombre\' => \'EN_TRAMITE\',\n   \'codigo\' => \'EN_TRAMITE\',\n))', '2021-08-31 17:32:05', 'tbl_accion'),
(29, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 11:33:27\',\n   \'nombre\' => \'recepción de Solicitud\',\n   \'codigo\' => \'Inbox\',\n))', '2021-08-31 17:33:27', 'tbl_estacion'),
(30, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 11:33:49\',\n   \'nombre\' => \'Revisión de Solicitud\',\n   \'codigo\' => \'CHECK\',\n))', '2021-08-31 17:33:49', 'tbl_estacion'),
(31, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-08-31 11:34:02\',\n   \'nombre\' => \'Impresión de Documentación\',\n   \'codigo\' => \'PRINT\',\n))', '2021-08-31 17:34:03', 'tbl_estacion'),
(32, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-08-31 11:34:27\',\n   \'nombre\' => \'Entrega de Solicitudes\',\n   \'codigo\' => \'OUTBOX\',\n))', '2021-08-31 17:34:27', 'tbl_estacion'),
(33, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 11:42:55\',\n   \'nombre\' => \'Partida de Nacimiento\',\n   \'descrpcion\' => NULL,\n   \'codigo\' => \'Partida_Nac\',\n))', '2021-08-31 17:42:55', 'tbl_proceso'),
(34, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 11:45:51\',\n   \'id_proceso\' => \'1\',\n   \'id_estacion\' => \'1\',\n   \'ruta\' => \'1\',\n))', '2021-08-31 17:45:51', 'tbl_proceso_estacion'),
(35, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-08-31 11:46:05\',\n   \'id_proceso\' => \'1\',\n   \'id_estacion\' => \'2\',\n   \'ruta\' => \'2\',\n))', '2021-08-31 17:46:06', 'tbl_proceso_estacion'),
(36, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-08-31 11:46:09\',\n   \'id_proceso\' => \'1\',\n   \'id_estacion\' => \'3\',\n   \'ruta\' => \'3\',\n))', '2021-08-31 17:46:09', 'tbl_proceso_estacion'),
(37, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-08-31 11:46:13\',\n   \'id_proceso\' => \'1\',\n   \'id_estacion\' => \'4\',\n   \'ruta\' => \'4\',\n))', '2021-08-31 17:46:13', 'tbl_proceso_estacion'),
(38, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-08-31 12:31:01\',\n   \'id_proceso_estacion_origen\' => \'1\',\n   \'id_accion\' => \'1\',\n   \'id_proceso_estacion_destino\' => \'2\',\n))', '2021-08-31 18:31:01', 'tbl_proceso_estacion_accion'),
(39, 1, 'stdClass::__set_state(array(\n   \'id\' => \'19\',\n   \'opcion\' => \'Campos Adicionales\',\n   \'enlace\' => \'telemetria/campotipo/\',\n   \'imagen\' => \'fa fa-align-justify\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-08-31 13:44:42\',\n))', '2021-08-31 19:44:42', 'tbl_menu'),
(40, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-08-31 13:47:16\',\n   \'nombre\' => \'Hospital\',\n   \'descripcion\' => \'\',\n))', '2021-08-31 19:47:16', 'tbl_campotipo'),
(41, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-01 09:41:50\',\n   \'codigo\' => \'Sol\',\n   \'nombre\' => \'Solicitudes\',\n   \'icono\' => \'fa fa-file\',\n))', '2021-09-01 15:41:50', 'tbl_app'),
(42, 1, 'stdClass::__set_state(array(\n   \'id\' => \'20\',\n   \'opcion\' => \'Partida de Nacimiento\',\n   \'enlace\' => \'telemetria/lista/1/1\',\n   \'imagen\' => \'fa fa-archive\',\n   \'padre\' => \'4\',\n   \'creado\' => \'2021-09-01 09:43:53\',\n))', '2021-09-01 15:43:53', 'tbl_menu'),
(43, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'parametro\' => \'ACCION_INICIO\',\n   \'valor\' => \'INICIADO\',\n   \'creado\' => \'2021-09-01 10:00:26\',\n   \'descripcion\' => \'<p>Accion de inicio para telemetrias</p>\',\n))', '2021-09-01 16:00:26', 'tbl_conf_general'),
(44, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 11:30:22\',\n   \'nombre\' => \'Partida de Defunción\',\n   \'descrpcion\' => NULL,\n   \'codigo\' => \'Partida_Def\',\n   \'icono\' => NULL,\n))', '2021-09-01 17:30:22', 'tbl_proceso'),
(45, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 12:37:17\',\n   \'nombre\' => \'Email\',\n   \'descripcion\' => \'correo personal\',\n   \'tipo\' => \'email\',\n   \'validacion\' => \'\',\n))', '2021-09-01 18:37:17', 'tbl_campotipo'),
(46, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 12:38:40\',\n   \'nombre\' => \'Fecha de Defuncion\',\n   \'descripcion\' => \'Fecha de Defunción de la persona\',\n   \'tipo\' => \'date\',\n   \'validacion\' => \'\',\n))', '2021-09-01 18:38:40', 'tbl_campotipo'),
(47, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-09-01 13:23:36\',\n   \'id_usuario\' => \'1\',\n   \'id_solicitud_tipo\' => \'0\',\n))', '2021-09-01 19:23:36', 'tbl_solicitud'),
(48, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-09-01 13:23:36\',\n   \'id_persona\' => \'1\',\n   \'id_solicitud\' => \'1\',\n))', '2021-09-01 19:23:36', 'tbl_solicitud_persona'),
(49, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 13:24:15\',\n   \'id_usuario\' => \'1\',\n   \'id_solicitud_tipo\' => \'0\',\n))', '2021-09-01 19:24:15', 'tbl_solicitud'),
(50, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 13:24:15\',\n   \'id_persona\' => \'1\',\n   \'id_solicitud\' => \'2\',\n))', '2021-09-01 19:24:15', 'tbl_solicitud_persona'),
(51, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-09-01 13:24:15\',\n   \'id_solicitud\' => \'2\',\n   \'id_motivo\' => \'1\',\n   \'comentario\' => \'me la solicitan\',\n))', '2021-09-01 19:24:15', 'tbl_solicitud_motivo'),
(52, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-09-01 13:24:15\',\n   \'id_proceso_estacion_accion\' => \'3\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'Inicio de Solicitud de Proceso Partida de Nacimiento\',\n   \'id_solicitud\' => \'2\',\n   \'act', '2021-09-01 19:24:15', 'tbl_solicitud_bitacora'),
(53, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 13:25:00\',\n   \'id_usuario\' => \'1\',\n   \'id_solicitud_tipo\' => \'0\',\n))', '2021-09-01 19:25:00', 'tbl_solicitud'),
(54, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 13:25:00\',\n   \'id_persona\' => \'1\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-01 19:25:01', 'tbl_solicitud_persona'),
(55, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 13:25:01\',\n   \'id_solicitud\' => \'3\',\n   \'id_motivo\' => \'1\',\n   \'comentario\' => \'me la solicitan\',\n))', '2021-09-01 19:25:01', 'tbl_solicitud_motivo'),
(56, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 13:25:01\',\n   \'id_proceso_estacion_accion\' => \'3\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'Inicio de Solicitud de Proceso Partida de Nacimiento\',\n   \'id_solicitud\' => \'3\',\n   \'act', '2021-09-01 19:25:01', 'tbl_solicitud_bitacora'),
(57, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-01 13:29:04\',\n   \'id_usuario\' => \'1\',\n   \'id_solicitud_tipo\' => \'0\',\n))', '2021-09-01 19:29:04', 'tbl_solicitud'),
(58, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-01 13:29:04\',\n   \'id_persona\' => \'1\',\n   \'id_solicitud\' => \'4\',\n))', '2021-09-01 19:29:04', 'tbl_solicitud_persona'),
(59, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 13:29:04\',\n   \'id_solicitud\' => \'4\',\n   \'id_motivo\' => \'1\',\n   \'comentario\' => \'me la solicitan\',\n))', '2021-09-01 19:29:04', 'tbl_solicitud_motivo'),
(60, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 13:29:04\',\n   \'id_proceso_estacion_accion\' => \'3\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'Inicio de Solicitud de Proceso Partida de Nacimiento\',\n   \'id_solicitud\' => \'4\',\n   \'act', '2021-09-01 19:29:05', 'tbl_solicitud_bitacora'),
(61, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-01 13:29:05\',\n   \'id_solicitud\' => \'4\',\n   \'id_campotipo_proceso\' => \'2\',\n   \'valor\' => \'el salvador\',\n))', '2021-09-01 19:29:05', 'tbl_campotipo_proceso_solicitud'),
(62, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 13:29:05\',\n   \'id_solicitud\' => \'4\',\n   \'id_campotipo_proceso\' => \'3\',\n   \'valor\' => \'ser@gmail.com\',\n))', '2021-09-01 19:29:05', 'tbl_campotipo_proceso_solicitud'),
(63, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-01 14:51:57\',\n   \'nombre\' => \'IMPRIMIR\',\n   \'codigo\' => \'IMPRIMIR\',\n))', '2021-09-01 20:51:57', 'tbl_accion'),
(64, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-01 14:52:15\',\n   \'id_proceso_estacion_origen\' => \'2\',\n   \'id_accion\' => \'2\',\n   \'id_proceso_estacion_destino\' => \'3\',\n))', '2021-09-01 20:52:15', 'tbl_proceso_estacion_accion'),
(65, 1, 'stdClass::__set_state(array(\n   \'id\' => \'5\',\n   \'creado\' => \'2021-09-01 14:52:23\',\n   \'id_proceso_estacion_origen\' => \'3\',\n   \'id_accion\' => \'3\',\n   \'id_proceso_estacion_destino\' => \'4\',\n))', '2021-09-01 20:52:23', 'tbl_proceso_estacion_accion'),
(66, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-02 08:40:01\',\n   \'id_proceso_estacion_accion\' => \'4\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'nuevo movimiento\',\n   \'id_solicitud\' => \'2\',\n   \'activa\' => \'1\',\n))', '2021-09-02 14:40:01', 'tbl_solicitud_bitacora'),
(67, 1, 'stdClass::__set_state(array(\n   \'id\' => \'5\',\n   \'creado\' => \'2021-09-02 08:40:42\',\n   \'id_proceso_estacion_accion\' => \'4\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'nuevo movimiento\',\n   \'id_solicitud\' => \'2\',\n   \'activa\' => \'1\',\n))', '2021-09-02 14:40:43', 'tbl_solicitud_bitacora'),
(68, 1, 'stdClass::__set_state(array(\n   \'id\' => \'6\',\n   \'creado\' => \'2021-09-02 08:41:05\',\n   \'id_proceso_estacion_accion\' => \'4\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'en tramite\',\n   \'id_solicitud\' => \'3\',\n   \'activa\' => \'1\',\n))', '2021-09-02 14:41:05', 'tbl_solicitud_bitacora'),
(69, 1, 'stdClass::__set_state(array(\n   \'id\' => \'7\',\n   \'creado\' => \'2021-09-02 08:42:52\',\n   \'id_proceso_estacion_accion\' => \'4\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'nuevo movimiento\',\n   \'id_solicitud\' => \'4\',\n   \'activa\' => \'1\',\n))', '2021-09-02 14:42:52', 'tbl_solicitud_bitacora'),
(70, 1, 'stdClass::__set_state(array(\n   \'id\' => \'21\',\n   \'opcion\' => \'Estación Revisión\',\n   \'enlace\' => \'telemetria/listar/2/Partida_Nac\',\n   \'imagen\' => \'\',\n   \'padre\' => \'20\',\n   \'creado\' => \'2021-09-02 08:55:33\',\n))', '2021-09-02 14:55:33', 'tbl_menu'),
(71, 1, 'stdClass::__set_state(array(\n   \'id\' => \'22\',\n   \'opcion\' => \'Estación Impresión\',\n   \'enlace\' => \'telemetria/listar/3/Partida_Nac\',\n   \'imagen\' => \'\',\n   \'padre\' => \'20\',\n   \'creado\' => \'2021-09-02 08:55:47\',\n))', '2021-09-02 14:55:47', 'tbl_menu'),
(72, 1, 'stdClass::__set_state(array(\n   \'id\' => \'23\',\n   \'opcion\' => \'Estación Salida\',\n   \'enlace\' => \'telemetria/listar/4/Partida_Nac\',\n   \'imagen\' => \'\',\n   \'padre\' => \'20\',\n   \'creado\' => \'2021-09-02 08:56:00\',\n))', '2021-09-02 14:56:00', 'tbl_menu'),
(73, 1, 'stdClass::__set_state(array(\n   \'id\' => \'8\',\n   \'creado\' => \'2021-09-02 08:58:02\',\n   \'id_proceso_estacion_accion\' => \'5\',\n   \'id_usuario\' => \'1\',\n   \'comentario\' => \'\',\n   \'id_solicitud\' => \'2\',\n   \'activa\' => \'1\',\n))', '2021-09-02 14:58:02', 'tbl_solicitud_bitacora'),
(74, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-02 10:13:41\',\n   \'nombre\' => \'juan\',\n   \'apellido\' => \'castro\',\n   \'genero\' => \'MASCULINO\',\n   \'dui\' => NULL,\n   \'nit\' => NULL,\n   \'pasaporte\' => NULL,\n))', '2021-09-02 16:13:41', 'tbl_persona'),
(75, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-02 10:13:48\',\n   \'nombre\' => \'marcela\',\n   \'apellido\' => \'ramirez\',\n   \'genero\' => \'MASCULINO\',\n   \'dui\' => NULL,\n   \'nit\' => NULL,\n   \'pasaporte\' => NULL,\n))', '2021-09-02 16:13:48', 'tbl_persona'),
(76, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'parametro\' => \'MAX_ARCHIVO\',\n   \'valor\' => \'80000\',\n   \'creado\' => \'2021-09-07 10:31:35\',\n   \'descripcion\' => \'<p>Tama&ntilde;o m&aacute;ximo de archivo de subida</p>\',\n))', '2021-09-07 16:31:35', 'tbl_conf_general'),
(77, 1, 'stdClass::__set_state(array(\n   \'id\' => \'5\',\n   \'parametro\' => \'TIPO_ARCHIVO\',\n   \'valor\' => \'pdf/jpg\',\n   \'creado\' => \'2021-09-07 10:31:59\',\n   \'descripcion\' => \'<p>Tipo de archivo permitido para suibida</p>\',\n))', '2021-09-07 16:31:59', 'tbl_conf_general'),
(78, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'ruta\' => \'C:/xampp/htdocs/esqueleto/assets/uploads/files/solicitudes/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 10:56:05\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\' => \'1', '2021-09-07 16:56:05', 'tbl_archivo'),
(79, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'ruta\' => \'C:/xampp/htdocs/esqueleto/assets/uploads/files/solicitudes/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 10:56:50\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuario\' => \'', '2021-09-07 16:56:50', 'tbl_archivo'),
(80, 1, 'stdClass::__set_state(array(\n   \'id\' => \'1\',\n   \'creado\' => \'2021-09-07 10:56:50\',\n   \'id_archivo\' => \'2\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 16:56:50', 'tbl_solicitud_archivo'),
(81, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'ruta\' => \'C:/xampp/htdocs/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 10:58:47\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\' => ', '2021-09-07 16:58:47', 'tbl_archivo'),
(82, 1, 'stdClass::__set_state(array(\n   \'id\' => \'2\',\n   \'creado\' => \'2021-09-07 10:58:47\',\n   \'id_archivo\' => \'2\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 16:58:47', 'tbl_solicitud_archivo'),
(83, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'ruta\' => \'C:/xampp/htdocs/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:09:10\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuario\' =>', '2021-09-07 17:09:10', 'tbl_archivo'),
(84, 1, 'stdClass::__set_state(array(\n   \'id\' => \'3\',\n   \'creado\' => \'2021-09-07 11:09:10\',\n   \'id_archivo\' => \'4\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:09:10', 'tbl_solicitud_archivo'),
(85, 1, 'stdClass::__set_state(array(\n   \'id\' => \'5\',\n   \'ruta\' => \'C:/xampp/htdocs/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:09:39\',\n   \'nombre\' => \'DUI2.jpg\',\n   \'id_usuario\' =>', '2021-09-07 17:09:39', 'tbl_archivo'),
(86, 1, 'stdClass::__set_state(array(\n   \'id\' => \'4\',\n   \'creado\' => \'2021-09-07 11:09:39\',\n   \'id_archivo\' => \'5\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:09:40', 'tbl_solicitud_archivo'),
(87, 1, 'stdClass::__set_state(array(\n   \'id\' => \'6\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:28:34\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\'', '2021-09-07 17:28:34', 'tbl_archivo'),
(88, 1, 'stdClass::__set_state(array(\n   \'id\' => \'5\',\n   \'creado\' => \'2021-09-07 11:28:34\',\n   \'id_archivo\' => \'6\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:28:34', 'tbl_solicitud_archivo'),
(89, 1, 'stdClass::__set_state(array(\n   \'id\' => \'7\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/4/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:30:35\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\'', '2021-09-07 17:30:35', 'tbl_archivo'),
(90, 1, 'stdClass::__set_state(array(\n   \'id\' => \'6\',\n   \'creado\' => \'2021-09-07 11:30:36\',\n   \'id_archivo\' => \'7\',\n   \'id_solicitud\' => \'4\',\n))', '2021-09-07 17:30:36', 'tbl_solicitud_archivo'),
(91, 1, 'stdClass::__set_state(array(\n   \'id\' => \'8\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/2/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:31:49\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario\'', '2021-09-07 17:31:49', 'tbl_archivo'),
(92, 1, 'stdClass::__set_state(array(\n   \'id\' => \'7\',\n   \'creado\' => \'2021-09-07 11:31:49\',\n   \'id_archivo\' => \'8\',\n   \'id_solicitud\' => \'2\',\n))', '2021-09-07 17:31:49', 'tbl_solicitud_archivo'),
(93, 1, 'stdClass::__set_state(array(\n   \'id\' => \'9\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/4/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:47:30\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuario', '2021-09-07 17:47:30', 'tbl_archivo'),
(94, 1, 'stdClass::__set_state(array(\n   \'id\' => \'8\',\n   \'creado\' => \'2021-09-07 11:47:30\',\n   \'id_archivo\' => \'9\',\n   \'id_solicitud\' => \'4\',\n))', '2021-09-07 17:47:30', 'tbl_solicitud_archivo'),
(95, 1, 'stdClass::__set_state(array(\n   \'id\' => \'10\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:49:14\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuari', '2021-09-07 17:49:14', 'tbl_archivo'),
(96, 1, 'stdClass::__set_state(array(\n   \'id\' => \'9\',\n   \'creado\' => \'2021-09-07 11:49:14\',\n   \'id_archivo\' => \'10\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:49:14', 'tbl_solicitud_archivo'),
(97, 1, 'stdClass::__set_state(array(\n   \'id\' => \'11\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:50:36\',\n   \'nombre\' => \'DUI2.jpg\',\n   \'id_usuari', '2021-09-07 17:50:36', 'tbl_archivo'),
(98, 1, 'stdClass::__set_state(array(\n   \'id\' => \'10\',\n   \'creado\' => \'2021-09-07 11:50:36\',\n   \'id_archivo\' => \'11\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:50:36', 'tbl_solicitud_archivo'),
(99, 1, 'stdClass::__set_state(array(\n   \'id\' => \'12\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:53:23\',\n   \'nombre\' => \'DUI3.jpg\',\n   \'id_usuari', '2021-09-07 17:53:23', 'tbl_archivo'),
(100, 1, 'stdClass::__set_state(array(\n   \'id\' => \'11\',\n   \'creado\' => \'2021-09-07 11:53:23\',\n   \'id_archivo\' => \'12\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:53:23', 'tbl_solicitud_archivo'),
(101, 1, 'stdClass::__set_state(array(\n   \'id\' => \'13\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:58:06\',\n   \'nombre\' => \'DUI4.jpg\',\n   \'id_usuari', '2021-09-07 17:58:06', 'tbl_archivo'),
(102, 1, 'stdClass::__set_state(array(\n   \'id\' => \'12\',\n   \'creado\' => \'2021-09-07 11:58:06\',\n   \'id_archivo\' => \'13\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:58:06', 'tbl_solicitud_archivo'),
(103, 1, 'stdClass::__set_state(array(\n   \'id\' => \'14\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 11:59:36\',\n   \'nombre\' => \'DUI.jpg\',\n   \'id_usuario', '2021-09-07 17:59:37', 'tbl_archivo'),
(104, 1, 'stdClass::__set_state(array(\n   \'id\' => \'13\',\n   \'creado\' => \'2021-09-07 11:59:37\',\n   \'id_archivo\' => \'14\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 17:59:37', 'tbl_solicitud_archivo'),
(105, 1, 'stdClass::__set_state(array(\n   \'id\' => \'15\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 12:00:03\',\n   \'nombre\' => \'DUI1.jpg\',\n   \'id_usuari', '2021-09-07 18:00:03', 'tbl_archivo'),
(106, 1, 'stdClass::__set_state(array(\n   \'id\' => \'14\',\n   \'creado\' => \'2021-09-07 12:00:03\',\n   \'id_archivo\' => \'15\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 18:00:03', 'tbl_solicitud_archivo'),
(107, 1, 'stdClass::__set_state(array(\n   \'id\' => \'16\',\n   \'ruta\' => \'http://localhost:82/esqueleto/assets/uploads/files/solicitudes/3/\',\n   \'peso\' => \'39\',\n   \'formato\' => \'image/jpeg\',\n   \'creado\' => \'2021-09-07 12:00:33\',\n   \'nombre\' => \'DUI2.jpg\',\n   \'id_usuari', '2021-09-07 18:00:33', 'tbl_archivo'),
(108, 1, 'stdClass::__set_state(array(\n   \'id\' => \'15\',\n   \'creado\' => \'2021-09-07 12:00:33\',\n   \'id_archivo\' => \'16\',\n   \'id_solicitud\' => \'3\',\n))', '2021-09-07 18:00:33', 'tbl_solicitud_archivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_rol`
--

CREATE TABLE `tbl_usuario_rol` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `tbl_usuario_rol`
--

INSERT INTO `tbl_usuario_rol` (`id`, `id_usuario`, `id_rol`, `creado`) VALUES
(1, 1, 1, '2021-08-30 20:44:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_accion`
--
ALTER TABLE `tbl_accion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_app`
--
ALTER TABLE `tbl_app`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_app_menu`
--
ALTER TABLE `tbl_app_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_app_me583047` (`id_app`);

--
-- Indices de la tabla `tbl_archivo`
--
ALTER TABLE `tbl_archivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_archiv138830` (`id_documento`),
  ADD KEY `FKtbl_archiv138823` (`id_usuario`);

--
-- Indices de la tabla `tbl_campotipo`
--
ALTER TABLE `tbl_campotipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_campotipo_proceso`
--
ALTER TABLE `tbl_campotipo_proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_campot202290` (`id_campotipo`),
  ADD KEY `FKtbl_campot481656` (`id_proceso`);

--
-- Indices de la tabla `tbl_campotipo_proceso_solicitud`
--
ALTER TABLE `tbl_campotipo_proceso_solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_campot260203` (`id_campotipo_proceso`),
  ADD KEY `FKtbl_campot609923` (`id_solicitud`);

--
-- Indices de la tabla `tbl_categoriadocumento`
--
ALTER TABLE `tbl_categoriadocumento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_conf_general`
--
ALTER TABLE `tbl_conf_general`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_documento`
--
ALTER TABLE `tbl_documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_tipodo409394` (`id_categoriadocumento`),
  ADD KEY `FKtbl_tipodo487602` (`id_tipodocumento`);

--
-- Indices de la tabla `tbl_email`
--
ALTER TABLE `tbl_email`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_estacion`
--
ALTER TABLE `tbl_estacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_menu655968` (`padre`);

--
-- Indices de la tabla `tbl_menu_rol`
--
ALTER TABLE `tbl_menu_rol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `tbl_minucipio`
--
ALTER TABLE `tbl_minucipio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_motivo`
--
ALTER TABLE `tbl_motivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_persona_direccion`
--
ALTER TABLE `tbl_persona_direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_persona_email`
--
ALTER TABLE `tbl_persona_email`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_persona_telefono`
--
ALTER TABLE `tbl_persona_telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_person707698` (`id_telefono`);

--
-- Indices de la tabla `tbl_proceso`
--
ALTER TABLE `tbl_proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `tbl_proceso_categoriadocumento`
--
ALTER TABLE `tbl_proceso_categoriadocumento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_proces86244` (`id_proceso`);

--
-- Indices de la tabla `tbl_proceso_estacion`
--
ALTER TABLE `tbl_proceso_estacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_proces544427` (`id_estacion`),
  ADD KEY `FKtbl_proces227286` (`id_proceso`);

--
-- Indices de la tabla `tbl_proceso_estacion_accion`
--
ALTER TABLE `tbl_proceso_estacion_accion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_proces358565` (`id_proceso_estacion_destino`),
  ADD KEY `FKtbl_proces413416` (`id_accion`),
  ADD KEY `FKtbl_proces592914` (`id_proceso_estacion_origen`);

--
-- Indices de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_solicitud`
--
ALTER TABLE `tbl_solicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_solicitud_archivo`
--
ALTER TABLE `tbl_solicitud_archivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_solici408279` (`id_archivo`),
  ADD KEY `FKtbl_solici510171` (`id_solicitud`);

--
-- Indices de la tabla `tbl_solicitud_bitacora`
--
ALTER TABLE `tbl_solicitud_bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_bitaco113143` (`id_proceso_estacion_accion`),
  ADD KEY `FKtbl_bitaco674475` (`id_solicitud`);

--
-- Indices de la tabla `tbl_solicitud_motivo`
--
ALTER TABLE `tbl_solicitud_motivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_solici548236` (`id_solicitud`),
  ADD KEY `FKtbl_solici910947` (`id_motivo`);

--
-- Indices de la tabla `tbl_solicitud_persona`
--
ALTER TABLE `tbl_solicitud_persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_solici170625` (`id_solicitud`);

--
-- Indices de la tabla `tbl_solicitud_proceso`
--
ALTER TABLE `tbl_solicitud_proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_solici93297` (`id_solicitud`),
  ADD KEY `FKtbl_solici341097` (`id_proceso`);

--
-- Indices de la tabla `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_telefo807619` (`id_tipo`);

--
-- Indices de la tabla `tbl_tipo`
--
ALTER TABLE `tbl_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_tipodocumento`
--
ALTER TABLE `tbl_tipodocumento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `FKtbl_usuari114634` (`id_persona`);

--
-- Indices de la tabla `tbl_usuariobitacora`
--
ALTER TABLE `tbl_usuariobitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_usuari853148` (`id_usuario`);

--
-- Indices de la tabla `tbl_usuario_bitacoraactualizar`
--
ALTER TABLE `tbl_usuario_bitacoraactualizar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_usuari825357` (`id_usuario`);

--
-- Indices de la tabla `tbl_usuario_bitacoraeliminar`
--
ALTER TABLE `tbl_usuario_bitacoraeliminar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_usuari36210` (`id_usuario`);

--
-- Indices de la tabla `tbl_usuario_bitacoraingreso`
--
ALTER TABLE `tbl_usuario_bitacoraingreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtbl_usuari765069` (`id_usuario`);

--
-- Indices de la tabla `tbl_usuario_rol`
--
ALTER TABLE `tbl_usuario_rol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_accion`
--
ALTER TABLE `tbl_accion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_app`
--
ALTER TABLE `tbl_app`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_app_menu`
--
ALTER TABLE `tbl_app_menu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_archivo`
--
ALTER TABLE `tbl_archivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_campotipo`
--
ALTER TABLE `tbl_campotipo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_campotipo_proceso`
--
ALTER TABLE `tbl_campotipo_proceso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_campotipo_proceso_solicitud`
--
ALTER TABLE `tbl_campotipo_proceso_solicitud`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_categoriadocumento`
--
ALTER TABLE `tbl_categoriadocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_conf_general`
--
ALTER TABLE `tbl_conf_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_documento`
--
ALTER TABLE `tbl_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_email`
--
ALTER TABLE `tbl_email`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_estacion`
--
ALTER TABLE `tbl_estacion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tbl_menu_rol`
--
ALTER TABLE `tbl_menu_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbl_minucipio`
--
ALTER TABLE `tbl_minucipio`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_motivo`
--
ALTER TABLE `tbl_motivo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_persona_direccion`
--
ALTER TABLE `tbl_persona_direccion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_persona_email`
--
ALTER TABLE `tbl_persona_email`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_persona_telefono`
--
ALTER TABLE `tbl_persona_telefono`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_proceso`
--
ALTER TABLE `tbl_proceso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_proceso_categoriadocumento`
--
ALTER TABLE `tbl_proceso_categoriadocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_proceso_estacion`
--
ALTER TABLE `tbl_proceso_estacion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_proceso_estacion_accion`
--
ALTER TABLE `tbl_proceso_estacion_accion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud`
--
ALTER TABLE `tbl_solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud_archivo`
--
ALTER TABLE `tbl_solicitud_archivo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud_bitacora`
--
ALTER TABLE `tbl_solicitud_bitacora`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud_motivo`
--
ALTER TABLE `tbl_solicitud_motivo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud_persona`
--
ALTER TABLE `tbl_solicitud_persona`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitud_proceso`
--
ALTER TABLE `tbl_solicitud_proceso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo`
--
ALTER TABLE `tbl_tipo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipodocumento`
--
ALTER TABLE `tbl_tipodocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_usuariobitacora`
--
ALTER TABLE `tbl_usuariobitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario_bitacoraactualizar`
--
ALTER TABLE `tbl_usuario_bitacoraactualizar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario_bitacoraeliminar`
--
ALTER TABLE `tbl_usuario_bitacoraeliminar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario_bitacoraingreso`
--
ALTER TABLE `tbl_usuario_bitacoraingreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario_rol`
--
ALTER TABLE `tbl_usuario_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_app_menu`
--
ALTER TABLE `tbl_app_menu`
  ADD CONSTRAINT `FKtbl_app_me583047` FOREIGN KEY (`id_app`) REFERENCES `tbl_app` (`id`);

--
-- Filtros para la tabla `tbl_archivo`
--
ALTER TABLE `tbl_archivo`
  ADD CONSTRAINT `FKtbl_archiv138823` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_archiv138830` FOREIGN KEY (`id_documento`) REFERENCES `tbl_documento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_campotipo_proceso`
--
ALTER TABLE `tbl_campotipo_proceso`
  ADD CONSTRAINT `FKtbl_campot202290` FOREIGN KEY (`id_campotipo`) REFERENCES `tbl_campotipo` (`id`),
  ADD CONSTRAINT `FKtbl_campot481656` FOREIGN KEY (`id_proceso`) REFERENCES `tbl_proceso` (`id`);

--
-- Filtros para la tabla `tbl_campotipo_proceso_solicitud`
--
ALTER TABLE `tbl_campotipo_proceso_solicitud`
  ADD CONSTRAINT `FKtbl_campot260203` FOREIGN KEY (`id_campotipo_proceso`) REFERENCES `tbl_campotipo_proceso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_campot609923` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_documento`
--
ALTER TABLE `tbl_documento`
  ADD CONSTRAINT `FKtbl_tipodo409394` FOREIGN KEY (`id_categoriadocumento`) REFERENCES `tbl_categoriadocumento` (`id`),
  ADD CONSTRAINT `FKtbl_tipodo487602` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tbl_tipodocumento` (`id`);

--
-- Filtros para la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FKtbl_menu655968` FOREIGN KEY (`padre`) REFERENCES `tbl_menu` (`id`);

--
-- Filtros para la tabla `tbl_menu_rol`
--
ALTER TABLE `tbl_menu_rol`
  ADD CONSTRAINT `FKtbl_menu_r173182` FOREIGN KEY (`id_menu`) REFERENCES `tbl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_menu_r449877` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id`);

--
-- Filtros para la tabla `tbl_persona_telefono`
--
ALTER TABLE `tbl_persona_telefono`
  ADD CONSTRAINT `FKtbl_person707698` FOREIGN KEY (`id_telefono`) REFERENCES `tbl_telefono` (`id`);

--
-- Filtros para la tabla `tbl_proceso_categoriadocumento`
--
ALTER TABLE `tbl_proceso_categoriadocumento`
  ADD CONSTRAINT `FKtbl_proces86244` FOREIGN KEY (`id_proceso`) REFERENCES `tbl_proceso` (`id`);

--
-- Filtros para la tabla `tbl_proceso_estacion`
--
ALTER TABLE `tbl_proceso_estacion`
  ADD CONSTRAINT `FKtbl_proces227286` FOREIGN KEY (`id_proceso`) REFERENCES `tbl_proceso` (`id`),
  ADD CONSTRAINT `FKtbl_proces544427` FOREIGN KEY (`id_estacion`) REFERENCES `tbl_estacion` (`id`);

--
-- Filtros para la tabla `tbl_proceso_estacion_accion`
--
ALTER TABLE `tbl_proceso_estacion_accion`
  ADD CONSTRAINT `FKtbl_proces358565` FOREIGN KEY (`id_proceso_estacion_destino`) REFERENCES `tbl_proceso_estacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_proces413416` FOREIGN KEY (`id_accion`) REFERENCES `tbl_accion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_proces592914` FOREIGN KEY (`id_proceso_estacion_origen`) REFERENCES `tbl_proceso_estacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_solicitud_archivo`
--
ALTER TABLE `tbl_solicitud_archivo`
  ADD CONSTRAINT `FKtbl_solici408279` FOREIGN KEY (`id_archivo`) REFERENCES `tbl_archivo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKtbl_solici510171` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_solicitud_bitacora`
--
ALTER TABLE `tbl_solicitud_bitacora`
  ADD CONSTRAINT `FKtbl_bitaco113143` FOREIGN KEY (`id_proceso_estacion_accion`) REFERENCES `tbl_proceso_estacion_accion` (`id`),
  ADD CONSTRAINT `FKtbl_bitaco674475` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`);

--
-- Filtros para la tabla `tbl_solicitud_motivo`
--
ALTER TABLE `tbl_solicitud_motivo`
  ADD CONSTRAINT `FKtbl_solici548236` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`),
  ADD CONSTRAINT `FKtbl_solici910947` FOREIGN KEY (`id_motivo`) REFERENCES `tbl_motivo` (`id`);

--
-- Filtros para la tabla `tbl_solicitud_persona`
--
ALTER TABLE `tbl_solicitud_persona`
  ADD CONSTRAINT `FKtbl_solici170625` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`);

--
-- Filtros para la tabla `tbl_solicitud_proceso`
--
ALTER TABLE `tbl_solicitud_proceso`
  ADD CONSTRAINT `FKtbl_solici341097` FOREIGN KEY (`id_proceso`) REFERENCES `tbl_proceso` (`id`),
  ADD CONSTRAINT `FKtbl_solici93297` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id`);

--
-- Filtros para la tabla `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  ADD CONSTRAINT `FKtbl_telefo807619` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo` (`id`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `FKtbl_usuari114634` FOREIGN KEY (`id_persona`) REFERENCES `tbl_persona` (`id`);

--
-- Filtros para la tabla `tbl_usuariobitacora`
--
ALTER TABLE `tbl_usuariobitacora`
  ADD CONSTRAINT `FKtbl_usuari853148` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`);

--
-- Filtros para la tabla `tbl_usuario_bitacoraactualizar`
--
ALTER TABLE `tbl_usuario_bitacoraactualizar`
  ADD CONSTRAINT `FKtbl_usuari825357` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`);

--
-- Filtros para la tabla `tbl_usuario_bitacoraeliminar`
--
ALTER TABLE `tbl_usuario_bitacoraeliminar`
  ADD CONSTRAINT `FKtbl_usuari36210` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`);

--
-- Filtros para la tabla `tbl_usuario_bitacoraingreso`
--
ALTER TABLE `tbl_usuario_bitacoraingreso`
  ADD CONSTRAINT `FKtbl_usuari765069` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`);

--
-- Filtros para la tabla `tbl_usuario_rol`
--
ALTER TABLE `tbl_usuario_rol`
  ADD CONSTRAINT `FKtbl_usuari55807` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id`),
  ADD CONSTRAINT `FKtbl_usuari965447` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
