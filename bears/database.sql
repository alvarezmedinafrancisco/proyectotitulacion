-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS `cetis_examenes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cetis_examenes`;

-- 2. Tabla de Usuarios 
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Tabla de Semestres (Para separar Admisión, 1er Semestre, 2do Semestre, etc.)
CREATE TABLE IF NOT EXISTS `semestres` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL, 
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Tabla de Materias (Inglés, Matemáticas, Química...)
CREATE TABLE IF NOT EXISTS `materias` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `id_semestre` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_materia`),
  FOREIGN KEY (`id_semestre`) REFERENCES `semestres`(`id_semestre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Tabla de Unidades (Unidad 1, Unidad 2, Unidad 3...)
CREATE TABLE IF NOT EXISTS `unidades` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL, 
  PRIMARY KEY (`id_unidad`),
  FOREIGN KEY (`id_materia`) REFERENCES `materias`(`id_materia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Tabla de Preguntas 
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidad` int(11) NOT NULL,
  `pregunta_texto` text NOT NULL,
  `opcion_a` varchar(255) NOT NULL,
  `opcion_b` varchar(255) NOT NULL,
  `opcion_c` varchar(255) NOT NULL,
  `opcion_d` varchar(255) NOT NULL,
  `respuesta_correcta` enum('A','B','C','D') NOT NULL,
  PRIMARY KEY (`id_pregunta`),
  FOREIGN KEY (`id_unidad`) REFERENCES `unidades`(`id_unidad`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Tabla de Resultados
CREATE TABLE IF NOT EXISTS `resultados` (
  `id_resultado` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `calificacion` decimal(5,2) NOT NULL,
  `fecha_realizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_resultado`),
  FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id_usuario`) ON DELETE CASCADE,
  FOREIGN KEY (`id_unidad`) REFERENCES `unidades`(`id_unidad`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;