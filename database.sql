-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2023 a las 20:14:13
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(5) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `client_id` int(5) NOT NULL,
  `employee_id` int(2) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time_expected` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `canceled` tinyint(1) NOT NULL DEFAULT 0,
  `cancellation_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `date_created`, `client_id`, `employee_id`, `start_time`, `end_time_expected`, `canceled`, `cancellation_reason`) VALUES
(10, '2021-02-06 13:40:00', 11, 3, '2021-02-08 09:30:00', '2021-02-08 09:50:00', 0, NULL),
(11, '2021-03-20 08:22:00', 12, 3, '2021-03-22 06:00:00', '2021-03-22 06:20:00', 0, NULL),
(12, '2022-09-20 04:32:00', 15, 2, '2022-09-24 14:15:00', '2022-09-24 14:25:00', 0, NULL),
(13, '2022-09-20 22:11:00', 16, 1, '2022-09-21 14:15:00', '2022-09-21 14:35:00', 0, NULL),
(14, '2022-09-21 04:34:00', 17, 1, '2022-09-22 14:45:00', '2022-09-22 15:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barber_admin`
--

CREATE TABLE `barber_admin` (
  `admin_id` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `barber_admin`
--

INSERT INTO `barber_admin` (`admin_id`, `username`, `email`, `full_name`, `password`) VALUES
(1, 'configuroweb', 'hola@configuroweb.com', 'Mauricio Sevilla', 'ad4bedc9f4f98e0513315bcfd543e4f8e2c00a77');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `client_id` int(5) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `client_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `phone_number`, `client_email`) VALUES
(1, 'Juan', 'Cliente', '3052589741', 'jcliente@cweb.com'),
(2, 'Andres', 'Cliente', '3125896471', 'acliente@cweb.com'),
(3, 'Diego', 'Cliente', '3052467194', 'dcliente@cweb.com'),
(4, 'Adriana', 'Cliente', '3064589741', 'adcliente@cweb.com'),
(5, 'Demetrio', 'Clemente', '3125467141', 'dclemente@cweb.com'),
(7, 'Artemio', 'Lucian', '3236205984', 'alucian@cweb.com'),
(8, 'Emiliano', 'Sanchez', '3069857431', 'esanchez@cweb.com'),
(11, 'Carlos', 'Garcia', '3159874161', 'cgarcia@cweb.com'),
(12, 'Jhon', 'Juan', '3056489721', 'jjuan@cweb.com'),
(15, 'Pedro', 'Usuario', '3025897410', 'pusuario@cweb.com'),
(16, 'Martin', 'Estudiante', '3052659784', 'mestudiante@cweb.com'),
(17, 'Rafael', 'Pereira', '3062589437', 'rpereira@cweb.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(2) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `phone_number`, `email`) VALUES
(1, 'Juan', 'Peluquero', '3025894671', 'jpeluquero@cweb.com'),
(2, 'Pedro', 'Peluquero', '3052589741', 'ppeluquero@cweb.com'),
(3, 'Adriana', 'Peluquera', '3052589741', 'apeluquera@cweb.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees_schedule`
--

CREATE TABLE `employees_schedule` (
  `id` int(5) NOT NULL,
  `employee_id` int(2) NOT NULL,
  `day_id` tinyint(1) NOT NULL,
  `from_hour` time NOT NULL,
  `to_hour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees_schedule`
--

INSERT INTO `employees_schedule` (`id`, `employee_id`, `day_id`, `from_hour`, `to_hour`) VALUES
(41, 1, 1, '09:00:00', '18:00:00'),
(42, 1, 2, '14:00:00', '22:00:00'),
(43, 1, 3, '09:00:00', '18:00:00'),
(44, 1, 4, '00:00:00', '20:00:00'),
(45, 1, 5, '09:00:00', '18:00:00'),
(46, 1, 6, '09:00:00', '18:00:00'),
(47, 1, 7, '09:00:00', '18:00:00'),
(55, 3, 1, '09:00:00', '18:00:00'),
(56, 3, 2, '09:00:00', '18:00:00'),
(57, 3, 3, '09:00:00', '18:00:00'),
(58, 3, 4, '09:00:00', '18:00:00'),
(59, 3, 5, '09:00:00', '18:00:00'),
(60, 3, 6, '09:00:00', '18:00:00'),
(61, 3, 7, '09:00:00', '17:00:00'),
(62, 2, 1, '09:00:00', '17:00:00'),
(63, 2, 2, '09:00:00', '18:00:00'),
(64, 2, 3, '09:00:00', '18:00:00'),
(65, 2, 4, '09:00:00', '18:00:00'),
(66, 2, 5, '09:00:00', '18:00:00'),
(67, 2, 6, '09:00:00', '18:00:00'),
(68, 2, 7, '09:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `service_id` int(5) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `service_description` varchar(255) NOT NULL,
  `service_price` decimal(6,2) NOT NULL,
  `service_duration` int(5) NOT NULL,
  `category_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_description`, `service_price`, `service_duration`, `category_id`) VALUES
(1, 'Corte de Cabello', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '21.00', 20, 6),
(2, 'Peinado', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '9.00', 15, 6),
(3, 'Recorte de cabello', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '10.00', 10, 6),
(4, 'Afeitado Limpio', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '20.00', 20, 2),
(5, 'Recorte de barba', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '20.00', 15, 2),
(6, 'Afeitado suave', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '15.00', 20, 2),
(7, 'Facial blanca', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '16.00', 15, 3),
(8, 'Limpieza de Rostro', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '20.00', 20, 3),
(9, 'Afinación brillante', 'El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.', '14.00', 20, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services_booked`
--

CREATE TABLE `services_booked` (
  `appointment_id` int(5) NOT NULL,
  `service_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `services_booked`
--

INSERT INTO `services_booked` (`appointment_id`, `service_id`) VALUES
(10, 9),
(11, 9),
(12, 3),
(13, 1),
(14, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_categories`
--

CREATE TABLE `service_categories` (
  `category_id` int(2) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `service_categories`
--

INSERT INTO `service_categories` (`category_id`, `category_name`) VALUES
(2, 'Afeitado'),
(3, 'Mascarilla facial'),
(4, 'Uncategorized'),
(6, 'Corte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `FK_client_appointment` (`client_id`),
  ADD KEY `FK_employee_appointment` (`employee_id`);

--
-- Indices de la tabla `barber_admin`
--
ALTER TABLE `barber_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_email` (`client_email`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indices de la tabla `employees_schedule`
--
ALTER TABLE `employees_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_emp` (`employee_id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `FK_service_category` (`category_id`);

--
-- Indices de la tabla `services_booked`
--
ALTER TABLE `services_booked`
  ADD PRIMARY KEY (`appointment_id`,`service_id`),
  ADD KEY `FK_SB_service` (`service_id`);

--
-- Indices de la tabla `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `barber_admin`
--
ALTER TABLE `barber_admin`
  MODIFY `admin_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `employees_schedule`
--
ALTER TABLE `employees_schedule`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `category_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FK_client_appointment` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_employee_appointment` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `employees_schedule`
--
ALTER TABLE `employees_schedule`
  ADD CONSTRAINT `FK_emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `FK_service_category` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`category_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `services_booked`
--
ALTER TABLE `services_booked`
  ADD CONSTRAINT `FK_SB_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_SB_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
