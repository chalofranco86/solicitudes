-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         11.3.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sistema_solicitudes
CREATE DATABASE IF NOT EXISTS `sistema_solicitudes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sistema_solicitudes`;

-- Volcando estructura para tabla sistema_solicitudes.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_group: ~0 rows (aproximadamente)
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(1, 'Supervisores');

-- Volcando estructura para tabla sistema_solicitudes.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_group_permissions: ~2 rows (aproximadamente)
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(1, 1, 27),
	(2, 1, 28);

-- Volcando estructura para tabla sistema_solicitudes.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_permission: ~28 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add solicitud', 7, 'add_solicitud'),
	(26, 'Can change solicitud', 7, 'change_solicitud'),
	(27, 'Can delete solicitud', 7, 'delete_solicitud'),
	(28, 'Can view solicitud', 7, 'view_solicitud');

-- Volcando estructura para tabla sistema_solicitudes.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_user: ~2 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$600000$HACSVemKQe2naHTa9KbZX6$zuKcy9PT0KE9bLUQiH7oX3hDuu8Q+SxuAS6Jkk4EtfY=', '2025-02-27 22:04:42.312048', 1, 'admin', '', '', 'admin@mail.com', 1, 1, '2025-02-26 15:32:56.248520'),
	(2, 'pbkdf2_sha256$600000$4r8xN3WrYLww9A0RK4o4ip$ye/si9YXpVGg4KUaHE5GF+lOzPHvvnmmiWjBlhB4XbU=', '2025-03-03 14:39:43.519333', 0, 'supervisor', 'Gonzalo Emanuel', 'Franco de León', 'gfrancod@miumg.edu.gt', 1, 1, '2025-02-26 16:25:16.000000');

-- Volcando estructura para tabla sistema_solicitudes.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_user_groups: ~0 rows (aproximadamente)
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 2, 1);

-- Volcando estructura para tabla sistema_solicitudes.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.auth_user_user_permissions: ~0 rows (aproximadamente)
INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
	(1, 2, 28);

-- Volcando estructura para tabla sistema_solicitudes.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.django_admin_log: ~6 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-02-26 15:34:24.886882', '1', 'Supervisores', 1, '[{"added": {}}]', 3, 1),
	(2, '2025-02-26 15:37:20.355243', '1', 'Supervisores', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1),
	(3, '2025-02-26 16:25:16.510661', '2', 'supervisor', 1, '[{"added": {}}]', 4, 1),
	(4, '2025-02-26 16:26:45.351989', '2', 'supervisor', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]', 4, 1),
	(5, '2025-02-27 22:12:59.377870', '2', 'supervisor', 2, '[{"changed": {"fields": ["Staff status", "User permissions"]}}]', 4, 1),
	(6, '2025-02-27 22:14:08.062635', '2', 'supervisor', 2, '[]', 4, 1);

-- Volcando estructura para tabla sistema_solicitudes.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.django_content_type: ~7 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'solicitudes', 'solicitud');

-- Volcando estructura para tabla sistema_solicitudes.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.django_migrations: ~18 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-02-18 22:32:15.921577'),
	(2, 'auth', '0001_initial', '2025-02-18 22:32:16.083964'),
	(3, 'admin', '0001_initial', '2025-02-18 22:32:16.120560'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-18 22:32:16.123990'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-18 22:32:16.126990'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-18 22:32:16.151557'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-18 22:32:16.167563'),
	(8, 'auth', '0003_alter_user_email_max_length', '2025-02-18 22:32:16.177721'),
	(9, 'auth', '0004_alter_user_username_opts', '2025-02-18 22:32:16.184713'),
	(10, 'auth', '0005_alter_user_last_login_null', '2025-02-18 22:32:16.207083'),
	(11, 'auth', '0006_require_contenttypes_0002', '2025-02-18 22:32:16.210116'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-18 22:32:16.217119'),
	(13, 'auth', '0008_alter_user_username_max_length', '2025-02-18 22:32:16.234813'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-18 22:32:16.248851'),
	(15, 'auth', '0010_alter_group_name_max_length', '2025-02-18 22:32:16.269593'),
	(16, 'auth', '0011_update_proxy_permissions', '2025-02-18 22:32:16.274161'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-18 22:32:16.303779'),
	(18, 'sessions', '0001_initial', '2025-02-18 22:32:16.336965'),
	(23, 'solicitudes', '0001_initial', '2025-02-24 17:14:01.123923'),
	(24, 'solicitudes', '0002_alter_solicitud_cuenta_con_internet', '2025-02-24 20:59:05.011875');

-- Volcando estructura para tabla sistema_solicitudes.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.django_session: ~3 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('6kikr3nygwifstyua9k3ygbn1n5a41xu', '.eJxVjEEOwiAQRe_C2pCBsS3j0r1nIAMDUjU0Ke3KeHfbpAvd_vfefyvP61L82tLsR1EXZdTpdwscn6nuQB5c75OOU13mMehd0Qdt-jZJel0P9--gcCtbjYIddhTBDgAENDASOuv6QDabjAJoGaIkF5DODiVmpt64tInZUFSfL62fNxs:1tnJPX:9_lblKp9nCT_ggMMY4wZus17Eh3mZHaZhQz5uE6cEqM', '2025-03-12 15:33:23.385906'),
	('dyv35lf9u53qi3ipbd7cs20c6mkgqeoe', '.eJxVjMsOwiAQRf-FtSEMMEBduvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMJDv9bjGkB7Ud5Htot85Tb-syR74r_KCDX3um5-Vw_w5qGPVbA0bIkwiQii0ZpCMnXEFLAqVNUCJOyiVXnDagAhYypCWA0WCkQAXs_QHYuTbh:1tp6xL:Q4-FyxjKX8pv781nada3Q7scv3oyNM0kBZyqukaH0_M', '2025-03-17 14:39:43.521331'),
	('glrb4lfrobv9xqk4q3iq1qjvwuhcs60e', '.eJxVjMsOwiAQRf-FtSEMMEBduvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMJDv9bjGkB7Ud5Htot85Tb-syR74r_KCDX3um5-Vw_w5qGPVbA0bIkwiQii0ZpCMnXEFLAqVNUCJOyiVXnDagAhYypCWA0WCkQAXs_QHYuTbh:1to3KO:HS3gAdw9nxHWdCbuz5idQKPF46OEhajOzfUQEFNXyrE', '2025-03-14 16:35:08.241467');

-- Volcando estructura para tabla sistema_solicitudes.solicitudes_solicitud
CREATE TABLE IF NOT EXISTS `solicitudes_solicitud` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `proyecto` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `dependencia_solicita` varchar(100) NOT NULL,
  `nombre_proyecto` varchar(100) NOT NULL,
  `responsable_dependencia` varchar(100) NOT NULL,
  `observaciones` longtext DEFAULT NULL,
  `equipo` longtext DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `uuid` char(32) NOT NULL,
  `cuenta_con_internet` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_solicitudes.solicitudes_solicitud: ~12 rows (aproximadamente)
INSERT INTO `solicitudes_solicitud` (`id`, `nombre`, `proyecto`, `fecha`, `dependencia_solicita`, `nombre_proyecto`, `responsable_dependencia`, `observaciones`, `equipo`, `pdf`, `uuid`, `cuenta_con_internet`) VALUES
	(1, 'Luis Cruz', 'AAAAAAA...........', '2025-02-24 17:15:58.290142', 'Catastro', 'Control de solicitudes', 'Sosa', 'Ninguna', 'Laptop', 'solicitudes_pdf/solicitud_1.pdf', 'fab67895473b4f9fb901b77f75cc892c', 'SI'),
	(2, 'Luis Cruz', 'AAAAAAA...........', '2025-02-24 20:19:03.900578', 'Catastro', 'Control de solicitudes', 'Sosa', 'Ninguna', 'Laptop', 'solicitudes_pdf/solicitud_2.pdf', '7394a57d14e340de831ad42270d16057', 'SI'),
	(3, 'Luis Cruz As', 'AAAAAAA.............', '2025-02-24 20:19:30.331274', 'Catastro', 'Control de solicitudes', 'Sosa', 'Ninguna.', 'Laptop y', 'solicitudes_pdf/solicitud_3.pdf', '2b66cda1f83b43669cdfe8c58d243a89', 'SI'),
	(4, 'Luis Cruz As', 'AAAAAAA.............', '2025-02-24 20:20:18.853420', 'Catastro', 'Control de solicitudes', 'Sosa', 'Ninguna.', 'Laptop y', 'solicitudes_pdf/solicitud_4.pdf', 'a988aafd6cee48cb8db3455d5c00f077', 'SI'),
	(5, 'Andrés Puac', 'Este sistema es para ....', '2025-02-24 20:25:06.642529', 'Catastro', 'Control de solicitudes folio y c', 'Sosa', 'Ninguna xd', 'Computadora', 'solicitudes_pdf/solicitud_5.pdf', 'bba0db90f0bf4f7c9bbab694fde56ed3', 'SI'),
	(6, 'Marcos Lilo', 'AAAABBBBCCCC....', '2025-02-24 20:44:34.144564', 'Contabilidad', 'ISR control', 'Sosa', 'No', 'Impresora', 'solicitudes_pdf/solicitud_6.pdf', '0037a214020740e3ad71430541be4fb9', '0'),
	(7, 'Ibai', 'Control de sesiones', '2025-02-24 21:00:32.027548', 'Gerencia', 'ISR control 2', 'Cristian', 'No', 'TAblet', 'solicitudes_pdf/solicitud_7.pdf', '2681a752547d42a1ba4cd633f02897b4', 'NO'),
	(8, 'Canecro', 'Se necesita un sistema en donde ....', '2025-02-24 21:07:04.526796', 'Limpieza', 'Sistema para control de limpieza', 'Cristian', 'A', 'Computadora', 'solicitudes_pdf/solicitud_8.pdf', 'b7416ab0f8504b35ad85284365c6bafb', 'SI'),
	(9, 'Arturo Perez', 'En este sistema se desea almacenar la información relacionada a los pilotos', '2025-02-24 21:49:03.606044', 'Transporte', 'Sistema control de pilotos', 'José', 'se almacenaran fotografías y documentos personales', 'Computadora', 'solicitudes_pdf/solicitud_9.pdf', '679c534d82b04d04bc9fab9c84f4153b', 'SI'),
	(10, 'Cristian Gonzalez', 'lllll', '2025-02-25 15:30:37.283958', 'Catastro', 'Ejemplo', 'Sosa', 'llll', 'llllll', 'solicitudes_pdf/solicitud_10.pdf', '84ec797645f84348b31433c6f6923b1d', 'SI'),
	(11, 'Gonzalo Franco D', 'qqqq', '2025-02-25 16:39:55.584604', 'Informática', 'Control de solicitudes', 'Cristian', 'qqq', 'A', 'solicitudes_pdf/solicitud_11.pdf', 'de729c2fea794086981815efb16853e0', 'SI'),
	(12, 'Luis Cruz', 'AAA', '2025-02-25 16:42:39.001034', 'Informática', 'Ejemplo', 'Cristian', 'AAQ', 'Q', 'solicitudes_pdf/solicitud_12.pdf', '7fd38b82013843c09de95d5872e2e27e', 'NO'),
	(13, 'Gonzalo Franco de León', 'Con este sistema se busca poder almacenar cada uno de los formularios que presentan los contribuyentes en el área de contabilidad solicitando un convenio de pago referente a su cobro de energía eléctrica.', '2025-02-25 23:10:02.948638', 'Contabilidad', 'Sistema para ingreso de formularios', 'Juan Perez', 'El sistema será únicamente de uso interno.', 'Computadora de escritorio.', 'solicitudes_pdf/solicitud_13.pdf', '69c5d344401f4a2fa1f691ef59b929e1', 'SI');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
