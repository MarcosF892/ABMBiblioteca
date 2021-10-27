-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-10-2021 a las 17:32:05
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`) VALUES
(1, 'Jose Carlos Ruiz'),
(2, 'Christophe Galfard'),
(3, 'Jostein Gaarder'),
(4, 'Martinez Freire'),
(5, 'Jose maza'),
(6, 'Sara Seager'),
(7, 'Angel Cardona'),
(8, 'Peter Kingsley'),
(9, 'Daniel Kahneman'),
(10, 'Mariano Sigman'),
(11, 'Ken Robinson, Aronica Debolsillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Filosofia'),
(2, 'Astronomia'),
(3, 'Psicologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `editorial` varchar(30) NOT NULL,
  `anio` int NOT NULL,
  `idioma` varchar(30) NOT NULL,
  `nPaginas` int NOT NULL,
  `idCategoria` int NOT NULL,
  `idAutor` int NOT NULL,
  `tema` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `portada` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idAutor` (`idAutor`),
  KEY `idAutor_2` (`idAutor`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombre`, `editorial`, `anio`, `idioma`, `nPaginas`, `idCategoria`, `idAutor`, `tema`, `portada`) VALUES
(1, 'El arte de pensar', 'Berenice', 2018, 'Español', 240, 1, 1, 'Filosofia', 'libro3.jpg'),
(2, 'El mundo de Sofia', 'Siruela', 2010, 'Español', 640, 1, 3, 'Filosofia', 'libro1.jpg'),
(3, 'La nueva filosofia de la mente', 'Gedisa', 2015, 'Español', 168, 1, 4, 'Filosofia', 'libro2.jpg'),
(4, 'El universo en tu mano', 'Blackie books', 2021, 'Español', 464, 2, 2, 'Ciencia', 'astro1.jpg'),
(5, 'Somos polvo de estrellas', 'Planeta', 2017, 'Castellano', 136, 2, 5, 'Astronomia', 'astro2.jpg'),
(6, 'Las luces mas diminutas del universo', 'Ediciones Paidos', 2021, 'Español', 360, 2, 6, 'Astronomia', 'astro3.jpg'),
(7, 'Breve historia de la astronomi', 'Nowtilus', 2013, 'Español', 288, 2, 7, 'Astronomia', 'astro4.jpg'),
(8, 'Reality', 'Catafalque Press', 2020, 'ingles', 600, 3, 8, 'Psicologia', 'libro4.jpg'),
(9, 'Pensar rapido pensar despacio', 'Debolsillo', 2015, 'Español', 672, 3, 9, 'Psicologia', 'libro5.jpg'),
(10, 'La vida secreta de la mente', 'Debate', 2014, 'Español', 288, 3, 10, 'Psicologia', 'libro6.jpg'),
(11, 'El Elemento', 'Debolsillo', 2010, 'Español', 360, 3, 11, 'Psicologia', 'libro7.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservasl`
--

DROP TABLE IF EXISTS `reservasl`;
CREATE TABLE IF NOT EXISTS `reservasl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reslibros`
--

DROP TABLE IF EXISTS `reslibros`;
CREATE TABLE IF NOT EXISTS `reslibros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idReserva` int NOT NULL,
  `idLibro` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idReserva` (`idReserva`),
  KEY `idLibro` (`idLibro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(8) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `nombre`, `email`) VALUES
(2, 'Marc', '97e1e59c0375e0f55c10d4314db20466', 'Figueroa Marcos', 'marcos@yahoo.com'),
(3, 'Juancito', 'a94652aa97c7211ba8954dd15a3cf838', 'Perez Juan', 'juan@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
