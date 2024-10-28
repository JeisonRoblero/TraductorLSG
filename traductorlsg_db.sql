-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2024 a las 13:16:39
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
(1, 'admin', 'admin', 'admin@admin.com', 'admin', 'admin', NULL, '2024-10-25 19:55:43', '2024-10-25 19:55:43'),
(8, 'Jeison ', 'Roblero ', 'jeison@gmail.com', '123', 'user', NULL, '2024-10-27 04:45:38', '2024-10-27 04:45:38'),
(9, 'Dann', 'Rob', 'dannrobg@gmail.com', '12345', 'user', NULL, '2024-10-27 05:18:00', '2024-10-27 05:18:00'),
(10, 'David', 'Lopez', 'david@gmail.com', '000', 'user', NULL, '2024-10-27 05:29:37', '2024-10-27 05:29:37'),
(11, 'Carlos', 'Perez Garcia', 'carlos@gmail.com', '123', 'user', NULL, '2024-10-27 05:38:18', '2024-10-27 05:38:18');

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
  MODIFY `id_traduccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
