-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Agu 2023 pada 16.56
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcauseid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activity_name` varchar(255) NOT NULL,
  `activity_picture` varchar(255) NOT NULL,
  `activity_type` varchar(255) NOT NULL,
  `activity_kilometers` double(8,2) NOT NULL,
  `activity_hours` int(11) NOT NULL,
  `activity_minutes` int(11) NOT NULL,
  `activity_seconds` int(11) NOT NULL,
  `activity_datetime` datetime NOT NULL,
  `race_ids` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activities`
--

INSERT INTO `activities` (`id`, `activity_name`, `activity_picture`, `activity_type`, `activity_kilometers`, `activity_hours`, `activity_minutes`, `activity_seconds`, `activity_datetime`, `race_ids`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'testrace', 'C:\\Users\\ASUS\\Desktop\\tes-magang\\cause-id\\public/images/1691650307.png', 'testrace', 10.50, 3, 2, 1, '2023-08-10 08:48:35', '1', 1, '2023-08-09 23:51:48', '2023-08-09 23:51:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_08_07_164622_create_activities_table', 1),
(5, '2023_08_07_164708_create_races_table', 1),
(6, '2023_08_07_165115_create_race_registrations_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `races`
--

CREATE TABLE `races` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `race_name` varchar(255) NOT NULL,
  `race_picture` varchar(255) NOT NULL,
  `race_startdatetime` datetime NOT NULL,
  `race_enddatetime` datetime NOT NULL,
  `race_activitystartdatetime` datetime NOT NULL,
  `race_activityenddatetime` datetime NOT NULL,
  `race_description` text NOT NULL,
  `race_finishkilometer` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `races`
--

INSERT INTO `races` (`id`, `race_name`, `race_picture`, `race_startdatetime`, `race_enddatetime`, `race_activitystartdatetime`, `race_activityenddatetime`, `race_description`, `race_finishkilometer`, `created_at`, `updated_at`) VALUES
(1, 'race1', 'pic.jpg', '2023-08-09 08:37:52', '2023-08-09 08:37:52', '2023-08-09 08:37:52', '2023-08-09 08:37:52', 'racesatutest', 1000, NULL, NULL),
(2, 'test2', 'race.jpg', '2023-08-09 19:31:20', '2023-08-09 19:31:20', '2023-08-09 19:31:20', '2023-08-09 19:31:20', 'test', 9000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `race_registrations`
--

CREATE TABLE `race_registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `race_id` bigint(20) UNSIGNED NOT NULL,
  `registration_jerseysize` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `race_registrations`
--

INSERT INTO `race_registrations` (`id`, `user_id`, `race_id`, `registration_jerseysize`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'M', NULL, NULL),
(2, 1, 1, 'M', '2023-08-09 20:46:31', '2023-08-09 20:46:31'),
(4, 1, 1, 'M', '2023-08-10 06:37:32', '2023-08-10 06:37:32'),
(5, 1, 1, 'M', '2023-08-10 06:42:01', '2023-08-10 06:42:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `user_firstname`, `user_lastname`, `user_password`, `token`, `created_at`, `updated_at`) VALUES
(1, 'nizarlabib', 'nizar', 'labib', 'rahasia', NULL, NULL, NULL),
(2, 'admin@admin.com', 'admin', 'admin', '$2y$10$uKBfXY2zGD4he5Xlo8Xpve3wmEzV.73QJLdDr7BHSqbxxKWXjaCjS', 'eyJ1c2VybmFtZSI6ImFkbWluQGFkbWluLmNvbSIsInRpbWVzdGFtcCI6MTY5MTY3OTI4NSwiZXhwIjoxNjkxNjgyODg1fQ==', NULL, NULL),
(3, 'tes', 'tes', 'tes', '$2y$10$ksTGT4uurrHWp6.Z/fM/dOwEDq9FNlb7407Y3cMPmDzKvkyp6LCVK', NULL, NULL, NULL),
(4, 'tes2', 'tes2', 'tes2', '$2y$10$ZbS2j.3TaLBcyaqqthMmze9SJR74E5CAzrhXRVK5BlLTX1GDoCbG2', 'eyJ1c2VybmFtZSI6InRlczIiLCJ0aW1lc3RhbXAiOjE2OTE2NzkyNTEsImV4cCI6MTY5MTY4Mjg1MX0=', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `race_registrations`
--
ALTER TABLE `race_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_token_unique` (`token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `races`
--
ALTER TABLE `races`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `race_registrations`
--
ALTER TABLE `race_registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
