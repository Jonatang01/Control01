-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2018 a las 22:16:44
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box`
--

CREATE TABLE `box` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id`, `image`, `name`, `description`, `created_at`) VALUES
(1, NULL, 'JonatanG', NULL, '2018-01-18 20:30:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `image`, `name`, `description`, `created_at`) VALUES
(1, NULL, 'Discos', NULL, '2018-01-19 12:02:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `short` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` int(11) NOT NULL,
  `val` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
(1, 'company_name', 'Nombre de la empresa', 2, 'Gigasoft'),
(2, 'title', 'Titulo del Sistema', 2, 'ControlStock'),
(3, 'ticket_title', 'Titulo en el Ticket', 2, 'ControlStock-GIGASOFT'),
(4, 'admin_email', 'Email Administracion', 2, 'Jonatan_Gutierrez7@hotmail.com'),
(5, 'report_image', 'Imagen en Reportes', 4, ''),
(6, 'imp-name', 'Nombre Impuesto', 2, 'IVA'),
(7, 'imp-val', 'Valor Impuesto (%)', 2, '21'),
(8, 'currency', 'Simbolo de Moneda', 2, '$');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d`
--

CREATE TABLE `d` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `d`
--

INSERT INTO `d` (`id`, `name`) VALUES
(1, 'Entregado'),
(2, 'Pendiente'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposits`
--

CREATE TABLE `deposits` (
  `iddeposito` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f`
--

CREATE TABLE `f` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `f`
--

INSERT INTO `f` (`id`, `name`) VALUES
(1, 'Efectivo'),
(2, 'Deposito'),
(3, 'Cheque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation`
--

CREATE TABLE `operation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `stock_destination_id` int(11) DEFAULT NULL,
  `operation_from_id` int(11) DEFAULT NULL,
  `q` float NOT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL,
  `operation_type_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `is_traspase` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_type`
--

CREATE TABLE `operation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operation_type`
--

INSERT INTO `operation_type` (`id`, `name`) VALUES
(1, 'entrada'),
(2, 'salida'),
(3, 'entrada-pendiente'),
(4, 'salida-pendiente'),
(5, 'devolucion'),
(6, 'traspaso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p`
--

CREATE TABLE `p` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `p`
--

INSERT INTO `p` (`id`, `name`) VALUES
(1, 'Pagado'),
(2, 'Pendiente'),
(3, 'Cancelado'),
(4, 'Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `val` double DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`) VALUES
(1, 'Cargo'),
(2, 'Abono');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `is_active_access` tinyint(1) NOT NULL DEFAULT '0',
  `has_credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_limit` double DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `inventary_min` int(11) NOT NULL DEFAULT '10',
  `price_in` float NOT NULL,
  `price_out` float DEFAULT NULL,
  `price_mayor` decimal(11,2) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `presentation` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `kind` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id`, `nombre`, `direccion`, `telefono`, `email`) VALUES
(1, 'Mercado S.A0001', 'Pasaje 2556', '011-12525555', 'Jonat@hotmail.com'),
(2, 'Electronica desktop Mayor', 'Barrio los nogales 545', '011-15256565', 'Mercado@arnet.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saving`
--

CREATE TABLE `saving` (
  `id` int(11) NOT NULL,
  `concept` varchar(255) DEFAULT NULL,
  `description` text,
  `amount` float DEFAULT NULL,
  `date_at` date DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell`
--

CREATE TABLE `sell` (
  `id` int(11) NOT NULL,
  `invoice_code` varchar(255) DEFAULT NULL,
  `invoice_file` varchar(255) DEFAULT NULL,
  `comment` text,
  `ref_id` int(11) DEFAULT NULL,
  `sell_from_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT '2',
  `box_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `f_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `stock_to_id` int(11) DEFAULT NULL,
  `stock_from_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sell`
--

INSERT INTO `sell` (`id`, `invoice_code`, `invoice_file`, `comment`, `ref_id`, `sell_from_id`, `person_id`, `user_id`, `operation_type_id`, `box_id`, `p_id`, `d_id`, `f_id`, `total`, `cash`, `iva`, `discount`, `is_draft`, `stock_to_id`, `stock_from_id`, `status`, `created_at`) VALUES
(1, '', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 20000, NULL, NULL, NULL, 0, 1, NULL, 1, '2017-06-14 12:48:49'),
(2, '', '', '', 2, NULL, NULL, 1, 1, NULL, 1, 1, 1, 45000, NULL, NULL, NULL, 0, 1, NULL, 1, '2017-06-14 12:50:21'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 5600, NULL, NULL, 0, 0, NULL, NULL, 1, '2017-06-16 15:11:43'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, 1, 1, NULL, 0, NULL, 21, 0, 0, 2, 1, 1, '2017-06-18 20:07:01'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 5600, NULL, NULL, 150, 0, NULL, NULL, 1, '2017-06-23 18:41:34'),
(9, NULL, NULL, NULL, NULL, 8, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, '2017-07-01 03:56:51'),
(12, NULL, NULL, NULL, NULL, 8, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, '2017-09-15 18:15:06'),
(15, NULL, NULL, NULL, NULL, 14, NULL, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, '2017-11-11 21:09:13'),
(16, '', NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 12:13:04'),
(17, '', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 12:14:48'),
(18, '', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 12:21:55'),
(19, '', NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 12:26:26'),
(20, '', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 12:26:28'),
(21, '', NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:40:23'),
(22, '', NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:41:31'),
(23, '', NULL, NULL, 10, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:42:02'),
(24, '', NULL, NULL, 11, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:45:02'),
(25, '', NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:47:19'),
(26, '', NULL, NULL, 13, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:47:52'),
(27, '', NULL, NULL, 14, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:48:19'),
(28, '', NULL, NULL, 15, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:49:13'),
(29, '', NULL, NULL, 16, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:50:36'),
(30, '', NULL, NULL, 17, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:51:52'),
(31, '', NULL, NULL, 18, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:52:23'),
(32, '', NULL, NULL, 19, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:52:50'),
(33, '', NULL, NULL, 20, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:53:16'),
(34, '', NULL, NULL, 21, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:56:53'),
(35, '', NULL, NULL, 22, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:57:27'),
(36, '', NULL, NULL, 23, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:58:42'),
(37, '', NULL, NULL, 24, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 15:59:32'),
(38, '', NULL, NULL, 25, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:01:13'),
(39, '', NULL, NULL, 26, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:02:46'),
(40, '', NULL, NULL, 27, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:03:15'),
(41, '', NULL, NULL, 28, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:03:49'),
(42, '', NULL, NULL, 29, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:07:58'),
(43, '', NULL, NULL, 30, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:09:02'),
(44, '', NULL, NULL, 31, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:12:34'),
(45, '', NULL, NULL, 32, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:13:27'),
(46, '', NULL, NULL, 33, NULL, NULL, 1, 1, NULL, 1, 1, 1, 125000, NULL, NULL, NULL, 0, 1, NULL, 1, '2018-01-19 16:17:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spend`
--

CREATE TABLE `spend` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_principal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `name`, `address`, `phone`, `email`, `is_principal`) VALUES
(1, 'Principal', NULL, NULL, NULL, 1),
(2, 'Almacen 1', 'Pje santa maria n21', '0387615513527', 'Jonatangr67@gmail.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `kind` int(11) NOT NULL DEFAULT '1',
  `stock_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `comision`, `status`, `kind`, `stock_id`, `created_at`) VALUES
(1, 'Administrador', '', '', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '20161229_091258.jpg', 25, 1, 1, NULL, '2017-06-13 19:02:14'),
(2, 'Emanuel', 'Frias', 'Femanuel', 'Emanuel@frias', 'fe703d258c7ef5f50b71e06565a65aa07194907f', '', 5, 1, 3, 1, '2017-06-30 18:32:35'),
(4, 'Jorge', 'El curioso', 'Jorgecurioso', 'Jonatangr67@gmail.com', 'fe703d258c7ef5f50b71e06565a65aa07194907f', '', NULL, 1, 2, 1, '2017-11-11 20:56:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xx`
--

CREATE TABLE `xx` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `xx`
--

INSERT INTO `xx` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `yy`
--

CREATE TABLE `yy` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `yy`
--

INSERT INTO `yy` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short` (`short`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `d`
--
ALTER TABLE `d`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`iddeposito`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `f`
--
ALTER TABLE `f`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `stock_destination_id` (`stock_destination_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `sell_id` (`sell_id`);

--
-- Indices de la tabla `operation_type`
--
ALTER TABLE `operation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `p`
--
ALTER TABLE `p`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `sell_id` (`sell_id`),
  ADD KEY `payment_type_id` (`payment_type_id`);

--
-- Indices de la tabla `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saving`
--
ALTER TABLE `saving`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `box_id` (`box_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `spend`
--
ALTER TABLE `spend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `box_id` (`box_id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `xx`
--
ALTER TABLE `xx`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `yy`
--
ALTER TABLE `yy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `box`
--
ALTER TABLE `box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `d`
--
ALTER TABLE `d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `iddeposito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `f`
--
ALTER TABLE `f`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `p`
--
ALTER TABLE `p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `saving`
--
ALTER TABLE `saving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sell`
--
ALTER TABLE `sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT de la tabla `spend`
--
ALTER TABLE `spend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `xx`
--
ALTER TABLE `xx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `yy`
--
ALTER TABLE `yy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposit_prov1` FOREIGN KEY (`idproveedor`) REFERENCES `provider` (`id`);

--
-- Filtros para la tabla `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`stock_destination_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `operation_ibfk_4` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  ADD CONSTRAINT `operation_ibfk_5` FOREIGN KEY (`sell_id`) REFERENCES `sell` (`id`);

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`sell_id`) REFERENCES `sell` (`id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`idproveedor`) REFERENCES `provider` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `p` (`id`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `d` (`id`),
  ADD CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  ADD CONSTRAINT `sell_ibfk_4` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  ADD CONSTRAINT `sell_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sell_ibfk_6` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `spend`
--
ALTER TABLE `spend`
  ADD CONSTRAINT `spend_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
