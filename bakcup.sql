/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - laravel-boilerplate-api
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel-boilerplate-api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `laravel-boilerplate-api`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `comments` */

insert  into `comments`(`id`,`created_at`,`updated_at`,`name`,`text`) values 
(1,'2024-01-27 10:39:36','2024-01-27 10:39:36','Prof. Alvah Thompson I','Eius nihil laboriosam repellendus enim nam. Totam explicabo laudantium repudiandae quo. Et quia blanditiis quidem labore facilis nam.'),
(2,'2024-01-27 10:39:36','2024-01-27 10:39:36','Reynold Schumm','Vero velit debitis harum quo dolores in. Neque voluptas ea sed accusamus. Aliquid incidunt praesentium aut est.'),
(3,'2024-01-27 10:39:36','2024-01-27 10:39:36','Naomi Kemmer','Veniam veniam et vero dicta numquam qui. Aut ea deserunt quisquam sed. Temporibus vero quasi impedit nobis. Illo repudiandae quia et officia nihil excepturi rem. Ut eum nihil dolores atque et nobis.');

/*Table structure for table `configurations` */

DROP TABLE IF EXISTS `configurations`;

CREATE TABLE `configurations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editable` tinyint NOT NULL DEFAULT '1',
  `weight` int DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `configurations` */

insert  into `configurations`(`id`,`name`,`value`,`title`,`description`,`input_type`,`editable`,`weight`,`params`,`order`,`type`) values 
(1,'title','W3CMS Laravel',NULL,NULL,'text',1,1,NULL,0,'site'),
(2,'tagline','W3CMS Laravel System',NULL,NULL,'textarea',1,2,NULL,3,'site'),
(3,'email','ali_naeem89@live.com',NULL,NULL,'text',1,3,NULL,2,'site'),
(4,'status','1',NULL,NULL,'checkbox',1,4,NULL,4,'site'),
(5,'copyright','Crafted with <span class=\"heart\"></span> by <a href=\"https://www.w3itexperts.com/\\\" target=\\\"_blank\\\">W3ITEXPERTS</a>','Copyright Text',NULL,'text',1,5,NULL,5,'site'),
(6,'footer_text','Developed by <a href=\"https://www.w3itexperts.com/\\\" target=\\\"_blank\\\">W3itexperts</a>','Footer text',NULL,'textarea',1,6,NULL,6,'site'),
(7,'coming_soon','0',NULL,NULL,'checkbox',1,7,NULL,7,'site'),
(8,'contact','1234567890',NULL,NULL,'text',1,8,NULL,8,'site'),
(9,'logo','1673435349.logo-full-black.png','Logo','Site Logo','file',1,9,NULL,9,'site'),
(10,'favicon','1673435350.favicon.png','Site Favicon','Site Favicon','file',1,10,NULL,10,'site'),
(11,'maintenance_message','PLEASE SORRY FOR THE <span class=\"text-primary\">DISTURBANCES</span>','Maintenance Message','Site down for maintenance Message will show on maintenance page','textarea',1,11,NULL,13,'site'),
(12,'comingsoon_message','We Are Coming Soon !','Coming Soon Message','Coming soon message will show on coming soon page','textarea',1,12,NULL,11,'site'),
(13,'text_logo','1673435350.logo-text.png','Text Logo',NULL,'file',1,13,NULL,12,'site'),
(17,'instagram','https://www.instagram.com/','Instagram Url',NULL,'text',1,17,NULL,17,'social'),
(18,'linkedin','https://www.in.linkedin.com/','Whatsapp Url',NULL,'text',1,17,NULL,17,'social'),
(19,'facebook','http://www.facebook.com','Facebook Url',NULL,'text',1,18,NULL,18,'social'),
(20,'twitter','http://www.twitter.com','Twitter Url',NULL,'text',1,19,NULL,19,'social'),
(21,'menu_location','a:5:{s:7:\"primary\";a:2:{s:5:\"title\";s:23:\"Desktop Horizontal Menu\";s:4:\"menu\";s:1:\"1\";}s:8:\"expanded\";a:2:{s:5:\"title\";s:21:\"Desktop Expanded Menu\";s:4:\"menu\";s:1:\"3\";}s:6:\"mobile\";a:2:{s:5:\"title\";s:11:\"Mobile Menu\";s:4:\"menu\";N;}s:6:\"footer\";a:2:{s:5:\"title\";s:11:\"Footer Menu\";s:4:\"menu\";s:1:\"2\";}s:6:\"social\";a:2:{s:5:\"title\";s:11:\"Social Menu\";s:4:\"menu\";s:0:\"\";}}',NULL,NULL,'text',0,20,NULL,20,'site'),
(24,'registeration_email','1',NULL,NULL,'textarea',1,NULL,'1',0,'email'),
(25,'password_reset_email','1',NULL,NULL,'textarea',1,NULL,'1',0,'email'),
(26,'login_notification_email','1',NULL,'','textarea',1,NULL,'1',0,'email'),
(30,'comingsoon_date','2023-02-27',NULL,'','date',1,NULL,'',0,'site'),
(31,'biography','A Wonderful Serenity Has Taken Possession Of My Entire Soul, Like These.',NULL,'','text',1,NULL,'',0,'site'),
(32,'location','832  Thompson Drive, San Fransisco CA 94107, United States',NULL,'','text',1,NULL,'',0,'site'),
(33,'office_time','Time 09:00 AM To 07:00 PM',NULL,'Ex. : \"Time 06:00 AM To 08:00 PM\'','text',1,NULL,'',0,'site'),
(34,'icon_logo','1673520377.image_2023_01_02T08_30_32_811Z.png',NULL,'','file',1,NULL,'',0,'site');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2024_01_27_103637_create_comments_table',1),
(6,'2024_01_27_180805_create_permission_tables',2),
(9,'2024_02_21_061709_create_configurations_table',4),
(11,'2024_02_29_212502_add_col_type_to_configurations_table',5),
(13,'2024_02_29_202445_create_pages_table',6),
(14,'2024_03_13_162507_add_cols_to_permissions_table',7),
(15,'2024_03_13_164227_add_cols_deny_to_model_has_permissions_table',8);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `deny` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(16,'App\\Models\\User',12),
(17,'App\\Models\\User',18),
(20,'App\\Models\\User',21),
(20,'App\\Models\\User',33);

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `auther` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

insert  into `pages`(`id`,`title`,`description`,`banner`,`auther`,`created_at`,`updated_at`) values 
(1,'Test page','Page Description','public/images/xCj2IcZGJs2r735su1eHBq6l7EbWtdbkXayHimKP.png','Ali Baig','2024-03-02 08:37:50','2024-03-02 08:37:50');

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `temp_permission_id` bigint unsigned DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `type` enum('pre-define','user-define') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user-define',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`,`temp_permission_id`,`action`,`type`) values 
(665,'users-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@index','user-define'),
(666,'users-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@show','user-define'),
(667,'users-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@create','user-define'),
(668,'users-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@store','user-define'),
(669,'users-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@edit','user-define'),
(670,'users-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@update','user-define'),
(671,'users-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@destroy','user-define'),
(672,'users-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/UserController@search','user-define'),
(673,'roles-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@index','user-define'),
(674,'roles-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@show','user-define'),
(675,'roles-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@create','user-define'),
(676,'roles-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@store','user-define'),
(677,'roles-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@edit','user-define'),
(678,'roles-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@update','user-define'),
(679,'roles-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@destroy','user-define'),
(680,'roles-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/RoleController@search','user-define'),
(681,'permissions-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@index','user-define'),
(682,'permissions-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@show','user-define'),
(683,'permissions-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@create','user-define'),
(684,'permissions-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@store','user-define'),
(685,'permissions-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@edit','user-define'),
(686,'permissions-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@update','user-define'),
(687,'permissions-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@destroy','user-define'),
(688,'permissions-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PermissionController@search','user-define'),
(689,'configurations-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@index','user-define'),
(690,'configurations-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@show','user-define'),
(691,'configurations-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@create','user-define'),
(692,'configurations-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@store','user-define'),
(693,'configurations-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@edit','user-define'),
(694,'configurations-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@update','user-define'),
(695,'configurations-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@destroy','user-define'),
(696,'configurations-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/ConfigurationController@search','user-define'),
(697,'comments-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@index','user-define'),
(698,'comments-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@show','user-define'),
(699,'comments-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@create','user-define'),
(700,'comments-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@store','user-define'),
(701,'comments-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@edit','user-define'),
(702,'comments-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@update','user-define'),
(703,'comments-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@destroy','user-define'),
(704,'comments-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/CommentController@search','user-define'),
(705,'pages-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@index','user-define'),
(706,'pages-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@show','user-define'),
(707,'pages-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@create','user-define'),
(708,'pages-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@store','user-define'),
(709,'pages-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@edit','user-define'),
(710,'pages-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@update','user-define'),
(711,'pages-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@destroy','user-define'),
(712,'pages-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/PageController@search','user-define'),
(713,'auth-index','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@index','user-define'),
(714,'auth-show','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@show','user-define'),
(715,'auth-create','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@create','user-define'),
(716,'auth-store','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@store','user-define'),
(717,'auth-edit','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@edit','user-define'),
(718,'auth-update','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@update','user-define'),
(719,'auth-destroy','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@destroy','user-define'),
(720,'auth-search','sanctum','2024-03-19 06:59:28','2024-03-19 06:59:28',NULL,'Controllers/AuthController@search','user-define'),
(721,'auth-association','sanctum',NULL,NULL,NULL,'Controllers/AuthController@association','user-define'),
(722,'auth-logout','sanctum',NULL,NULL,NULL,'Controllers/AuthController@logout','user-define');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values 
(80,'App\\Models\\User',18,'Login Token','eefe0ddbf7db8dc46cb2aa3969b186b35eec251294d86394ecc3f21920be5ee7','[\"*\"]','2024-03-19 07:08:50',NULL,'2024-03-19 07:08:21','2024-03-19 07:08:50');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values 
(665,17),
(666,17),
(667,17),
(668,17),
(669,17),
(670,17),
(671,17),
(672,17),
(673,17),
(674,17),
(675,17),
(676,17),
(677,17),
(678,17),
(679,17),
(680,17),
(681,17),
(682,17),
(683,17),
(684,17),
(685,17),
(686,17),
(687,17),
(688,17),
(689,17),
(690,17),
(691,17),
(692,17),
(693,17),
(694,17),
(695,17),
(696,17),
(697,17),
(698,17),
(699,17),
(700,17),
(701,17),
(702,17),
(703,17),
(704,17),
(705,17),
(706,17),
(707,17),
(708,17),
(709,17),
(710,17),
(711,17),
(712,17),
(713,17),
(714,17),
(715,17),
(716,17),
(717,17),
(718,17),
(719,17),
(720,17),
(721,17),
(722,17);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(16,'Super Admin','sanctum','2024-01-27 21:34:52','2024-01-27 21:34:52'),
(17,'Admin','sanctum','2024-01-28 07:04:51','2024-01-28 07:04:51'),
(20,'Manager','sanctum','2024-02-22 21:38:08','2024-02-22 21:38:08'),
(21,'Branch Manager','sanctum','2024-02-25 20:50:53','2024-02-25 20:50:53'),
(26,'Test Test','sanctum','2024-03-03 19:48:49','2024-03-03 19:48:49'),
(27,'New Test','web','2024-03-19 05:33:33','2024-03-19 05:33:33'),
(28,'New Test 1','sanctum','2024-03-19 05:34:06','2024-03-19 05:34:06');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(12,'Ali Baig','ali_naeem89@live.com',NULL,'$2y$12$eOO0nSUZ/9Q7R63Rn5Ofhu7vdpiFjviPnf8wpGKR3tKeT4l0XkUea',NULL,'2024-01-28 06:38:57','2024-01-28 06:38:57'),
(18,'Wajid Asim','wajid@gmail.com',NULL,'$2y$12$wPa4cUz2AWQ7fp2ScQGpOOSTzzmY3mjvOyxoR7kV3tiI5qLAzemze',NULL,'2024-02-22 16:09:34','2024-02-22 16:09:34'),
(21,'Manager Sahab','manager@live.com',NULL,'$2y$12$rsXHy66tL2Towv5nC7hprOC9ut8Yugxs56fsLhof1CCXn1OP8fawm',NULL,'2024-03-06 04:39:51','2024-03-06 04:39:51'),
(22,'Test one','test1@live.com',NULL,'$2y$12$hvYwEjSx3DrHpkIOVd2xVOYY4/q3uMcLXeF12e8BSD8E4DmqITy96',NULL,'2024-03-16 07:39:22','2024-03-16 07:39:22'),
(23,'Test three','test3@live.com',NULL,'$2y$12$NClsNYqa/N.BtqNRSlnapOZxGNWcfmU4NxsuuNYqdAHiBm03Pt3qy',NULL,'2024-03-16 07:46:39','2024-03-16 07:46:39'),
(24,'Test three','test4@live.com',NULL,'$2y$12$xy0sU/6c3lAFBHCMk72ckOyfdbxV/r/X9DFFX3kc2xVVcE5WIzrYS',NULL,'2024-03-16 09:52:57','2024-03-16 09:52:57'),
(25,'Test three','test5@live.com',NULL,'$2y$12$pBKzi5B7YzDMimbDlhcJdevnAYmH46UyBSXzwg7xAKmplryJgVX7a',NULL,'2024-03-16 09:53:17','2024-03-16 09:53:17'),
(26,'Test three','test6@live.com',NULL,'$2y$12$QgCWth8.gQM7z1qFVvfYt.ugdcu07t6/mOD34eMQbjVbj1zqsCWpa',NULL,'2024-03-16 09:54:33','2024-03-16 09:54:33'),
(27,'Test three','test7@live.com',NULL,'$2y$12$vpaifaZP.bj5IHuF/6Ov2.LAXaRELJl0pjlv7VTFEJmFaJdBd7FnO',NULL,'2024-03-16 09:55:37','2024-03-16 09:55:37'),
(28,'Test three','test8@live.com',NULL,'$2y$12$A6SMSZnE8t6w3zA8wN6ojejzK8wUgUsBpWc10rcYuTBRrCATkOMgu',NULL,'2024-03-16 09:56:01','2024-03-16 09:56:01'),
(29,'Test three','test9@live.com',NULL,'$2y$12$EkkV7gyyT8KfzrwWMKPG1uaitr3THzVbauED4E4jFHiuFrshYDwY6',NULL,'2024-03-16 09:59:24','2024-03-16 09:59:24'),
(30,'Test three','test10@live.com',NULL,'$2y$12$Gq9RQ2sOObaWRWsQNmrLtumTXPJQ09zB1OLsqoM28Js3sQrJdRr2q',NULL,'2024-03-17 05:23:53','2024-03-17 05:23:53'),
(31,'Test three','test11@live.com',NULL,'$2y$12$QRqQSbPDGFnT4vcwApXZO.CjgVV5oMEcY1qDQk6Bew6WNHOUJmXZW',NULL,'2024-03-17 05:27:26','2024-03-17 05:27:26'),
(33,'Test three','test12@live.com',NULL,'$2y$12$u7SgIeF4vDPg5LvFErkVXOyyOc7m9QYxc9f.6m7PEK2merF5MjGVC',NULL,'2024-03-17 05:28:35','2024-03-17 05:28:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
