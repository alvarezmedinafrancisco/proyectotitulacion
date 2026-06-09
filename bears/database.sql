-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2026 a las 21:30:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cetis_examenes`
--
CREATE DATABASE IF NOT EXISTS `cetis_examenes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cetis_examenes`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `id_semestre`, `nombre`) VALUES
(1, 1, 'Pensamiento Matemático I'),
(2, 1, 'Lengua y Comunicación I'),
(3, 1, 'Cultura Digital I'),
(4, 2, 'Pensamiento Matemático II'),
(5, 2, 'Conservación de la Energía'),
(6, 2, 'Inglés II'),
(7, 3, 'Pensamiento Matemático III'),
(8, 3, 'Ecosistemas'),
(9, 3, 'Humanidades II'),
(10, 4, 'Pensamiento Matemático IV'),
(11, 4, 'Reacciones Químicas'),
(12, 4, 'Inglés IV'),
(13, 5, 'Temas Selectos de Matemáticas II'),
(14, 5, 'Conciencia Histórica'),
(15, 5, 'Economía Pública y Social'),
(16, 6, 'Probabilidad y Estadística'),
(17, 6, 'Temas de Filosofía'),
(18, 6, 'Ecología y Medio Ambiente'),
(19, 1, 'Química Básica I'),
(20, 1, 'Física Básica I'),
(21, 1, 'Inglés I'),
(22, 1, 'Socioemocional I'),
(23, 1, 'Humanidades I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `pregunta_texto` text NOT NULL,
  `opcion_a` varchar(255) NOT NULL,
  `opcion_b` varchar(255) NOT NULL,
  `opcion_c` varchar(255) NOT NULL,
  `opcion_d` varchar(255) NOT NULL,
  `respuesta_correcta` enum('A','B','C','D') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `id_unidad`, `pregunta_texto`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`) VALUES
(3121, 226, '¿Cuál es el resultado de 8 + 7? (nivel básico)', '15', '14', '16', '13', 'A'),
(3122, 226, '¿Qué operación sirve para repartir en partes iguales? (nivel básico)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3123, 226, '¿Cuál es el valor de 12 - 5? (nivel básico)', '6', '7', '8', '9', 'B'),
(3124, 226, '¿Qué número sigue después de 19? (nivel básico)', '18', '20', '21', '22', 'B'),
(3125, 226, '¿Cuál es el doble de 6? (nivel básico)', '10', '12', '14', '16', 'B'),
(3126, 226, '¿Qué fracción representa la mitad? (nivel básico)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3127, 226, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel básico)', '12', '14', '16', '18', 'C'),
(3128, 226, '¿Qué número es mayor, 15 o 21? (nivel básico)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3129, 226, '¿Cuál es la suma de 9 y 8? (nivel básico)', '15', '16', '17', '18', 'C'),
(3130, 226, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel básico)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3131, 227, '¿Cuál es el resultado de 8 + 7? (nivel intermedio)', '15', '14', '16', '13', 'A'),
(3132, 227, '¿Qué operación sirve para repartir en partes iguales? (nivel intermedio)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3133, 227, '¿Cuál es el valor de 12 - 5? (nivel intermedio)', '6', '7', '8', '9', 'B'),
(3134, 227, '¿Qué número sigue después de 19? (nivel intermedio)', '18', '20', '21', '22', 'B'),
(3135, 227, '¿Cuál es el doble de 6? (nivel intermedio)', '10', '12', '14', '16', 'B'),
(3136, 227, '¿Qué fracción representa la mitad? (nivel intermedio)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3137, 227, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel intermedio)', '12', '14', '16', '18', 'C'),
(3138, 227, '¿Qué número es mayor, 15 o 21? (nivel intermedio)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3139, 227, '¿Cuál es la suma de 9 y 8? (nivel intermedio)', '15', '16', '17', '18', 'C'),
(3140, 227, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel intermedio)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3141, 228, '¿Cuál es el resultado de 8 + 7? (nivel avanzado)', '15', '14', '16', '13', 'A'),
(3142, 228, '¿Qué operación sirve para repartir en partes iguales? (nivel avanzado)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3143, 228, '¿Cuál es el valor de 12 - 5? (nivel avanzado)', '6', '7', '8', '9', 'B'),
(3144, 228, '¿Qué número sigue después de 19? (nivel avanzado)', '18', '20', '21', '22', 'B'),
(3145, 228, '¿Cuál es el doble de 6? (nivel avanzado)', '10', '12', '14', '16', 'B'),
(3146, 228, '¿Qué fracción representa la mitad? (nivel avanzado)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3147, 228, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel avanzado)', '12', '14', '16', '18', 'C'),
(3148, 228, '¿Qué número es mayor, 15 o 21? (nivel avanzado)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3149, 228, '¿Cuál es la suma de 9 y 8? (nivel avanzado)', '15', '16', '17', '18', 'C'),
(3150, 228, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel avanzado)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3151, 229, '¿Qué tipo de palabra describe a un sustantivo? (nivel básico)', 'Verbo', 'Adjetivo', 'Adverbio', 'Pronombre', 'B'),
(3152, 229, '¿Cuál es el propósito de un párrafo? (nivel básico)', 'Explicar una idea', 'Desordenar el texto', 'Cambiar el tema', 'Borrar información', 'A'),
(3153, 229, '¿Qué signo se usa para terminar una pregunta? (nivel básico)', '.', ',', ';', '?', 'D'),
(3154, 229, '¿Qué es una oración? (nivel básico)', 'Una lista de números', 'Una idea completa', 'Un dibujo', 'Un título', 'B'),
(3155, 229, '¿Cuál es el antónimo de \"rápido\"? (nivel básico)', 'Lento', 'Alto', 'Suave', 'Feliz', 'A'),
(3156, 229, '¿Qué palabra es un verbo? (nivel básico)', 'Casa', 'Correr', 'Azul', 'Rápido', 'B'),
(3157, 229, '¿Cuál es el sujeto de la oración “Ana estudia”? (nivel básico)', 'Ana', 'estudia', 'la', 'una', 'A'),
(3158, 229, '¿Qué recurso se usa para comparar dos cosas? (nivel básico)', 'Hipérbole', 'Símil', 'Metáfora', 'Resumen', 'B'),
(3159, 229, '¿Qué parte de la oración indica acción? (nivel básico)', 'Sujeto', 'Verbo', 'Artículo', 'Adjetivo', 'B'),
(3160, 229, '¿Qué palabra completa “La niña ___ feliz”? (nivel básico)', 'está', 'correr', 'libro', 'rápido', 'A'),
(3161, 230, '¿Qué tipo de palabra describe a un sustantivo? (nivel intermedio)', 'Verbo', 'Adjetivo', 'Adverbio', 'Pronombre', 'B'),
(3162, 230, '¿Cuál es el propósito de un párrafo? (nivel intermedio)', 'Explicar una idea', 'Desordenar el texto', 'Cambiar el tema', 'Borrar información', 'A'),
(3163, 230, '¿Qué signo se usa para terminar una pregunta? (nivel intermedio)', '.', ',', ';', '?', 'D'),
(3164, 230, '¿Qué es una oración? (nivel intermedio)', 'Una lista de números', 'Una idea completa', 'Un dibujo', 'Un título', 'B'),
(3165, 230, '¿Cuál es el antónimo de \"rápido\"? (nivel intermedio)', 'Lento', 'Alto', 'Suave', 'Feliz', 'A'),
(3166, 230, '¿Qué palabra es un verbo? (nivel intermedio)', 'Casa', 'Correr', 'Azul', 'Rápido', 'B'),
(3167, 230, '¿Cuál es el sujeto de la oración “Ana estudia”? (nivel intermedio)', 'Ana', 'estudia', 'la', 'una', 'A'),
(3168, 230, '¿Qué recurso se usa para comparar dos cosas? (nivel intermedio)', 'Hipérbole', 'Símil', 'Metáfora', 'Resumen', 'B'),
(3169, 230, '¿Qué parte de la oración indica acción? (nivel intermedio)', 'Sujeto', 'Verbo', 'Artículo', 'Adjetivo', 'B'),
(3170, 230, '¿Qué palabra completa “La niña ___ feliz”? (nivel intermedio)', 'está', 'correr', 'libro', 'rápido', 'A'),
(3171, 231, '¿Qué tipo de palabra describe a un sustantivo? (nivel avanzado)', 'Verbo', 'Adjetivo', 'Adverbio', 'Pronombre', 'B'),
(3172, 231, '¿Cuál es el propósito de un párrafo? (nivel avanzado)', 'Explicar una idea', 'Desordenar el texto', 'Cambiar el tema', 'Borrar información', 'A'),
(3173, 231, '¿Qué signo se usa para terminar una pregunta? (nivel avanzado)', '.', ',', ';', '?', 'D'),
(3174, 231, '¿Qué es una oración? (nivel avanzado)', 'Una lista de números', 'Una idea completa', 'Un dibujo', 'Un título', 'B'),
(3175, 231, '¿Cuál es el antónimo de \"rápido\"? (nivel avanzado)', 'Lento', 'Alto', 'Suave', 'Feliz', 'A'),
(3176, 231, '¿Qué palabra es un verbo? (nivel avanzado)', 'Casa', 'Correr', 'Azul', 'Rápido', 'B'),
(3177, 231, '¿Cuál es el sujeto de la oración “Ana estudia”? (nivel avanzado)', 'Ana', 'estudia', 'la', 'una', 'A'),
(3178, 231, '¿Qué recurso se usa para comparar dos cosas? (nivel avanzado)', 'Hipérbole', 'Símil', 'Metáfora', 'Resumen', 'B'),
(3179, 231, '¿Qué parte de la oración indica acción? (nivel avanzado)', 'Sujeto', 'Verbo', 'Artículo', 'Adjetivo', 'B'),
(3180, 231, '¿Qué palabra completa “La niña ___ feliz”? (nivel avanzado)', 'está', 'correr', 'libro', 'rápido', 'A'),
(3181, 232, '¿Qué debes hacer para proteger tu contraseña? (nivel básico)', 'Compartirla con amigos', 'Usar una contraseña segura', 'Escribirla en papel', 'Usar la misma siempre', 'B'),
(3182, 232, '¿Qué significa “phishing”? (nivel básico)', 'Un juego', 'Un tipo de fraude online', 'Una red social', 'Un antivirus', 'B'),
(3183, 232, '¿Qué herramienta sirve para buscar información? (nivel básico)', 'Buscador', 'Calculadora', 'Impresora', 'Reproductor', 'A'),
(3184, 232, '¿Qué es una red social? (nivel básico)', 'Una red de agua', 'Una plataforma para comunicarse', 'Una copia de seguridad', 'Un programa de música', 'B'),
(3185, 232, '¿Cuál es una buena práctica al usar internet? (nivel básico)', 'Compartir datos personales sin revisar', 'Usar contraseñas únicas', 'Abrir todo lo que llega', 'Descargar archivos sospechosos', 'B'),
(3186, 232, '¿Qué debes hacer si recibes un archivo sospechoso? (nivel básico)', 'Abrirlo de inmediato', 'Eliminarlo y avisar', 'Compartirlo con todos', 'Guardarlo en la carpeta de Descargas', 'B'),
(3187, 232, '¿Qué es un antivirus? (nivel básico)', 'Un programa para proteger tu equipo', 'Una impresora', 'Una app de edición', 'Una red inalámbrica', 'A'),
(3188, 232, '¿Qué significa “ciberacoso”? (nivel básico)', 'Una broma amistosa', 'Acoso mediante internet', 'Un software de audio', 'Una búsqueda en línea', 'B'),
(3189, 232, '¿Qué debes verificar antes de compartir datos personales? (nivel básico)', 'Que sea divertido', 'Que sea confiable y necesario', 'Que sea gratis', 'Que sea largo', 'B'),
(3190, 232, '¿Qué acción evita el acceso no autorizado a tu cuenta? (nivel básico)', 'Usar una contraseña fuerte', 'Compartirla con todos', 'Escribirla en la pantalla', 'No cerrar sesión', 'A'),
(3191, 233, '¿Qué debes hacer para proteger tu contraseña? (nivel intermedio)', 'Compartirla con amigos', 'Usar una contraseña segura', 'Escribirla en papel', 'Usar la misma siempre', 'B'),
(3192, 233, '¿Qué significa “phishing”? (nivel intermedio)', 'Un juego', 'Un tipo de fraude online', 'Una red social', 'Un antivirus', 'B'),
(3193, 233, '¿Qué herramienta sirve para buscar información? (nivel intermedio)', 'Buscador', 'Calculadora', 'Impresora', 'Reproductor', 'A'),
(3194, 233, '¿Qué es una red social? (nivel intermedio)', 'Una red de agua', 'Una plataforma para comunicarse', 'Una copia de seguridad', 'Un programa de música', 'B'),
(3195, 233, '¿Cuál es una buena práctica al usar internet? (nivel intermedio)', 'Compartir datos personales sin revisar', 'Usar contraseñas únicas', 'Abrir todo lo que llega', 'Descargar archivos sospechosos', 'B'),
(3196, 233, '¿Qué debes hacer si recibes un archivo sospechoso? (nivel intermedio)', 'Abrirlo de inmediato', 'Eliminarlo y avisar', 'Compartirlo con todos', 'Guardarlo en la carpeta de Descargas', 'B'),
(3197, 233, '¿Qué es un antivirus? (nivel intermedio)', 'Un programa para proteger tu equipo', 'Una impresora', 'Una app de edición', 'Una red inalámbrica', 'A'),
(3198, 233, '¿Qué significa “ciberacoso”? (nivel intermedio)', 'Una broma amistosa', 'Acoso mediante internet', 'Un software de audio', 'Una búsqueda en línea', 'B'),
(3199, 233, '¿Qué debes verificar antes de compartir datos personales? (nivel intermedio)', 'Que sea divertido', 'Que sea confiable y necesario', 'Que sea gratis', 'Que sea largo', 'B'),
(3200, 233, '¿Qué acción evita el acceso no autorizado a tu cuenta? (nivel intermedio)', 'Usar una contraseña fuerte', 'Compartirla con todos', 'Escribirla en la pantalla', 'No cerrar sesión', 'A'),
(3201, 234, '¿Qué debes hacer para proteger tu contraseña? (nivel avanzado)', 'Compartirla con amigos', 'Usar una contraseña segura', 'Escribirla en papel', 'Usar la misma siempre', 'B'),
(3202, 234, '¿Qué significa “phishing”? (nivel avanzado)', 'Un juego', 'Un tipo de fraude online', 'Una red social', 'Un antivirus', 'B'),
(3203, 234, '¿Qué herramienta sirve para buscar información? (nivel avanzado)', 'Buscador', 'Calculadora', 'Impresora', 'Reproductor', 'A'),
(3204, 234, '¿Qué es una red social? (nivel avanzado)', 'Una red de agua', 'Una plataforma para comunicarse', 'Una copia de seguridad', 'Un programa de música', 'B'),
(3205, 234, '¿Cuál es una buena práctica al usar internet? (nivel avanzado)', 'Compartir datos personales sin revisar', 'Usar contraseñas únicas', 'Abrir todo lo que llega', 'Descargar archivos sospechosos', 'B'),
(3206, 234, '¿Qué debes hacer si recibes un archivo sospechoso? (nivel avanzado)', 'Abrirlo de inmediato', 'Eliminarlo y avisar', 'Compartirlo con todos', 'Guardarlo en la carpeta de Descargas', 'B'),
(3207, 234, '¿Qué es un antivirus? (nivel avanzado)', 'Un programa para proteger tu equipo', 'Una impresora', 'Una app de edición', 'Una red inalámbrica', 'A'),
(3208, 234, '¿Qué significa “ciberacoso”? (nivel avanzado)', 'Una broma amistosa', 'Acoso mediante internet', 'Un software de audio', 'Una búsqueda en línea', 'B'),
(3209, 234, '¿Qué debes verificar antes de compartir datos personales? (nivel avanzado)', 'Que sea divertido', 'Que sea confiable y necesario', 'Que sea gratis', 'Que sea largo', 'B'),
(3210, 234, '¿Qué acción evita el acceso no autorizado a tu cuenta? (nivel avanzado)', 'Usar una contraseña fuerte', 'Compartirla con todos', 'Escribirla en la pantalla', 'No cerrar sesión', 'A'),
(3211, 235, '¿Cuál es el resultado de 8 + 7? (nivel básico)', '15', '14', '16', '13', 'A'),
(3212, 235, '¿Qué operación sirve para repartir en partes iguales? (nivel básico)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3213, 235, '¿Cuál es el valor de 12 - 5? (nivel básico)', '6', '7', '8', '9', 'B'),
(3214, 235, '¿Qué número sigue después de 19? (nivel básico)', '18', '20', '21', '22', 'B'),
(3215, 235, '¿Cuál es el doble de 6? (nivel básico)', '10', '12', '14', '16', 'B'),
(3216, 235, '¿Qué fracción representa la mitad? (nivel básico)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3217, 235, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel básico)', '12', '14', '16', '18', 'C'),
(3218, 235, '¿Qué número es mayor, 15 o 21? (nivel básico)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3219, 235, '¿Cuál es la suma de 9 y 8? (nivel básico)', '15', '16', '17', '18', 'C'),
(3220, 235, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel básico)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3221, 236, '¿Cuál es el resultado de 8 + 7? (nivel intermedio)', '15', '14', '16', '13', 'A'),
(3222, 236, '¿Qué operación sirve para repartir en partes iguales? (nivel intermedio)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3223, 236, '¿Cuál es el valor de 12 - 5? (nivel intermedio)', '6', '7', '8', '9', 'B'),
(3224, 236, '¿Qué número sigue después de 19? (nivel intermedio)', '18', '20', '21', '22', 'B'),
(3225, 236, '¿Cuál es el doble de 6? (nivel intermedio)', '10', '12', '14', '16', 'B'),
(3226, 236, '¿Qué fracción representa la mitad? (nivel intermedio)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3227, 236, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel intermedio)', '12', '14', '16', '18', 'C'),
(3228, 236, '¿Qué número es mayor, 15 o 21? (nivel intermedio)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3229, 236, '¿Cuál es la suma de 9 y 8? (nivel intermedio)', '15', '16', '17', '18', 'C'),
(3230, 236, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel intermedio)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3231, 237, '¿Cuál es el resultado de 8 + 7? (nivel avanzado)', '15', '14', '16', '13', 'A'),
(3232, 237, '¿Qué operación sirve para repartir en partes iguales? (nivel avanzado)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3233, 237, '¿Cuál es el valor de 12 - 5? (nivel avanzado)', '6', '7', '8', '9', 'B'),
(3234, 237, '¿Qué número sigue después de 19? (nivel avanzado)', '18', '20', '21', '22', 'B'),
(3235, 237, '¿Cuál es el doble de 6? (nivel avanzado)', '10', '12', '14', '16', 'B'),
(3236, 237, '¿Qué fracción representa la mitad? (nivel avanzado)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3237, 237, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel avanzado)', '12', '14', '16', '18', 'C'),
(3238, 237, '¿Qué número es mayor, 15 o 21? (nivel avanzado)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3239, 237, '¿Cuál es la suma de 9 y 8? (nivel avanzado)', '15', '16', '17', '18', 'C'),
(3240, 237, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel avanzado)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3241, 238, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3242, 238, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3243, 238, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3244, 238, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3245, 238, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3246, 238, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3247, 238, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3248, 238, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3249, 238, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3250, 238, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3251, 239, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3252, 239, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3253, 239, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3254, 239, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3255, 239, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3256, 239, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3257, 239, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3258, 239, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3259, 239, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3260, 239, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3261, 240, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3262, 240, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3263, 240, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3264, 240, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3265, 240, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3266, 240, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3267, 240, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3268, 240, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3269, 240, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3270, 240, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3271, 241, 'What is the English word for “libro”? (nivel básico)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3272, 241, 'What is the plural of “child”? (nivel básico)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3273, 241, 'Which word means “good morning”? (nivel básico)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3274, 241, 'What is the correct form of “to be” for “I”? (nivel básico)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3275, 241, 'What color is the sky on a clear day? (nivel básico)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3276, 241, 'Which sentence is correct? (nivel básico)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3277, 241, 'What does “hello” mean in Spanish? (nivel básico)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3278, 241, 'What is the opposite of “big”? (nivel básico)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3279, 241, 'Which word fits: “I ___ a student.” (nivel básico)', 'am', 'is', 'are', 'be', 'A'),
(3280, 241, 'What is the past tense of “go”? (nivel básico)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3281, 242, 'What is the English word for “libro”? (nivel intermedio)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3282, 242, 'What is the plural of “child”? (nivel intermedio)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3283, 242, 'Which word means “good morning”? (nivel intermedio)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3284, 242, 'What is the correct form of “to be” for “I”? (nivel intermedio)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3285, 242, 'What color is the sky on a clear day? (nivel intermedio)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3286, 242, 'Which sentence is correct? (nivel intermedio)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3287, 242, 'What does “hello” mean in Spanish? (nivel intermedio)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3288, 242, 'What is the opposite of “big”? (nivel intermedio)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3289, 242, 'Which word fits: “I ___ a student.” (nivel intermedio)', 'am', 'is', 'are', 'be', 'A'),
(3290, 242, 'What is the past tense of “go”? (nivel intermedio)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3291, 243, 'What is the English word for “libro”? (nivel avanzado)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3292, 243, 'What is the plural of “child”? (nivel avanzado)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3293, 243, 'Which word means “good morning”? (nivel avanzado)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3294, 243, 'What is the correct form of “to be” for “I”? (nivel avanzado)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3295, 243, 'What color is the sky on a clear day? (nivel avanzado)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3296, 243, 'Which sentence is correct? (nivel avanzado)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3297, 243, 'What does “hello” mean in Spanish? (nivel avanzado)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3298, 243, 'What is the opposite of “big”? (nivel avanzado)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3299, 243, 'Which word fits: “I ___ a student.” (nivel avanzado)', 'am', 'is', 'are', 'be', 'A'),
(3300, 243, 'What is the past tense of “go”? (nivel avanzado)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3301, 244, '¿Cuál es el resultado de 8 + 7? (nivel básico)', '15', '14', '16', '13', 'A'),
(3302, 244, '¿Qué operación sirve para repartir en partes iguales? (nivel básico)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3303, 244, '¿Cuál es el valor de 12 - 5? (nivel básico)', '6', '7', '8', '9', 'B'),
(3304, 244, '¿Qué número sigue después de 19? (nivel básico)', '18', '20', '21', '22', 'B'),
(3305, 244, '¿Cuál es el doble de 6? (nivel básico)', '10', '12', '14', '16', 'B'),
(3306, 244, '¿Qué fracción representa la mitad? (nivel básico)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3307, 244, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel básico)', '12', '14', '16', '18', 'C'),
(3308, 244, '¿Qué número es mayor, 15 o 21? (nivel básico)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3309, 244, '¿Cuál es la suma de 9 y 8? (nivel básico)', '15', '16', '17', '18', 'C'),
(3310, 244, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel básico)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3311, 245, '¿Cuál es el resultado de 8 + 7? (nivel intermedio)', '15', '14', '16', '13', 'A'),
(3312, 245, '¿Qué operación sirve para repartir en partes iguales? (nivel intermedio)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3313, 245, '¿Cuál es el valor de 12 - 5? (nivel intermedio)', '6', '7', '8', '9', 'B'),
(3314, 245, '¿Qué número sigue después de 19? (nivel intermedio)', '18', '20', '21', '22', 'B'),
(3315, 245, '¿Cuál es el doble de 6? (nivel intermedio)', '10', '12', '14', '16', 'B'),
(3316, 245, '¿Qué fracción representa la mitad? (nivel intermedio)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3317, 245, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel intermedio)', '12', '14', '16', '18', 'C'),
(3318, 245, '¿Qué número es mayor, 15 o 21? (nivel intermedio)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3319, 245, '¿Cuál es la suma de 9 y 8? (nivel intermedio)', '15', '16', '17', '18', 'C'),
(3320, 245, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel intermedio)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3321, 246, '¿Cuál es el resultado de 8 + 7? (nivel avanzado)', '15', '14', '16', '13', 'A'),
(3322, 246, '¿Qué operación sirve para repartir en partes iguales? (nivel avanzado)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3323, 246, '¿Cuál es el valor de 12 - 5? (nivel avanzado)', '6', '7', '8', '9', 'B'),
(3324, 246, '¿Qué número sigue después de 19? (nivel avanzado)', '18', '20', '21', '22', 'B'),
(3325, 246, '¿Cuál es el doble de 6? (nivel avanzado)', '10', '12', '14', '16', 'B'),
(3326, 246, '¿Qué fracción representa la mitad? (nivel avanzado)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3327, 246, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel avanzado)', '12', '14', '16', '18', 'C'),
(3328, 246, '¿Qué número es mayor, 15 o 21? (nivel avanzado)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3329, 246, '¿Cuál es la suma de 9 y 8? (nivel avanzado)', '15', '16', '17', '18', 'C'),
(3330, 246, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel avanzado)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3331, 247, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3332, 247, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3333, 247, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3334, 247, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3335, 247, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3336, 247, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3337, 247, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3338, 247, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3339, 247, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3340, 247, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3341, 248, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3342, 248, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3343, 248, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3344, 248, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3345, 248, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3346, 248, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3347, 248, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3348, 248, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3349, 248, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3350, 248, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3351, 249, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3352, 249, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3353, 249, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3354, 249, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3355, 249, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3356, 249, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3357, 249, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3358, 249, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3359, 249, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3360, 249, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3361, 250, '¿Qué estudia la filosofía? (nivel básico)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3362, 250, '¿Qué es una norma? (nivel básico)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3363, 250, '¿Qué significa ética? (nivel básico)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3364, 250, '¿Qué busca la reflexión filosófica? (nivel básico)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3365, 250, '¿Qué diferencia hay entre opinión y argumento? (nivel básico)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3366, 250, '¿Qué es el pensamiento crítico? (nivel básico)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3367, 250, '¿Qué importancia tiene la libertad? (nivel básico)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3368, 250, '¿Qué es la cultura? (nivel básico)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3369, 250, '¿Por qué se analizan los valores? (nivel básico)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3370, 250, '¿Qué busca la educación humanista? (nivel básico)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A'),
(3371, 251, '¿Qué estudia la filosofía? (nivel intermedio)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3372, 251, '¿Qué es una norma? (nivel intermedio)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3373, 251, '¿Qué significa ética? (nivel intermedio)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3374, 251, '¿Qué busca la reflexión filosófica? (nivel intermedio)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3375, 251, '¿Qué diferencia hay entre opinión y argumento? (nivel intermedio)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3376, 251, '¿Qué es el pensamiento crítico? (nivel intermedio)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3377, 251, '¿Qué importancia tiene la libertad? (nivel intermedio)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3378, 251, '¿Qué es la cultura? (nivel intermedio)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3379, 251, '¿Por qué se analizan los valores? (nivel intermedio)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3380, 251, '¿Qué busca la educación humanista? (nivel intermedio)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A'),
(3381, 252, '¿Qué estudia la filosofía? (nivel avanzado)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3382, 252, '¿Qué es una norma? (nivel avanzado)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3383, 252, '¿Qué significa ética? (nivel avanzado)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3384, 252, '¿Qué busca la reflexión filosófica? (nivel avanzado)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3385, 252, '¿Qué diferencia hay entre opinión y argumento? (nivel avanzado)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3386, 252, '¿Qué es el pensamiento crítico? (nivel avanzado)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3387, 252, '¿Qué importancia tiene la libertad? (nivel avanzado)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3388, 252, '¿Qué es la cultura? (nivel avanzado)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3389, 252, '¿Por qué se analizan los valores? (nivel avanzado)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3390, 252, '¿Qué busca la educación humanista? (nivel avanzado)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A'),
(3391, 253, '¿Cuál es el resultado de 8 + 7? (nivel básico)', '15', '14', '16', '13', 'A'),
(3392, 253, '¿Qué operación sirve para repartir en partes iguales? (nivel básico)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3393, 253, '¿Cuál es el valor de 12 - 5? (nivel básico)', '6', '7', '8', '9', 'B'),
(3394, 253, '¿Qué número sigue después de 19? (nivel básico)', '18', '20', '21', '22', 'B'),
(3395, 253, '¿Cuál es el doble de 6? (nivel básico)', '10', '12', '14', '16', 'B'),
(3396, 253, '¿Qué fracción representa la mitad? (nivel básico)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3397, 253, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel básico)', '12', '14', '16', '18', 'C'),
(3398, 253, '¿Qué número es mayor, 15 o 21? (nivel básico)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3399, 253, '¿Cuál es la suma de 9 y 8? (nivel básico)', '15', '16', '17', '18', 'C'),
(3400, 253, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel básico)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3401, 254, '¿Cuál es el resultado de 8 + 7? (nivel intermedio)', '15', '14', '16', '13', 'A'),
(3402, 254, '¿Qué operación sirve para repartir en partes iguales? (nivel intermedio)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3403, 254, '¿Cuál es el valor de 12 - 5? (nivel intermedio)', '6', '7', '8', '9', 'B'),
(3404, 254, '¿Qué número sigue después de 19? (nivel intermedio)', '18', '20', '21', '22', 'B'),
(3405, 254, '¿Cuál es el doble de 6? (nivel intermedio)', '10', '12', '14', '16', 'B'),
(3406, 254, '¿Qué fracción representa la mitad? (nivel intermedio)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3407, 254, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel intermedio)', '12', '14', '16', '18', 'C'),
(3408, 254, '¿Qué número es mayor, 15 o 21? (nivel intermedio)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3409, 254, '¿Cuál es la suma de 9 y 8? (nivel intermedio)', '15', '16', '17', '18', 'C'),
(3410, 254, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel intermedio)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3411, 255, '¿Cuál es el resultado de 8 + 7? (nivel avanzado)', '15', '14', '16', '13', 'A'),
(3412, 255, '¿Qué operación sirve para repartir en partes iguales? (nivel avanzado)', 'Suma', 'Resta', 'Multiplicación', 'División', 'D'),
(3413, 255, '¿Cuál es el valor de 12 - 5? (nivel avanzado)', '6', '7', '8', '9', 'B'),
(3414, 255, '¿Qué número sigue después de 19? (nivel avanzado)', '18', '20', '21', '22', 'B'),
(3415, 255, '¿Cuál es el doble de 6? (nivel avanzado)', '10', '12', '14', '16', 'B'),
(3416, 255, '¿Qué fracción representa la mitad? (nivel avanzado)', '1/2', '1/3', '2/3', '3/4', 'A'),
(3417, 255, '¿Cuál es el perímetro de un cuadrado de lado 4? (nivel avanzado)', '12', '14', '16', '18', 'C'),
(3418, 255, '¿Qué número es mayor, 15 o 21? (nivel avanzado)', '15', '21', 'Ambos', 'Ninguno', 'B'),
(3419, 255, '¿Cuál es la suma de 9 y 8? (nivel avanzado)', '15', '16', '17', '18', 'C'),
(3420, 255, '¿Qué unidad se usa para medir el espacio ocupado por una figura? (nivel avanzado)', 'Longitud', 'Área', 'Volumen', 'Tiempo', 'B'),
(3421, 256, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3422, 256, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3423, 256, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3424, 256, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3425, 256, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3426, 256, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3427, 256, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3428, 256, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3429, 256, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3430, 256, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3431, 257, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3432, 257, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3433, 257, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3434, 257, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3435, 257, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3436, 257, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3437, 257, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3438, 257, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3439, 257, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3440, 257, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3441, 258, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3442, 258, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3443, 258, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3444, 258, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3445, 258, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3446, 258, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3447, 258, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3448, 258, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3449, 258, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3450, 258, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3451, 259, 'What is the English word for “libro”? (nivel básico)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3452, 259, 'What is the plural of “child”? (nivel básico)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3453, 259, 'Which word means “good morning”? (nivel básico)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3454, 259, 'What is the correct form of “to be” for “I”? (nivel básico)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3455, 259, 'What color is the sky on a clear day? (nivel básico)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3456, 259, 'Which sentence is correct? (nivel básico)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3457, 259, 'What does “hello” mean in Spanish? (nivel básico)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3458, 259, 'What is the opposite of “big”? (nivel básico)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3459, 259, 'Which word fits: “I ___ a student.” (nivel básico)', 'am', 'is', 'are', 'be', 'A'),
(3460, 259, 'What is the past tense of “go”? (nivel básico)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3461, 260, 'What is the English word for “libro”? (nivel intermedio)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3462, 260, 'What is the plural of “child”? (nivel intermedio)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3463, 260, 'Which word means “good morning”? (nivel intermedio)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3464, 260, 'What is the correct form of “to be” for “I”? (nivel intermedio)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3465, 260, 'What color is the sky on a clear day? (nivel intermedio)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3466, 260, 'Which sentence is correct? (nivel intermedio)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3467, 260, 'What does “hello” mean in Spanish? (nivel intermedio)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3468, 260, 'What is the opposite of “big”? (nivel intermedio)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3469, 260, 'Which word fits: “I ___ a student.” (nivel intermedio)', 'am', 'is', 'are', 'be', 'A'),
(3470, 260, 'What is the past tense of “go”? (nivel intermedio)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3471, 261, 'What is the English word for “libro”? (nivel avanzado)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3472, 261, 'What is the plural of “child”? (nivel avanzado)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3473, 261, 'Which word means “good morning”? (nivel avanzado)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3474, 261, 'What is the correct form of “to be” for “I”? (nivel avanzado)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3475, 261, 'What color is the sky on a clear day? (nivel avanzado)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3476, 261, 'Which sentence is correct? (nivel avanzado)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3477, 261, 'What does “hello” mean in Spanish? (nivel avanzado)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3478, 261, 'What is the opposite of “big”? (nivel avanzado)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3479, 261, 'Which word fits: “I ___ a student.” (nivel avanzado)', 'am', 'is', 'are', 'be', 'A'),
(3480, 261, 'What is the past tense of “go”? (nivel avanzado)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3481, 262, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3482, 262, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3483, 262, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3484, 262, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3485, 262, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3486, 262, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3487, 262, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3488, 262, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3489, 262, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3490, 262, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3491, 263, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A');
INSERT INTO `preguntas` (`id_pregunta`, `id_unidad`, `pregunta_texto`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`) VALUES
(3492, 263, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3493, 263, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3494, 263, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3495, 263, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3496, 263, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3497, 263, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3498, 263, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3499, 263, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3500, 263, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3501, 264, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3502, 264, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3503, 264, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3504, 264, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3505, 264, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3506, 264, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3507, 264, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3508, 264, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3509, 264, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3510, 264, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3511, 265, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3512, 265, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3513, 265, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3514, 265, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3515, 265, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3516, 265, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3517, 265, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3518, 265, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3519, 265, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3520, 265, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3521, 266, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3522, 266, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3523, 266, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3524, 266, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3525, 266, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3526, 266, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3527, 266, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3528, 266, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3529, 266, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3530, 266, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3531, 267, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3532, 267, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3533, 267, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3534, 267, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3535, 267, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3536, 267, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3537, 267, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3538, 267, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3539, 267, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3540, 267, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3541, 268, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3542, 268, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3543, 268, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3544, 268, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3545, 268, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3546, 268, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3547, 268, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3548, 268, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3549, 268, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3550, 268, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3551, 269, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3552, 269, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3553, 269, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3554, 269, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3555, 269, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3556, 269, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3557, 269, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3558, 269, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3559, 269, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3560, 269, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3561, 270, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3562, 270, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3563, 270, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3564, 270, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3565, 270, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3566, 270, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3567, 270, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3568, 270, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3569, 270, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3570, 270, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3571, 271, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3572, 271, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3573, 271, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3574, 271, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3575, 271, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3576, 271, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3577, 271, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3578, 271, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3579, 271, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3580, 271, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3581, 272, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3582, 272, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3583, 272, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3584, 272, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3585, 272, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3586, 272, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3587, 272, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3588, 272, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3589, 272, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3590, 272, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3591, 273, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3592, 273, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3593, 273, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3594, 273, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3595, 273, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3596, 273, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3597, 273, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3598, 273, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3599, 273, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3600, 273, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3601, 274, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3602, 274, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3603, 274, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3604, 274, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3605, 274, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3606, 274, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3607, 274, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3608, 274, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3609, 274, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3610, 274, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3611, 275, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3612, 275, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3613, 275, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3614, 275, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3615, 275, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3616, 275, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3617, 275, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3618, 275, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3619, 275, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3620, 275, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3621, 276, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3622, 276, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3623, 276, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3624, 276, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3625, 276, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3626, 276, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3627, 276, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3628, 276, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3629, 276, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3630, 276, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3631, 277, '¿Qué idea principal se relaciona con este tema? (nivel básico)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3632, 277, '¿Cuál opción describe mejor el concepto principal? (nivel básico)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3633, 277, '¿Qué ejemplo ilustra mejor el tema? (nivel básico)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3634, 277, '¿Qué afirmación es correcta? (nivel básico)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3635, 277, '¿Qué relación existe entre estos conceptos? (nivel básico)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3636, 277, '¿Cuál opción completa mejor la idea? (nivel básico)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3637, 277, '¿Qué aplicación práctica corresponde al tema? (nivel básico)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3638, 277, '¿Qué ventaja ofrece este conocimiento? (nivel básico)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3639, 277, '¿Qué error se debe evitar? (nivel básico)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3640, 277, '¿Cuál es la mejor conclusión? (nivel básico)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3641, 278, '¿Qué idea principal se relaciona con este tema? (nivel intermedio)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3642, 278, '¿Cuál opción describe mejor el concepto principal? (nivel intermedio)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3643, 278, '¿Qué ejemplo ilustra mejor el tema? (nivel intermedio)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3644, 278, '¿Qué afirmación es correcta? (nivel intermedio)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3645, 278, '¿Qué relación existe entre estos conceptos? (nivel intermedio)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3646, 278, '¿Cuál opción completa mejor la idea? (nivel intermedio)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3647, 278, '¿Qué aplicación práctica corresponde al tema? (nivel intermedio)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3648, 278, '¿Qué ventaja ofrece este conocimiento? (nivel intermedio)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3649, 278, '¿Qué error se debe evitar? (nivel intermedio)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3650, 278, '¿Cuál es la mejor conclusión? (nivel intermedio)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3651, 279, '¿Qué idea principal se relaciona con este tema? (nivel avanzado)', 'Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número', 'A'),
(3652, 279, '¿Cuál opción describe mejor el concepto principal? (nivel avanzado)', 'La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima', 'A'),
(3653, 279, '¿Qué ejemplo ilustra mejor el tema? (nivel avanzado)', 'Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia', 'A'),
(3654, 279, '¿Qué afirmación es correcta? (nivel avanzado)', 'La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta', 'A'),
(3655, 279, '¿Qué relación existe entre estos conceptos? (nivel avanzado)', 'Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria', 'A'),
(3656, 279, '¿Cuál opción completa mejor la idea? (nivel avanzado)', 'La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía', 'A'),
(3657, 279, '¿Qué aplicación práctica corresponde al tema? (nivel avanzado)', 'Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica', 'A'),
(3658, 279, '¿Qué ventaja ofrece este conocimiento? (nivel avanzado)', 'Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta', 'A'),
(3659, 279, '¿Qué error se debe evitar? (nivel avanzado)', 'El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil', 'A'),
(3660, 279, '¿Cuál es la mejor conclusión? (nivel avanzado)', 'La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía', 'A'),
(3661, 280, '¿Qué es una mezcla? (nivel básico)', 'Una sustancia pura', 'Una combinación de sustancias', 'Un solo elemento', 'Una reacción nuclear', 'B'),
(3662, 280, '¿Cuál es el símbolo del agua? (nivel básico)', 'O', 'H2O', 'CO2', 'NaCl', 'B'),
(3663, 280, '¿Qué estado de la materia tiene forma fija? (nivel básico)', 'Gas', 'Líquido', 'Sólido', 'Plasma', 'C'),
(3664, 280, '¿Qué se mide con la escala de pH? (nivel básico)', 'La temperatura', 'La acidez o alcalinidad', 'La masa', 'La velocidad', 'B'),
(3665, 280, '¿Qué es un elemento? (nivel básico)', 'Una mezcla de dos cosas', 'Una sustancia simple', 'Un cambio químico', 'Un gas', 'B'),
(3666, 280, '¿Qué nombre recibe la sustancia más simple? (nivel básico)', 'Compuesto', 'Elemento', 'Solución', 'Mezcla', 'B'),
(3667, 280, '¿Qué gas respiramos? (nivel básico)', 'Oxígeno', 'Dióxido de carbono', 'Helio', 'Nitrógeno', 'A'),
(3668, 280, '¿Qué propiedad distingue un sólido de un líquido? (nivel básico)', 'Color', 'Forma fija', 'Olor', 'Peso', 'B'),
(3669, 280, '¿Qué se obtiene al mezclar sal y agua? (nivel básico)', 'Una solución', 'Un gas', 'Un sólido puro', 'Un metal', 'A'),
(3670, 280, '¿Qué tipo de cambio ocurre si se quema papel? (nivel básico)', 'Físico', 'Químico', 'Biológico', 'Eléctrico', 'B'),
(3671, 281, '¿Qué es una mezcla? (nivel intermedio)', 'Una sustancia pura', 'Una combinación de sustancias', 'Un solo elemento', 'Una reacción nuclear', 'B'),
(3672, 281, '¿Cuál es el símbolo del agua? (nivel intermedio)', 'O', 'H2O', 'CO2', 'NaCl', 'B'),
(3673, 281, '¿Qué estado de la materia tiene forma fija? (nivel intermedio)', 'Gas', 'Líquido', 'Sólido', 'Plasma', 'C'),
(3674, 281, '¿Qué se mide con la escala de pH? (nivel intermedio)', 'La temperatura', 'La acidez o alcalinidad', 'La masa', 'La velocidad', 'B'),
(3675, 281, '¿Qué es un elemento? (nivel intermedio)', 'Una mezcla de dos cosas', 'Una sustancia simple', 'Un cambio químico', 'Un gas', 'B'),
(3676, 281, '¿Qué nombre recibe la sustancia más simple? (nivel intermedio)', 'Compuesto', 'Elemento', 'Solución', 'Mezcla', 'B'),
(3677, 281, '¿Qué gas respiramos? (nivel intermedio)', 'Oxígeno', 'Dióxido de carbono', 'Helio', 'Nitrógeno', 'A'),
(3678, 281, '¿Qué propiedad distingue un sólido de un líquido? (nivel intermedio)', 'Color', 'Forma fija', 'Olor', 'Peso', 'B'),
(3679, 281, '¿Qué se obtiene al mezclar sal y agua? (nivel intermedio)', 'Una solución', 'Un gas', 'Un sólido puro', 'Un metal', 'A'),
(3680, 281, '¿Qué tipo de cambio ocurre si se quema papel? (nivel intermedio)', 'Físico', 'Químico', 'Biológico', 'Eléctrico', 'B'),
(3681, 282, '¿Qué es una mezcla? (nivel avanzado)', 'Una sustancia pura', 'Una combinación de sustancias', 'Un solo elemento', 'Una reacción nuclear', 'B'),
(3682, 282, '¿Cuál es el símbolo del agua? (nivel avanzado)', 'O', 'H2O', 'CO2', 'NaCl', 'B'),
(3683, 282, '¿Qué estado de la materia tiene forma fija? (nivel avanzado)', 'Gas', 'Líquido', 'Sólido', 'Plasma', 'C'),
(3684, 282, '¿Qué se mide con la escala de pH? (nivel avanzado)', 'La temperatura', 'La acidez o alcalinidad', 'La masa', 'La velocidad', 'B'),
(3685, 282, '¿Qué es un elemento? (nivel avanzado)', 'Una mezcla de dos cosas', 'Una sustancia simple', 'Un cambio químico', 'Un gas', 'B'),
(3686, 282, '¿Qué nombre recibe la sustancia más simple? (nivel avanzado)', 'Compuesto', 'Elemento', 'Solución', 'Mezcla', 'B'),
(3687, 282, '¿Qué gas respiramos? (nivel avanzado)', 'Oxígeno', 'Dióxido de carbono', 'Helio', 'Nitrógeno', 'A'),
(3688, 282, '¿Qué propiedad distingue un sólido de un líquido? (nivel avanzado)', 'Color', 'Forma fija', 'Olor', 'Peso', 'B'),
(3689, 282, '¿Qué se obtiene al mezclar sal y agua? (nivel avanzado)', 'Una solución', 'Un gas', 'Un sólido puro', 'Un metal', 'A'),
(3690, 282, '¿Qué tipo de cambio ocurre si se quema papel? (nivel avanzado)', 'Físico', 'Químico', 'Biológico', 'Eléctrico', 'B'),
(3691, 283, '¿Qué mide un termómetro? (nivel básico)', 'La temperatura', 'La masa', 'La velocidad', 'La presión', 'A'),
(3692, 283, '¿Qué se necesita para mover un objeto? (nivel básico)', 'Fuerza', 'Silencio', 'Color', 'Luz', 'A'),
(3693, 283, '¿Qué es la fuerza? (nivel básico)', 'Un empuje o tracción', 'Un color', 'Una forma', 'Una pregunta', 'A'),
(3694, 283, '¿Qué unidad se usa para medir la longitud? (nivel básico)', 'Metro', 'Segundo', 'Kilogramo', 'Litro', 'A'),
(3695, 283, '¿Qué pasa con la energía al caer un objeto? (nivel básico)', 'Se transforma', 'Se destruye', 'Se vuelve luz fija', 'Desaparece', 'A'),
(3696, 283, '¿Qué es la velocidad? (nivel básico)', 'La distancia recorrida en un tiempo', 'La masa de un objeto', 'La cantidad de calor', 'La forma de una figura', 'A'),
(3697, 283, '¿Qué tipo de energía tiene un cuerpo en movimiento? (nivel básico)', 'Energía cinética', 'Energía térmica', 'Energía química', 'Energía nuclear', 'A'),
(3698, 283, '¿Qué instrumento mide la masa? (nivel básico)', 'Balanza', 'Termómetro', 'Cronómetro', 'Vernier', 'A'),
(3699, 283, '¿Qué sucede cuando dos fuerzas opuestas son iguales? (nivel básico)', 'No hay movimiento', 'Se acelera', 'Se quema', 'Se evapora', 'A'),
(3700, 283, '¿Qué es la temperatura? (nivel básico)', 'La medida del calor de un cuerpo', 'La cantidad de agua', 'La velocidad del sonido', 'La presión del aire', 'A'),
(3701, 284, '¿Qué mide un termómetro? (nivel intermedio)', 'La temperatura', 'La masa', 'La velocidad', 'La presión', 'A'),
(3702, 284, '¿Qué se necesita para mover un objeto? (nivel intermedio)', 'Fuerza', 'Silencio', 'Color', 'Luz', 'A'),
(3703, 284, '¿Qué es la fuerza? (nivel intermedio)', 'Un empuje o tracción', 'Un color', 'Una forma', 'Una pregunta', 'A'),
(3704, 284, '¿Qué unidad se usa para medir la longitud? (nivel intermedio)', 'Metro', 'Segundo', 'Kilogramo', 'Litro', 'A'),
(3705, 284, '¿Qué pasa con la energía al caer un objeto? (nivel intermedio)', 'Se transforma', 'Se destruye', 'Se vuelve luz fija', 'Desaparece', 'A'),
(3706, 284, '¿Qué es la velocidad? (nivel intermedio)', 'La distancia recorrida en un tiempo', 'La masa de un objeto', 'La cantidad de calor', 'La forma de una figura', 'A'),
(3707, 284, '¿Qué tipo de energía tiene un cuerpo en movimiento? (nivel intermedio)', 'Energía cinética', 'Energía térmica', 'Energía química', 'Energía nuclear', 'A'),
(3708, 284, '¿Qué instrumento mide la masa? (nivel intermedio)', 'Balanza', 'Termómetro', 'Cronómetro', 'Vernier', 'A'),
(3709, 284, '¿Qué sucede cuando dos fuerzas opuestas son iguales? (nivel intermedio)', 'No hay movimiento', 'Se acelera', 'Se quema', 'Se evapora', 'A'),
(3710, 284, '¿Qué es la temperatura? (nivel intermedio)', 'La medida del calor de un cuerpo', 'La cantidad de agua', 'La velocidad del sonido', 'La presión del aire', 'A'),
(3711, 285, '¿Qué mide un termómetro? (nivel avanzado)', 'La temperatura', 'La masa', 'La velocidad', 'La presión', 'A'),
(3712, 285, '¿Qué se necesita para mover un objeto? (nivel avanzado)', 'Fuerza', 'Silencio', 'Color', 'Luz', 'A'),
(3713, 285, '¿Qué es la fuerza? (nivel avanzado)', 'Un empuje o tracción', 'Un color', 'Una forma', 'Una pregunta', 'A'),
(3714, 285, '¿Qué unidad se usa para medir la longitud? (nivel avanzado)', 'Metro', 'Segundo', 'Kilogramo', 'Litro', 'A'),
(3715, 285, '¿Qué pasa con la energía al caer un objeto? (nivel avanzado)', 'Se transforma', 'Se destruye', 'Se vuelve luz fija', 'Desaparece', 'A'),
(3716, 285, '¿Qué es la velocidad? (nivel avanzado)', 'La distancia recorrida en un tiempo', 'La masa de un objeto', 'La cantidad de calor', 'La forma de una figura', 'A'),
(3717, 285, '¿Qué tipo de energía tiene un cuerpo en movimiento? (nivel avanzado)', 'Energía cinética', 'Energía térmica', 'Energía química', 'Energía nuclear', 'A'),
(3718, 285, '¿Qué instrumento mide la masa? (nivel avanzado)', 'Balanza', 'Termómetro', 'Cronómetro', 'Vernier', 'A'),
(3719, 285, '¿Qué sucede cuando dos fuerzas opuestas son iguales? (nivel avanzado)', 'No hay movimiento', 'Se acelera', 'Se quema', 'Se evapora', 'A'),
(3720, 285, '¿Qué es la temperatura? (nivel avanzado)', 'La medida del calor de un cuerpo', 'La cantidad de agua', 'La velocidad del sonido', 'La presión del aire', 'A'),
(3721, 286, 'What is the English word for “libro”? (nivel básico)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3722, 286, 'What is the plural of “child”? (nivel básico)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3723, 286, 'Which word means “good morning”? (nivel básico)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3724, 286, 'What is the correct form of “to be” for “I”? (nivel básico)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3725, 286, 'What color is the sky on a clear day? (nivel básico)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3726, 286, 'Which sentence is correct? (nivel básico)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3727, 286, 'What does “hello” mean in Spanish? (nivel básico)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3728, 286, 'What is the opposite of “big”? (nivel básico)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3729, 286, 'Which word fits: “I ___ a student.” (nivel básico)', 'am', 'is', 'are', 'be', 'A'),
(3730, 286, 'What is the past tense of “go”? (nivel básico)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3731, 287, 'What is the English word for “libro”? (nivel intermedio)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3732, 287, 'What is the plural of “child”? (nivel intermedio)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3733, 287, 'Which word means “good morning”? (nivel intermedio)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3734, 287, 'What is the correct form of “to be” for “I”? (nivel intermedio)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3735, 287, 'What color is the sky on a clear day? (nivel intermedio)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3736, 287, 'Which sentence is correct? (nivel intermedio)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3737, 287, 'What does “hello” mean in Spanish? (nivel intermedio)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3738, 287, 'What is the opposite of “big”? (nivel intermedio)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3739, 287, 'Which word fits: “I ___ a student.” (nivel intermedio)', 'am', 'is', 'are', 'be', 'A'),
(3740, 287, 'What is the past tense of “go”? (nivel intermedio)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3741, 288, 'What is the English word for “libro”? (nivel avanzado)', 'Book', 'Table', 'Pen', 'Car', 'A'),
(3742, 288, 'What is the plural of “child”? (nivel avanzado)', 'Childs', 'Children', 'Childes', 'Childer', 'B'),
(3743, 288, 'Which word means “good morning”? (nivel avanzado)', 'Good evening', 'Good morning', 'Good afternoon', 'Good night', 'B'),
(3744, 288, 'What is the correct form of “to be” for “I”? (nivel avanzado)', 'I am', 'I is', 'I are', 'I be', 'A'),
(3745, 288, 'What color is the sky on a clear day? (nivel avanzado)', 'Red', 'Blue', 'Green', 'Yellow', 'B'),
(3746, 288, 'Which sentence is correct? (nivel avanzado)', 'She is happy', 'She am happy', 'She are happy', 'She be happy', 'A'),
(3747, 288, 'What does “hello” mean in Spanish? (nivel avanzado)', 'Adiós', 'Hola', 'Gracias', 'Por favor', 'B'),
(3748, 288, 'What is the opposite of “big”? (nivel avanzado)', 'Small', 'Tall', 'Heavy', 'Fast', 'A'),
(3749, 288, 'Which word fits: “I ___ a student.” (nivel avanzado)', 'am', 'is', 'are', 'be', 'A'),
(3750, 288, 'What is the past tense of “go”? (nivel avanzado)', 'Went', 'Goed', 'Gone', 'Going', 'A'),
(3751, 289, '¿Qué ayuda a resolver conflictos con respeto? (nivel básico)', 'Escuchar y dialogar', 'Gritar', 'Ignorar', 'Humillar', 'A'),
(3752, 289, '¿Qué significa empatía? (nivel básico)', 'Entender cómo se siente otra persona', 'No hablar', 'Estar enojado', 'Jugar solo', 'A'),
(3753, 289, '¿Por qué es importante escuchar a los demás? (nivel básico)', 'Porque mejora la comunicación', 'Porque se pierde tiempo', 'Porque no importa', 'Porque todo es igual', 'A'),
(3754, 289, '¿Qué debes hacer cuando alguien se siente triste? (nivel básico)', 'Acompañarlo y escuchar', 'Reírte', 'Ignorarlo', 'Gritarle', 'A'),
(3755, 289, '¿Qué habilidad mejora la convivencia? (nivel básico)', 'La escucha activa', 'La agresividad', 'La indiferencia', 'La mentira', 'A'),
(3756, 289, '¿Cómo se llama la capacidad de controlar tus emociones? (nivel básico)', 'Autorregulación', 'Desorden', 'Agresión', 'Falta de sueño', 'A'),
(3757, 289, '¿Qué acción promueve la responsabilidad? (nivel básico)', 'Cumplir con lo que se promete', 'Postergar todo', 'Mentir', 'Ignorar', 'A'),
(3758, 289, '¿Por qué es importante pedir ayuda? (nivel básico)', 'Porque todos necesitamos apoyo', 'Porque es mala señal', 'Porque nadie ayuda', 'Porque no sirve', 'A'),
(3759, 289, '¿Qué actitud ayuda al trabajo en equipo? (nivel básico)', 'Colaboración', 'Competencia agresiva', 'Indiferencia', 'Aislamiento', 'A'),
(3760, 289, '¿Qué hace una persona autorregulada? (nivel básico)', 'Controla sus acciones y emociones', 'Se enoja siempre', 'No escucha', 'Hace todo al azar', 'A'),
(3761, 290, '¿Qué ayuda a resolver conflictos con respeto? (nivel intermedio)', 'Escuchar y dialogar', 'Gritar', 'Ignorar', 'Humillar', 'A'),
(3762, 290, '¿Qué significa empatía? (nivel intermedio)', 'Entender cómo se siente otra persona', 'No hablar', 'Estar enojado', 'Jugar solo', 'A'),
(3763, 290, '¿Por qué es importante escuchar a los demás? (nivel intermedio)', 'Porque mejora la comunicación', 'Porque se pierde tiempo', 'Porque no importa', 'Porque todo es igual', 'A'),
(3764, 290, '¿Qué debes hacer cuando alguien se siente triste? (nivel intermedio)', 'Acompañarlo y escuchar', 'Reírte', 'Ignorarlo', 'Gritarle', 'A'),
(3765, 290, '¿Qué habilidad mejora la convivencia? (nivel intermedio)', 'La escucha activa', 'La agresividad', 'La indiferencia', 'La mentira', 'A'),
(3766, 290, '¿Cómo se llama la capacidad de controlar tus emociones? (nivel intermedio)', 'Autorregulación', 'Desorden', 'Agresión', 'Falta de sueño', 'A'),
(3767, 290, '¿Qué acción promueve la responsabilidad? (nivel intermedio)', 'Cumplir con lo que se promete', 'Postergar todo', 'Mentir', 'Ignorar', 'A'),
(3768, 290, '¿Por qué es importante pedir ayuda? (nivel intermedio)', 'Porque todos necesitamos apoyo', 'Porque es mala señal', 'Porque nadie ayuda', 'Porque no sirve', 'A'),
(3769, 290, '¿Qué actitud ayuda al trabajo en equipo? (nivel intermedio)', 'Colaboración', 'Competencia agresiva', 'Indiferencia', 'Aislamiento', 'A'),
(3770, 290, '¿Qué hace una persona autorregulada? (nivel intermedio)', 'Controla sus acciones y emociones', 'Se enoja siempre', 'No escucha', 'Hace todo al azar', 'A'),
(3771, 291, '¿Qué ayuda a resolver conflictos con respeto? (nivel avanzado)', 'Escuchar y dialogar', 'Gritar', 'Ignorar', 'Humillar', 'A'),
(3772, 291, '¿Qué significa empatía? (nivel avanzado)', 'Entender cómo se siente otra persona', 'No hablar', 'Estar enojado', 'Jugar solo', 'A'),
(3773, 291, '¿Por qué es importante escuchar a los demás? (nivel avanzado)', 'Porque mejora la comunicación', 'Porque se pierde tiempo', 'Porque no importa', 'Porque todo es igual', 'A'),
(3774, 291, '¿Qué debes hacer cuando alguien se siente triste? (nivel avanzado)', 'Acompañarlo y escuchar', 'Reírte', 'Ignorarlo', 'Gritarle', 'A'),
(3775, 291, '¿Qué habilidad mejora la convivencia? (nivel avanzado)', 'La escucha activa', 'La agresividad', 'La indiferencia', 'La mentira', 'A'),
(3776, 291, '¿Cómo se llama la capacidad de controlar tus emociones? (nivel avanzado)', 'Autorregulación', 'Desorden', 'Agresión', 'Falta de sueño', 'A'),
(3777, 291, '¿Qué acción promueve la responsabilidad? (nivel avanzado)', 'Cumplir con lo que se promete', 'Postergar todo', 'Mentir', 'Ignorar', 'A'),
(3778, 291, '¿Por qué es importante pedir ayuda? (nivel avanzado)', 'Porque todos necesitamos apoyo', 'Porque es mala señal', 'Porque nadie ayuda', 'Porque no sirve', 'A'),
(3779, 291, '¿Qué actitud ayuda al trabajo en equipo? (nivel avanzado)', 'Colaboración', 'Competencia agresiva', 'Indiferencia', 'Aislamiento', 'A'),
(3780, 291, '¿Qué hace una persona autorregulada? (nivel avanzado)', 'Controla sus acciones y emociones', 'Se enoja siempre', 'No escucha', 'Hace todo al azar', 'A'),
(3781, 292, '¿Qué estudia la filosofía? (nivel básico)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3782, 292, '¿Qué es una norma? (nivel básico)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3783, 292, '¿Qué significa ética? (nivel básico)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3784, 292, '¿Qué busca la reflexión filosófica? (nivel básico)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3785, 292, '¿Qué diferencia hay entre opinión y argumento? (nivel básico)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3786, 292, '¿Qué es el pensamiento crítico? (nivel básico)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3787, 292, '¿Qué importancia tiene la libertad? (nivel básico)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3788, 292, '¿Qué es la cultura? (nivel básico)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3789, 292, '¿Por qué se analizan los valores? (nivel básico)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3790, 292, '¿Qué busca la educación humanista? (nivel básico)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A'),
(3791, 293, '¿Qué estudia la filosofía? (nivel intermedio)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3792, 293, '¿Qué es una norma? (nivel intermedio)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3793, 293, '¿Qué significa ética? (nivel intermedio)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3794, 293, '¿Qué busca la reflexión filosófica? (nivel intermedio)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3795, 293, '¿Qué diferencia hay entre opinión y argumento? (nivel intermedio)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3796, 293, '¿Qué es el pensamiento crítico? (nivel intermedio)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3797, 293, '¿Qué importancia tiene la libertad? (nivel intermedio)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3798, 293, '¿Qué es la cultura? (nivel intermedio)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3799, 293, '¿Por qué se analizan los valores? (nivel intermedio)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3800, 293, '¿Qué busca la educación humanista? (nivel intermedio)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A'),
(3801, 294, '¿Qué estudia la filosofía? (nivel avanzado)', 'La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina', 'A'),
(3802, 294, '¿Qué es una norma? (nivel avanzado)', 'Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción', 'A'),
(3803, 294, '¿Qué significa ética? (nivel avanzado)', 'La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción', 'A'),
(3804, 294, '¿Qué busca la reflexión filosófica? (nivel avanzado)', 'Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas', 'A'),
(3805, 294, '¿Qué diferencia hay entre opinión y argumento? (nivel avanzado)', 'La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones', 'A'),
(3806, 294, '¿Qué es el pensamiento crítico? (nivel avanzado)', 'Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre', 'A'),
(3807, 294, '¿Qué importancia tiene la libertad? (nivel avanzado)', 'Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia', 'A'),
(3808, 294, '¿Qué es la cultura? (nivel avanzado)', 'El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social', 'A'),
(3809, 294, '¿Por qué se analizan los valores? (nivel avanzado)', 'Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto', 'A'),
(3810, 294, '¿Qué busca la educación humanista? (nivel avanzado)', 'Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id_resultado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `calificacion` decimal(5,2) NOT NULL,
  `fecha_realizacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resultados`
--

INSERT INTO `resultados` (`id_resultado`, `id_usuario`, `id_unidad`, `calificacion`, `fecha_realizacion`) VALUES
(2, 4, 271, 100.00, '2026-06-08 05:23:14'),
(3, 4, 226, 20.00, '2026-06-08 05:48:44'),
(4, 4, 226, 90.00, '2026-06-08 05:59:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestres`
--

CREATE TABLE `semestres` (
  `id_semestre` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `semestres`
--

INSERT INTO `semestres` (`id_semestre`, `nombre`) VALUES
(1, 'Primer Semestre'),
(2, 'Segundo Semestre'),
(3, 'Tercer Semestre'),
(4, 'Cuarto Semestre'),
(5, 'Quinto Semestre'),
(6, 'Sexto Semestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id_unidad` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id_unidad`, `id_materia`, `nombre`) VALUES
(226, 1, 'Unidad 1 - Nivel 1'),
(227, 1, 'Unidad 2 - Nivel 2'),
(228, 1, 'Unidad 3 - Nivel 3'),
(229, 2, 'Unidad 1 - Nivel 1'),
(230, 2, 'Unidad 2 - Nivel 2'),
(231, 2, 'Unidad 3 - Nivel 3'),
(232, 3, 'Unidad 1 - Nivel 1'),
(233, 3, 'Unidad 2 - Nivel 2'),
(234, 3, 'Unidad 3 - Nivel 3'),
(235, 4, 'Unidad 1 - Nivel 1'),
(236, 4, 'Unidad 2 - Nivel 2'),
(237, 4, 'Unidad 3 - Nivel 3'),
(238, 5, 'Unidad 1 - Nivel 1'),
(239, 5, 'Unidad 2 - Nivel 2'),
(240, 5, 'Unidad 3 - Nivel 3'),
(241, 6, 'Unidad 1 - Nivel 1'),
(242, 6, 'Unidad 2 - Nivel 2'),
(243, 6, 'Unidad 3 - Nivel 3'),
(244, 7, 'Unidad 1 - Nivel 1'),
(245, 7, 'Unidad 2 - Nivel 2'),
(246, 7, 'Unidad 3 - Nivel 3'),
(247, 8, 'Unidad 1 - Nivel 1'),
(248, 8, 'Unidad 2 - Nivel 2'),
(249, 8, 'Unidad 3 - Nivel 3'),
(250, 9, 'Unidad 1 - Nivel 1'),
(251, 9, 'Unidad 2 - Nivel 2'),
(252, 9, 'Unidad 3 - Nivel 3'),
(253, 10, 'Unidad 1 - Nivel 1'),
(254, 10, 'Unidad 2 - Nivel 2'),
(255, 10, 'Unidad 3 - Nivel 3'),
(256, 11, 'Unidad 1 - Nivel 1'),
(257, 11, 'Unidad 2 - Nivel 2'),
(258, 11, 'Unidad 3 - Nivel 3'),
(259, 12, 'Unidad 1 - Nivel 1'),
(260, 12, 'Unidad 2 - Nivel 2'),
(261, 12, 'Unidad 3 - Nivel 3'),
(262, 13, 'Unidad 1 - Nivel 1'),
(263, 13, 'Unidad 2 - Nivel 2'),
(264, 13, 'Unidad 3 - Nivel 3'),
(265, 14, 'Unidad 1 - Nivel 1'),
(266, 14, 'Unidad 2 - Nivel 2'),
(267, 14, 'Unidad 3 - Nivel 3'),
(268, 15, 'Unidad 1 - Nivel 1'),
(269, 15, 'Unidad 2 - Nivel 2'),
(270, 15, 'Unidad 3 - Nivel 3'),
(271, 16, 'Unidad 1 - Nivel 1'),
(272, 16, 'Unidad 2 - Nivel 2'),
(273, 16, 'Unidad 3 - Nivel 3'),
(274, 17, 'Unidad 1 - Nivel 1'),
(275, 17, 'Unidad 2 - Nivel 2'),
(276, 17, 'Unidad 3 - Nivel 3'),
(277, 18, 'Unidad 1 - Nivel 1'),
(278, 18, 'Unidad 2 - Nivel 2'),
(279, 18, 'Unidad 3 - Nivel 3'),
(280, 19, 'Unidad 1 - Nivel 1'),
(281, 19, 'Unidad 2 - Nivel 2'),
(282, 19, 'Unidad 3 - Nivel 3'),
(283, 20, 'Unidad 1 - Nivel 1'),
(284, 20, 'Unidad 2 - Nivel 2'),
(285, 20, 'Unidad 3 - Nivel 3'),
(286, 21, 'Unidad 1 - Nivel 1'),
(287, 21, 'Unidad 2 - Nivel 2'),
(288, 21, 'Unidad 3 - Nivel 3'),
(289, 22, 'Unidad 1 - Nivel 1'),
(290, 22, 'Unidad 2 - Nivel 2'),
(291, 22, 'Unidad 3 - Nivel 3'),
(292, 23, 'Unidad 1 - Nivel 1'),
(293, 23, 'Unidad 2 - Nivel 2'),
(294, 23, 'Unidad 3 - Nivel 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `fecha_registro`) VALUES
(4, 'Francisco Alvarez Medina', '23308060610104@cetis61.edu.mx', '$2b$12$8uZbl7uo1XeqVjpKcIjzIe.2UhJowsI3PBMYznYN.Yd4lULMUB3Ui', '2026-06-08 05:21:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id_semestre`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidad`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3811;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `semestres`
--
ALTER TABLE `semestres`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_semestre`) REFERENCES `semestres` (`id_semestre`) ON DELETE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`) ON DELETE CASCADE;

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
