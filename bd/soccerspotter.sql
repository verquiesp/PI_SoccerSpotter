-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-04-2023 a las 14:48:13
-- Versión del servidor: 8.0.32
-- Versión de PHP: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soccerspotter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `idcategoria` int NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `idpais` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`idcategoria`, `categoria`, `idpais`) VALUES
(1, 'Premier League', 1),
(2, 'EFL Championship', 1),
(3, 'LaLiga', 2),
(4, 'Ligue1', 4),
(5, 'Bundesliga', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudades`
--

CREATE TABLE `Ciudades` (
  `idciudad` int NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Ciudades`
--

INSERT INTO `Ciudades` (`idciudad`, `ciudad`) VALUES
(1, 'Londres'),
(2, 'Brigthon'),
(3, 'Southampton'),
(4, 'Bournemouth'),
(5, 'Leicester'),
(6, 'Birmingham'),
(7, 'Wolverhampton'),
(8, 'Nottingham'),
(9, 'Liverpool'),
(10, 'Manchester'),
(11, 'Leeds'),
(12, 'Newcastle');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Equipos`
--

CREATE TABLE `Equipos` (
  `idequipo` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `idciudad` int NOT NULL,
  `idcategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Equipos`
--

INSERT INTO `Equipos` (`idequipo`, `nombre`, `idciudad`, `idcategoria`) VALUES
(1, 'Arsenal', 1, 1),
(2, 'Aston Villa', 6, 1),
(3, 'Bournemouth', 4, 1),
(4, 'Brentford', 1, 1),
(5, 'Brighton and Hove Albion', 2, 1),
(6, 'Chelsea', 1, 1),
(7, 'Crystal Palace', 1, 1),
(8, 'Everton', 9, 1),
(9, 'Fulham', 1, 1),
(10, 'Leeds United', 11, 1),
(11, 'Leicester City', 5, 1),
(12, 'Liverpool', 9, 1),
(13, 'Manchester City', 10, 1),
(14, 'Manchester United', 10, 1),
(15, 'Newcastle United', 12, 1),
(16, 'Nottingham Forest', 8, 1),
(17, 'Southampton', 3, 1),
(18, 'Tottenham Hotspur', 1, 1),
(19, 'West Ham United', 1, 1),
(20, 'Wolverhampton Wanderers', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Jugadores`
--

CREATE TABLE `Jugadores` (
  `idjugador` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idposicion` int NOT NULL,
  `idequipo_fk` int DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Jugadores`
--

INSERT INTO `Jugadores` (`idjugador`, `nombre`, `idposicion`, `idequipo_fk`, `apellidos`, `edad`) VALUES
(1, 'Leo', 6, 13, 'Messi', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paises`
--

CREATE TABLE `Paises` (
  `idpais` int NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Paises`
--

INSERT INTO `Paises` (`idpais`, `pais`) VALUES
(1, 'Inglaterra'),
(2, 'España'),
(3, 'Alemania'),
(4, 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Posiciones`
--

CREATE TABLE `Posiciones` (
  `idposicion` int NOT NULL,
  `posicion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Posiciones`
--

INSERT INTO `Posiciones` (`idposicion`, `posicion`) VALUES
(1, 'Portero'),
(2, 'Defensa'),
(3, 'Lateral'),
(4, 'Mediocentro'),
(5, 'Extremo'),
(6, 'Delantero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rendimiento`
--

CREATE TABLE `Rendimiento` (
  `idrendimiento` int NOT NULL,
  `rendimiento` int NOT NULL,
  `idjugador` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Rendimiento`
--

INSERT INTO `Rendimiento` (`idrendimiento`, `rendimiento`, `idjugador`) VALUES
(1, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id`, `email`, `password`, `role`) VALUES
(1, 'vquirosespinosa@gmail.com', 'hashed_password', 'admin'),
(2, 'vero.96.mairena@gmail.com', 'hashed_password', 'user');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`idcategoria`),
  ADD KEY `idpais` (`idpais`);

--
-- Indices de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  ADD PRIMARY KEY (`idciudad`);

--
-- Indices de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD PRIMARY KEY (`idequipo`),
  ADD KEY `idciudad` (`idciudad`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  ADD PRIMARY KEY (`idjugador`),
  ADD KEY `idposicion` (`idposicion`),
  ADD KEY `FK_Jugadores_Equipos` (`idequipo_fk`);

--
-- Indices de la tabla `Paises`
--
ALTER TABLE `Paises`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `Posiciones`
--
ALTER TABLE `Posiciones`
  ADD PRIMARY KEY (`idposicion`);

--
-- Indices de la tabla `Rendimiento`
--
ALTER TABLE `Rendimiento`
  ADD PRIMARY KEY (`idrendimiento`),
  ADD KEY `idjugador` (`idjugador`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `idcategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `idciudad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  MODIFY `idequipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  MODIFY `idjugador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Paises`
--
ALTER TABLE `Paises`
  MODIFY `idpais` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Posiciones`
--
ALTER TABLE `Posiciones`
  MODIFY `idposicion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Rendimiento`
--
ALTER TABLE `Rendimiento`
  MODIFY `idrendimiento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD CONSTRAINT `Categorias_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `Paises` (`idpais`);

--
-- Filtros para la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD CONSTRAINT `Equipos_ibfk_1` FOREIGN KEY (`idciudad`) REFERENCES `Ciudades` (`idciudad`),
  ADD CONSTRAINT `Equipos_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `Categorias` (`idcategoria`);

--
-- Filtros para la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  ADD CONSTRAINT `FK_Jugadores_Equipos` FOREIGN KEY (`idequipo_fk`) REFERENCES `Equipos` (`idequipo`),
  ADD CONSTRAINT `Jugadores_ibfk_1` FOREIGN KEY (`idposicion`) REFERENCES `Posiciones` (`idposicion`);

--
-- Filtros para la tabla `Rendimiento`
--
ALTER TABLE `Rendimiento`
  ADD CONSTRAINT `Rendimiento_ibfk_1` FOREIGN KEY (`idjugador`) REFERENCES `Jugadores` (`idjugador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
