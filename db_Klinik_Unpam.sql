-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk db_klinik
CREATE DATABASE IF NOT EXISTS `db_klinik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_klinik`;

-- membuang struktur untuk table db_klinik.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.cache: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.cache_locks: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.job_batches: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.medicines
CREATE TABLE IF NOT EXISTS `medicines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strength` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int unsigned NOT NULL DEFAULT '100',
  `unit_price` decimal(12,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medicines_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.medicines: ~17 rows (lebih kurang)
INSERT INTO `medicines` (`id`, `name`, `form`, `strength`, `unit`, `stock`, `unit_price`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Paracetamol', 'Tablet', '500 mg', 'tablet', 99, 3000.00, 1, '2026-10-11 02:18:20', '2026-10-12 01:02:30'),
	(2, 'Paracetamol Sirup', 'Sirup', '120 mg/5 mL', 'botol', 100, 18000.00, 1, '2026-10-11 02:18:20', '2026-10-11 02:18:20'),
	(3, 'Amoxicillin', 'Kapsul', '500 mg', 'kapsul', 100, 4500.00, 1, '2026-10-11 02:18:20', '2026-10-11 02:18:20'),
	(4, 'Oralit', 'Serbuk sachet', '200 mL', 'sachet', 99, 2500.00, 1, '2026-10-11 02:18:20', '2026-10-12 01:26:37'),
	(5, 'Vitamin C', 'Tablet', '500 mg', 'tablet', 98, 2000.00, 1, '2026-10-11 02:18:20', '2026-10-12 01:02:30'),
	(6, 'Cetirizine', 'Tablet', '10 mg', 'tablet', 100, 3500.00, 1, '2026-10-11 02:18:20', '2026-10-11 02:18:20'),
	(7, 'Ambroxol Sirup', 'Sirup', '15 mg/5 mL', 'botol', 2, 16000.00, 1, '2026-10-11 02:18:20', '2026-10-11 02:18:20'),
	(8, 'Ibuprofen', 'Tablet', '200 mg', 'tablet', 50, 1500.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(9, 'Antasida', 'Tablet kunyah', 'Sesuai label kemasan', 'tablet', 60, 1000.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(10, 'CTM', 'Tablet', '4 mg', 'tablet', 50, 500.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(11, 'Salbutamol', 'Tablet', '2 mg', 'tablet', 30, 1000.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(12, 'Zinc', 'Tablet dispersibel', '20 mg', 'tablet', 40, 1500.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(13, 'Amlodipine', 'Tablet', '5 mg', 'tablet', 50, 1500.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(14, 'Omeprazole', 'Kapsul', '20 mg', 'kapsul', 49, 2000.00, 1, '2026-10-12 00:56:58', '2026-10-12 01:02:30'),
	(15, 'Metformin', 'Tablet', '500 mg', 'tablet', 49, 1000.00, 1, '2026-10-12 00:56:58', '2026-10-12 01:02:30'),
	(16, 'Dextromethorphan', 'Tablet', '15 mg', 'tablet', 50, 1000.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58'),
	(17, 'Asam Mefenamat', 'Tablet', '500 mg', 'tablet', 50, 1500.00, 1, '2026-10-12 00:56:58', '2026-10-12 00:56:58');

-- membuang struktur untuk table db_klinik.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.migrations: ~15 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_10_08_000001_add_role_and_phone_to_users_table', 1),
	(5, '2026_10_11_082446_add_staff_number_to_users_table', 1),
	(6, '2026_10_11_084727_create_visits_table', 2),
	(7, '2026_10_11_084728_create_prescriptions_table', 2),
	(8, '2026_10_11_090956_create_medicines_table', 3),
	(9, '2026_10_11_090957_create_prescription_items_table', 3),
	(10, '2026_10_11_090958_create_payments_table', 3),
	(11, '2026_10_11_093413_add_queue_sequence_to_visits_table', 4),
	(12, '2026_10_11_094423_make_visit_queue_numbers_unique_per_clinic_and_date', 5),
	(13, '2026_10_12_072507_add_patient_details_to_users_table', 6),
	(14, '2026_10_11_102422_add_called_at_to_visits_table', 7),
	(15, '2026_10_12_081636_add_medical_history_to_users_table', 8);

-- membuang struktur untuk table db_klinik.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_klinik.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint unsigned NOT NULL,
  `processed_by` bigint unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum_bayar',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_visit_id_unique` (`visit_id`),
  KEY `payments_processed_by_foreign` (`processed_by`),
  CONSTRAINT `payments_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.payments: ~3 rows (lebih kurang)
INSERT INTO `payments` (`id`, `visit_id`, `processed_by`, `amount`, `status`, `method`, `paid_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 2000.00, 'dibayar', 'tunai', '2026-10-12 01:01:50', '2026-10-12 01:01:42', '2026-10-12 01:01:50'),
	(2, 7, 3, 8000.00, 'dibayar', 'tunai', '2026-10-12 01:03:04', '2026-10-12 01:02:40', '2026-10-12 01:03:04'),
	(3, 8, 3, 2500.00, 'dibayar', 'tunai', '2026-10-12 01:26:48', '2026-10-12 01:26:42', '2026-10-12 01:26:48');

-- membuang struktur untuk table db_klinik.prescriptions
CREATE TABLE IF NOT EXISTS `prescriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint unsigned NOT NULL,
  `doctor_id` bigint unsigned NOT NULL,
  `medicine` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prescriptions_visit_id_unique` (`visit_id`),
  KEY `prescriptions_doctor_id_foreign` (`doctor_id`),
  KEY `prescriptions_status_created_at_index` (`status`,`created_at`),
  CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `prescriptions_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.prescriptions: ~4 rows (lebih kurang)
INSERT INTO `prescriptions` (`id`, `visit_id`, `doctor_id`, `medicine`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'Resep terstruktur', NULL, 'diserahkan', '2026-10-11 02:28:02', '2026-10-12 01:01:56'),
	(2, 6, 2, 'Resep terstruktur', NULL, 'menunggu', '2026-10-12 00:45:11', '2026-10-12 00:45:11'),
	(3, 7, 2, 'Resep terstruktur', NULL, 'diserahkan', '2026-10-12 00:59:53', '2026-10-12 01:03:15'),
	(4, 8, 2, 'Resep terstruktur', NULL, 'diserahkan', '2026-10-12 01:25:22', '2026-10-12 01:26:55');

-- membuang struktur untuk table db_klinik.prescription_items
CREATE TABLE IF NOT EXISTS `prescription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prescription_id` bigint unsigned NOT NULL,
  `medicine_id` bigint unsigned NOT NULL,
  `quantity` smallint unsigned NOT NULL,
  `dosage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prescription_items_medicine_id_foreign` (`medicine_id`),
  KEY `prescription_items_prescription_id_medicine_id_index` (`prescription_id`,`medicine_id`),
  CONSTRAINT `prescription_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `prescription_items_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.prescription_items: ~6 rows (lebih kurang)
INSERT INTO `prescription_items` (`id`, `prescription_id`, `medicine_id`, `quantity`, `dosage`, `unit_price`, `created_at`, `updated_at`) VALUES
	(1, 1, 5, 1, '1x sehari', 2000.00, '2026-10-11 02:28:02', '2026-10-11 02:28:02'),
	(2, 2, 3, 1, '1x sehari', 4500.00, '2026-10-12 00:45:11', '2026-10-12 00:45:11'),
	(3, 3, 14, 1, ',', 2000.00, '2026-10-12 00:59:53', '2026-10-12 00:59:53'),
	(4, 3, 15, 1, '.', 1000.00, '2026-10-12 00:59:53', '2026-10-12 00:59:53'),
	(5, 3, 5, 1, '.', 2000.00, '2026-10-12 00:59:53', '2026-10-12 00:59:53'),
	(6, 3, 1, 1, '.', 3000.00, '2026-10-12 00:59:53', '2026-10-12 00:59:53'),
	(7, 4, 4, 1, '1x sehari', 2500.00, '2026-10-12 01:25:22', '2026-10-12 01:25:22');

-- membuang struktur untuk table db_klinik.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.sessions: ~4 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('4Y1nScsL8saA1GKIFJimxjHZanUPUkvpR3VOwe8K', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJFTFZ5UnZUMFdPZ3BROHlydzEzbGNXbnZFcW1mbzNjZE05c2Q3S0FzIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjozLCJwYXNzd29yZF9oYXNoX3dlYiI6IjIzM2RhODRjNzFkNWJmMzY3N2E5YmMwOTM4MDlmYzg5YjVlY2YwZjBiOTkyY2RiNzJjNDI4NzkyOWMyMDAzNGMifQ==', 1791866755),
	('Er1Cj8wkDBViSEzrjKQivYt2MFteeIrXrDjt0hW4', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJwcm5YVWlhdm1BVU1JZjIwTG1lQzhjZFhFcW0yUFNmNGpYYW0xM0NiIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjozLCJwYXNzd29yZF9oYXNoX3dlYiI6IjIzM2RhODRjNzFkNWJmMzY3N2E5YmMwOTM4MDlmYzg5YjVlY2YwZjBiOTkyY2RiNzJjNDI4NzkyOWMyMDAzNGMifQ==', 1791793661),
	('OdyZOAA8omBovpibC9a4UNC6Nv9kJTCNyoT1fT04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.141.0 Chrome/150.0.7871.250 Electron/43.7.7 Safari/537.36', 'eyJfdG9rZW4iOiJIUG1PTzZJd3Y3RmF4RGtkTWdZUjVhOTdVbUljTEtVWXhKOHRFaXk5IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1791789400),
	('PPe19AlkhJTbnXTt2yq8icnOX1A48karGBlY8wec', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.141.0 Chrome/150.0.7871.250 Electron/43.7.7 Safari/537.36', 'eyJfdG9rZW4iOiJMTHdrSFk2VnZNOTZhN25VeUJ5Y01PZ2g2VG1xWlhkRG5QVXBmVW00IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjozLCJwYXNzd29yZF9oYXNoX3dlYiI6IjIzM2RhODRjNzFkNWJmMzY3N2E5YmMwOTM4MDlmYzg5YjVlY2YwZjBiOTkyY2RiNzJjNDI4NzkyOWMyMDAzNGMifQ==', 1791793906);

-- membuang struktur untuk table db_klinik.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pasien',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `national_id` text COLLATE utf8mb4_unicode_ci,
  `national_id_hash` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_history` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_role_staff_number_unique` (`role`,`staff_number`),
  UNIQUE KEY `users_national_id_hash_unique` (`national_id_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.users: ~4 rows (lebih kurang)
INSERT INTO `users` (`id`, `name`, `email`, `role`, `phone`, `staff_number`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `national_id`, `national_id_hash`, `date_of_birth`, `gender`, `address`, `emergency_contact_name`, `emergency_contact_phone`, `blood_type`, `medical_history`) VALUES
	(1, 'Pasien Demo', 'pasien.demo@klinik-unpam.test', 'pasien', '081200000001', NULL, NULL, '$2y$12$W/HJbL309Y/VDesMVuTaN.Uq4xAje9ZWzRbLwxFNDC7.rJrLoAcKe', 'lnJNgXVdsh6BVGJY71Vs8581YROpJMYIukCCRlQP53R95yPubuUW29pkK9IK', '2026-10-11 01:40:15', '2026-10-11 01:40:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Dokter Demo', 'dokter.demo@klinik-unpam.test', 'dokter', '081200000002', 'DOK-DEMO-001', NULL, '$2y$12$UeZKCXzKelC0R.29jCus6uMGVqeZNG4Bjie5UqX3P8QB.TeF.Q15m', NULL, '2026-10-11 01:40:15', '2026-10-11 01:40:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Apoteker Demo', 'apoteker.demo@klinik-unpam.test', 'apoteker', '081200000003', 'APT-DEMO-001', NULL, '$2y$12$Jd1pJrSF9yZv.aFmddKt.OmUdbz4.UXLVh7k1ilczih3K6SAt0U9e', NULL, '2026-10-11 01:40:16', '2026-10-11 01:40:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Perawat Demo', 'perawat.demo@klinik-unpam.test', 'suster', '081200000004', 'SUS-DEMO-001', NULL, '$2y$12$HGZxLlrYd6IEab7sQXYNH.JgQn88urq0RQ4Jitubp4lj8JtjQfhY2', NULL, '2026-10-11 01:40:16', '2026-10-11 01:40:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- membuang struktur untuk table db_klinik.visits
CREATE TABLE IF NOT EXISTS `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint unsigned NOT NULL,
  `assigned_doctor_id` bigint unsigned DEFAULT NULL,
  `queue_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_sequence` int unsigned DEFAULT NULL,
  `queue_date` date DEFAULT NULL,
  `service` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu_verifikasi',
  `verified_at` timestamp NULL DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `consultation_started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visits_service_date_sequence_unique` (`service`,`queue_date`,`queue_sequence`),
  KEY `visits_patient_id_foreign` (`patient_id`),
  KEY `visits_assigned_doctor_id_foreign` (`assigned_doctor_id`),
  KEY `visits_status_created_at_index` (`status`,`created_at`),
  KEY `visits_service_queue_lookup_index` (`service`,`queue_date`,`queue_sequence`),
  CONSTRAINT `visits_assigned_doctor_id_foreign` FOREIGN KEY (`assigned_doctor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `visits_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_klinik.visits: ~8 rows (lebih kurang)
INSERT INTO `visits` (`id`, `patient_id`, `assigned_doctor_id`, `queue_number`, `queue_sequence`, `queue_date`, `service`, `complaint`, `status`, `verified_at`, `called_at`, `consultation_started_at`, `completed_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'A261011-00001', NULL, NULL, 'Poli Umum', 'asma.', 'selesai', '2026-10-11 02:23:08', NULL, '2026-10-11 02:27:38', '2026-10-11 02:30:37', '2026-10-11 02:22:11', '2026-10-11 02:30:37'),
	(2, 1, NULL, '1A', 1, '2026-10-11', 'Poli Umum', 'lambung', 'dibatalkan', '2026-10-11 02:43:12', NULL, NULL, NULL, '2026-10-11 02:41:22', '2026-10-11 03:02:03'),
	(3, 1, NULL, '1G', 1, '2026-10-11', 'Poli Gigi', 'bolong', 'dibatalkan', NULL, NULL, NULL, NULL, '2026-10-11 03:02:15', '2026-10-11 03:26:12'),
	(4, 1, NULL, '2A', 2, '2026-10-11', 'Poli Umum', 'lambung', 'dibatalkan', NULL, NULL, NULL, NULL, '2026-10-11 03:17:04', '2026-10-11 03:28:42'),
	(5, 1, NULL, '3A', 3, '2026-10-11', 'Poli Umum', 'asma.', 'dibatalkan', NULL, NULL, NULL, NULL, '2026-10-11 03:31:11', '2026-10-12 00:40:19'),
	(6, 1, 2, '1K', 1, '2026-10-12', 'Poli KIA', 'ngandung', 'selesai', NULL, '2026-10-12 00:44:20', '2026-10-12 00:44:26', '2026-10-12 00:45:24', '2026-10-12 00:40:32', '2026-10-12 00:45:24'),
	(7, 1, 2, '1G', 1, '2026-10-12', 'Poli Gigi', 'bolong', 'selesai', NULL, '2026-10-12 00:58:07', '2026-10-12 00:58:12', '2026-10-12 01:00:00', '2026-10-12 00:57:16', '2026-10-12 01:00:00'),
	(8, 1, 2, '2G', 2, '2026-10-12', 'Poli Gigi', 'karatan', 'selesai', NULL, '2026-10-12 01:24:18', '2026-10-12 01:24:22', '2026-10-12 01:25:25', '2026-10-12 01:10:39', '2026-10-12 01:25:25');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
