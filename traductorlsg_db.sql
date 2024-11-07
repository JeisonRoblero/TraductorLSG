-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2024 a las 23:12:12
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `traductorlsg_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modeloai`
--

CREATE TABLE `modeloai` (
  `id_modelo` int(11) NOT NULL,
  `version` varchar(100) DEFAULT NULL,
  `contenido` varchar(150) DEFAULT NULL,
  `fecha_entrenamiento` date DEFAULT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modeloai`
--

INSERT INTO `modeloai` (`id_modelo`, `version`, `contenido`, `fecha_entrenamiento`, `rol`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, '1.0', 'Modelo de Lengua de Señas Guatemalteco Con Precisión del 65.4%', '2024-09-15', 'online', '2024-10-27 05:47:18', '2024-10-27 05:47:18'),
(2, '2.0', 'Modelo de Lengua de Señas Guatemalteco Con Precisión del 71.6%', '2024-10-15', 'online', '2024-10-27 05:48:34', '2024-10-27 05:48:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traduccion`
--

CREATE TABLE `traduccion` (
  `id_traduccion` int(11) NOT NULL,
  `texto_traducido` varchar(1000) DEFAULT NULL,
  `gesto_capturado` varchar(1000) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `precision` varchar(1000) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_modelo` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `traduccion`
--

INSERT INTO `traduccion` (`id_traduccion`, `texto_traducido`, `gesto_capturado`, `fecha`, `precision`, `id_usuario`, `id_modelo`, `fecha_creacion`, `fecha_modificacion`) VALUES
(3, 'SSSSSSQQOQJJJJJMe AsombraUUC ', '', '2024-10-27', '82.7275872230529897.3590195178985692.1103358268737889.8518383502960290.7668888568878288.3991301059722999.9993920326232999.899131059646688.2458269596099999.335938692092997.5762844085693494.2424178123474183.9158475399017379.528039693832482.1352422237396276.0835707187652636.8235945701599141.8209940195083635.8865350484848 ', 1, 2, '2024-10-27 18:18:18', '2024-10-27 18:18:18'),
(4, 'AAAAAAA ', '', '2024-10-27', '71.0091650485992487.0027542114257856.0280919075012276.9112050533294778.0371010303497386.289912462234599.70837235450745 ', 1, 2, '2024-10-27 18:23:33', '2024-10-27 18:23:33'),
(5, 'Hola mucho gusto ', 'AsombraCCCCCCCAdiosAdiosAdiosAdiosCAdiosO', '0000-00-00', ' 99.9770581722259557.1958005428314283.2690060138702450.05840659141540564.5008742809295773.2376575469970773.3681797981262245.9870278835296679.1387379169464196.6040968894958591.9338822364807197.7700173854827998.3784794807434198.3890235424041798.3714640140533495.8877325057983492.8066134452819887.8701746463775687.1149182319641179.9506008625030550.83481669425964493.94447803497314 ', 1, 2, '2024-10-27 18:27:53', '2024-10-27 19:03:57'),
(6, ' AAAAAAC ', 'AAAAAAC', '2024-10-27', ' 77.3304462432861347.86605834960937575.4697740077972463.10510635375976658.9341461658477867.4321770668029899.84775185585022 ', 1, 2, '2024-10-27 19:10:41', '2024-10-27 19:10:41'),
(7, 'PPPP', 'PPPP', '2024-10-27', '99.7013926506042599.7635722160339499.7747600078582897.58380055427551', 1, 2, '2024-10-27 19:10:47', '2024-10-27 19:10:47'),
(8, 'IQQQQQQQQ ', 'IQQQQQQQQ', '2024-10-27', '68.7840640544891468.0838048458099457.19838142395019581.2173724174499567.8875684738159268.4017300605773992.0166909694671670.1751232147216864.42127823829651 ', 1, 2, '2024-10-27 19:10:55', '2024-10-27 19:10:55'),
(9, 'SPPPPPPPP', 'SPPPPPPPP', '2024-10-27', '93.6595976352691794.8315262794494697.1998453140258898.9799499511718892.1157240867614781.1948597431182998.8778412342071596.3167488574981796.77873849868774', 1, 2, '2024-10-27 19:11:32', '2024-10-27 19:11:32'),
(10, ' PPPPPAJJJJ ', 'PPPPPAJJJJ', '2024-10-27', ' 81.3814342021942198.4184026718139699.8025774955749599.8746871948242259.9458456039428754.58467006683349676.194989681243967.3625171184539874.8928904533386295.01142501831055 ', 1, 2, '2024-10-27 19:21:31', '2024-10-27 19:21:31'),
(11, 'PJJJJJP AJ JMe Encanta Me EncantaMe EncantaMe Encanta Me Encanta GGGGMe GustaMe GustaMe GustaGGGGMe GustaMe GustaMe GustaMe GustaMe GustaMe GustaMe Gusta PP ', 'PP', '2024-10-27', '66.70%43.09%75.96%69.17%61.65%67.73%51.41% 97.4059820175170957.643455266952515 78.2222568988855.16883134841919 84.666323661804299.8320758342742999.7723639011383 98.56228232383728 98.645788431167699.0732431411743299.6732831001281799.8368084430694645.2021330595016556.2598347663879478.7177801132202188.4522855281829889.0944123268127488.9555394649505691.3683950901031562.0165348052978593.8338696956634593.5230374336242798.220878839492897.9087591171264698.0882704257965198.05966019630432 50.7273316383361843.193379044532776 ', 1, 2, '2024-10-27 19:48:33', '2024-10-27 19:48:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `correo`, `contrasenia`, `rol`, `imagen`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'admin', 'admin', '', '2024-10-25 19:55:43', '2024-10-29 16:28:14'),
(8, 'Jeison ', 'Roblero ', 'jeison@gmail.com', '123', 'user', 'https://wallpapers.com/images/hd/cool-profile-pictures-panda-man-gsl2ntkjj3hrk84s.jpg', '2024-10-27 04:45:38', '2024-10-28 04:14:19'),
(10, 'David modificado', 'Lopez', 'david@gmail.com', '000', 'user', 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png', '2024-10-27 05:29:37', '2024-10-28 03:38:24'),
(14, 'Carlos Nuevooooo 1', 'Robes', 'carlos1@gmail.com', '123', 'user', NULL, '2024-10-28 03:31:22', '2024-10-28 03:31:22'),
(17, 'Danilo', 'Davez', 'danilo@gmail.com', '123', 'user', NULL, '2024-10-28 12:51:21', '2024-10-28 12:51:21'),
(18, 'Noe', 'Gomez', 'noe1@gmail.com', '321', 'user', NULL, '2024-10-28 12:52:10', '2024-10-28 12:52:10'),
(19, 'Marco', 'Perez', 'marco@gmail.com', '123', 'user', NULL, '2024-10-28 12:53:08', '2024-10-28 12:53:08'),
(20, 'Jose', 'Arevalo', 'jose@gmail.com', '123', 'user', NULL, '2024-10-28 14:14:53', '2024-10-28 14:14:53'),
(21, 'Carol', 'Castro', 'carol@gmail.com', '123', 'user', NULL, '2024-10-28 14:15:22', '2024-10-28 14:15:22'),
(22, 'Cristofer', 'Garcia', 'cristofer@gmail.com', '123', 'user', NULL, '2024-10-28 14:17:53', '2024-10-28 14:17:53'),
(23, 'Mafer', 'Cros', 'mafer@gmail.com', '123', 'user', NULL, '2024-10-28 14:23:15', '2024-10-28 14:23:15'),
(24, 'Ester', 'Gomez', 'ester@gmail.com', '123', 'user', NULL, '2024-10-28 14:23:45', '2024-10-28 14:23:45'),
(25, 'Nora', 'Lopez', 'nora@gmail.com', '123', 'user', NULL, '2024-10-28 14:24:08', '2024-10-28 14:24:08'),
(26, 'Camilo', 'Monze', 'camilo@gmail.com', '123456', 'user', NULL, '2024-10-28 14:24:42', '2024-10-28 14:24:42'),
(27, 'Galicia', 'Rosales', 'galicia@gmail.com', '00000', 'user', NULL, '2024-10-28 14:25:14', '2024-10-28 14:25:14'),
(28, 'Patricia', 'Mendez Mendez', 'patricia@gmail.com', 'patricia123', 'user', NULL, '2024-10-28 14:25:46', '2024-10-28 14:25:46'),
(31, 'Kimberly', 'Gomez', 'kim@gmail.com', '123456', 'user', NULL, '2024-10-28 15:50:25', '2024-10-28 15:50:25'),
(32, 'Laura', 'Lezus', 'laurale@gmail.com', '$2b$12$rNNLCqy7DHQjPuvGlo6uuedHQmGkfjI21J19ItEGjET8IqAar1jq6', 'user', NULL, '2024-11-07 03:20:25', '2024-11-07 03:20:25'),
(33, 'Mauricio', 'Gomez', 'mauricio@gmail.com', '$2b$12$8iFTHOItvmYY4nHKX4pKIOSYS3n34B1TbNQQFWrHecEreVO2WbO1a', 'user', NULL, '2024-11-07 04:30:15', '2024-11-07 04:31:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `modeloai`
--
ALTER TABLE `modeloai`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `traduccion`
--
ALTER TABLE `traduccion`
  ADD PRIMARY KEY (`id_traduccion`),
  ADD KEY `id_modelo` (`id_modelo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `modeloai`
--
ALTER TABLE `modeloai`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `traduccion`
--
ALTER TABLE `traduccion`
  MODIFY `id_traduccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `traduccion`
--
ALTER TABLE `traduccion`
  ADD CONSTRAINT `traduccion_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modeloai` (`id_modelo`),
  ADD CONSTRAINT `traduccion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
