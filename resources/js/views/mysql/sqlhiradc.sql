-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Sep 2021 pada 16.40
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hiradcvuee`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activities`
--

INSERT INTO `activities` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(2, 'dasdasa', '2021-04-08 20:24:21', '2021-04-08 20:28:48'),
(4, 'Memahat Batu', '2021-04-30 00:22:26', '2021-04-30 00:22:26'),
(5, 'Parkir Mobil', '2021-05-28 01:47:27', '2021-06-03 09:22:18'),
(6, 'axax', '2021-06-08 04:12:48', '2021-06-08 04:12:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `assets`
--

INSERT INTO `assets` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(2, 'Truck', '2021-06-07 23:33:50', '2021-06-07 23:35:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(2, 'K3', '2021-04-06 00:51:53', '2021-04-12 19:08:51'),
(6, 'LH', '2021-04-07 01:52:40', '2021-04-07 03:58:54'),
(7, 'Pengamanan', '2021-05-25 03:52:21', '2021-05-25 01:35:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `conditions`
--

CREATE TABLE `conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `conditions`
--

INSERT INTO `conditions` (`id`, `category_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 2, 'Rutin', '2021-04-18 21:01:24', '2021-05-24 21:28:11'),
(2, 2, 'Non Rutin', '2021-04-19 02:02:36', '2021-06-28 18:24:42'),
(3, 6, 'Normal', '2021-04-19 02:03:10', '2021-05-24 21:28:57'),
(4, 6, 'Tidak Normal', '2021-04-20 19:27:52', '2021-05-24 21:29:13'),
(5, 7, 'Emergency', '2021-05-24 21:26:59', '2021-05-24 21:29:27'),
(13, 6, 'Emergency', '2021-06-28 18:23:08', '2021-06-28 18:23:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `consequences`
--

CREATE TABLE `consequences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `nilai` bigint(255) NOT NULL,
  `konsekuensi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `objective` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `legal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `biaya` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `reputasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `cakupan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lama_pemulihan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lama_penyimpangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dampak_sosial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `consequences`
--

INSERT INTO `consequences` (`id`, `category_id`, `nilai`, `konsekuensi`, `financial`, `objective`, `legal`, `biaya`, `reputasi`, `cakupan`, `lama_pemulihan`, `lama_penyimpangan`, `product_image`, `dampak_sosial`, `created_at`, `updated_at`) VALUES
(22, 7, 3, 'Memerlukan perawatan medis dan mengakibatkan hilangnya fungsi anggota tubuh untuk sementara waktu', 'Berdampak keuangan ≥ Rp. 2.5M s.d < Rp. 5 M', 'Kehilangan kesempatan produksi semen ≥ 15,000 ton s.d < 25,000 ton/hari', 'Pelanggaran peraturan yang serius atau berupa pecabutan izin operasi pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatan keras kepada perusahaan atau denda senilai Rp 2.5 M - Rp. 10 M', 'Biaya Rp. 25 Juta<Biaya<Rp. 100 Juta', 'Berdampak serius bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa dengan pangsa lokal terbatas (liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-04-27 00:33:42', '2021-06-29 20:18:35'),
(23, 7, 2, 'Memerlukan perawatan P3K', 'Berdampak keuangan ≥ Rp. 250 Jt s.d < Rp. 2.5 M', 'Kehilangan kesempatan produksi semen ≥ 350 ton s.d < 150,000 ton/hari', 'Pelanggaran peraturan yang serius atau pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatan keras kepada perusahaan atau denda senilai Rp.250 Jt - Rp. 2.5 M', 'Biaya Rp. 10 Juta<Biaya<Rp. 25 Juta', 'Berdampak bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa dengan pangsa lokal terbatas (bukan liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-19 21:04:32', '2021-06-29 20:18:22'),
(24, 7, 1, 'Tidak ada cidera', 'Berdampak keuangan < Rp. 250 Jt', 'Kehilangan kesempatan produksi semen ≤ 350ton/hari', 'Kehilangan kesempatan produksi semen ≤ 350ton/hari', 'Biaya < Rp. 10 Juta', 'Berdampak bagi reputasi Perusahaan yang tidak tersebar luas dan tidak terdapat pemberitaan di media', NULL, NULL, NULL, NULL, NULL, '2021-05-20 23:41:33', '2021-06-29 20:17:57'),
(25, 7, 4, 'Cidera yang mengakibatkan cacat/hilangnya fungsi tubuh secara total', 'Berdampak keuangan ≥ Rp. 5 M s.d < Rp. 10 M', 'Kehilangan kesempatan produksi semen 25,000 ton s.d < 35,000 ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasional perusahaan sementara atau denda senilai Rp. 5 M - 10 Rp. 10 M', 'Biaya Rp. 100 Juta<Biaya<Rp.200 Juta', 'Berdampak serius bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa danga pangsa lokal (liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 22:32:44', '2021-06-29 20:17:38'),
(26, 7, 5, 'Menyebabkan Kematian', 'Berdampak keuangan ≥ Rp. 10 M', 'Kehilangan Kesempatan produksi semen ≥ 35,000 ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasional perusahaan sementara atau denda senilai > Rp. 10 M', 'Biaya > Rp. 200 Juta', 'Berdampak signifikan bagi reputasi perusahaan. Melibatkan pemberitaan di media massa dengan pangsa nasional (liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 22:33:41', '2021-06-29 20:17:19'),
(27, 6, 1, 'Tidak ada gangguan', 'Berdampak keuangan < Rp 250 Jt', 'Kehilangan kesempatan produksi semen ≤ 350ton/hari', 'Pelanggaran peraturan, isu hukum dan ketidakpatuhan ringan', 'Biaya < Rp. 10 Juta', 'Berdampak bagi reputasi perusahaan yang tidak tersebar luas dan tidak terdapat pemberitaan di media', 'Ditempat kerja', 's/d 1 Minggu', '≤ 5 %', 'CSI > 95 %', 'Adanya Keluhan (1 kali setahun)', '2021-05-24 22:34:40', '2021-06-29 20:17:00'),
(28, 6, 2, 'Adanya Gangguan', 'Berdampak keuangan ≥ Rp. 250 Jt s.d < Rp. 2.5 M', 'Kehilangan kesempatan produksi semen ≥ 350 ton s.d < 15,000 ton/hari', 'Pelanggaran peraturan yang serius atau pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatan keras kepada perusahaan atau denda senilai Rp 250 Jt - Rp. 2.5 M', 'Biaya Rp.10 Juta< Biaya<Rp. 25 Juta', 'Berdampak bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa dengan pangsa lokal terbatas (bukan liputan utama)', 'Di area pabrik', 's/d 1 bulan', '6 % - 15 %', 'CSI 80 - 95 %', 'Seringnya keluhan (1 s/d 5 kali setahun)', '2021-05-24 22:35:50', '2021-06-29 20:16:48'),
(29, 6, 3, 'Menimbulkan pencemaran udara', 'Berdampak keuangan ≥ Rp. 2.5 M s.d < Rp. 5 M', 'Kehilangan kesempatan produksi semen ≥ 15,000 ton s.d < 25,000 ton / hari', 'Pelanggaran peraturan yang serius atau berupa pencabutan izin operasi pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatankeras kepada perusahaan atau denda senilai Rp. 2.5 M - Rp. 10M', 'Biaya Rp. 25 Juta<Biaya<Rp.100Juta', 'Berdampak serius bagi reputasi perusahaan. Melibatkan pemberitaan di media massa dengan pangsa lokal terbatas (liputan utama)', 'Radius < 200 m disekitar lingkungan pabrik', 's/d 1 Tahun', '16% - 25%', 'CSI 65 - 80 %', 'Issu di TK II', '2021-05-24 23:14:50', '2021-06-29 20:16:35'),
(30, 6, 4, 'Menimbulkan Pengrusakan', 'Berdampak keuangan ≥ Rp. 5M s.d < Rp. 10M', 'Kehilangan kesempatan produksi semen 25,000 ton s.d < 35,000 ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasional sementara atau denda senilai Rp. 5M - Rp. 10 M', 'Biaya Rp.100 Juta <Biaya<Rp. 200 Juta', 'Berdampak serius bagi reputasi Perusahaan. Melibatkan pemberitaan di media maassa dengan pangsa lokal (liptan utama)', '200 m - 1 km di Kec. Lubuk Kilangan', 's/d 5 Tahun', '25 - 50 %', 'CSI 50- 65%', 'Issu TKI/Nasional/ Global', '2021-05-24 23:16:06', '2021-06-29 20:16:17'),
(31, 6, 5, 'Menimbulkan pengrusakan / perubahan iklim', 'Berdampak keuangan ≥ Rp. 10 M', 'Kehilangan kesempatan produksi semen ≥ 35,000 ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasional perusahaan sementara atau denda senilai > 10 M', 'Biaya >Rp. 200 Juta', 'Berdampak signifikan bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa dengan pangsa nasional (liputan utama)', 'Radius >1 KM di Kota Padang', '> 5 Tahun', '≥50%', 'CSI < 50%', 'Issu TKI/Nasional/Global', '2021-05-24 23:18:05', '2021-06-29 20:16:05'),
(32, 2, 1, 'Tidak ada Gangguan', 'Berdampak keuangan < Rp. 250 Jt', 'Kehilangan kesempatan produksi semen ≤ 350 ton/hari', 'Pelanggaran peraturan, isu hukum dan ketidakpatuhan ringan', 'Biaya < Rp. 10 juta', 'Berdampak bagi reputasi perusahaan yang tidak tersebar luas dan tidak terdapat pemberitaan di media', NULL, NULL, NULL, NULL, NULL, '2021-05-24 23:19:09', '2021-06-29 20:15:50'),
(33, 2, 2, 'Stress', 'Berdampak keuangan ≥ Rp. 250 Jt s.d < Rp. 2.5 M', 'Kehilangan kesempatan produksi semen ≥ 350 ton s.d 15,000 ton/hari', 'Pelanggaran peraturan yang serius atau pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatan keras kepada perusahaan atau denda senilai Rp. 250 Jt - Rp. 2.5 M', 'Biaya Rp. 10 Juta<Biaya<Rp. 25 Juta', 'Berdampak bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa denngan pangsa lokal terbatas (buka liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 23:20:00', '2021-06-29 20:15:28'),
(34, 2, 3, 'Cidera', 'Berdampak keuangan ≥ Rp. 2.5 M s.d < rp. 5M', 'Kehilangan kesempatan produksi semen ≥ 15,000 ton s.d 25,000 ton/hari', 'Pelanggaran peraturan yang serius atau pengaduan pada pihak berwenang dengan kemungkinan putusan hukum berupa peringatan keras kepada perusahaan atau denda senilai Rp. 2.5 M - Rp. 10 M', 'Biaya Rp. 25 Juta<Biaya<Rp. 100 Juta', 'Berdampak serius bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa denngan pangsa lokal terbatas (bukan liputan utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 23:20:53', '2021-06-29 20:15:14'),
(35, 2, 4, 'Cacat Permanen', 'Berdampak keuangan ≥ Rp. 5 M s.d < Rp. 20 M', 'Kehilangan kesempatan produksi semen 25,000 ton s.d < 35,000 ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasioanl perusahaan sementara atau denda senilai Rp. 5 M - Rp. 10 M', 'Biaya Rp. 100 Juta<Biaya<Rp. 200 Juta', 'Berdampak serius bagi reputasi perusahaan. Melibatkan pemberitaan di media massa dengan pangsa lokal (Liputan Utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 23:21:39', '2021-06-29 20:14:59'),
(36, 2, 5, 'Kematian', 'Berdampak keuangan ≥ Rp.10 M', 'Kehilangan kesempatan produksi semen ≥ 35,000ton/hari', 'Pelanggaran peraturan yang berat berupa pencabutan izin operasional perusahaan sementara atau denda senilai > Rp. 10 M', 'Biaya >Rp. 200 Juta', 'Berdampak signifikan bagi reputasi Perusahaan. Melibatkan pemberitaan di media massa dengan pangsa nasional (liputan Utama)', NULL, NULL, NULL, NULL, NULL, '2021-05-24 23:22:12', '2021-06-29 20:14:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `k3teams`
--

CREATE TABLE `k3teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_kerja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `koordinator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ketua` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `k3teams`
--

INSERT INTO `k3teams` (`id`, `unit_kerja`, `koordinator`, `ketua`, `pic`, `created_at`, `updated_at`) VALUES
(5, 'Unit Sistem Manajemen', 'NASRUN, SE., Akt., MM.', 'RENI SARI RAHMADHANI, ST.', 'POVIA', '2021-08-19 01:23:45', '2021-08-19 01:23:45'),
(6, 'Unit Kinerja & Anggaran', 'DASRIL, SE., Akt.', 'IHDA NULIZA LEYROS, SE.', 'RAHMI MUTIA', '2021-08-19 01:43:16', '2021-08-19 01:53:36'),
(7, 'Unit Penunjang Produksi', 'TRI PRAPTOYO HERIYANTO, ST., MSc.', 'HERIYANTO, ST.', 'ERADANTES EKA PUTERA', '2021-08-19 02:21:22', '2021-08-19 02:21:22'),
(8, '9', 'RINOLD THAMRIN, SE., Akt., MM.', 'DELFIADRI', 'MELYANA', '2021-08-26 02:18:06', '2021-08-26 02:18:06'),
(9, '53', 'NELVI IRAWATI S.Si, MT.', 'ARIE RONALDO ALBERTHA', 'POVIA', '2021-08-31 19:15:18', '2021-08-31 19:15:18'),
(10, '9', 'RINOLD THAMRIN, SE., Akt., MM.', 'MASYKUR RAUF', 'JAYUS KARNEDI', '2021-08-31 19:18:16', '2021-08-31 19:18:16'),
(11, '53', 'NASRUN, SE., Akt., MM.', 'RENI SARI RAHMADHANI, ST.', 'RINNI SYAFNITA, SE.', '2021-08-31 19:54:40', '2021-08-31 19:54:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawans`
--

CREATE TABLE `karyawans` (
  `nik` varchar(4) NOT NULL,
  `nip` varchar(7) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `band` varchar(20) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `dir` varchar(200) NOT NULL,
  `dep` varchar(200) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `seksi` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawans`
--

INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('2856', '6500001', 'NANDA T', 'PEL I', 'Male', '1965-04-11', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'NANDA.T', NULL, NULL),
('2857', '6587005', 'AKHYAR', 'IV', 'Male', '1965-09-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AKHYAR', NULL, NULL),
('2859', '6587018', 'HASANUDDIN', 'PEL I', 'Male', '1965-12-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'HASANUDDIN.2859', NULL, NULL),
('2860', '6587020', 'HARDI ANDRI', 'III', 'Male', '1965-05-14', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'HARDI.ANDRI', NULL, NULL),
('2861', '6587025', 'IRDAS', 'PEL I', 'Male', '1965-09-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'IRDAS', NULL, NULL),
('2862', '6587026', 'IRWAN', 'IV', 'Male', '1965-09-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'IRWAN.2862', NULL, NULL),
('2863', '6587028', 'JON REFLUS', 'III', 'Male', '1965-10-17', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'JON.REFLUS', NULL, NULL),
('2865', '6587047', 'RUSLI', 'III', 'Male', '1965-04-08', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'RUSLI', NULL, NULL),
('2866', '6587049', 'RONANDI ZAIN', 'III', 'Male', '1965-10-19', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'RONANDI.ZAIN', NULL, NULL),
('2868', '6587056', 'WINTERMAN, SH.', 'III', 'Male', '1965-05-03', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Hukum', 'WINTERMAN', NULL, NULL),
('2869', '6587058', 'YUSMAN', 'IV', 'Male', '1965-10-05', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'YUSMAN.2869', NULL, NULL),
('2871', '6587063', 'ZALMAN, SE.', 'III', 'Male', '1965-12-12', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'ZALMAN', NULL, NULL),
('2872', '6587067', 'AFDAL', 'IV', '', '1965-07-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AFDAL.2872', NULL, NULL),
('2873', '6587068', 'APRIANTO', 'IV', 'Male', '1965-04-04', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'APRIANTO.2873', NULL, NULL),
('2874', '6589001', 'ABDUL AZIS', 'IV', 'Male', '1965-05-16', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ABDUL.AZIS', NULL, NULL),
('2878', '6598015', 'NASRUL', 'PEL I', 'Male', '1965-10-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'NASRUL.2878', NULL, NULL),
('2879', '6598020', 'ONSARMAN', 'IV', '', '1965-12-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ONSARMAN', NULL, NULL),
('2880', '6598032', 'YULDISATRIA', 'IV', 'Male', '1965-07-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'YULDISATRIA', NULL, NULL),
('2881', '6598123', 'YUMARDI', 'IV', 'Male', '1965-11-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YUMARDI', NULL, NULL),
('2882', '6598269', 'FIRDAUS', 'PEL I', 'Male', '1965-09-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'FIRDAUS.2882', NULL, NULL),
('2883', '6598279', 'SUPRI', 'PEL I', 'Male', '1965-11-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'SUPRI', NULL, NULL),
('2884', '6598292', 'RUSLI', 'PEL I', 'Male', '1965-10-11', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'RUSLI.2884', NULL, NULL),
('2885', '6598298', 'IRWAN AZWAR', 'IV', 'Male', '1965-10-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'IRWAN.AZWAR', NULL, NULL),
('2886', '6598307', 'AFINI', 'IV', '', '1965-06-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AFINI', NULL, NULL),
('2887', '6600005', 'DONGKEL PERANGIN ANGIN', 'IV', 'Male', '1966-06-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'DONGKEL.ANGIN', NULL, NULL),
('2888', '6600019', 'MULFA ROZA', 'IV', 'Male', '1966-09-25', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'MULFA.ROZA', NULL, NULL),
('2889', '6600023', 'AMRIL NURMAN', 'PEL I', 'Male', '1966-04-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'AMRIL.NURMAN2889', NULL, NULL),
('2890', '6687011', 'DAHNIL', 'IV', 'Male', '1966-06-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'DAHNIL', NULL, NULL),
('2891', '6687013', 'DARMIZA', 'III', 'Male', '1966-11-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'DARMIZA', NULL, NULL),
('2892', '6687014', 'EDRI', 'III', 'Male', '1966-12-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'EDRI', NULL, NULL),
('2893', '6687022', 'HASDI SUGIANTO', 'III', '', '1966-09-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HASDI.SUGIANTO', NULL, NULL),
('2894', '6687029', 'JUNAIDI JOHOR', 'III', '', '1966-10-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JUNAIDI.JOHOR', NULL, NULL),
('2895', '6687037', 'MARKHANIS', 'IV', 'Male', '1966-06-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'MARKHANIS', NULL, NULL),
('2896', '6687046', 'RISWANDI', 'IV', '', '1966-08-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RISWANDI.2896', NULL, NULL),
('2897', '6687051', 'SUWIS', 'PEL I', 'Male', '1966-08-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'SUWIS', NULL, NULL),
('2898', '6687055', 'SUWIRMAN', 'PEL I', 'Male', '1966-02-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'SUWIRMAN', NULL, NULL),
('2899', '6687069', 'HENDRAWANTO', 'IV', 'Male', '1966-09-21', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'HENDRAWANTO', NULL, NULL),
('2900', '6687071', 'RAMLI', 'III', '', '1966-01-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAMLI.2900', NULL, NULL),
('2901', '6689004', 'WELIANSYAH', 'IV', 'Male', '1966-01-19', 'Semen Padang Subsidiaries', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'WELIANSYAH', NULL, NULL),
('2902', '6689009', 'AHMAD SUKRI', 'III', '', '1966-03-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AHMAD.SUKRI', NULL, NULL),
('2903', '6690002', 'MASYKUR RAUF', 'III', 'Male', '1966-05-10', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Bina Lingkungan', 'MASYKUR.RAUF', NULL, NULL),
('2904', '6691002', 'EDINAL', 'II', 'Male', '1966-06-26', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke Yayasan Igasar', 'Kary. Ditugaskan ke Yayasan Igasar', 'Kary. Ditugaskan ke Yayasan Igasar', 'EDINAL', NULL, NULL),
('2907', '6691015', 'TARLO SEMBIRING, Ir., MT.', 'II', 'Male', '1966-11-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Unit Bengkel', 'TARLO.SEMBIRING', NULL, NULL),
('2909', '6693003', 'FIDEL BESTRI, Ir., SE., Akt.', 'II', '', '1966-05-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIDEL.BESTRI', NULL, NULL),
('2910', '6696015', 'DANIL DARWIN, ST.', 'II', '', '1966-12-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DANIL.DARWIN', NULL, NULL),
('2911', '6697019', 'AMPRI SATYAWAN, SE., MM.', 'I', 'Male', '1966-09-21', 'Operation Directorate', 'Staf Direksi', 'Staf Direksi', 'Staf Direksi', 'AMPRI.SATYAWAN', NULL, NULL),
('2912', '6698037', 'ZULKARNAINI', 'PEL I', '', '1966-07-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZULKARNAINI.2912', NULL, NULL),
('2913', '6698039', 'WAHYUDI', 'PEL I', 'Male', '1966-09-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'WAHYUDI.2913', NULL, NULL),
('2915', '6698053', 'JAYUS KARNEDI', 'IV', 'Male', '1966-01-14', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'JAYUS.KARNEDI', NULL, NULL),
('2916', '6698083', 'AGUSTAMI', 'IV', 'Male', '1966-08-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AGUSTAMI', NULL, NULL),
('2917', '6698084', 'SUKIRMAN', 'PEL I', '', '1966-12-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUKIRMAN', NULL, NULL),
('2918', '6698106', 'NOVRIWAN', 'PEL I', 'Male', '1966-11-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'NOVRIWAN', NULL, NULL),
('2919', '6698111', 'SUPARNO', 'IV', '', '1966-07-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUPARNO.2919', NULL, NULL),
('2922', '6698278', 'IRWANDI', 'PEL I', 'Male', '1966-10-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'IRWANDI.2922', NULL, NULL),
('2923', '6698284', 'SAPTIRAL', 'IV', 'Male', '1966-08-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'SAPTIRAL', NULL, NULL),
('2924', '6698297', 'HARMEN', 'IV', 'Male', '1966-04-25', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'HARMEN.2924', NULL, NULL),
('2925', '6698299', 'ALAM MURI', 'PEL I', 'Male', '1966-01-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ALAM.MURI', NULL, NULL),
('2926', '6698303', 'ARIZAL', 'PEL I', 'Male', '1966-07-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'ARIZAL', NULL, NULL),
('2927', '6700006', 'HENDRI ALI', 'PEL I', 'Male', '1967-11-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'HENDRI.ALI', NULL, NULL),
('2928', '6700026', 'NAFRIAL', 'IV', 'Male', '1967-07-07', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'NAFRIAL', NULL, NULL),
('2929', '6787006', 'ALIMUNAS', 'PEL I', '', '1967-05-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALIMUNAS', NULL, NULL),
('2931', '6787043', 'OKTAPIANUS', 'IV', 'Male', '1967-10-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'OKTAPIANUS', NULL, NULL),
('2932', '6789006', 'ANTON SYOFNEVIL', 'III', 'Male', '1967-07-07', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'ANTON.SYOFNEVIL', NULL, NULL),
('2933', '6790003', 'HENDRA SUSILA', 'III', 'Male', '1967-05-30', 'Semen Padang Subsidiaries', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'HENDRA.SUSILA', NULL, NULL),
('2934', '6790009', 'DELFIADRI', 'III', 'Male', '1967-02-11', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'DELFIADRI', NULL, NULL),
('2935', '6791016', 'HARI UTAMA, Ir.', 'I', 'Male', '1967-04-17', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'HARI.UTAMA', NULL, NULL),
('2937', '6792023', 'DESRA FITRI, Ir.', 'III', '', '1967-12-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DESRA.FITRI', NULL, NULL),
('2938', '6792025', 'ASRAN KRISNA, SE.', 'III', 'Male', '1967-04-23', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'ASRAN.KRISNA', NULL, NULL),
('2939', '6796004', 'DASRIAL, Ir., MM.', 'I', 'Male', '1967-06-08', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'DASRIAL', NULL, NULL),
('2940', '6798021', 'ZULKIFLI', 'PEL I', 'Male', '1967-06-24', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'ZULKIFLI.2940', NULL, NULL),
('2941', '6798027', 'ZULKARNAINI', 'IV', 'Male', '1967-12-18', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'ZULKARNAINI.2941', NULL, NULL),
('2942', '6798031', 'JAMALUS M', 'PEL I', 'Male', '1967-06-04', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'JAMALUS.M', NULL, NULL),
('2943', '6798061', 'AHMAD BUDIHARTANTO', 'IV', 'Male', '1967-03-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'AHMAD.BUDIHARTANTO', NULL, NULL),
('2944', '6798072', 'MARTINUS', 'III', 'Male', '1967-03-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'MARTINUS', NULL, NULL),
('2945', '6798102', 'HELMARIUS', 'III', 'Male', '1967-10-26', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'HELMARIUS', NULL, NULL),
('2946', '6798122', 'INDRIADI', 'IV', 'Male', '1967-04-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'INDRIADI', NULL, NULL),
('2947', '6798291', 'ALIBAR', 'PEL I', '', '1967-11-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALIBAR', NULL, NULL),
('2948', '6798295', 'ABDUL HAPIS', 'PEL I', 'Male', '1967-07-11', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ABDUL.HAPIS', NULL, NULL),
('2949', '6798301', 'SYAFRIAL', 'PEL II', 'Male', '1967-06-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'SYAFRIAL.2949', NULL, NULL),
('2950', '6800002', 'RIKI AZWAR, SE.', 'II', 'Male', '1968-11-03', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Asuransi', 'RIKI.AZWAR', NULL, NULL),
('2951', '6802032', 'GUSPADRIYANTO', 'IV', 'Male', '1968-08-17', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'GUSPADRIANTO', NULL, NULL),
('2952', '6889002', 'AFDAL', 'III', 'Male', '1968-02-05', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Keamanan', 'Staf Keamanan', 'AFDAL.2952', NULL, NULL),
('2953', '6890130', 'REFCAN AFIVI, SE.', 'II', '', '1968-07-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'REFCAN.AFIVI', NULL, NULL),
('2954', '6890143', 'ENDRA M', 'IV', 'Male', '1968-10-07', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ENDRA.M', NULL, NULL),
('2955', '6892013', 'TAUFIK', 'III', 'Male', '1968-11-09', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'TAUFIK', NULL, NULL),
('2956', '6892017', 'DEDI R', 'III', 'Male', '1968-07-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'DEDI.R', NULL, NULL),
('2958', '6893006', 'YANTI HASNUR', 'PEL I', '', '1968-10-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YANTI.HASNUR', NULL, NULL),
('2959', '6896011', 'OKTOWERI, ST., MM.', 'I', 'Male', '1968-10-06', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Departemen Komunikasi & Hukum Perusahaan', 'Departemen Komunikasi & Hukum Perusahaan', 'OKTOWERI', NULL, NULL),
('2960', '6896012', 'ABDUL HAKIM LUBIS, ST.', 'I', 'Male', '1968-10-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Departemen Pemeliharaan', 'Departemen Pemeliharaan', 'ABDUL.LUBIS', NULL, NULL),
('2961', '6896013', 'DEDDY SAPTOMO, ST., MT.', 'II', 'Male', '1968-12-15', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'DEDDY.SAPTOMO', NULL, NULL),
('2962', '6896014', 'MUHAMMAD SYAFITRI, ST., MM.', 'I', 'Male', '1968-12-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Departemen Pemeliharaan', 'Departemen Pemeliharaan', 'MUHAMMAD.SYAFITRI', NULL, NULL),
('2963', '6897008', 'SUMARSONO, ST, SE, MM', 'I', 'Male', '1968-06-08', 'Operation Directorate', 'Departemen Produksi Semen', 'Departemen Produksi Semen', 'Departemen Produksi Semen', 'SUMARSONO', NULL, NULL),
('2964', '6897013', 'PRI GUSTARI AKBAR, ST., MT.', 'I', 'Male', '1968-08-18', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'PRI.AKBAR', NULL, NULL),
('2965', '6897015', 'NASRUN, SE., Akt., MM.', 'II', 'Male', '1968-07-09', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'NASRUN', NULL, NULL),
('2966', '6898004', 'WILNORA', 'IV', 'Male', '1968-07-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'WILNORA', NULL, NULL),
('2967', '6898018', 'SOFINADETRA', 'III', 'Male', '1968-01-19', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'SOFINADETRA', NULL, NULL),
('2968', '6898025', 'ADRIADI', 'IV', '', '1968-05-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADRIADI', NULL, NULL),
('2969', '6898058', 'EDISON', 'IV', 'Male', '1968-10-30', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'EDISON.2969', NULL, NULL),
('2970', '6898071', 'ZULMAIDI', 'IV', 'Male', '1968-05-25', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'ZULMAIDI', NULL, NULL),
('2971', '6898073', 'RUJI SAPUTRO', 'IV', 'Male', '1968-07-13', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'RUJI.SAPUTRO', NULL, NULL),
('2974', '6898104', 'BASRIJON', 'PEL I', 'Male', '1968-11-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'BASRIJON', NULL, NULL),
('2975', '6898107', 'AGUSTRI', 'IV', 'Male', '1968-08-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'AGUSTRI', NULL, NULL),
('2976', '6898120', 'DASRIL', 'PEL I', 'Male', '1968-09-22', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'DASRIL.2976', NULL, NULL),
('2977', '6898277', 'DASRIAL', 'PEL I', 'Male', '1968-12-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'DASRIAL.2977', NULL, NULL),
('2978', '6898312', 'BENNY ISMANTO, Ir.', 'I', '', '1968-03-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BENNY.ISMANTO', NULL, NULL),
('2980', '6900008', 'AGUSLIM', 'PEL I', 'Male', '1969-08-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'AGUSLIM', NULL, NULL),
('2981', '6900009', 'IRWANDI', 'PEL I', '', '1969-06-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IRWANDI.2981', NULL, NULL),
('2982', '6901011', 'SURIADI', 'PEL I', '', '1969-01-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SURIADI.2982', NULL, NULL),
('2983', '6902011', 'APRIYENDI, ST.', 'II', 'Male', '1969-12-25', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'APRIYENDI', NULL, NULL),
('2984', '6907029', 'ASRIL, S.Pt.', 'IV', 'Male', '1969-11-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ASRIL.2984', NULL, NULL),
('2985', '6992016', 'NOVRIADI M', 'III', '', '1969-11-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NOVRIADI.M', NULL, NULL),
('2986', '6993010', 'MELYANA', 'IV', 'Female', '1969-05-18', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Program Kemitraan', 'MELYANA', NULL, NULL),
('2987', '6993011', 'DEWI KURNIANINGSIH', 'PEL I', '', '1969-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DEWI.KURNIANINGSIH', NULL, NULL),
('2988', '6993038', 'JUKE ISMARA, M.Engtech, Ir.', 'I', 'Male', '1969-06-16', 'Operation Directorate', 'Departemen Rendal Produksi', 'Departemen Rendal Produksi', 'Departemen Rendal Produksi', 'JUKE.ISMARA', NULL, NULL),
('2990', '6996005', 'AMRAL AHMAD, ST.', 'I', '', '1969-05-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AMRAL.AHMAD', NULL, NULL),
('2991', '6996010', 'RUSPENDI', 'IV', '', '1969-10-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RUSPENDI', NULL, NULL),
('2992', '6997014', 'BOY DEFRIZA FULDIANDRI, ST., MM.', 'II', 'Male', '1969-05-18', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'BOY.FULDIANDRI', NULL, NULL),
('2993', '6997017', 'EDWIN, SE., M.Mktg', 'I', 'Male', '1969-07-19', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'EDWIN', NULL, NULL),
('2994', '6998006', 'ZULKIFLI', 'IV', 'Male', '1969-08-12', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'ZULKIFLI.2994', NULL, NULL),
('2995', '6998007', 'ERFAN SUTRIYANTO', 'III', '', '1969-09-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ERFAN.SUTRIYANTO', NULL, NULL),
('2996', '6998009', 'ANDRIYANTO', 'IV', 'Male', '1969-12-19', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ANDRIYANTO', NULL, NULL),
('2997', '6998019', 'YUSRA GUMANTI', 'IV', 'Male', '1969-08-09', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'YUSRA.GUMANTI', NULL, NULL),
('2998', '6998030', 'IMAN SAYUDI', 'IV', 'Male', '1969-02-09', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'IMAN.SAYUDI', NULL, NULL),
('2999', '6998035', 'BUDIMAN JAMAL', 'PEL I', '', '1969-12-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BUDIMAN.JAMAL', NULL, NULL),
('3000', '6998036', 'DODY EFENDI', 'IV', 'Male', '1969-03-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'DODY.EFENDI', NULL, NULL),
('3001', '6998041', 'YULIANTO', 'IV', '', '1969-06-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YULIANTO.3001', NULL, NULL),
('3002', '6998047', 'EFDIRIZMEN', 'IV', 'Male', '1969-06-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'EFDIRIZMEN', NULL, NULL),
('3003', '6998060', 'KASNO', 'PEL I', 'Male', '1969-09-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'KASNO', NULL, NULL),
('3004', '6998067', 'HENDRI BAKRI', 'PEL I', 'Male', '1969-02-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HENDRI.BAKRI', NULL, NULL),
('3005', '6998069', 'ZUHELMI', 'IV', 'Male', '1969-10-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'ZUHELMI', NULL, NULL),
('3006', '6998090', 'GUSWARMAN', 'PEL I', 'Male', '1969-08-26', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'GUSWARMAN', NULL, NULL),
('3007', '6998091', 'DIRMANSYAH', 'PEL I', '', '1969-06-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DIRMANSYAH', NULL, NULL),
('3008', '6998092', 'EDISON', 'IV', 'Male', '1969-05-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'EDISON.3008', NULL, NULL),
('3009', '6998097', 'AZRI FOMAR', 'PEL I', '', '1969-10-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AZRI.FOMAR', NULL, NULL),
('3010', '6998105', 'MARDIAL', 'IV', 'Male', '1969-10-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'MARDIAL', NULL, NULL),
('3011', '6998109', 'JAFRIENDRA', 'PEL I', 'Male', '1969-01-08', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'JAFRIENDRA', NULL, NULL),
('3012', '6998110', 'ENET PUTRA', 'PEL I', 'Male', '1969-08-15', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ENET.PUTRA', NULL, NULL),
('3013', '6998112', 'SAFRIZAL', 'IV', 'Male', '1969-05-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'SAFRIZAL', NULL, NULL),
('3014', '6998113', 'AFRIZAL', 'IV', 'Male', '1969-11-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AFRIZAL.3014', NULL, NULL),
('3015', '6998116', 'RINALDI', 'IV', 'Male', '1969-09-04', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'RINALDI.3015', NULL, NULL),
('3016', '6998272', 'NURMAN', 'IV', 'Male', '1969-06-03', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'NURMAN', NULL, NULL),
('3017', '6998275', 'HAZIRUN', 'PEL I', '', '1969-11-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HAZIRUN', NULL, NULL),
('3018', '6998280', 'SAFRIL', 'IV', 'Male', '1969-12-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'SAFRIL', NULL, NULL),
('3019', '6998289', 'YULMIZAR', 'IV', '', '1969-10-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Yulmizar', NULL, NULL),
('3020', '6998293', 'YUSRA NUZUL', 'PEL I', 'Male', '1969-12-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'YUSRA.NUZUL', NULL, NULL),
('3021', '6998296', 'MARSUENDI', 'IV', 'Male', '1969-03-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'MARSUENDI', NULL, NULL),
('3022', '6998306', 'ABDUL HADI', 'IV', '', '1969-05-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ABDUL.HADI3022', NULL, NULL),
('3023', '6999075', 'VERY HARJANTO, ST.', 'II', '', '1969-07-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'VERY.HARJANTO', NULL, NULL),
('3024', '6999082', 'OTMA ROSYA, SE.', 'II', '', '1969-10-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'OTMA.ROSYA', NULL, NULL),
('3025', '6999085', 'SUPARNO, ST.', 'II', '', '1969-04-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUPARNO', NULL, NULL),
('3026', '6999087', 'DEDISAPUTRA', 'III', '', '1969-12-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DEDISAPUTRA', NULL, NULL),
('3027', '7000003', 'RIZALDI, ST., MM.', 'III', 'Male', '1970-04-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RIZALDI', NULL, NULL),
('3028', '7000018', 'INDRA', 'IV', 'Male', '1970-11-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'INDRA.3028', NULL, NULL),
('3029', '7001020', 'BUYUNG ISMU', 'PEL I', '', '1970-05-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BUYUNG.ISMU', NULL, NULL),
('3030', '7002004', 'DENI ZEN, ST.', 'III', 'Male', '1970-04-07', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'DENI.ZEN', NULL, NULL),
('3031', '7002007', 'MASRIZAL, SH MM M.Kom', 'II', 'Male', '1970-01-05', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'MASRIZAL.KOM', NULL, NULL),
('3032', '7002009', 'ISKANDAR ZULKARNAIN L, ST., MM.', 'I', 'Male', '1970-06-26', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'ISKANDAR.ZULKARNAIN', NULL, NULL),
('3033', '7002014', 'SYAFRIADO, ST.', 'II', 'Male', '1970-09-08', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Unit Pabrik Kantong', 'SYAFRIADO', NULL, NULL),
('3035', '7002024', 'JAMALUDDIN, S.Kom.', 'III', 'Male', '1970-01-09', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'JAMALUDDIN.NZR', NULL, NULL),
('3037', '7093007', 'RINI UTARI', 'PEL I', '', '1970-01-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RINI.UTARI', NULL, NULL),
('3038', '7097001', 'AHMAD ARIS, ST.', 'I', '', '1970-04-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('3039', '7097002', 'DESRAMON, ST., MSc.', 'I', 'Male', '1970-12-30', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke Yayasan Igasar', 'Kary. Ditugaskan ke Yayasan Igasar', 'Kary. Ditugaskan ke Yayasan Igasar', 'DESRAMON', NULL, NULL),
('3040', '7097003', 'R TRISANDI HENDRAWAN, ST., MM.', 'I', 'Male', '1970-04-29', 'Finance Directorate', 'Departemen SDM & Umum', 'Departemen SDM & Umum', 'Departemen SDM & Umum', 'TRISANDI.HENDRAWAN', NULL, NULL),
('3041', '7097005', 'HASFI RAFIQ, ST.', 'II', 'Male', '1970-10-06', 'Semen Padang Subsidiaries', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'HASFI.RAFIQ', NULL, NULL),
('3042', '7097007', 'ADMARTIN, ST., MM.', 'I', 'Male', '1970-03-11', 'Operation Directorate', 'Departemen Produksi Terak', 'Departemen Produksi Terak', 'Departemen Produksi Terak', 'ADMARTIN', NULL, NULL),
('3043', '7097016', 'DEDI ZAHERDI, SE., Akt.', 'I', 'Male', '1970-10-22', 'Finance Directorate', 'Departemen Keuangan', 'Departemen Keuangan', 'Departemen Keuangan', 'DEDI.ZAHERDI', NULL, NULL),
('3044', '7098011', 'MAWARDI', 'IV', '', '1970-03-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MAWARDI', NULL, NULL),
('3045', '7098016', 'JUSRIAL', 'IV', 'Male', '1970-07-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'JUSRIAL', NULL, NULL),
('3046', '7098033', 'DAHARMAN', 'IV', 'Male', '1970-11-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'DAHARMAN', NULL, NULL),
('3047', '7098042', 'ERIJON', 'PEL I', 'Male', '1970-12-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'ERIJON', NULL, NULL),
('3048', '7098055', 'HARWAN', 'IV', 'Male', '1970-10-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HARWAN', NULL, NULL),
('3049', '7098063', 'JUMRA', 'IV', 'Male', '1970-11-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'JUMRA', NULL, NULL),
('3050', '7098081', 'AGUSRIZAL', 'IV', 'Male', '1970-08-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'AGUSRIZAL', NULL, NULL),
('3051', '7098085', 'ARJUMAIDI', 'PEL I', 'Male', '1970-06-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'ARJUMAIDI', NULL, NULL),
('3052', '7098095', 'FAUZAN', 'IV', 'Male', '1970-12-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'FAUZAN.SULLIR', NULL, NULL),
('3053', '7098101', 'ZULFINAL', 'IV', 'Male', '1970-04-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'ZULFINAL', NULL, NULL),
('3054', '7098108', 'VARDIMIR A', 'IV', 'Male', '1970-08-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'VARDIMIR.A', NULL, NULL),
('3055', '7098281', 'YANUAR ALFIAN', 'IV', 'Male', '1970-01-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YANUAR.ALFIAN', NULL, NULL),
('3056', '7098285', 'LEGIWAN', 'PEL I', 'Male', '1970-05-23', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'LEGIWAN', NULL, NULL),
('3058', '7098300', 'NAZIRMAN', 'PEL I', 'Male', '1970-11-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'NAZIRMAN', NULL, NULL),
('3059', '7098304', 'HENDRI', 'PEL I', 'Male', '1970-05-20', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'HENDRI.3059', NULL, NULL),
('3060', '7098309', 'AFRIZAL', 'PEL I', 'Male', '1970-09-11', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'AFRIZAL.3060', NULL, NULL),
('3061', '7098311', 'SYAFRIL A', 'PEL I', 'Male', '1970-10-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'SYAFRIL.A', NULL, NULL),
('3062', '7098314', 'NURALIB, ST., MM.', 'II', '', '1970-12-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NURALIB', NULL, NULL),
('3063', '7099076', 'WISMATUL IFFAH, SE.', 'PEL I', 'Female', '1970-12-08', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'WISMATUL.IFFAH', NULL, NULL),
('3064', '7099077', 'GINARYO, ST.', 'II', '', '1970-08-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'GINARYO', NULL, NULL),
('3065', '7099083', 'SLAMET SUYANTO, SE., MM.', 'I', '', '1970-04-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SLAMET.SUYANTO', NULL, NULL),
('3066', '7099091', 'ASRIL', 'IV', 'Male', '1970-12-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'ASRIL.3066', NULL, NULL),
('3067', '7100004', 'AHLEN ALFIAN, SE., MM.', 'II', 'Male', '1971-05-15', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', 'AHLEN.ALFIAN', NULL, NULL),
('3068', '7102019', 'WEMPI KURNIAWAN, ST.', 'II', 'Male', '1971-06-22', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'WEMPI.KURNIAWAN', NULL, NULL),
('3069', '7102025', 'FAHRIZAL', 'IV', 'Male', '1971-12-30', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'FAHRIZAL', NULL, NULL),
('3070', '7102026', 'YASNELI SASTRAWATI YUSUF, SE.', 'III', '', '1971-08-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YASNELLY.SASTRAWATI', NULL, NULL),
('3071', '7102035', 'MUKHLIS', 'IV', 'Male', '1971-03-10', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'MUKHLIS', NULL, NULL),
('3072', '7107005', 'NOVRIZAL, AMD.', 'IV', 'Male', '1971-08-26', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'NOVRIZAL', NULL, NULL),
('3073', '7107026', 'YULHELMUS', 'IV', 'Male', '1971-07-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'YULHELMUS', NULL, NULL),
('3074', '7193008', 'NOVIA HARMILAWATI, AM., KEB', 'IV', 'Female', '1971-11-06', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'NOVIA.HARMILAWATI', NULL, NULL),
('3075', '7196001', 'MELI AGUSTINI', 'III', 'Female', '1971-08-12', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'MELI.AGUSTINI', NULL, NULL),
('3076', '7196008', 'HENDRIK DELA ROZA', 'III', '', '1971-02-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENDRIK.ROZA', NULL, NULL),
('3078', '7197018', 'AMRI YUSRAN NASUTION', 'IV', 'Male', '1971-11-09', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Keamanan', 'Staf Keamanan', 'AMRI.NASUTION', NULL, NULL),
('3079', '7198002', 'RUSTAM', 'IV', 'Male', '1971-01-22', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'RUSTAM.3079', NULL, NULL),
('3080', '7198010', 'BURMATIAS', 'IV', 'Male', '1971-03-11', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'BURMATIAS', NULL, NULL),
('3081', '7198012', 'DESFIRMAN', 'PEL I', 'Male', '1971-12-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'DESFIRMAN', NULL, NULL),
('3082', '7198017', 'EDY SURYANTO', 'IV', 'Male', '1971-01-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'EDY.SURYANTO', NULL, NULL),
('3083', '7198024', 'SABRIMEN', 'IV', 'Male', '1971-01-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'SABRIMEN', NULL, NULL),
('3084', '7198034', 'ADEL WARMAN', 'IV', 'Male', '1971-12-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ADEL.WARMAN', NULL, NULL),
('3085', '7198040', 'APRINAL', 'IV', 'Male', '1971-05-08', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'APRINAL', NULL, NULL),
('3086', '7198054', 'HENDRI AWALUDDIN', 'IV', 'Male', '1971-05-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'HENDRI.AWALUDDIN', NULL, NULL),
('3087', '7198062', 'ZULHENDRA', 'PEL I', 'Male', '1971-05-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ZULHENDRA', NULL, NULL),
('3088', '7198065', 'ZULFIKAR M', 'IV', 'Male', '1971-07-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'ZULFIKAR.M', NULL, NULL),
('3089', '7198076', 'MASRIZAL', 'IV', 'Male', '1971-03-25', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'MASRIZAL', NULL, NULL),
('3090', '7198082', 'RUDI ANTONI', 'IV', 'Male', '1971-10-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'RUDI.ANTONI', NULL, NULL),
('3091', '7198118', 'EDHI DJOKO PURWONO', 'IV', '', '1971-06-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EDHI.PURWONO', NULL, NULL),
('3092', '7198124', 'JON REFEL', 'III', 'Male', '1971-01-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'JON.REFEL', NULL, NULL),
('3093', '7198125', 'DWI SUKMANADI', 'IV', 'Male', '1971-02-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'DWI.SUKMANADI', NULL, NULL),
('3094', '7198131', 'FAUZAL', 'III', 'Male', '1971-10-14', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Pengelolaan AP / AR', 'FAUZAL', NULL, NULL),
('3095', '7198263', 'DONI YULWANDRI', 'IV', 'Male', '1971-02-02', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'DONI.YULWANDRI', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('3096', '7198274', 'YONISMA PUTRA, ST.', 'IV', '', '1971-06-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YONISMA.PUTRA', NULL, NULL),
('3097', '7198286', 'SYAFRIN', 'PEL I', 'Male', '1971-04-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'SYAFRIN', NULL, NULL),
('3099', '7199031', 'GUSMAN', 'III', 'Male', '1971-08-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'GUSMAN', NULL, NULL),
('3100', '7199032', 'TASWIN', 'IV', 'Male', '1971-09-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'TASWIN', NULL, NULL),
('3101', '7199034', 'WAHDINI', 'IV', 'Male', '1971-11-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'WAHDINI', NULL, NULL),
('3102', '7199046', 'ADENIL MUZARWI', 'IV', 'Male', '1971-01-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ADENIL.MUZARWI', NULL, NULL),
('3103', '7199070', 'FERDIANTO', 'IV', 'Male', '1971-03-09', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'FERDIANTO', NULL, NULL),
('3104', '7199078', 'SURYADI WIZAR, ST.', 'II', '', '1971-05-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SURYADI.WIZAR', NULL, NULL),
('3105', '7199081', 'SURYAT HANDOKO, ST., MT.', 'II', '', '1971-02-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SURYAT.HANDOKO', NULL, NULL),
('3106', '7199090', 'YANTRI WENDI, SE.', 'III', 'Male', '1971-12-29', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'YANTRI.WENDI', NULL, NULL),
('3107', '7202003', 'RUDI WIJAYA', 'PEL II', 'Male', '1972-02-02', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'RUDI.WIJAYA', NULL, NULL),
('3108', '7207002', 'MUHAMMAD ARIEF ASYARI', 'IV', 'Male', '1972-02-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'MUHAMMAD.ASYARI', NULL, NULL),
('3109', '7207010', 'RICARD', 'PEL I', 'Male', '1972-09-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'RICARD', NULL, NULL),
('3110', '7207015', 'ZULBAHRI', 'PEL I', 'Male', '1972-04-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'ZULBAHRI', NULL, NULL),
('3112', '7207166', 'DENNY CHANDRA, ST.', 'PEL I', 'Male', '1972-05-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DENNY.CHANDRA', NULL, NULL),
('3113', '7207175', 'MARWILIS', 'PEL I', 'Male', '1972-03-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'MARWILIS', NULL, NULL),
('3114', '7207223', 'IKHSAN SETIAWAN, ST.', 'PEL I', 'Male', '1972-09-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'IKHSAN.SETIAWAN', NULL, NULL),
('3115', '7298028', 'AFRIZAL', 'IV', 'Male', '1972-08-24', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'AFRIZAL.3115', NULL, NULL),
('3116', '7298046', 'MUSPARI', 'IV', 'Male', '1972-02-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'MUSPARI', NULL, NULL),
('3117', '7298048', 'SUSENO NUGROHO', 'PEL I', '', '1972-04-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUSENO.NUGROHO', NULL, NULL),
('3118', '7298052', 'FIRDAUS HASNUR', 'IV', '', '1972-04-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIRDAUS.HASNUR', NULL, NULL),
('3119', '7298059', 'MARLIUSMAN', 'IV', 'Male', '1972-03-06', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'MARLIUSMAN', NULL, NULL),
('3120', '7298070', 'EFRIALDIARMI', 'IV', 'Male', '1972-04-04', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'EFRIALDIARMI', NULL, NULL),
('3121', '7298074', 'ALKAMEN', 'PEL I', 'Male', '1972-03-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'ALKAMEN', NULL, NULL),
('3123', '7298079', 'MASRUL IDRIS', 'III', 'Male', '1972-10-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'MASRUL.IDRIS', NULL, NULL),
('3124', '7298086', 'ADE CENDRA', 'PEL I', 'Male', '1972-02-20', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'ADE.CENDRA', NULL, NULL),
('3125', '7298099', 'JEFRI ANTONI, SE., MM.', 'IV', 'Male', '1972-06-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'JEFRI.ANTONI', NULL, NULL),
('3126', '7298103', 'HERMAN', 'IV', 'Male', '1972-07-10', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'HERMAN.3126', NULL, NULL),
('3127', '7298117', 'YUHARZI FAUZI', 'PEL I', 'Male', '1972-04-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'YUHARZI.FAUZI', NULL, NULL),
('3128', '7298130', 'ARMADIANTO', 'IV', 'Male', '1972-10-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'ARMADIANTO', NULL, NULL),
('3129', '7298132', 'SUPRIADI, ST.', 'IV', 'Male', '1972-02-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'SUPRIADI.3129', NULL, NULL),
('3130', '7298162', 'IBRAR, ST.', 'IV', 'Male', '1972-09-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'IBRAR', NULL, NULL),
('3131', '7298177', 'ABDUL ARIF, S.Pd.', 'IV', '', '1972-09-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ABDUL.ARIF', NULL, NULL),
('3132', '7298241', 'ALDIWARMAN, ST.', 'IV', 'Male', '1972-10-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'ALDIWARMAN', NULL, NULL),
('3133', '7298257', 'MUHAMMAD SALMAN', 'PEL I', 'Male', '1972-09-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'MUHAMMAD.SALMAN', NULL, NULL),
('3134', '7298273', 'MARDIANTO', 'PEL I', 'Male', '1972-03-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'MARDIANTO', NULL, NULL),
('3135', '7298282', 'BENI ALDI SAKTI', 'IV', '', '1972-01-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BENI.SAKTI', NULL, NULL),
('3136', '7298283', 'ARAHIM', 'III', 'Male', '1972-08-19', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'ARAHIM', NULL, NULL),
('3137', '7298302', 'ERADANTES EKA PUTERA', 'IV', 'Male', '1972-05-14', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'ERADANTES.PUTERA', NULL, NULL),
('3138', '7298305', 'SYAHRIL EFENDI', 'IV', 'Male', '1972-06-26', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Kebersihan', 'SYAHRIL.EFENDI', NULL, NULL),
('3140', '7299016', 'ABD RAHMAN', 'IV', 'Male', '1972-05-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ABD.RAHMAN3140', NULL, NULL),
('3142', '7299030', 'ARMEN JUNAIDI, ST.', 'III', '', '1972-06-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARMEN.JUNAIDI', NULL, NULL),
('3143', '7299042', 'DONI SUHARTO', 'PEL I', 'Male', '1972-07-19', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'DONI.SUHARTO', NULL, NULL),
('3144', '7299048', 'HELFANTRI', 'III', 'Male', '1972-05-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'HELFANTRI', NULL, NULL),
('3145', '7299052', 'CHRISTOPEL WIBISONO', 'IV', 'Male', '1972-11-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'CHRISTOPEL.WIBISONO', NULL, NULL),
('3146', '7299071', 'YANISALDI', 'IV', 'Male', '1972-01-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'YANISALDI', NULL, NULL),
('3147', '7299072', 'FIRDAUS', 'III', 'Male', '1972-03-23', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'FIRDAUS.LENIN', NULL, NULL),
('3148', '7299094', 'DASRIL, SE., Akt.', 'II', 'Male', '1972-04-02', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Evaluasi Kinerja', 'DASRIL', NULL, NULL),
('3149', '7301016', 'SYAFRIL', 'PEL II', '', '1973-12-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SYAFRIL.3149', NULL, NULL),
('3151', '7302002', 'BAROKAH', 'PEL I', 'Male', '1973-06-16', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'BAROKAH', NULL, NULL),
('3152', '7302005', 'EDWIN, SE., Akt.', 'II', 'Male', '1973-11-23', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'Kary. Ditugaskan ke PT Igasar', 'EDWIN.3152', NULL, NULL),
('3153', '7302022', 'THOMY HAMPRI YANDY, S.Kom.', 'III', 'Male', '1973-06-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'THOMY.HAMPRIYANDY', NULL, NULL),
('3154', '7302023', 'RULI RAHMADI, S.Kom.', 'PEL I', 'Male', '1973-07-24', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'RULI.RAHMADI', NULL, NULL),
('3155', '7307038', 'JUFRI NALDI', 'IV', 'Male', '1973-01-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'JUFRI.NALDI', NULL, NULL),
('3156', '7307200', 'SURYA ADIWINATA', 'PEL I', 'Male', '1973-06-30', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'SURYA.ADIWINATA', NULL, NULL),
('3157', '7307210', 'EDI FAHRIZAL, SE.', 'PEL I', 'Male', '1973-07-01', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Bina Lingkungan', 'EDI.FAHRIZAL', NULL, NULL),
('3158', '7398003', 'NOVENDRI IDRUS', 'IV', 'Male', '1973-11-24', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'NOVENDRI.IDRUS', NULL, NULL),
('3159', '7398013', 'HENDRIZAL', 'IV', 'Male', '1973-08-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'HENDRIZAL', NULL, NULL),
('3160', '7398014', 'CANDRA FAUZI', 'III', 'Male', '1973-06-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'CANDRA.FAUZI', NULL, NULL),
('3161', '7398022', 'RIDWAN', 'IV', 'Male', '1973-10-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'RIDWAN.3161', NULL, NULL),
('3162', '7398038', 'SYAFRIADI', 'IV', '', '1973-03-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SYAFRIADI.3162', NULL, NULL),
('3163', '7398068', 'DODI HENDRIKO', 'IV', 'Male', '1973-06-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'DODI.HENDRIKO', NULL, NULL),
('3164', '7398075', 'WARDI', 'PEL I', 'Male', '1973-03-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'WARDI.3164', NULL, NULL),
('3165', '7398080', 'AL HARIS', 'IV', 'Male', '1973-07-30', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'AL.HARIS', NULL, NULL),
('3166', '7398126', 'YASRIZAL', 'IV', 'Male', '1973-08-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'YASRIZAL.3166', NULL, NULL),
('3167', '7398134', 'GATOT HERI SANTOSO', 'PEL I', '', '1973-06-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'GATOT.SANTOSO', NULL, NULL),
('3168', '7398140', 'JUNAIDI N', 'IV', 'Male', '1973-04-24', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'JUNAIDI.N', NULL, NULL),
('3170', '7398151', 'AMRIL NURMAN', 'IV', 'Male', '1973-05-01', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'AMRIL.NURMAN', NULL, NULL),
('3171', '7398155', 'YARTONI MAISON', 'IV', 'Male', '1973-04-01', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'YARTONI.MAISON', NULL, NULL),
('3172', '7398160', 'MUHAMMAD IKBAL', 'IV', 'Male', '1973-07-22', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'MUHAMMAD.IKBAL', NULL, NULL),
('3173', '7398163', 'ZULMAYEDI', 'PEL I', '', '1973-07-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZULMAYEDI', NULL, NULL),
('3174', '7398172', 'ZEINIAL', 'IV', 'Male', '1973-11-07', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'ZEINIAL', NULL, NULL),
('3175', '7398188', 'AMRIZAL', 'IV', 'Male', '1973-08-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'AMRIZAL.3175', NULL, NULL),
('3176', '7398193', 'WEY AKHDIAT APPEL, ST.', 'III', 'Male', '1973-09-15', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'WEY.APPEL', NULL, NULL),
('3177', '7398203', 'ERWIN MAYUNDA, S.Pd.', 'III', 'Male', '1973-07-19', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'ERWIN.MAYUNDA', NULL, NULL),
('3178', '7398207', 'JAMILUS', 'IV', 'Male', '1973-08-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'JAMILUS', NULL, NULL),
('3179', '7398211', 'SYAFRIADI', 'PEL I', 'Male', '1973-06-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'SYAFRIADI.3179', NULL, NULL),
('3180', '7398212', 'APRISAL', 'PEL I', 'Male', '1973-04-22', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'APRISAL', NULL, NULL),
('3181', '7398216', 'AKMAL, S. Mn, MM.', 'IV', 'Male', '1973-11-26', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'AKMAL.3181', NULL, NULL),
('3182', '7398221', 'HERIYANTO, ST.', 'III', 'Male', '1973-08-27', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Kebersihan', 'HERIYANTO', NULL, NULL),
('3183', '7398224', 'YENDI NOVRI, S.Pt.', 'IV', 'Male', '1973-11-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'YENDI.NOVRI', NULL, NULL),
('3184', '7398229', 'YANDRIL', 'IV', 'Male', '1973-05-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YANDRIL', NULL, NULL),
('3185', '7398238', 'ANDI PUTRA', 'PEL I', '', '1973-03-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDI.PUTRA', NULL, NULL),
('3186', '7398240', 'NISFA NETRI, ST.', 'IV', 'Female', '1973-09-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'NISFA.NETRI', NULL, NULL),
('3187', '7398243', 'FAKHRIZAL', 'IV', 'Male', '1973-05-15', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'FAKHRIZAL', NULL, NULL),
('3188', '7398252', 'IRSON', 'IV', 'Male', '1973-03-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'IRSON', NULL, NULL),
('3191', '7398261', 'IDRIS, S.Sos.', 'III', 'Male', '1973-07-27', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'IDRIS', NULL, NULL),
('3193', '7398265', 'DSHAAF', 'IV', 'Male', '1973-10-18', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'DSHAAF', NULL, NULL),
('3194', '7398267', 'NOKI ENDRISON', 'IV', 'Male', '1973-11-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Pengelolaan Overhaul', 'NOKI.ENDRISON', NULL, NULL),
('3195', '7399006', 'AWALUDDIN', 'III', '', '1973-07-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AWALUDDIN.3195', NULL, NULL),
('3196', '7399014', 'IFZAL, ST.', 'IV', 'Male', '1973-11-30', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'IFZAL', NULL, NULL),
('3197', '7399015', 'RAMA SANOTO', 'IV', '', '1973-10-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAMA.SANOTO', NULL, NULL),
('3198', '7399017', 'FAUZUL AZIS S, ST.', 'III', 'Male', '1973-02-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'FAUZUL.AZIS', NULL, NULL),
('3199', '7399021', 'ISMARDI', 'PEL I', 'Male', '1973-12-16', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'ISMARDI', NULL, NULL),
('3201', '7399035', 'INDRA NASRUN', 'IV', '', '1973-02-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'INDRA.NASRUN', NULL, NULL),
('3202', '7399036', 'ARTIS MUZARBI', 'IV', 'Male', '1973-03-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'ARTIS.MUZARBI', NULL, NULL),
('3203', '7399039', 'YEVERSON', 'III', 'Male', '1973-02-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YEVERSON', NULL, NULL),
('3204', '7399043', 'RONNY KUSWARA', 'IV', 'Male', '1973-03-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'RONNY.KUSWARA', NULL, NULL),
('3205', '7399047', 'HARERA SASTANEDA', 'PEL I', 'Male', '1973-06-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HARERA.SASTANEDA', NULL, NULL),
('3206', '7399053', 'ONDRI R, ST.', 'IV', 'Male', '1973-04-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ONDRI.R', NULL, NULL),
('3207', '7399073', 'YENDRA ABADI, ST.', 'IV', '', '1973-06-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YENDRA.ABADI', NULL, NULL),
('3208', '7399079', 'DORCE YUNIRSYAM, ST., MEng.', 'II', 'Male', '1973-06-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DORCE.YUNIRSYAM', NULL, NULL),
('3209', '7399084', 'RUKY HENDRA, SE., Akt., MM.', 'II', 'Male', '1973-11-27', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Unit Keuangan', 'RUKY.HENDRA', NULL, NULL),
('3210', '7399088', 'ALFIN', 'II', '', '1973-08-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALFIN', NULL, NULL),
('3211', '7399089', 'MUHAMMAD IRWAN MARS, SE.', 'II', 'Male', '1973-05-25', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'MUHAMMAD.MARS', NULL, NULL),
('3212', '7400024', 'PEBRIANTO', 'IV', 'Male', '1974-02-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'PEBRIANTO', NULL, NULL),
('3213', '7400025', 'MHD GUSNAIDI, ST., MM.', 'III', 'Male', '1974-08-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'MHD.GUSNAIDI', NULL, NULL),
('3214', '7401010', 'ZULKARNAIN Z', 'PEL I', 'Male', '1974-11-23', 'Semen Padang Subsidiaries', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'ZULKARNAIN.Z', NULL, NULL),
('3215', '7402016', 'RIDWAN MUCHTAR, ST., MM.', 'II', 'Male', '1974-04-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Unit Inspeksi Pemeliharaan & PGOH', 'RIDWAN.MUCHTAR', NULL, NULL),
('3216', '7402018', 'ZULKARNAEN, ST.', 'II', 'Male', '1974-10-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'ZULKARNAEN', NULL, NULL),
('3217', '7402029', 'JOHN FITZGERALD NURDIN', 'IV', 'Male', '1974-11-26', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'JOHN.NURDIN', NULL, NULL),
('3218', '7402033', 'SLAMET SUNARTO, S.Kom.', 'III', 'Male', '1974-03-03', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Manajemen Aset', 'SLAMET.SUNARTO', NULL, NULL),
('3219', '7405001', 'RINOLD THAMRIN, SE., Akt., MM.', 'II', 'Male', '1974-05-06', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Unit CSR', 'RINOLD.THAMRIN', NULL, NULL),
('3220', '7407008', 'ASEP SUPRIATNA', 'IV', 'Male', '1974-12-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ASEP.SUPRIATNA', NULL, NULL),
('3221', '7407014', 'EKA SYAHRAVI', 'PEL I', 'Male', '1974-01-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'EKA.SYAHRAVI', NULL, NULL),
('3222', '7407016', 'SYOFIAN B', 'PEL I', 'Male', '1974-08-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'SYOFIAN.B', NULL, NULL),
('3223', '7407027', 'WENDRISMAN', 'PEL I', 'Male', '1974-02-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'WENDRISMAN', NULL, NULL),
('3224', '7407035', 'ANDRIA RUKMA', 'IV', 'Male', '1974-08-21', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'ANDRIA.RUKMA', NULL, NULL),
('3225', '7407051', 'JHON NIKO', 'IV', 'Male', '1974-07-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'JHON.NIKO', NULL, NULL),
('3226', '7407118', 'DIAN WAHYUDI, ST.', 'IV', 'Male', '1974-12-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'DIAN.WAHYUDI', NULL, NULL),
('3227', '7407138', 'IRWANDI', 'PEL I', 'Male', '1974-06-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'IRWANDI.3227', NULL, NULL),
('3228', '7407142', 'ZULNAIDI', 'IV', 'Male', '1974-06-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'ZULNAIDI', NULL, NULL),
('3229', '7407160', 'RUDI SYARIF', 'PEL I', 'Male', '1974-04-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'RUDI.SYARIF', NULL, NULL),
('3230', '7407181', 'NUARDI N', 'PEL I', 'Male', '1974-07-14', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'NUARDI.N', NULL, NULL),
('3231', '7407245', 'DONI BERNADI', 'PEL I', '', '1974-07-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DONI.BERNADI', NULL, NULL),
('3232', '7493009', 'FIONA INDRIANI', 'PEL I', '', '1974-03-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIONA.INDRIANI', NULL, NULL),
('3233', '7498008', 'SYAFRIYAL', 'PEL I', 'Male', '1974-08-28', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'SYAFRIYAL', NULL, NULL),
('3234', '7498023', 'YANUARDI', 'IV', 'Male', '1974-01-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'YANUARDI', NULL, NULL),
('3236', '7498045', 'DONRIZAL', 'IV', 'Male', '1974-10-04', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Kebersihan', 'DONRIZAL', NULL, NULL),
('3237', '7498051', 'HENDRY SURYA', 'IV', 'Male', '1974-12-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HENDRY.SURYA', NULL, NULL),
('3238', '7498056', 'AFRIZAL', 'IV', 'Male', '1974-04-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AFRIZAL.3238', NULL, NULL),
('3239', '7498064', 'FIRDAUS RAMSIS, ST.', 'IV', '', '1974-04-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIRDAUS.RAMSIS', NULL, NULL),
('3240', '7498114', 'ZULHERMAN', 'IV', 'Male', '1974-12-16', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'ZULHERMAN', NULL, NULL),
('3241', '7498121', 'ILYAS', 'PEL I', 'Male', '1974-08-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ILYAS.3241', NULL, NULL),
('3242', '7498127', 'TAFTAZANI, S. Mn', 'IV', 'Male', '1974-01-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'TAFTAZANI', NULL, NULL),
('3243', '7498129', 'AMRIZAL', 'IV', 'Male', '1974-09-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'AMRIZAL.3243', NULL, NULL),
('3244', '7498154', 'MOCHAMAD YAMAN', 'PEL I', '', '1974-07-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MOCHAMAD.YAMAN', NULL, NULL),
('3245', '7498158', 'YOKE GISKARD, ST.', 'III', 'Male', '1974-01-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YOKE.GISKARD', NULL, NULL),
('3246', '7498161', 'YOSSI DIENITA', 'IV', 'Female', '1974-07-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'YOSSI.DIENITA', NULL, NULL),
('3247', '7498169', 'NURWAN SP', 'III', '', '1974-01-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NURWAN', NULL, NULL),
('3248', '7498182', 'SUGENG HARTANTO', 'PEL I', 'Male', '1974-06-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'SUGENG.HARTANTO', NULL, NULL),
('3249', '7498195', 'DESRIANTO', 'IV', 'Male', '1974-12-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'DESRIANTO', NULL, NULL),
('3250', '7498196', 'FERIWARMAN', 'IV', 'Male', '1974-11-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'FERIWARMAN', NULL, NULL),
('3251', '7498200', 'AFRIWAN', 'IV', 'Male', '1974-09-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'AFRIWAN', NULL, NULL),
('3252', '7498204', 'SEIVEN RAHMAN', 'IV', 'Male', '1974-03-10', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'SEIVEN.RAHMAN', NULL, NULL),
('3254', '7498206', 'RINALDI, SE.', 'IV', 'Male', '1974-12-20', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'RINALDI.3254', NULL, NULL),
('3255', '7498213', 'DESRINAL RIVAI, SE., Akt.', 'IV', 'Male', '1974-09-07', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Manajemen Aset', 'DESRINAL.RIVAI', NULL, NULL),
('3256', '7498215', 'KHAIRIAL AZHAR, ST.', 'IV', 'Male', '1974-09-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'KHAIRIAL.AZHAR', NULL, NULL),
('3257', '7498219', 'ASRI FEBRI', 'IV', '', '1974-02-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ASRI.FEBRI', NULL, NULL),
('3258', '7498226', 'TATA, S. Pd, SE', 'III', '', '1974-01-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TATA.SPD', NULL, NULL),
('3259', '7498227', 'DEDDI ADRIANDI, SE., Akt.', 'II', '', '1974-08-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DEDDI.ADRIANDI', NULL, NULL),
('3260', '7498230', 'HELMIZAR', 'IV', 'Male', '1974-06-28', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'HELMIZAR', NULL, NULL),
('3261', '7498231', 'MAMAN ABDURAHMAN', 'IV', 'Male', '1974-04-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'MAMAN.ABDURAHMAN', NULL, NULL),
('3262', '7498235', 'RINALDI, SE.', 'IV', 'Male', '1974-04-29', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'RINALDI.3262', NULL, NULL),
('3263', '7498237', 'YUSUF EFENDI', 'IV', '', '1974-07-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YUSUF.EFENDI', NULL, NULL),
('3264', '7498244', 'ALHADY', 'IV', '', '1974-06-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALHADY', NULL, NULL),
('3265', '7498250', 'JUFRIAL', 'PEL I', '', '1974-05-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JUFRIAL.3265', NULL, NULL),
('3266', '7498255', 'AFRINALDI', 'IV', '', '1974-04-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AFRINALDI', NULL, NULL),
('3267', '7498256', 'ALJASMON', 'IV', '', '1974-04-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALJASMON', NULL, NULL),
('3268', '7498260', 'ZULFAHMI', 'IV', 'Male', '1974-08-30', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ZULFAHMI.3268', NULL, NULL),
('3269', '7498271', 'YASRIZAL', 'IV', '', '1974-06-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YASRIZAL', NULL, NULL),
('3270', '7498288', 'RUDI HANDOKO', 'III', 'Male', '1974-07-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'RUDI.HANDOKO', NULL, NULL),
('3271', '7498294', 'MULYANTO MUCHTAR', 'PEL III', 'Male', '1974-05-20', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'MULYANTO.MUCHTAR', NULL, NULL),
('3272', '7499003', 'IKHSAN KAMIL', 'III', 'Male', '1974-05-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'IKHSAN.KAMIL', NULL, NULL),
('3273', '7499005', 'WAN SETIAWAN', 'III', 'Male', '1974-01-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'WAN.SETIAWAN', NULL, NULL),
('3274', '7499007', 'BUDI CITRA', 'III', 'Male', '1974-06-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'BUDI.CITRA', NULL, NULL),
('3275', '7499009', 'YOPI ALEXANDRITO', 'IV', 'Male', '1974-06-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'YOPI.ALEXANDRITO', NULL, NULL),
('3276', '7499010', 'ALGAZALI, ST.', 'III', 'Male', '1974-06-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'ALGAZALI', NULL, NULL),
('3277', '7499011', 'HENDRIANTO, ST.', 'III', '', '1974-05-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENDRIANTO', NULL, NULL),
('3278', '7499012', 'DODY SUNATA, ST.', 'IV', 'Male', '1974-05-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DODY.SUNATA', NULL, NULL),
('3279', '7499013', 'HIPTOP KHAIRUL, ST.', 'III', 'Male', '1974-02-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'HIPTOP.KHAIRUL', NULL, NULL),
('3280', '7499018', 'ISMAR ADRIANI', 'IV', 'Male', '1974-01-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'ISMAR.ADRIANI', NULL, NULL),
('3281', '7499022', 'JAMARIS, ST.', 'IV', 'Male', '1974-09-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'JAMARIS', NULL, NULL),
('3282', '7499026', 'AHMAD SALAFI', 'IV', 'Male', '1974-10-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'AHMAD.SALAFI', NULL, NULL),
('3284', '7499037', 'DELVIYOLDI', 'III', 'Male', '1974-02-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'DELVIYOLDI', NULL, NULL),
('3285', '7499038', 'AZET PUTRA', 'III', 'Male', '1974-06-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'AZET.PUTRA', NULL, NULL),
('3286', '7499041', 'REZA MUCHTAR', 'IV', 'Male', '1974-04-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'REZA.MUCHTAR', NULL, NULL),
('3287', '7499044', 'APRIYAL, ST.', 'IV', 'Male', '1974-04-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'APRIYAL', NULL, NULL),
('3288', '7499050', 'YOHANNES', 'IV', 'Male', '1974-11-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'YOHANNES', NULL, NULL),
('3289', '7499051', 'SUJARMADI, ST.', 'IV', '', '1974-09-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUJARMADI', NULL, NULL),
('3290', '7499063', 'DAINURI', 'III', 'Male', '1974-08-04', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'DAINURI', NULL, NULL),
('3291', '7499065', 'JAMPUR', 'PEL I', 'Male', '1974-01-17', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'JAMPUR', NULL, NULL),
('3292', '7499068', 'SUBANDIYO', 'IV', 'Male', '1974-12-02', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'SUBANDIYO', NULL, NULL),
('3293', '7499086', 'KHAIRUL SYAM KURNIAWAN', 'III', '', '1974-07-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'KHAIRUL.KURNIAWAN', NULL, NULL),
('3294', '7501014', 'HUSAINI', 'IV', '', '1975-01-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HUSAINI', NULL, NULL),
('3295', '7502013', 'ISKANDAR SAMUDRA TAQWA, ST.', 'II', '', '1975-07-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ISKANDAR.TAQWA', NULL, NULL),
('3296', '7502015', 'NELVI IRAWATI S.Si, MT.', 'II', 'Female', '1975-06-26', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'NELVI.IRAWATI', NULL, NULL),
('3297', '7505012', 'IRF\'AK IZMA RI, ST.', 'II', 'Male', '1975-02-17', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'IRFAK.IZMA', NULL, NULL),
('3298', '7505021', 'ERICK REZA ALANDRI, ST.', 'II', 'Male', '1975-11-07', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Unit WHRPG & Utilitas', 'ERICK.ALANDRI', NULL, NULL),
('3299', '7507004', 'MARZALI', 'IV', 'Male', '1975-09-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'MARZALI', NULL, NULL),
('3300', '7507006', 'DARMAWEL', 'IV', 'Male', '1975-12-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'DARMAWEL', NULL, NULL),
('3301', '7507020', 'HENDRA WAYAN', 'IV', 'Male', '1975-08-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'HENDRA.WAYAN', NULL, NULL),
('3302', '7507034', 'ROBY JENGRI', 'PEL I', 'Male', '1975-04-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'ROBY.JENGRI', NULL, NULL),
('3303', '7507040', 'MARYENTI, SE.', 'IV', '', '1975-03-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MARYENTI', NULL, NULL),
('3304', '7507064', 'BUDI RAHMAD, ST.', 'IV', 'Male', '1975-03-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'BUDI.RAHMAD', NULL, NULL),
('3305', '7507115', 'BOBBY SUHARLAH LATI', 'IV', 'Male', '1975-01-29', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'BOBBY.LATI', NULL, NULL),
('3306', '7507129', 'MAIFIDRA', 'IV', 'Male', '1975-05-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'MAIFIDRA', NULL, NULL),
('3307', '7507135', 'SUBRIANTO', 'IV', 'Male', '1975-10-07', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Hukum', 'SUBRIANTO', NULL, NULL),
('3308', '7507182', 'RUDI ASMI', 'PEL I', 'Male', '1975-03-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'RUDI.ASMI', NULL, NULL),
('3309', '7507228', 'ARMAINI', 'PEL I', 'Male', '1975-04-28', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'ARMAINI', NULL, NULL),
('3310', '7598044', 'BOBBY WIRDHANA', 'PEL I', '', '1975-03-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BOBBY.WIRDHANA', NULL, NULL),
('3311', '7598066', 'ZAIFUL', 'III', '', '1975-06-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZAIFUL', NULL, NULL),
('3312', '7598093', 'IPENRIZAL S', 'IV', 'Male', '1975-06-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'IPENRIZAL.S', NULL, NULL),
('3313', '7598098', 'EMIL RIDHA, ST.', 'III', '', '1975-09-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EMIL.RIDHA', NULL, NULL),
('3314', '7598133', 'ALIF YUZA, S.TP', 'IV', '', '1975-01-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALIF.YUZA', NULL, NULL),
('3315', '7598143', 'MEDYAWARMAN, ST.', 'IV', 'Male', '1975-01-15', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'MEDYAWARMAN', NULL, NULL),
('3316', '7598146', 'YULMULYADI', 'IV', 'Male', '1975-08-23', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'YULMULYADI', NULL, NULL),
('3317', '7598159', 'JHIM REDI, ST., MM.', 'III', 'Male', '1975-02-02', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'JHIM.REDI', NULL, NULL),
('3318', '7598167', 'HENDRA', 'IV', 'Male', '1975-10-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'HENDRA.3318', NULL, NULL),
('3319', '7598176', 'AIDIL ISWANDI', 'IV', '', '1975-12-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AIDIL.ISWANDI', NULL, NULL),
('3320', '7598178', 'JONSON SINAGA', 'PEL I', '', '1975-01-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JONSON.SINAGA', NULL, NULL),
('3321', '7598179', 'YANTANAMAL', 'III', '', '1975-03-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YANTANAMAL', NULL, NULL),
('3322', '7598181', 'DERI AFIANTO', 'IV', 'Male', '1975-09-17', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'DERI.AFIANTO', NULL, NULL),
('3323', '7598185', 'AZMI INDRA', 'PEL I', 'Male', '1975-07-03', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'AZMI.INDRA', NULL, NULL),
('3324', '7598187', 'WISMALDI', 'III', 'Male', '1975-11-10', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'WISMALDI', NULL, NULL),
('3326', '7598202', 'JUNAIDI', 'IV', 'Male', '1975-06-17', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'JUNAIDI.3326', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('3327', '7598222', 'INDRA BAHAR', 'IV', 'Male', '1975-05-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'INDRA.BAHAR', NULL, NULL),
('3328', '7598228', 'GUSWANDI, ST.', 'III', 'Male', '1975-08-17', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'GUSWANDI', NULL, NULL),
('3329', '7598232', 'KIKI WARLANSYAH', 'III', 'Male', '1975-06-07', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'KIKI.WARLANSYAH', NULL, NULL),
('3330', '7598233', 'JONI HERMAN, ST.', 'IV', 'Male', '1975-11-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'JONI.HERMAN', NULL, NULL),
('3331', '7598245', 'FERIS NOVEL', 'IV', 'Male', '1975-04-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'FERIS.NOVEL', NULL, NULL),
('3332', '7598249', 'BENNY DWI PUTRA, ST.', 'III', 'Male', '1975-07-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'BENNY.PUTRA', NULL, NULL),
('3333', '7598251', 'ZAMRIS', 'III', 'Male', '1975-03-05', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'ZAMRIS', NULL, NULL),
('3334', '7599002', 'HERNES, ST.', 'III', 'Male', '1975-04-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'HERNES', NULL, NULL),
('3335', '7599008', 'MUHARMANSYAH, AMD.', 'IV', 'Male', '1975-01-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'MUHARMANSYAH', NULL, NULL),
('3336', '7599019', 'MAMAN WAHYUDI', 'IV', 'Male', '1975-09-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'MAMAN.WAHYUDI', NULL, NULL),
('3337', '7599020', 'DARWAS, ST.', 'IV', '', '1975-08-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DARWAS', NULL, NULL),
('3338', '7599033', 'YULI ANANTO', 'III', '', '1975-07-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YULI.ANANTO', NULL, NULL),
('3339', '7599040', 'FATHUL MAUSIL', 'III', 'Male', '1975-06-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'FATHUL.MAUSIL', NULL, NULL),
('3340', '7599045', 'HAMDI AYUSSA, ST.', 'III', '', '1975-03-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HAMDI.AYUSSA', NULL, NULL),
('3341', '7599049', 'DONY PUTRA MULIA, ST.', 'III', 'Male', '1975-02-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'DONY.MULIA', NULL, NULL),
('3342', '7599060', 'SARMAN DURMALAY, ST.', 'III', 'Male', '1975-03-24', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. AFR & Material Ketiga', 'SARMAN.DURMALAY', NULL, NULL),
('3343', '7599074', 'AGUNG JOKO PRASETIYO', 'III', 'Male', '1975-01-14', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Hubungan Institusional', 'AGUNG.PRASETIYO', NULL, NULL),
('3344', '7601013', 'AMIR HAMZAH', 'PEL I', 'Male', '1976-08-23', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'AMIR.HAMZAH', NULL, NULL),
('3345', '7601015', 'AGUS RIANTO', 'III', '', '1976-08-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AGUS.RIANTO', NULL, NULL),
('3346', '7602006', 'APRISON IRSYAM, SE., Akt.', 'I', 'Male', '1976-04-01', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke DPSP', 'Kary. Ditugaskan ke DPSP', 'Kary. Ditugaskan ke DPSP', 'APRISON.IRSYAM', NULL, NULL),
('3347', '7602008', 'TINO DARUSMAN, SE., MBA', 'I', '', '1976-09-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TINO.DARUSMAN', NULL, NULL),
('3348', '7602010', 'ANDRIA DELFA, ST.', 'I', 'Male', '1976-11-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Department of Mining & Raw Mtrl Mgt', 'Departemen Tambang & Pengelolaan Bahan Baku', 'ANDRIA.DELFA', NULL, NULL),
('3350', '7602020', 'HASMERU HASLER, ST., MM.', 'II', 'Male', '1976-08-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'HASMERU.HASLER', NULL, NULL),
('3351', '7602028', 'RONI MAHMUDI, S.Kom.', 'III', '', '1976-01-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Roni.Mahmudi', NULL, NULL),
('3352', '7602030', 'ALEXANDER DIRGANTARA, S. Kom, SE', 'III', '', '1976-11-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALEXANDER.DIRGANTARA', NULL, NULL),
('3353', '7602031', 'FERRY FUADI, S.Kom.', 'III', 'Male', '1976-08-31', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'FERRY.FUADI', NULL, NULL),
('3354', '7607028', 'BASRIZAL', 'PEL I', 'Male', '1976-09-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'BASRIZAL', NULL, NULL),
('3355', '7607036', 'INDRA PUTRA', 'PEL I', 'Male', '1976-10-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'INDRA.PUTRA3355', NULL, NULL),
('3356', '7607037', 'IMRISAL', 'IV', 'Male', '1976-06-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'IMRISAL', NULL, NULL),
('3357', '7607060', 'AKHMAD BASTARI, ST.', 'IV', '', '1976-01-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AKHMAD.BASTARI', NULL, NULL),
('3358', '7607091', 'ROSELINA ROSLAN, AMD.', 'IV', 'Female', '1976-09-06', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'ROSELINA.ROSLAN', NULL, NULL),
('3359', '7607106', 'ADI PRAMAYUL', 'IV', 'Male', '1976-07-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ADI.PRAMAYUL', NULL, NULL),
('3360', '7607179', 'FERNANDO DA COSTA', 'PEL I', 'Male', '1976-12-05', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'FERNANDO.COSTA', NULL, NULL),
('3361', '7607226', 'DELFI SYUKHRI, ST.', 'PEL I', 'Male', '1976-10-07', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'DELFI.SYUKHRI', NULL, NULL),
('3362', '7698029', 'SYAFRIAL', 'IV', '', '1976-09-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SYAFRIAL.3362', NULL, NULL),
('3363', '7698141', 'ZUHENDRI, ST.', 'III', 'Male', '1976-02-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ZUHENDRI', NULL, NULL),
('3364', '7698150', 'NASRUL', 'PEL I', '', '1976-07-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NASRUL.3364', NULL, NULL),
('3365', '7698153', 'ENDRAYANTO, SE., MM.', 'IV', 'Male', '1976-05-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'ENDRAYANTO', NULL, NULL),
('3366', '7698156', 'NASRUL NASIR', 'IV', 'Male', '1976-10-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'NASRUL.NASIR', NULL, NULL),
('3367', '7698165', 'ACHIARMAN, SE., MM.', 'IV', 'Male', '1976-12-23', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'ACHIARMAN', NULL, NULL),
('3368', '7698168', 'ARMEN', 'PEL I', 'Male', '1976-09-29', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ARMEN', NULL, NULL),
('3369', '7698171', 'HENDRI RISMAN', 'III', 'Male', '1976-03-18', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Perencanaan Produksi & QA Kantong', 'HENDRI.RISMAN', NULL, NULL),
('3370', '7698174', 'PETER SAZLI', 'III', 'Male', '1976-08-12', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'PETER.SAZLI', NULL, NULL),
('3371', '7698175', 'SUKRI', 'IV', '', '1976-01-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUKRI.3371', NULL, NULL),
('3372', '7698190', 'ROBBY ELNANDO, ST.', 'IV', '', '1976-12-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROBBY.ELNANDO', NULL, NULL),
('3373', '7698194', 'PARYONO', 'IV', 'Male', '1976-05-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'PARYONO', NULL, NULL),
('3374', '7698201', 'AMRULLAH', 'IV', 'Male', '1976-06-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'AMRULLAH', NULL, NULL),
('3375', '7698208', 'ANTON WIJAYA, SE.', 'PEL I', '', '1976-07-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANTON.WIJAYA', NULL, NULL),
('3376', '7698209', 'SUHENDRI', 'PEL I', 'Male', '1976-12-16', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'SUHENDRI', NULL, NULL),
('3377', '7698210', 'EFFENDI', 'IV', 'Male', '1976-04-14', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'EFFENDI', NULL, NULL),
('3378', '7698214', 'JUNAIDI', 'IV', 'Male', '1976-06-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'JUNAIDI.3378', NULL, NULL),
('3379', '7698218', 'JANWARMAN', 'IV', 'Male', '1976-01-05', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'JANWARMAN', NULL, NULL),
('3380', '7698236', 'DESMIANTO, SE.', 'III', '', '1976-12-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DESMIANTO', NULL, NULL),
('3381', '7698239', 'EDWARD', 'IV', 'Male', '1976-01-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'EDWARD', NULL, NULL),
('3382', '7698242', 'M UDRIZAL', 'IV', 'Male', '1976-05-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'M.UDRIZAL', NULL, NULL),
('3383', '7698246', 'DODY ANDRI', 'IV', 'Male', '1976-01-05', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'DODY.ANDRI', NULL, NULL),
('3384', '7699024', 'REFVAN NANDRA', 'IV', 'Male', '1976-08-28', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'REFVAN.NANDRA', NULL, NULL),
('3385', '7699025', 'WERI SASTRA', 'PEL I', 'Male', '1976-06-24', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'WERI.SASTRA', NULL, NULL),
('3386', '7699027', 'JEFRI ANTONI', 'IV', 'Male', '1976-01-02', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'JEFRI.ANTONI3386', NULL, NULL),
('3387', '7699056', 'JASRIADI, ST.', 'IV', '', '1976-05-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JASRIADI', NULL, NULL),
('3388', '7699057', 'RAHMAD PUTRA', 'IV', 'Male', '1976-08-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'RAHMAD.PUTRA', NULL, NULL),
('3389', '7699061', 'AFRI MAWARDI', 'IV', '', '1976-04-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AFRI.MAWARDI', NULL, NULL),
('3390', '7699064', 'JONRIZAL, ST.', 'PEL I', 'Male', '1976-01-02', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'JONRIZAL', NULL, NULL),
('3391', '7700011', 'A M REZA, ST.', 'III', '', '1977-06-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'M.REZA', NULL, NULL),
('3392', '7700017', 'JANUMARINOS, SE.', 'IV', 'Male', '1977-01-09', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'JANUMARINOS', NULL, NULL),
('3393', '7700022', 'AFRIZAL', 'IV', 'Male', '1977-01-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'AFRIZAL.3393', NULL, NULL),
('3394', '7701012', 'KUSDIYANTO', 'PEL I', '', '1977-03-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'KUSDIYANTO', NULL, NULL),
('3395', '7702017', 'MARDIAN, ST., MM.', 'II', '', '1977-03-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MARDIAN', NULL, NULL),
('3396', '7702027', 'INDRA NOFIANDI', 'III', '', '1977-11-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'INDRA.NOFIANDI', NULL, NULL),
('3397', '7707003', 'ARMUNANTO', 'PEL I', 'Male', '1977-03-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ARMUNANTO', NULL, NULL),
('3398', '7707009', 'TRI SUDARNO', 'PEL I', 'Male', '1977-06-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'TRI.SUDARNO', NULL, NULL),
('3399', '7707011', 'SAWONO', 'PEL I', 'Male', '1977-08-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'SAWONO', NULL, NULL),
('3400', '7707019', 'MARTOYO', 'PEL I', 'Male', '1977-03-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'MARTOYO', NULL, NULL),
('3401', '7707099', 'HENDRI SATRIA', 'IV', 'Male', '1977-09-01', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'HENDRI.SATRIA', NULL, NULL),
('3402', '7707140', 'RIDWAN', 'PEL I', 'Male', '1977-01-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'RIDWAN.3402', NULL, NULL),
('3403', '7707141', 'YUSRI', 'IV', 'Male', '1977-08-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'YUSRI', NULL, NULL),
('3404', '7707172', 'NOVIAN SISKA', 'PEL I', 'Male', '1977-11-04', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'NOVIAN.SISKA', NULL, NULL),
('3405', '7707191', 'SVEND PRI REFOLVER', 'PEL II', 'Male', '1977-09-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'SVEND.REFOLVER', NULL, NULL),
('3406', '7707203', 'MUHAMMAD FADEL, ST.', 'IV', 'Male', '1977-07-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'MUHAMMAD.FADEL', NULL, NULL),
('3408', '7798135', 'RAHMAN SUJANA, ST.', 'IV', 'Male', '1977-03-27', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'RAHMAN.SUJANA', NULL, NULL),
('3409', '7798137', 'ARRY ADRYANTO, ST.', 'IV', 'Male', '1977-12-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ARRY.ADRYANTO', NULL, NULL),
('3410', '7798138', 'SUNOTO', 'IV', 'Male', '1977-11-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'SUNOTO.3410', NULL, NULL),
('3411', '7798142', 'EVIT ARORA', 'IV', 'Male', '1977-12-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'EVIT.ARORA', NULL, NULL),
('3412', '7798144', 'MUHAMMAD JAMIL', 'IV', 'Male', '1977-08-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'MUHAMMAD.JAMIL', NULL, NULL),
('3413', '7798145', 'DODI SUPRIADI', 'IV', 'Male', '1977-07-16', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'DODI.SUPRIADI', NULL, NULL),
('3414', '7798147', 'SATRIA WIWI, ST.', 'PEL I', '', '1977-05-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SATRIA.WIWI', NULL, NULL),
('3415', '7798152', 'ALDRI SONNI', 'III', '', '1977-06-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALDRI.SONNI', NULL, NULL),
('3416', '7798157', 'HARMONI', 'IV', 'Male', '1977-01-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'HARMONI', NULL, NULL),
('3417', '7798164', 'RIPOS MARDONA', 'IV', 'Male', '1977-01-19', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'RIPOS.MARDONA', NULL, NULL),
('3418', '7798166', 'ZULFADLI', 'IV', 'Male', '1977-05-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ZULFADLI.3418', NULL, NULL),
('3419', '7798173', 'FERINALDI', 'IV', 'Male', '1977-01-20', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'FERINALDI', NULL, NULL),
('3420', '7798180', 'JUFRIANTON', 'PEL I', 'Male', '1977-01-10', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'JUFRIANTON', NULL, NULL),
('3421', '7798183', 'ELMAS DOPRI', 'IV', '', '1977-01-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ELMAS.DOPRI', NULL, NULL),
('3422', '7798184', 'RONI SYAFRIANTON', 'IV', 'Male', '1977-07-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RONI.SYAFRIANTON', NULL, NULL),
('3423', '7798186', 'MICK DONALD', 'IV', 'Male', '1977-12-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'MICK.DONALD', NULL, NULL),
('3424', '7798197', 'NOVIAN HELMI, SE.', 'IV', 'Male', '1977-11-05', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'NOVIAN.HELMI', NULL, NULL),
('3426', '7798220', 'TONNY ELTER', 'III', 'Male', '1977-12-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'TONNY.ELTER', NULL, NULL),
('3427', '7798223', 'ZULVAWARMAN, ST.', 'III', 'Male', '1977-05-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ZULVAWARMAN', NULL, NULL),
('3428', '7798234', 'RONI CHANDRA', 'PEL I', 'Male', '1977-06-08', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'RONI.CHANDRA', NULL, NULL),
('3430', '7798248', 'AKHRILMAN HASAN', 'IV', 'Male', '1977-04-27', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'AKHRILMAN.HASAN', NULL, NULL),
('3431', '7798254', 'SHARMEN ASMAN', 'IV', 'Male', '1977-05-19', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'SHARMEN.ASMAN', NULL, NULL),
('3432', '7798266', 'JESRIWAL, SE.', 'PEL I', '', '1977-02-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JESRIWAL', NULL, NULL),
('3433', '7799054', 'PRINALDI', 'IV', 'Male', '1977-04-26', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'PRINALDI', NULL, NULL),
('3434', '7799059', 'EDIWANTO MALSI', 'IV', 'Male', '1977-04-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'EDIWANTO.MALSI', NULL, NULL),
('3435', '7799066', 'ADI ASMARA', 'IV', 'Male', '1977-03-24', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ADI.ASMARA', NULL, NULL),
('3436', '7799067', 'INDRIZAL', 'IV', 'Male', '1977-11-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'INDRIZAL', NULL, NULL),
('3437', '7802001', 'JOHNY SYAM, SE.', 'III', 'Male', '1978-01-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Perbendaharaan', 'JOHNY.SYAM', NULL, NULL),
('3438', '7802034', 'MUHAMMAD IKHWAN, ST.', 'IV', 'Male', '1978-11-15', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'MUHAMMAD.IKHWAN', NULL, NULL),
('3439', '7805003', 'ENDI ALTA, ST., MT.', 'II', 'Male', '1978-10-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Unit Pemeliharaan Mesin 1', 'ENDI.ALTA', NULL, NULL),
('3440', '7805013', 'GHUFRON VEBRIANTO G, ST., MM.', 'II', 'Male', '1978-03-10', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'GHUFRON.VEBRIANTO', NULL, NULL),
('3441', '7805016', 'MUHAMMAD IKHLAS, ST.', 'II', 'Male', '1978-07-11', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Unit Produksi Terak 2', 'MUHAMMAD.IKHLAS', NULL, NULL),
('3442', '7807001', 'GISTA HENDRIO PUSKA', 'PEL I', 'Male', '1978-08-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'GISTA.PUSKA', NULL, NULL),
('3443', '7807012', 'MARSUDI', 'IV', 'Male', '1978-03-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'MARSUDI', NULL, NULL),
('3444', '7807049', 'DASRIZAL ASRUL', 'PEL I', 'Male', '1978-10-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'DASRIZAL.ASRUL', NULL, NULL),
('3445', '7807057', 'YANUAR ADI PRASETYO', 'IV', '', '1978-01-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YANUAR.PRASETYO', NULL, NULL),
('3446', '7807061', 'ALEX ALAMSYAH', 'IV', 'Male', '1978-04-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'ALEX.ALAMSYAH', NULL, NULL),
('3447', '7807076', 'EKO SAPUTRA HARAHAP', 'PEL I', '', '1978-03-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EKO.HARAHAP', NULL, NULL),
('3448', '7807079', 'JULI FERNANDO', 'PEL I', 'Male', '1978-07-03', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'JULI.FERNANDO', NULL, NULL),
('3449', '7807098', 'ADI OKTAFIAN. ST', 'IV', 'Male', '1978-10-14', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'ADI.OKTAFIAN', NULL, NULL),
('3450', '7807109', 'ANDRI PANUSUNAN BATU BARA', 'IV', '', '1978-11-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDRI.BARA', NULL, NULL),
('3451', '7807151', 'UMMUL HASANAH', 'IV', 'Female', '1978-01-16', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'UMMUL.HASANAH', NULL, NULL),
('3452', '7807158', 'MAISON ISKANDAR', 'PEL I', 'Male', '1978-05-15', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'MAISON.ISKANDAR', NULL, NULL),
('3453', '7807190', 'EL FIRMANSYAH', 'PEL I', 'Male', '1978-06-13', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'EL.FIRMANSYAH', NULL, NULL),
('3454', '7807195', 'DONI DARWIS', 'PEL I', '', '1978-05-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DONI.DARWIS', NULL, NULL),
('3455', '7807201', 'YALDI', 'PEL II', 'Male', '1978-07-15', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Bina Lingkungan', 'YALDI', NULL, NULL),
('3456', '7807234', 'AZWAR BAKRI', 'PEL I', 'Male', '1978-10-26', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'AZWAR.BAKRI', NULL, NULL),
('3457', '7898128', 'YUSRIPAL', 'IV', '', '1978-03-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YUSRIPAL', NULL, NULL),
('3458', '7898136', 'ARFAN ASMARA PUTRA', 'III', '', '1978-04-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARFAN.PUTRA', NULL, NULL),
('3459', '7898139', 'HANELZI MAIDONI, ST.', 'IV', '', '1978-05-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HANELZI.MAIDONI', NULL, NULL),
('3460', '7898148', 'YANDRA FERI', 'IV', '', '1978-01-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YANDRA.FERI', NULL, NULL),
('3461', '7898191', 'DONALD T LUMBANRAJA', 'IV', '', '1978-04-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DONALD.LUMBANRAJA', NULL, NULL),
('3462', '7898192', 'SARDINAL, ST.', 'IV', 'Male', '1978-01-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'SARDINAL', NULL, NULL),
('3463', '7898258', 'ENRIZALDI', 'IV', '', '1978-10-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ENRIZALDI', NULL, NULL),
('3464', '7899055', 'IMRAN', 'PEL I', 'Male', '1978-11-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'IMRAN.3464', NULL, NULL),
('3465', '7899058', 'WITRAZONI, ST.', 'IV', 'Male', '1978-02-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'WITRAZONI', NULL, NULL),
('3466', '7899069', 'TAUFIQ HIDAYAT HAMDAN', 'IV', 'Male', '1978-03-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'TAUFIQ.HAMDAN', NULL, NULL),
('3467', '7905011', 'HERMAWAN ARDIYANTO, SE.', 'II', 'Male', '1979-10-03', 'Semen Padang Subsidiaries', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', 'HERMAWAN.ARDIYANTO', NULL, NULL),
('3468', '7905017', 'WIN BERNADINO, ST.', 'II', '', '1979-09-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WIN.BERNADINO', NULL, NULL),
('3469', '7907039', 'LILY JULIYATI', 'PEL I', 'Female', '1979-07-26', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'LILY.JULIYATI', NULL, NULL),
('3470', '7907047', 'ADRI KHAIR K, S.Si.', 'IV', 'Male', '1979-01-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'ADRI.KHAIR', NULL, NULL),
('3471', '7907119', 'EKO HARDIYANTO', 'PEL I', '', '1979-06-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EKO.HARDIYANTO', NULL, NULL),
('3472', '7907126', 'JANEDI', 'IV', 'Male', '1979-01-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'JANEDI', NULL, NULL),
('3473', '7907133', 'SALAHUDDIN AL AYU', 'IV', 'Male', '1979-05-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'SALAHUDDIN.AYU', NULL, NULL),
('3474', '7907137', 'HENGKI SAPUTRA', 'IV', 'Male', '1979-07-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'HENGKI.SAPUTRA', NULL, NULL),
('3475', '7907167', 'NAILUL HAMDANI, S.Sos.', 'PEL I', 'Male', '1979-09-16', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'NAILUL.HAMDANI', NULL, NULL),
('3477', '7907197', 'ABDI BUTSINATA, ST.', 'IV', 'Male', '1979-01-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'ABDI.BUTSINATA', NULL, NULL),
('3478', '7907235', 'FIRMA DORA', 'PEL II', '', '1979-11-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIRMA.DORA', NULL, NULL),
('3479', '7907246', 'AKBAR YUNAN, S.Pd.', 'PEL I', '', '1979-08-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AKBAR.YUNAN', NULL, NULL),
('3480', '7909017', 'HENDRA BAYU, ST.', 'II', 'Male', '1979-01-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'HENDRA.BAYU', NULL, NULL),
('3481', '7909020', 'FEBRI MAULANA, S.Si.', 'III', '', '1979-02-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FEBRI.MAULANA', NULL, NULL),
('3482', '7909038', 'IRWAN KARTADI PUTRA, ST.', 'II', 'Male', '1979-02-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Pengelolaan Overhaul', 'IRWAN.PUTRA', NULL, NULL),
('3483', '7999062', 'TEDDY ELDWIN, S.Sos.', 'PEL I', '', '1979-03-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TEDDY.ELDWIN', NULL, NULL),
('3484', '8002036', 'DENY HILMAN', 'IV', 'Male', '1980-07-14', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'DENY.HILMAN', NULL, NULL),
('3486', '8005014', 'YUNI EKA PUTRA, SE.', 'I', '', '1980-06-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YUNI.PUTRA', NULL, NULL),
('3487', '8005020', 'MAREZA HARLAN, SE., Ak., MM, CA.', 'I', 'Male', '1980-03-25', 'President Directorate', 'Internal Audit', 'Internal Audit', 'Internal Audit', 'MAREZA.HARLAN', NULL, NULL),
('3488', '8007007', 'JEFRI MAIRIZAL', 'IV', 'Male', '1980-05-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'JEFRIMAIRIZAL', NULL, NULL),
('3489', '8007017', 'RICOYAN PUTRA UTAMA', 'PEL I', 'Male', '1980-08-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'RICOYAN.UTAMA', NULL, NULL),
('3490', '8007018', 'DEFRI', 'PEL I', 'Male', '1980-05-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'DEFRI', NULL, NULL),
('3491', '8007022', 'HERU NURUDIN SHALLY, ST.', 'IV', 'Male', '1980-04-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'HERU.SHALLY', NULL, NULL),
('3492', '8007025', 'YUL EMRIZAL', 'PEL I', 'Male', '1980-07-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'YUL.EMRIZAL', NULL, NULL),
('3493', '8007030', 'YADI ISMONDRA, ST.', 'IV', 'Male', '1980-07-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'YADI.ISMONDRA', NULL, NULL),
('3494', '8007033', 'AFRIYANTO', 'IV', 'Male', '1980-04-18', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'AFRIYANTO', NULL, NULL),
('3495', '8007048', 'ANDRIAS ZAHDI MAHENDRA L, ST.', 'IV', 'Male', '1980-02-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'ANDRIAS.MAHENDRA', NULL, NULL),
('3496', '8007053', 'OGIE MARTADINATA', 'IV', 'Male', '1980-05-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'OGIE.MARTADINATA', NULL, NULL),
('3498', '8007083', 'INTAN LESTARI, SE.', 'IV', '', '1980-08-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'INTAN.LESTARI', NULL, NULL),
('3499', '8007085', 'REFFIWATI, SE.', 'IV', '', '1980-11-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'REFFIWATI', NULL, NULL),
('3500', '8007093', 'YULMIDAWATI', 'IV', '', '1980-02-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YULMIDAWATI', NULL, NULL),
('3501', '8007103', 'AKHIRMAN ARIF', 'PEL I', 'Male', '1980-01-03', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'AKHIRMAN.ARIF', NULL, NULL),
('3502', '8007105', 'ABDEL BAKRI', 'IV', 'Male', '1980-10-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ABDEL.BAKRI', NULL, NULL),
('3503', '8007117', 'SUHANDINATA, SE.', 'PEL I', '', '1980-11-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUHANDINATA', NULL, NULL),
('3504', '8007130', 'RAFRIZAL', 'PEL I', '', '1980-06-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAFRIZAL', NULL, NULL),
('3505', '8007163', 'JOSE APRIL', 'PEL I', '', '1980-04-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JOSE.APRIL', NULL, NULL),
('3506', '8007206', 'JUNALDO, ST.', 'PEL I', 'Male', '1980-06-20', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'JUNALDO', NULL, NULL),
('3507', '8007219', 'SONNY HANDRA, ST.', 'PEL I', 'Male', '1980-06-22', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'SONNY.HANDRA', NULL, NULL),
('3508', '8007224', 'BENY AGUSRA', 'PEL I', '', '1980-08-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BENY.AGUSRA', NULL, NULL),
('3509', '8007243', 'FEBBIE YOLANDA IRAWADHY', 'PEL I', 'Female', '1980-06-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'FEBBIE.IRAWADHY', NULL, NULL),
('3510', '8009004', 'NURMA YANTI, SE., Akt.', 'II', 'Female', '1980-10-08', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Unit Kinerja & Anggaran', 'NURMA.YANTI', NULL, NULL),
('3511', '8009028', 'HENDRIO HARMEL, ST., MT.', 'II', 'Male', '1980-03-17', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'HENDRIO.HARMEL', NULL, NULL),
('3512', '8009032', 'UJANG FRIATNA, ST.', 'II', 'Male', '1980-01-22', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Unit Produksi Semen', 'UJANG.FRIATNA', NULL, NULL),
('3513', '8009039', 'RADITYA ALGADRI, ST.', 'II', '', '1980-09-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RADITYA.ALGADRI', NULL, NULL),
('3514', '8101018', 'BUDI KURNIA', 'PEL I', '', '1981-08-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BUDI.KURNIA', NULL, NULL),
('3515', '8105006', 'DEDI MUHAMAD SIDIQ, ST.', 'II', 'Male', '1981-01-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Unit Perencanaan dan Pengawasan Tambang', 'DEDI.SIDIQ', NULL, NULL),
('3516', '8105007', 'FREDDO SYUKRI, SE., Akt.', 'II', 'Male', '1981-10-23', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Sepatim Batamtama', 'Kary. Ditugaskan ke PT Sepatim Batamtama', 'Kary. Ditugaskan ke PT Sepatim Batamtama', 'FREDDO.SYUKRI', NULL, NULL),
('3517', '8105009', 'FERY SARVINO, Ir., ST., MT., IPM.', 'II', 'Male', '1981-04-08', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'FERY.SARVINO', NULL, NULL),
('3518', '8105015', 'YULIA HIDAYATI, SE., Akt.', 'II', 'Female', '1981-07-17', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Unit Akuntansi', 'YULIA.HIDAYATI', NULL, NULL),
('3519', '8105019', 'SIGIT ARI WIDODO, ST.', 'II', 'Male', '1981-03-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Unit Pemeliharaan Mesin 2', 'SIGIT.WIDODO', NULL, NULL),
('3520', '8107024', 'FAJAR RAHMADONI, ST.', 'IV', 'Male', '1981-07-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'FAJAR.RAHMADONI', NULL, NULL),
('3521', '8107032', 'BUDI PUTRA', 'IV', 'Male', '1981-04-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'BUDI.PUTRA', NULL, NULL),
('3522', '8107045', 'VERA, SE.', 'IV', 'Female', '1981-09-13', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'VERA', NULL, NULL),
('3523', '8107052', 'MARTONO, ST.', 'PEL I', '', '1981-03-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MARTONO.3523', NULL, NULL),
('3524', '8107056', 'YANDRI FERDIYAN, ST.', 'PEL I', '', '1981-01-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YANDRI.FERDIYAN', NULL, NULL),
('3525', '8107058', 'YULHANDRI N', 'PEL I', 'Male', '1981-05-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'YULHANDRI.N', NULL, NULL),
('3526', '8107107', 'DONNA WIDYASTUTI, S.Si.', 'IV', 'Female', '1981-02-16', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'DONNA.WIDYASTUTI', NULL, NULL),
('3527', '8107114', 'BETA ALEX PUTRA JAYA', 'PEL I', 'Male', '1981-04-24', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'BETA.JAYA', NULL, NULL),
('3528', '8107127', 'LEXXY ASMARA ISKANDAR', 'IV', '', '1981-11-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'LEXXY.ISKANDAR', NULL, NULL),
('3529', '8107146', 'DONI MAIZWAR, ST.', 'IV', 'Male', '1981-09-05', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'DONI.MAIZWAR', NULL, NULL),
('3530', '8107149', 'ARDISTAL, ST.', 'IV', '', '1981-02-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARDISTAL', NULL, NULL),
('3531', '8107152', 'THOMY HARYADI HARIS', 'PEL II', '', '1981-02-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'THOMY.HARIS', NULL, NULL),
('3532', '8107185', 'ELVIES ANTHONY, ST.', 'PEL I', 'Male', '1981-04-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ELVIES.ANTHONY', NULL, NULL),
('3533', '8107194', 'RINNI SYAFNITA, SE.', 'IV', 'Female', '1981-03-19', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'RINNI.SYAFNITA', NULL, NULL),
('3534', '8107236', 'DODI MASTERY LIDRA, ST.', 'PEL I', 'Male', '1981-07-11', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'DODI.LIDRA', NULL, NULL),
('3535', '8107238', 'DIAN HANDRIKO', 'PEL I', 'Male', '1981-12-09', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'DIAN.HANDRIKO', NULL, NULL),
('3536', '8109003', 'MOCH. CHOIRIL ANAM, ST.', 'III', '', '1981-05-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MCHOIRIL.ANAM', NULL, NULL),
('3537', '8109042', 'AHMAD SUBEKTI, ST.', 'III', '', '1981-12-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AHMAD.SUBEKTI', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('3538', '8109045', 'HENDRI PRIPARIS, ST.', 'II', 'Male', '1981-04-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Unit Operasi Tambang', 'HENDRI.PRIPARIS', NULL, NULL),
('3539', '8109047', 'JIMMY DESILBA', 'III', 'Male', '1981-12-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'JIMMY.DESILBA', NULL, NULL),
('3540', '8109053', 'RENI SARI RAHMADHANI, ST.', 'III', 'Female', '1981-06-30', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'RENI.RAHMADHANI', NULL, NULL),
('3541', '8205005', 'VEKKY ANGGALIA SY, SE., Akt.', 'II', 'Female', '1982-06-13', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke DPSP', 'Kary. Ditugaskan ke DPSP', 'Kary. Ditugaskan ke DPSP', 'VEKKY.ANGGALIA', NULL, NULL),
('3542', '8205008', 'TRI PRAPTOYO HERIYANTO, ST., MSc.', 'II', 'Male', '1982-10-18', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Unit Penunjang Produksi', 'TRI.HERIYANTO', NULL, NULL),
('3543', '8205018', 'PALMAN, ST.', 'II', '', '1982-03-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'PALMAN', NULL, NULL),
('3544', '8207013', 'ARMANTO', 'PEL I', 'Male', '1982-11-30', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'ARMANTO', NULL, NULL),
('3545', '8207044', 'ULFATMI, SE.', 'IV', 'Female', '1982-12-17', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'ULFATMI', NULL, NULL),
('3546', '8207062', 'ALFRED RUSLI, ST.', 'IV', 'Male', '1982-09-07', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Bina Lingkungan', 'ALFRED.RUSLI', NULL, NULL),
('3547', '8207071', 'TARMIZI', 'IV', 'Male', '1982-11-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'TARMIZI.3547', NULL, NULL),
('3548', '8207073', 'HENDRA GUNAWAN', 'IV', 'Male', '1982-07-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'HENDRA.GUNAWAN', NULL, NULL),
('3549', '8207077', 'ROBBY HANDAYA', 'PEL I', '', '1982-10-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROBBY.HANDAYA', NULL, NULL),
('3550', '8207084', 'RAHMAT DINATA', 'III', '', '1982-10-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAHMAT.DINATA', NULL, NULL),
('3551', '8207088', 'VERA OKTAVIA', 'IV', '', '1982-10-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'VERA.OKTAVIA', NULL, NULL),
('3552', '8207092', 'SUSILAWATY', 'IV', '', '1982-05-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUSILAWATY', NULL, NULL),
('3553', '8207097', 'ADE IKA PUTRA', 'IV', 'Male', '1982-12-10', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'ADE.PUTRA', NULL, NULL),
('3554', '8207101', 'FIRDAUS YAMIFATI HULU', 'PEL I', 'Male', '1982-01-01', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Perencanaan Produksi & QA Kantong', 'FIRDAUS.HULU', NULL, NULL),
('3555', '8207102', 'ASRIL JONI, ST.', 'PEL I', 'Male', '1982-04-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ASRIL.JONI', NULL, NULL),
('3556', '8207108', 'AFRINAL', 'PEL II', 'Male', '1982-04-25', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'AFRINAL', NULL, NULL),
('3558', '8207125', 'ISNAIDI', 'PEL I', 'Male', '1982-10-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'ISNAIDI', NULL, NULL),
('3559', '8207136', 'YULI ADRI, ST.', 'IV', '', '1982-08-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YULI.ADRI', NULL, NULL),
('3560', '8207139', 'NOFRIZAL', 'IV', '', '1982-11-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NOFRIZAL', NULL, NULL),
('3561', '8207164', 'ERICK YULIANDRA', 'IV', 'Male', '1982-07-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ERICK.YULIANDRA', NULL, NULL),
('3562', '8207207', 'SEPTI EKA PUTRI, ST.', 'IV', 'Female', '1982-09-21', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'SEPTI.PUTRI', NULL, NULL),
('3563', '8207212', 'DELFI NOFRIYENTI, S.Pd.', 'PEL I', '', '1982-11-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DELFI.NOFRIYENTI', NULL, NULL),
('3564', '8207217', 'FIRMA YUDI', 'PEL I', 'Male', '1982-03-30', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Hubungan Institusional', 'FIRMA.YUDI', NULL, NULL),
('3565', '8207225', 'OKTA VIRMADONA, SE.', 'PEL I', '', '1982-10-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'OKTA.VIRMADONA', NULL, NULL),
('3567', '8209006', 'DANI OKTAVIANUS, SE.', 'III', '', '1982-10-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DANI.OKTAVIANUS', NULL, NULL),
('3568', '8209010', 'FIFIT ABRIYANTO, ST.', 'II', '', '1982-12-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIFIT.ABRIYANTO', NULL, NULL),
('3569', '8209013', 'DIAN EKA PRASETYAWAN, ST.', 'II', 'Male', '1982-12-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Unit Pemeliharaan Elins 2', 'DIAN.PRASETYAWAN', NULL, NULL),
('3570', '8209015', 'FERO GUSFA, ST.', 'III', 'Male', '1982-07-21', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'FERO.GUSFA', NULL, NULL),
('3571', '8209016', 'M IRWAN PRASETYO, ST.', 'II', 'Male', '1982-12-07', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Unit Operasional SDM', 'IRWAN.PRASETYO', NULL, NULL),
('3572', '8209018', 'R NICKO YUDA K, SH., MKn.', 'II', 'Male', '1982-12-31', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Unit Legal & GRC', 'NICKO.YUDA', NULL, NULL),
('3573', '8209030', 'SYAMSUR RIJAL, ST., MT.', 'II', 'Male', '1982-03-06', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'SYAMSUR.RIJAL', NULL, NULL),
('3574', '8209048', 'IRWAN ADI NUGROHO, ST.', 'III', '', '1982-03-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IRWAN.NUGROHO', NULL, NULL),
('3575', '8209050', 'MUHAMMAD YONANDA, SE.', 'II', '', '1982-03-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMMAD.YONANDA', NULL, NULL),
('3576', '8305002', 'MUHAMAD IKRAR, ST.', 'II', '', '1983-05-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMAD.IKRAR', NULL, NULL),
('3577', '8305010', 'LILIK AGUS SUGIYONO, ST., MT.', 'II', 'Male', '1983-03-06', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'LILIK.SUGIYONO', NULL, NULL),
('3578', '8307023', 'FEBRIANTO, ST.', 'PEL I', 'Male', '1983-02-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'FEBRIANTO', NULL, NULL),
('3579', '8307042', 'ROY HARDYANTO, SE.', 'IV', 'Male', '1983-01-21', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'ROY.HARDYANTO', NULL, NULL),
('3580', '8307050', 'HETLER FREDDY NAINGGOLAN', 'PEL I', 'Male', '1983-09-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'HETLER.NAINGGOLAN', NULL, NULL),
('3581', '8307054', 'OSKAR HARIS', 'IV', 'Male', '1983-05-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'OSKAR.HARIS', NULL, NULL),
('3582', '8307059', 'AGUS MAULANA', 'IV', 'Male', '1983-08-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AGUS.MAULANA', NULL, NULL),
('3583', '8307072', 'EKA PUTRA', 'PEL I', 'Male', '1983-07-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'EKA.PUTRA', NULL, NULL),
('3584', '8307074', 'YUDHISTIRA FANNY, ST., MM.', 'IV', 'Male', '1983-09-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'YUDHISTIRA.FANNY', NULL, NULL),
('3585', '8307081', 'HARI KHAIRUN SH., SE., MM.', 'IV', '', '1983-01-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HARI.KHAIRUN', NULL, NULL),
('3586', '8307087', 'SUPRIYANINGSIH', 'PEL I', '', '1983-10-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUPRIYANINGSIH', NULL, NULL),
('3587', '8307120', 'EWIN SAPRIANTO', 'IV', 'Male', '1983-12-19', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'EWIN.SAPRIANTO', NULL, NULL),
('3588', '8307123', 'HENDRI ZALIUS', 'IV', 'Male', '1983-08-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'HENDRI.ZALIUS', NULL, NULL),
('3589', '8307147', 'RIKA HANDAYANI', 'PEL I', 'Female', '1983-11-06', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'RIKA.HANDAYANI', NULL, NULL),
('3590', '8307154', 'HARBI ANGGARA, SE.', 'PEL I', '', '1983-08-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HARBI.ANGGARA', NULL, NULL),
('3592', '8307162', 'HANANDA HALIM, SST, MM.', 'PEL I', '', '1983-09-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HANANDA.HALIM', NULL, NULL),
('3593', '8307178', 'AULIA PUTRA, SE., MM.', 'IV', '', '1983-11-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AULIA.PUTRA', NULL, NULL),
('3594', '8307211', 'SUHERIAL ANDIKA PUTRA, ST.', 'PEL I', '', '1983-09-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUHERIAL.ANDIKA', NULL, NULL),
('3595', '8307215', 'ANGGA HANDIKA', 'PEL I', 'Male', '1983-09-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'ANGGA.HANDIKA', NULL, NULL),
('3596', '8307222', 'PRIMA YUAFRIZA', 'PEL I', 'Female', '1983-04-13', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'PRIMA.YUAFRIZA', NULL, NULL),
('3597', '8307237', 'BENNY AFRIZAL', 'PEL I', 'Male', '1983-06-18', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'BENNY.AFRIZAL', NULL, NULL),
('3598', '8309001', 'YANA PRIMA INTANIA D, SE.', 'III', 'Female', '1983-07-17', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'YANA.INTANIA', NULL, NULL),
('3599', '8309009', 'NUR ANITA RAHMAWATI, ST.', 'II', 'Female', '1983-10-04', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Unit Humas & Kesekretariatan', 'NUR.ANITA', NULL, NULL),
('3600', '8309012', 'NOVAN ANDY BACHTIAR, ST., MM.', 'II', 'Male', '1983-11-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Unit Pemeliharaan Elins 1', 'NOVAN.BACHTIAR', NULL, NULL),
('3601', '8309014', 'HARRY FAJRI ZAMZIBAR, ST.', 'III', 'Male', '1983-01-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'HARRY.ZAMZIBAR', NULL, NULL),
('3602', '8309034', 'MUSYTAQIM NASRA, ST.', 'II', '', '1983-04-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUSYTAQIM.NASRA', NULL, NULL),
('3603', '8309036', 'DONNY ASWIN IDHAM, ST.', 'II', 'Male', '1983-05-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Unit Produksi Bahan Baku', 'DONNY.IDHAM', NULL, NULL),
('3604', '8309043', 'NURITA HANDAYANI, ST.', 'II', 'Female', '1983-02-05', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Unit Sarana Umum', 'NURITA.HANDAYANI', NULL, NULL),
('3605', '8309049', 'ADE KURNIAWAN, ST., MM.', 'II', '', '1983-12-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADE.KURNIAWAN', NULL, NULL),
('3607', '8309054', 'WAHYUNI RETNOWATI, ST.', 'III', '', '1983-05-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WAHYUNI.RETNOWATI', NULL, NULL),
('3608', '8407046', 'DINA ARMIDYA', 'IV', 'Female', '1984-04-22', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'DINA.ARMIDYA', NULL, NULL),
('3609', '8407055', 'SYAMSU RIZAL, ST.', 'PEL I', 'Male', '1984-07-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'SYAMSU.RIZAL', NULL, NULL),
('3610', '8407063', 'ALIT SEMBODO, ST.', 'IV', 'Male', '1984-12-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ALIT.SEMBODO', NULL, NULL),
('3611', '8407069', 'RUSMAWIZA', 'PEL I', 'Female', '1984-04-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'RUSMAWIZA', NULL, NULL),
('3612', '8407082', 'HERU WANDA, SE.', 'IV', '', '1984-03-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HERU.WANDA', NULL, NULL),
('3613', '8407089', 'HESTY FITRIA SARI', 'IV', 'Female', '1984-06-29', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'HESTY.SARI', NULL, NULL),
('3614', '8407090', 'DEPI PUTRA, ST', 'IV', '', '1984-12-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DEPI.PUTRA', NULL, NULL),
('3615', '8407095', 'PRAMITA SICILIA', 'IV', 'Female', '1984-08-25', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'PRAMITA.SICILLIA', NULL, NULL),
('3616', '8407096', 'RAHMI MUTIA', 'IV', 'Female', '1984-01-08', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Evaluasi Kinerja', 'RAHMI.MUTIA', NULL, NULL),
('3617', '8407100', 'MARJUKI', 'IV', '', '1984-03-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MARJUKI', NULL, NULL),
('3618', '8407110', 'ANDRINALDI', 'IV', 'Male', '1984-05-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'ANDRINALDI', NULL, NULL),
('3619', '8407112', 'ARDIAN PUTRA', 'IV', 'Male', '1984-11-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'ARDIAN.PUTRA', NULL, NULL),
('3620', '8407116', 'DHONY TAHAR', 'IV', 'Male', '1984-05-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'DHONY.TAHAR', NULL, NULL),
('3622', '8407122', 'FIRDAUS GAFAR, ST.', 'IV', '', '1984-11-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIRDAUS.GAFAR', NULL, NULL),
('3623', '8407124', 'INDRA FARIZAL', 'PEL I', '', '1984-06-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'INDRA.FARIZAL', NULL, NULL),
('3624', '8407134', 'SATRIA KUSUMA', 'IV', 'Male', '1984-07-17', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'SATRIA.KUSUMA', NULL, NULL),
('3625', '8407143', 'ADEL ABRAR SAPUTRA', 'PEL I', 'Male', '1984-12-29', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ADEL.SAPUTRA', NULL, NULL),
('3626', '8407144', 'ADI ISMANTO', 'IV', 'Male', '1984-06-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ADI.ISMANTO', NULL, NULL),
('3627', '8407145', 'ARRIS ANDRA', 'IV', 'Male', '1984-12-01', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ARRIS.ANDRA', NULL, NULL),
('3628', '8407150', 'EVA FITRIANI', 'IV', 'Female', '1984-06-21', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'EVA.FITRIANI', NULL, NULL),
('3629', '8407155', 'ARIANO SAPUTRA', 'PEL I', 'Male', '1984-09-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ARIANO.SAPUTRA', NULL, NULL),
('3630', '8407173', 'HENDRISYAH AGUSTIAN', 'PEL I', 'Male', '1984-08-16', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'HENDRISYAH.AGUSTIAN', NULL, NULL),
('3631', '8407183', 'DEDDY M DARIS S. Kom M. Kom', 'IV', 'Male', '1984-08-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'DEDDY.DARIS', NULL, NULL),
('3632', '8407184', 'TELLI MERIZA ANGGELINA', 'PEL I', '', '1984-12-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TELLI.ANGGELINA', NULL, NULL),
('3633', '8407186', 'ADEK SUPRIADI, ST.', 'PEL I', '', '1984-09-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADEK.SUPRIADI', NULL, NULL),
('3634', '8407196', 'IHSAN ALHADI', 'PEL I', '', '1984-06-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IHSAN.ALHADI', NULL, NULL),
('3635', '8407227', 'AKMAL NURHAKIM', 'PEL II', 'Male', '1984-05-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'AKMAL.NURHAKIM', NULL, NULL),
('3636', '8407232', 'IRWANDI, ST.', 'PEL I', 'Male', '1984-04-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'IRWANDI.3636', NULL, NULL),
('3637', '8407239', 'RIKA RACHMAN, SE.', 'PEL I', '', '1984-10-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIKA.RACHMAN', NULL, NULL),
('3638', '8407242', 'ELSA', 'IV', 'Female', '1984-08-23', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Perbendaharaan', 'ELSA', NULL, NULL),
('3639', '8409011', 'ARIEF RAHMAN HAKIM, ST.', 'III', 'Male', '1984-10-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ARIEF.HAKIM', NULL, NULL),
('3640', '8409022', 'IKA NOPIKASARI, S.Psi.', 'II', '', '1984-01-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IKA.NOPIKASARI', NULL, NULL),
('3641', '8409024', 'SANTORO, ST.', 'III', 'Male', '1984-02-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'SANTORO', NULL, NULL),
('3642', '8409027', 'FAJAR ARISTYANTO, ST., MT.', 'II', '', '1984-07-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FAJAR.ARISTYANTO', NULL, NULL),
('3643', '8409029', 'TITUT ERYANTO, ST., MT.', 'II', 'Male', '1984-09-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Unit Produksi Terak 1', 'TITUT.ERYANTO', NULL, NULL),
('3644', '8409031', 'RATNAWATI, ST.', 'II', 'Female', '1984-02-10', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Unit Quality Control', 'RATNAWATI', NULL, NULL),
('3645', '8409033', 'MULYA ANDHIKA PUTRA, ST.', 'II', 'Male', '1984-04-30', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'MULYA.PUTRA', NULL, NULL),
('3646', '8409035', 'ASRINING SARI, ST.', 'III', '', '1984-01-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ASRINING.SARI', NULL, NULL),
('3647', '8409037', 'ANDRA NOVENDRI, ST.', 'II', '', '1984-11-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDRA.NOVENDRI', NULL, NULL),
('3648', '8409040', 'FAISAL ARIF, ST., MM.', 'II', 'Male', '1984-05-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'FAISAL.ARIF', NULL, NULL),
('3649', '8409041', 'ARIS SUPRIYATNA, ST., MM.', 'II', 'Male', '1984-01-25', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'ARIS.SUPRIYATNA', NULL, NULL),
('3650', '8409046', 'ARIYAN TRISNO, ST.', 'III', 'Male', '1984-07-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'ARIYAN.TRISNO', NULL, NULL),
('3651', '8409052', 'MUHAMMAD SHIDDIQ, ST., MSc.', 'III', '', '1984-05-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('3652', '8507041', 'NILVI RAHMI', 'III', 'Female', '1985-01-25', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'NILVI.RAHMI', NULL, NULL),
('3653', '8507043', 'SILVIA MEGASARI A', 'IV', 'Female', '1985-07-15', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Biaya', 'SILVIA.MEGASARI', NULL, NULL),
('3654', '8507065', 'DANNY SATRIA', 'PEL I', 'Male', '1985-01-11', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'DANNY.SATRIA', NULL, NULL),
('3655', '8507066', 'DASKI WANDI', 'IV', 'Male', '1985-01-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'DASKI.WANDI', NULL, NULL),
('3656', '8507067', 'DELVIANTI, ST.', 'IV', '', '1985-05-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DELVIANTI', NULL, NULL),
('3657', '8507068', 'ROBBY WIRZA, ST.', 'IV', 'Male', '1985-04-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'ROBBY.WIRZA', NULL, NULL),
('3658', '8507070', 'SALMOND PILIMA', 'IV', '', '1985-11-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SALMOND.PILIMA', NULL, NULL),
('3659', '8507075', 'DODY SAPUTRA', 'IV', '', '1985-05-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DODY.SAPUTRA', NULL, NULL),
('3660', '8507080', 'BANGUN PERDANA', 'IV', '', '1985-07-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BANGUN.PERDANA', NULL, NULL),
('3661', '8507086', 'RIKO MADONA', 'IV', '', '1985-05-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIKO.MADONA', NULL, NULL),
('3662', '8507094', 'HERA DWIASTUTI', 'IV', 'Female', '1985-01-24', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. AFR & Material Ketiga', 'HERA.DWIASTUTI', NULL, NULL),
('3663', '8507104', 'DOCHE DELSON, ST.', 'IV', 'Male', '1985-09-07', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'DOCHE.DELSON', NULL, NULL),
('3664', '8507113', 'AWEL ADHAR', 'PEL I', '', '1985-08-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AWEL.ADHAR', NULL, NULL),
('3665', '8507128', 'LIL YUSRA', 'PEL I', 'Male', '1985-05-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'LIL.YUSRA', NULL, NULL),
('3666', '8507131', 'RAHMAD HENDRAWAN', 'IV', 'Male', '1985-05-21', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'RAHMAD.HENDRAWAN', NULL, NULL),
('3667', '8507132', 'ROBBY SUHERI', 'PEL I', '', '1985-04-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROBBY.SUHERI', NULL, NULL),
('3668', '8507148', 'AKMAL', 'IV', 'Male', '1985-09-14', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'AKMAL.3668', NULL, NULL),
('3669', '8507157', 'AFRIADI LAOLY', 'PEL I', 'Male', '1985-01-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'AFRIADI.LAOLY', NULL, NULL),
('3670', '8507165', 'FELLY RANI', 'PEL I', '', '1985-09-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FELLY.RANI', NULL, NULL),
('3671', '8507168', 'SAFRINA ASMARANI', 'PEL I', 'Female', '1985-10-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'SAFRINA.ASMARANI', NULL, NULL),
('3672', '8507170', 'SANDRI YAZID', 'IV', 'Female', '1985-11-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'SANDRI.YAZID', NULL, NULL),
('3673', '8507176', 'HERU APRI OVAL', 'PEL II', 'Male', '1985-04-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'HERU.OVAL', NULL, NULL),
('3674', '8507177', 'ABDUL HADI', 'PEL I', 'Male', '1985-01-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'ABDUL.HADI3674', NULL, NULL),
('3675', '8507180', 'IFFAN TRI FEBRIADI', 'PEL I', '', '1985-02-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IFFAN.TRI', NULL, NULL),
('3676', '8507188', 'EKO SARWO ADIWIBOWO', 'PEL I', 'Male', '1985-04-22', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'EKO.ADIWIBOWO', NULL, NULL),
('3677', '8507199', 'JULI ARWAN', 'PEL I', 'Male', '1985-07-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'JULI.ARWAN', NULL, NULL),
('3679', '8507208', 'FADHLAN MAULANA', 'IV', 'Male', '1985-05-27', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'FADHLAN.MAULANA', NULL, NULL),
('3680', '8507220', 'FAJRY KURNIAWAN', 'IV', 'Male', '1985-11-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'FAJRY.KURNIAWAN', NULL, NULL),
('3681', '8507221', 'ERICK RINALDO', 'PEL I', 'Male', '1985-01-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'ERICK.RINALDO', NULL, NULL),
('3682', '8507229', 'ARIF KURNIAWAN', 'PEL I', 'Male', '1985-05-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'ARIF.KURNIAWAN3682', NULL, NULL),
('3683', '8507231', 'FIRMANSYAH, ST.', 'PEL I', 'Male', '1985-01-18', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'FIRMANSYAH.3683', NULL, NULL),
('3684', '8507240', 'ROCKY LADIMO, SE., MM.', 'PEL I', 'Male', '1985-06-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'ROCKY.LADIMO', NULL, NULL),
('3685', '8509005', 'SARI RAMADHANI, SE.', 'II', '', '1985-06-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SARI.RAMADHANI', NULL, NULL),
('3686', '8509008', 'PIERY TOGAP, ST.', 'II', '', '1985-02-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'PIERY.TOGAP', NULL, NULL),
('3687', '8509019', 'ROBBI R. PUTRA, ST.', 'II', '', '1985-07-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Robbi.Putra', NULL, NULL),
('3688', '8509021', 'IKE EVY WIYANA, S.Si.', 'III', 'Female', '1985-06-14', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'IKE.WIYANA', NULL, NULL),
('3689', '8509023', 'PUSPHA SARI, S. Psi, MM.', 'II', 'Female', '1985-03-28', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'PUSPHA.SARI', NULL, NULL),
('3690', '8509025', 'EKO BAGUS PRIYUANTORO, ST.', 'II', 'Male', '1985-01-07', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'Kary. Ditugaskan ke Yayasan Semen Padang', 'EKO.PRIYUANTORO', NULL, NULL),
('3691', '8509026', 'HANNY K. LUKITO, ST.', 'II', '', '1985-06-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HANNY.LUKITO', NULL, NULL),
('3692', '8607159', 'MUHARMAN B', 'PEL I', 'Male', '1986-09-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'MUHARMAN.B', NULL, NULL),
('3693', '8607171', 'RIDHO FAJAR', 'IV', 'Male', '1986-10-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Kebersihan', 'RIDHO.FAJAR', NULL, NULL),
('3694', '8607193', 'NENENG OKTAFIA, SE.', 'PEL I', '', '1986-10-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NENENG.OKTAFIA', NULL, NULL),
('3695', '8607202', 'ANDRIKO PUTRA', 'PEL I', 'Male', '1986-03-03', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ANDRIKO.PUTRA', NULL, NULL),
('3696', '8607213', 'YUDHI PERMANA, ST.', 'PEL I', 'Male', '1986-06-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'YUDHI.PERMANA', NULL, NULL),
('3697', '8607214', 'IRSYADULHALIM', 'PEL I', 'Male', '1986-01-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'IRSYADULHALIM', NULL, NULL),
('3699', '8607247', 'RUDI FIRDAUS', 'PEL I', '', '1986-10-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RUDI.FIRDAUS', NULL, NULL),
('3700', '8609007', 'SATRIO RIAN BHAKTI, SE.', 'III', 'Male', '1986-06-02', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Program Kemitraan', 'SATRIO.BHAKTI', NULL, NULL),
('3701', '8609044', 'ROMI ABDILAH, Ir.', 'II', '', '1986-03-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROMI.ABDILAH', NULL, NULL),
('3702', '8707189', 'ADEK PURNAMA SARI', 'PEL I', 'Female', '1987-08-05', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'ADEK.SARI', NULL, NULL),
('3703', '8707198', 'ZULFAHMI AMRI, ST.', 'IV', 'Male', '1987-08-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Pengelolaan Overhaul', 'ZULFAHMI.AMRI', NULL, NULL),
('3704', '8707209', 'DERI YUNI PUTRA', 'PEL I', 'Male', '1987-06-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'DERI.PUTRA', NULL, NULL),
('3705', '8707216', 'FREZI YULILHAMRI', 'PEL I', 'Male', '1987-07-29', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'FREZI.YULILHAMRI', NULL, NULL),
('3706', '8707241', 'DEDI ADRIANTO YUSRIZAL', 'PEL I', 'Male', '1987-12-06', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'DEDI.YUSRIZAL', NULL, NULL),
('3707', '8709002', 'ARINI KASMIRA, SE., MSc.', 'I', '', '1987-08-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARINI.KASMIRA', NULL, NULL),
('3708', '8807169', 'ARIANSYAH PUTRA, S.Kom.', 'PEL I', 'Male', '1988-01-24', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ARIANSYAH.PUTRA', NULL, NULL),
('3709', '8807192', 'RAHMAN ETIKA PUTRA, S.Kom.', 'PEL I', 'Male', '1988-03-25', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'RAHMAN.PUTRA', NULL, NULL),
('3710', '8807204', 'DINAWATI', 'PEL I', '', '1988-09-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DINAWATI', NULL, NULL),
('3711', '8807233', 'RIZKI HIDAYAT', 'PEL I', '', '1988-12-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIZKI.HIDAYAT', NULL, NULL),
('3712', '8807244', 'SYAFRI DONI', 'PEL I', '', '1988-07-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SYAFRI.DONI', NULL, NULL),
('3713', '8808001', 'FERDI NIKO, SE.', 'PEL I', '', '1988-08-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FERDI.NIKO', NULL, NULL),
('3714', '8907174', 'RIRI ELPIRA', 'PEL I', '', '1989-02-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIRI.ELPIRA', NULL, NULL),
('3729', '6596006', 'BAHAR, SE., Akt.', 'II', 'Male', '1965-05-02', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', 'BAHAR', NULL, NULL),
('3731', '6793002', 'AGUSTA FACHRURAZI, Ir., SE.', 'II', 'Male', '1967-08-17', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', 'AGUSTA.FACHRURAZI', NULL, NULL),
('3732', '6897010', 'DASWANDI, SE., Akt., MM.', 'II', 'Male', '1968-12-08', 'Semen Padang Subsidiaries', 'Kary. Ditugaskan ke KKSP', 'Kary. Ditugaskan ke KKSP', 'Kary. Ditugaskan ke KKSP', 'DASWANDI', NULL, NULL),
('3733', '7199092', 'ZULFAHMI, SE., Akt.', 'II', 'Male', '1971-03-23', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'ZULFAHMI', NULL, NULL),
('3737', '6896002', 'DURAIN PARMANOAN, ST., MT.', 'I', '', '1968-12-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DURAIN.PARMANOAN', NULL, NULL),
('5455', '8111032', 'ABDI DARMA, ST.', 'PEL I', 'Male', '1981-10-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'ABDI.DARMA', NULL, NULL),
('5456', '8111027', 'ABDIANTO, AMD.', 'PEL I', 'Male', '1981-11-30', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'ABDIANTO', NULL, NULL),
('5457', '8911242', 'ACHMAD MUSTAQIM', 'PEL II', '', '1989-10-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ACHMAD.MUSTAQIM', NULL, NULL),
('5462', '7911015', 'ADE BUSTANANDA, AMD.', 'PEL I', 'Male', '1979-10-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'ADE.BUSTANANDA', NULL, NULL),
('5463', '8511093', 'ADE ERMADI, ST.', 'PEL I', 'Male', '1985-04-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'ADE.ERMADI', NULL, NULL),
('5464', '8511076', 'ADE HARYADI', 'PEL I', '', '1985-03-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADE.HARYADI', NULL, NULL),
('5465', '8811232', 'ADE SIF', 'PEL II', '', '1988-03-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADE.SIF', NULL, NULL),
('5466', '8911269', 'ADE SYAPUTRA', 'PEL I', 'Male', '1989-09-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ADE.SYAPUTRA', NULL, NULL),
('5467', '8911245', 'ADE VEBRIA, SE.', 'PEL I', 'Male', '1989-12-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ADE.VEBRIA', NULL, NULL),
('5468', '8911157', 'ADI MUKHANIS', 'PEL I', 'Male', '1989-07-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ADI.MUKHANIS', NULL, NULL),
('5469', '7811169', 'ADRIL', 'PEL I', '', '1978-06-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADRIL', NULL, NULL),
('5471', '8511096', 'AHMAD DHANY, ST.', 'PEL I', '', '1985-11-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AHMAD.DHANY', NULL, NULL),
('5472', '8711142', 'AHMAD TRIKEN JAYA', 'PEL I', 'Male', '1987-09-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'AHMAD.JAYA', NULL, NULL),
('5473', '9011278', 'AKMAR SETIADI', 'PEL I', 'Male', '1990-03-20', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'AKMAR.SETIADI', NULL, NULL),
('5474', '8711140', 'ALBANI', 'IV', 'Male', '1987-04-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'ALBANI', NULL, NULL),
('5475', '9011298', 'ALFIANSYAH PUTRA, S.Si.', 'PEL I', 'Male', '1990-06-29', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ALFIANSYAH.PUTRA', NULL, NULL),
('5476', '8311046', 'ALI AKBAR', 'PEL I', '', '1983-12-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALI.AKBAR', NULL, NULL),
('5477', '7511256', 'ALMAHDI', 'PEL I', 'Male', '1975-08-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'ALMAHDI', NULL, NULL),
('5478', '8211035', 'AMELIA ROSYA, SE.', 'PEL I', '', '1982-01-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AMELIA.ROSYA', NULL, NULL),
('5479', '8511088', 'AMRULLAH RANGKUTI, ST.', 'PEL I', '', '1985-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AMRULLAH.RANGKUTI', NULL, NULL),
('5480', '8211042', 'AN HARIZAL', 'PEL I', 'Male', '1982-11-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'AN.HARIZAL', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('5481', '8911238', 'ANDHESKA PRIMA PUTRA', 'PEL I', '', '1989-12-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDHESKA.PUTRA', NULL, NULL),
('5482', '8711215', 'ANDRE HERU OKTARIA', 'PEL I', 'Male', '1987-10-09', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ANDRE.OKTARIA', NULL, NULL),
('5483', '8911251', 'ANDRE PRICO RIANDA', 'PEL I', 'Male', '1989-01-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'ANDRE.RIANDA', NULL, NULL),
('5484', '8011181', 'ANDRI ZULHELMI', 'PEL II', '', '1980-02-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDRI.ZULHELMI', NULL, NULL),
('5485', '8711204', 'ANGGA RIZANO, S.S', 'PEL II', 'Male', '1987-12-24', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ANGGA.RIZANO', NULL, NULL),
('5486', '8311047', 'ANRI HAYANTO', 'PEL I', 'Male', '1983-12-20', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Perbendaharaan', 'ANRI.HAYANTO', NULL, NULL),
('5487', '8211041', 'ANTON WIJAYA', 'PEL II', '', '1982-12-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANTON.WIJAYA5487', NULL, NULL),
('5488', '7811167', 'ARDENI', 'PEL I', '', '1978-12-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARDENI', NULL, NULL),
('5489', '9011273', 'ARIADI PUTRA, SE.', 'PEL I', '', '1990-08-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ARIADI.PUTRA', NULL, NULL),
('5490', '9111325', 'ARIE SISWANTO WISMAN', 'PEL I', 'Male', '1991-02-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ARIE.WISMAN', NULL, NULL),
('5491', '8111028', 'ARIEF RAHMAN', 'PEL I', 'Male', '1981-01-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ARIEF.RAHMAN', NULL, NULL),
('5492', '8411068', 'ARIF CAHYADI', 'PEL I', 'Male', '1984-10-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'ARIF.CAHYADI', NULL, NULL),
('5493', '8711206', 'ARIF RUSMAN, SE.', 'PEL I', 'Male', '1987-12-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ARIF.RUSMAN', NULL, NULL),
('5494', '7611004', 'ARISTO', 'IV', 'Male', '1976-06-17', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Anggaran', 'ARISTO', NULL, NULL),
('5495', '8811220', 'ARIZAL PUTRA, SE.', 'PEL I', 'Male', '1988-05-09', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ARIZAL.PUTRA', NULL, NULL),
('5496', '8611129', 'ARRI KURNIAWAN GAMY', 'PEL I', 'Male', '1986-05-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'ARRI.GAMY', NULL, NULL),
('5497', '8311053', 'ARTAFRI', 'PEL I', 'Male', '1983-05-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'ARTAFRI', NULL, NULL),
('5498', '8811217', 'ASHANUL FAJRI', 'PEL II', 'Male', '1988-08-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ASHANUL.FAJRI', NULL, NULL),
('5499', '9011299', 'ATRI REZA, S.Psi.', 'PEL I', 'Male', '1990-03-08', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'ATRI.REZA', NULL, NULL),
('5501', '8811229', 'AULIA KURNIA YUNAS, AMD.', 'PEL I', 'Female', '1988-07-30', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'AULIA.YUNAS', NULL, NULL),
('5502', '9111326', 'AZE SYAMARA', 'PEL II', 'Male', '1991-04-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'AZE.SYAMARA', NULL, NULL),
('5503', '8311191', 'BAHAGIA PERNANDES', 'PEL II', '', '1983-12-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BAHAGIA.PERNANDES', NULL, NULL),
('5504', '7811012', 'BAKTI DARMAGUNA', 'PEL I', 'Male', '1978-09-08', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'BAKTI.DARMAGUNA', NULL, NULL),
('5505', '8511101', 'BELLY BENRO, ST.', 'PEL II', '', '1985-08-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BELLY.BENRO', NULL, NULL),
('5506', '8711143', 'BENNY ARIANTO, ST.', 'PEL I', 'Male', '1987-04-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'BENNY.ARIANTO', NULL, NULL),
('5507', '9011272', 'BERRY SYAMTARIKO, ST.', 'PEL II', 'Male', '1990-10-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'BERRY.SYAMTARIKO', NULL, NULL),
('5508', '8711207', 'BERTY AGAMMURA', 'PEL I', 'Male', '1987-11-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'BERTY.AGAMMURA', NULL, NULL),
('5509', '8011020', 'BINTSAR PARULLIAN TAMPUBOLON', 'PEL I', 'Male', '1980-08-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'BINTSAR.TAMPUBOLON', NULL, NULL),
('5510', '7811010', 'BRAM DHANIEL, ST.', 'IV', 'Male', '1978-08-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'BRAM.DHANIEL', NULL, NULL),
('5512', '7611159', 'BUDI KHAIRA M', 'PEL I', 'Male', '1976-05-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'BUDI.KHAIRA', NULL, NULL),
('5513', '8911249', 'CEGA MUSLIM', 'PEL I', 'Male', '1989-04-03', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'CEGA.MUSLIM', NULL, NULL),
('5514', '8411062', 'DAVID APRIYAN', 'PEL I', 'Male', '1984-04-28', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'DAVID.APRIYAN', NULL, NULL),
('5515', '9111307', 'DAVID MUCHTAR', 'PEL II', '', '1991-06-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DAVID.MUCHTAR', NULL, NULL),
('5516', '9011290', 'DEDI KURNIA', 'PEL I', 'Male', '1990-04-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'DEDI.KURNIA', NULL, NULL),
('5517', '8711210', 'DEFRI BARLI', 'PEL II', 'Male', '1987-03-23', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'DEFRI.BARLI', NULL, NULL),
('5518', '8011023', 'DEFRIZAL ZED', 'PEL I', 'Male', '1980-12-09', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'DEFRIZAL.ZED', NULL, NULL),
('5519', '8611118', 'DERY KURNIAWAN P, ST.', 'PEL I', 'Male', '1986-05-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DERY.KURNIAWAN', NULL, NULL),
('5520', '9111318', 'DEVID DWIPA', 'PEL I', 'Male', '1991-02-14', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'DEVID.DWIPA', NULL, NULL),
('5521', '8611128', 'DEVILITO, ST.', 'PEL I', 'Male', '1986-10-02', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'DEVILITO', NULL, NULL),
('5522', '8611203', 'DEVY SULASTA', 'PEL I', 'Male', '1986-12-26', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'DEVY.SULASTA', NULL, NULL),
('5523', '8711134', 'DEWI YULIA SARI', 'IV', 'Female', '1987-07-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Perbendaharaan', 'DEWI.SARI', NULL, NULL),
('5524', '9011282', 'DIDI KURNIADI', 'PEL I', 'Male', '1990-04-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'DIDI.KURNIADI', NULL, NULL),
('5525', '8311049', 'DIDI KURNIAWAN', 'PEL I', 'Male', '1983-08-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'DIDI.KURNIAWAN', NULL, NULL),
('5526', '8911257', 'DIDY PRAWIRA', 'PEL I', 'Male', '1989-03-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'DIDY.PRAWIRA', NULL, NULL),
('5527', '8611119', 'DINAN ISLAMI', 'IV', 'Male', '1986-04-19', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'DINAN.ISLAMI', NULL, NULL),
('5528', '9111313', 'DOMES FERDIWAN, ST.', 'PEL II', '', '1991-11-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DOMES.FERDIWAN', NULL, NULL),
('5529', '7911175', 'DOMI SANDRA', 'PEL I', '', '1979-12-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DOMI.SANDRA', NULL, NULL),
('5530', '8511197', 'DONI AZANI', 'PEL I', 'Male', '1985-12-25', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'DONI.AZANI', NULL, NULL),
('5531', '8711019', 'DONNA YOLANDA', 'PEL I', 'Female', '1987-11-19', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'DONNA.YOLANDA', NULL, NULL),
('5532', '9111321', 'DONNI ANDIKA', 'PEL II', '', '1991-11-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DONNI.ANDIKA', NULL, NULL),
('5533', '8611120', 'DORAN FRINS BODE DAMANIK, ST.', 'PEL I', '', '1986-06-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DORAN.DAMANIK', NULL, NULL),
('5534', '8911244', 'DORI FEBRIANTO, ST.', 'PEL II', 'Male', '1989-02-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'DORI.FEBRIANTO', NULL, NULL),
('5535', '8911262', 'DORISMAN EKA PUTRA', 'PEL I', '', '1989-02-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DORISMAN.PUTRA', NULL, NULL),
('5536', '8611132', 'DWITA SURYANI LESTARI, ST., MT.', 'PEL I', 'Female', '1986-05-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DWITA.LESTARI', NULL, NULL),
('5537', '8911240', 'EDI KURNIAWAN, ST.', 'PEL I', 'Male', '1989-03-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'EDI.KURNIAWAN', NULL, NULL),
('5538', '8811236', 'EDI ZULHAJRI ADHA', 'PEL I', 'Male', '1988-07-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'EDI.ADHA', NULL, NULL),
('5539', '8711214', 'EGA GIOVANNI YANITRA, ST.', 'PEL II', 'Male', '1987-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'EGA.YANITRA', NULL, NULL),
('5540', '8511102', 'EKO AD MARTHA, ST.', 'PEL I', 'Male', '1985-07-13', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'EKO.MARTHA', NULL, NULL),
('5541', '8511090', 'ELDIS MURENDA', 'PEL I', '', '1985-07-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ELDIS.MURENDA', NULL, NULL),
('5543', '8111029', 'ELVI DARWIS', 'PEL I', '', '1981-01-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ELVI.DARWIS', NULL, NULL),
('5544', '8511098', 'EVO ASRAF', 'PEL I', 'Male', '1985-06-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'EVO.ASRAF', NULL, NULL),
('5545', '8511107', 'EVVELIN MARGAUS', 'PEL I', '', '1985-06-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EVVELIN.MARGAUS', NULL, NULL),
('5546', '8511103', 'FADLI FANI', 'PEL I', 'Male', '1985-11-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Unit Pemeliharaan Mesin 1', 'FADLI.FANI', NULL, NULL),
('5547', '8511106', 'FADLY GUSRIL, ST MT', 'PEL I', 'Male', '1985-05-21', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'FADLY.GUSRIL', NULL, NULL),
('5548', '8011022', 'FAIZ RAMADANI', 'IV', 'Male', '1980-08-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'FAIZ.RAMADANI', NULL, NULL),
('5551', '8911259', 'FANDI FUADIE', 'PEL I', 'Male', '1989-02-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'FANDI.FUADIE', NULL, NULL),
('5552', '8611202', 'FANNY FAISAL, SE.', 'PEL I', 'Female', '1986-02-11', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'FANNY.FAISAL', NULL, NULL),
('5553', '8411193', 'FARIDH HUSNI', 'PEL II', '', '1984-04-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FARIDH.HUSNI', NULL, NULL),
('5554', '8911264', 'FAUZI HANURA', 'PEL II', 'Male', '1989-10-20', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'FAUZI.HANURA', NULL, NULL),
('5555', '8611110', 'FEBBY RAHMADANI', 'PEL I', 'Female', '1986-05-13', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'FEBBY.RAHMADANI', NULL, NULL),
('5556', '8911258', 'FEBRIANSYAH D', 'PEL I', 'Male', '1989-11-10', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'FEBRIANSYAH.D', NULL, NULL),
('5557', '7911017', 'FERIZAL', 'IV', 'Male', '1979-06-03', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Biaya', 'FERIZAL', NULL, NULL),
('5558', '9111312', 'FERNANDA EKA PUTRA, S.Kom.', 'PEL II', '', '1991-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FERNANDA.PUTRA', NULL, NULL),
('5559', '8311190', 'FERRY FERDINAN', 'PEL I', '', '1983-08-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FERRY.FERDINAN', NULL, NULL),
('5560', '8611133', 'FICHESY INDRA', 'PEL I', 'Female', '1986-02-25', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'FICHESY.INDRA', NULL, NULL),
('5561', '8411057', 'FIDE FIKO ALAM', 'PEL I', '', '1984-04-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIDE.ALAM', NULL, NULL),
('5562', '8111034', 'FIDRIA SAPUTRA', 'PEL I', 'Male', '1981-07-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'FIDRIA.SAPUTRA', NULL, NULL),
('5563', '7911176', 'FIRDAUS', 'PEL I', 'Male', '1979-07-19', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'FIRDAUS.5563', NULL, NULL),
('5564', '8611113', 'FIRMANSYAH', 'PEL I', '', '1986-10-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FIRMANSYAH.5564', NULL, NULL),
('5565', '8711149', 'FRANSISKO', 'PEL I', 'Male', '1987-11-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'FRANSISKO', NULL, NULL),
('5566', '8611109', 'FRIMATEDDY SYAFENDRA', 'IV', 'Male', '1986-03-28', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'FRIMATEDDY.SYAFENDRA', NULL, NULL),
('5567', '8711144', 'FUAD REZA ALES SANDRO', 'PEL I', 'Male', '1987-10-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'FUAD.SANDRO', NULL, NULL),
('5568', '8411058', 'GITA ANGGRENI', 'PEL I', '', '1984-03-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'GITA.ANGGRENI', NULL, NULL),
('5569', '8611199', 'GITO HARITS', 'PEL I', 'Male', '1986-01-18', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'GITO.HARITS', NULL, NULL),
('5570', '7611163', 'GUSMAWARDI', 'PEL I', 'Male', '1976-05-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'GUSMAWARDI', NULL, NULL),
('5571', '7811173', 'GUSNAR RAMDANI, SE.', 'PEL I', '', '1978-08-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'GUSNAR.RAMDANI', NULL, NULL),
('5572', '7811009', 'HADI GUSTIAWAN MUCKLIS, SE.', 'PEL I', '', '1978-08-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HADI.GUSTIAWAN', NULL, NULL),
('5573', '9111305', 'HAMDAN HANADHI', 'PEL I', 'Male', '1991-11-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HAMDAN.HANADHI', NULL, NULL),
('5574', '8411075', 'HANGGA MAREY ARIEF', 'PEL I', 'Male', '1984-03-28', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'HANGGA.ARIEF', NULL, NULL),
('5575', '8511195', 'HARIA PUTRA', 'PEL I', 'Male', '1985-03-23', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'HARIA.PUTRA', NULL, NULL),
('5576', '9011280', 'HARIYANDA ADILESTAMAN', 'PEL I', 'Male', '1990-03-22', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'HARIYANDA.A', NULL, NULL),
('5577', '8711095', 'HARMEN, ST.', 'IV', 'Male', '1987-07-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'HARMEN.5577', NULL, NULL),
('5578', '8411074', 'HAYATUL AMALUDDIN', 'PEL I', 'Male', '1984-04-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'HAYATUL.AMALUDDIN', NULL, NULL),
('5579', '9011289', 'HAYATUL MUTTAQIN', 'PEL II', 'Male', '1990-06-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'HAYATUL.MUTTAQIN', NULL, NULL),
('5580', '9011286', 'HENDRA AGUSMAN', 'PEL II', '', '1990-08-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENDRA.AGUSMAN', NULL, NULL),
('5581', '7911177', 'HENDRA KUSUMA', 'PEL I', 'Male', '1979-10-14', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'HENDRA.KUSUMA', NULL, NULL),
('5582', '8311048', 'HENDRA SYAHRIZANA', 'PEL I', '', '1983-03-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENDRA.SYAHRIZANA', NULL, NULL),
('5583', '8911267', 'HENDRA YUDI, ST.', 'PEL I', 'Male', '1989-05-26', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'HENDRA.YUDI', NULL, NULL),
('5585', '8111111', 'HENGKI IRAWAN', 'PEL I', '', '1981-10-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENGKI.IRAWAN', NULL, NULL),
('5587', '8811227', 'HERJUN PRABOWO', 'PEL I', 'Male', '1988-08-11', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'HERJUN.PRABOWO', NULL, NULL),
('5588', '9011271', 'HERKA VERNANDA', 'PEL II', '', '1990-10-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HERKA.VERNANDA', NULL, NULL),
('5589', '8711205', 'HERLAN', 'PEL II', 'Male', '1987-12-22', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'HERLAN', NULL, NULL),
('5590', '8311045', 'HERLIN VIONA', 'IV', 'Female', '1983-08-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Perpajakan', 'HERLIN.VIONA', NULL, NULL),
('5591', '7911016', 'HERMANDA EKA PUTRA', 'PEL I', 'Male', '1979-11-29', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'HERMANDA.PUTRA', NULL, NULL),
('5592', '8911248', 'HERU PERDANA PUTRA', 'PEL I', '', '1989-03-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HERU.PUTRA', NULL, NULL),
('5593', '7711166', 'HISKO ARITIVON', 'PEL I', 'Male', '1977-02-24', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Regulasi & Administrasi Legal', 'HISKO.ARITIVON', NULL, NULL),
('5594', '8511097', 'IFFAH ILHAMI', 'IV', 'Male', '1985-05-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'IFFAH.ILHAMI', NULL, NULL),
('5595', '8711209', 'IFRAN IFRIANDA', 'PEL I', 'Male', '1987-01-04', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'IFRAN.IFRIANDA', NULL, NULL),
('5596', '9111327', 'IKHSAN PURNAMA, ST.', 'PEL II', 'Male', '1991-10-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'IKHSAN.PURNAMA', NULL, NULL),
('5597', '8911268', 'IKHWANUL FAJRI', 'PEL II', '', '1989-12-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IKHWANUL.FAJRI', NULL, NULL),
('5598', '8811226', 'ILHAM JUHENDRA', 'PEL I', 'Male', '1988-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'ILHAM.JUHENDRA', NULL, NULL),
('5599', '8811228', 'ILHAM REDHA', 'PEL I', 'Male', '1988-04-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'ILHAM.REDHA', NULL, NULL),
('5600', '8911250', 'ILHAM SHANI', 'PEL I', '', '1989-12-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ILHAM.SHANI', NULL, NULL),
('5601', '8511105', 'ILHAM WAHYUNI, ST.', 'PEL I', '', '1985-06-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ILHAM.WAHYUNI', NULL, NULL),
('5602', '7711008', 'ILVI WALDEVRI', 'PEL I', '', '1977-03-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ILVI.WALDEVRI', NULL, NULL),
('5603', '7411154', 'INDRA', 'PEL I', 'Male', '1974-12-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'INDRA.5603', NULL, NULL),
('5604', '9111314', 'INDRA MARDENI PUTRA', 'PEL II', '', '1991-03-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'INDRA.PUTRA5604', NULL, NULL),
('5605', '8811233', 'IREF MALIZAR', 'PEL II', '', '1988-08-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IREF.MALIZAR', NULL, NULL),
('5606', '9011279', 'IRWANDI YUSANDRA', 'PEL I', 'Male', '1990-02-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'IRWANDI.YUSANDRA', NULL, NULL),
('5607', '8611114', 'IRZA KUSTIANI', 'PEL I', '', '1986-09-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IRZA.KUSTIANI', NULL, NULL),
('5608', '8711148', 'ISKA PURWANDA', 'PEL I', 'Female', '1987-01-30', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ISKA.PURWANDA', NULL, NULL),
('5609', '8511087', 'ISMED', 'PEL I', 'Male', '1985-02-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ISMED', NULL, NULL),
('5610', '8211039', 'IZNIL ZUHEIMI', 'PEL I', 'Male', '1982-03-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'IZNIL.ZUHEIMI', NULL, NULL),
('5611', '9011295', 'JEFRY SUMARLI', 'PEL I', 'Male', '1990-01-08', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'JEFRY.SUMARLI', NULL, NULL),
('5612', '8411064', 'JHON RAMADONY, ST.', 'PEL I', 'Male', '1984-06-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'JHON.RAMADONY', NULL, NULL),
('5613', '9111328', 'JHOVI HAVIL', 'PEL I', 'Male', '1991-06-06', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'JHOVI.HAVIL', NULL, NULL),
('5614', '8811222', 'JOHARJO', 'PEL II', 'Male', '1988-01-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'JOHARJO', NULL, NULL),
('5615', '8711141', 'JOKO ADE SAPUTRA, ST.', 'PEL I', '', '1987-03-04', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JOKO.SAPUTRA', NULL, NULL),
('5617', '8811151', 'JONI INDA PUTRA, ST.', 'PEL I', 'Male', '1988-06-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'JONI.PUTRA', NULL, NULL),
('5618', '9011294', 'JONI SOPRIYANTO', 'PEL II', 'Male', '1990-06-18', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'JONI.SOPRIYANTO', NULL, NULL),
('5619', '8111183', 'JUNAIDI, SH.', 'PEL I', '', '1981-06-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JUNAIDI.5619', NULL, NULL),
('5620', '8611201', 'KAREL AQUARDO', 'PEL II', '', '1986-01-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'KAREL.AQUARDO', NULL, NULL),
('5621', '8811224', 'KHAIRUL FIKRI', 'PEL I', 'Male', '1988-11-13', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'KHAIRUL.FIKRI', NULL, NULL),
('5622', '7711165', 'KHIDMI', 'PEL I', 'Male', '1977-03-26', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'KHIDMI', NULL, NULL),
('5623', '8411055', 'KHRISTIAN SONATHA, SE.', 'PEL I', '', '1984-12-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'KHRISTIAN.SONATHA', NULL, NULL),
('5624', '8511100', 'KM AKIB FIRMANSYAH', 'PEL I', '', '1985-10-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AKIB.FIRMANSYAH', NULL, NULL),
('5625', '7911174', 'LIDYA ROSI ANGGRAINI', 'PEL II', '', '1979-06-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'LIDYA.ANGGRAINI', NULL, NULL),
('5626', '7911013', 'LIZA DRAMENDRA', 'IV', 'Female', '1979-01-13', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Perbendaharaan', 'LIZA.DRAMENDRA', NULL, NULL),
('5627', '7511155', 'LUKMAN', 'PEL II', 'Male', '1975-02-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'LUKMAN.5627', NULL, NULL),
('5628', '8911243', 'M ANDEKA FRANDALA, ST.', 'PEL II', '', '1989-05-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDEKA.FRANDALA', NULL, NULL),
('5629', '8311052', 'M FADLI NAZAR', 'PEL I', 'Male', '1983-10-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'FADLI.NAZAR', NULL, NULL),
('5630', '8711145', 'MARDIAL ELBEM', 'PEL I', 'Male', '1987-03-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'MARDIAL.ELBEM', NULL, NULL),
('5631', '9111316', 'MARTINUS ZALDI, SE.', 'PEL I', 'Male', '1991-03-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'MARTINUS.ZALDI', NULL, NULL),
('5632', '9011288', 'MARWAN SYAHPUTRA', 'PEL II', '', '1990-03-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MARWAN.SYAHPUTRA', NULL, NULL),
('5633', '7611160', 'MAY EVA YANTI', 'PEL I', '', '1976-05-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MAY.YANTI', NULL, NULL),
('5634', '8011021', 'MEHMOOD', 'PEL I', 'Male', '1980-02-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Listrik & Instrumen', 'MEHMOOD', NULL, NULL),
('5635', '8511089', 'MENDI HERYANTO', 'PEL I', 'Male', '1985-09-29', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'MENDI.HERYANTO', NULL, NULL),
('5636', '8611200', 'MENDRA YUSTISIA ASRIL', 'PEL II', 'Male', '1986-05-29', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'MENDRA.ASRIL', NULL, NULL),
('5637', '9211331', 'MERISA PUTRI', 'PEL I', 'Female', '1992-02-26', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'MERISA.PUTRI', NULL, NULL),
('5638', '8811225', 'META EPSI JALADARA', 'PEL I', 'Male', '1988-06-13', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'META.JALADARA', NULL, NULL),
('5639', '7611007', 'MHD  YAKIN, ST.', 'PEL I', 'Male', '1976-06-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'MHD.YAKIN', NULL, NULL),
('5640', '9011274', 'MICHAEL LASWANDI', 'PEL II', '', '1990-09-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MICHAEL.LASWANDI', NULL, NULL),
('5641', '9011287', 'MICHAEL YULISA, S.Sos.', 'PEL II', 'Male', '1990-05-04', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'MICHAEL.YULISA', NULL, NULL),
('5642', '8611122', 'MUHAMMAD AFIRDAL, ST.', 'PEL I', '', '1986-03-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMMAD.AFIRDAL', NULL, NULL),
('5643', '8411069', 'MUHAMMAD ERFAN, ST.', 'PEL I', '', '1984-12-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMMAD.ERFAN', NULL, NULL),
('5644', '9011301', 'MUHAMMAD FAUZI', 'PEL II', 'Male', '1990-05-21', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'MUHAMMAD.FAUZI', NULL, NULL),
('5645', '8611124', 'MUHAMMAD FIRDAUS PERDANA', 'PEL I', 'Male', '1986-09-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'MUHAMMAD.PERDANA', NULL, NULL),
('5646', '8411072', 'MUHAMMAD RAHMAD ASRIL', 'PEL I', '', '1984-05-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMMAD.ASRIL', NULL, NULL),
('5647', '8511104', 'MUHAMMAD RIDWAN', 'IV', 'Male', '1985-08-10', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'MUHAMMAD.RIDWAN', NULL, NULL),
('5648', '9011281', 'MUHAMMAD RIZKI, ST.', 'PEL I', 'Male', '1990-12-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'MUHAMMAD.RIZKI', NULL, NULL),
('5649', '8411066', 'MUHAMMAD RUSDIANSYAH PUTRA', 'PEL I', 'Male', '1984-10-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'MUHAMMAD.RUSDIANSYAH', NULL, NULL),
('5650', '8611125', 'MUHAMMAD SYUKRI, ST.', 'IV', 'Male', '1986-12-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'MUHAMMAD.SYUKRI', NULL, NULL),
('5651', '8311050', 'MUKHDI ROZI', 'PEL I', 'Male', '1983-07-07', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'MUKHDI.ROZI', NULL, NULL),
('5652', '7511156', 'MUKHRIAL', 'PEL II', 'Male', '1975-12-09', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'MUKHRIAL', NULL, NULL),
('5653', '7611234', 'MUSMARDI', 'PEL I', 'Male', '1976-03-08', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'MUSMARDI', NULL, NULL),
('5654', '8011024', 'MUSMULYADI BESMAN', 'PEL I', 'Male', '1980-01-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'MUSMULYADI.BESMAN', NULL, NULL),
('5655', '8111033', 'MUSRIZAL', 'PEL I', 'Male', '1981-11-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'MUSRIZAL', NULL, NULL),
('5656', '8911246', 'MUTIA RAHMI', 'PEL II', '', '1989-12-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUTIA.RAHMI', NULL, NULL),
('5657', '7811168', 'NASRIONO', 'PEL I', 'Male', '1978-06-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'TPM Officer', 'TPM Officer', 'NASRIONO', NULL, NULL),
('5658', '8011179', 'NICKY ALVANDI', 'PEL II', 'Male', '1980-11-26', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'NICKY.ALVANDI', NULL, NULL),
('5659', '8811237', 'NIKO AZWAR', 'PEL II', '', '1988-04-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NIKO.AZWAR', NULL, NULL),
('5660', '8711137', 'NIKO KURNIAWAN', 'PEL I', 'Male', '1987-08-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'NIKO.KURNIAWAN', NULL, NULL),
('5661', '8211036', 'NILA PUSPA RENI', 'IV', 'Female', '1982-02-01', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'NILA.RENI', NULL, NULL),
('5662', '8511091', 'NINO PERDANA PUTRA', 'IV', 'Male', '1985-01-09', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'NINO.PUTRA', NULL, NULL),
('5663', '8411060', 'NOVIAN HENDRA', 'PEL I', 'Male', '1984-06-16', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'NOVIAN.HENDRA', NULL, NULL),
('5664', '9111322', 'NURFITRI SAUFAYURA, SE.', 'PEL II', 'Female', '1991-04-22', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'NURFITRI.SAUFAYURA', NULL, NULL),
('5665', '8511084', 'NURMA NENGSIH', 'PEL I', 'Female', '1985-07-04', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'NURMA.NENGSIH', NULL, NULL),
('5666', '9011277', 'OKKY HARY SAPUTRA', 'PEL II', 'Male', '1990-10-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'OKKY.SAPUTRA', NULL, NULL),
('5667', '7511025', 'OKTAVERI', 'IV', 'Male', '1975-10-08', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'OKTAVERI', NULL, NULL),
('5668', '8711136', 'OSLANI ERWAL', 'PEL II', '', '1987-03-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'OSLANI.ERWAL', NULL, NULL),
('5669', '9111302', 'PANJI DWI AGRAMA, SE.', 'PEL I', '', '1991-03-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'PANJI.AGRAMA', NULL, NULL),
('5670', '8711216', 'PILIANJOLO REANT', 'PEL II', 'Male', '1987-04-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'PILIANJOLO.REANT', NULL, NULL),
('5671', '7611006', 'POVIA', 'IV', 'Female', '1976-08-11', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'POVIA', NULL, NULL),
('5672', '8911263', 'PUPUT DIANA', 'PEL I', 'Female', '1989-08-16', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Hukum', 'PUPUT.DIANA', NULL, NULL),
('5673', '8511196', 'PUTRI PALUPI, ST.', 'PEL II', 'Female', '1985-04-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'PUTRI.PALUPI', NULL, NULL),
('5675', '9111311', 'RAFKIE AULYA, ST.', 'PEL I', 'Male', '1991-07-04', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Perencanaan Produksi & QA Kantong', 'RAFKIE.AULYA', NULL, NULL),
('5676', '8611131', 'RAFSANJANI CHARLI, ST.', 'PEL I', 'Male', '1986-11-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RAFSANJANI.CHARLI', NULL, NULL),
('5677', '9111319', 'RAGIL SUKMANA', 'PEL II', '', '1991-01-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAGIL.SUKMANA', NULL, NULL),
('5678', '8511099', 'RAHIM RAZAKI', 'PEL I', '', '1985-07-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAHIM.RAZAKI', NULL, NULL),
('5679', '8911247', 'RANDI ANDAREZA', 'PEL I', 'Male', '1989-06-15', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'RANDI.ANDAREZA', NULL, NULL),
('5680', '8711135', 'RANDI DALVIANDRE', 'IV', 'Male', '1987-08-26', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'RANDI.DALVIANDRE', NULL, NULL),
('5681', '9011297', 'RANDY SURYA WIRMAN', 'PEL II', '', '1990-04-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RANDY.WIRMAN', NULL, NULL),
('5682', '8511079', 'RANGGA LOEIS', 'PEL I', 'Male', '1985-05-23', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'RANGGA.LOEIS', NULL, NULL),
('5684', '7811170', 'RAVIKO MAAR', 'PEL I', 'Male', '1978-02-22', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'RAVIKO.MAAR', NULL, NULL),
('5685', '8411192', 'RAYNALDO HAYARA NUNYAI', 'PEL I', '', '1984-01-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAYNALDO.NUNYAI', NULL, NULL),
('5686', '8611115', 'REFFY MERTA PUTRA', 'PEL I', '', '1986-04-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'REFFY.PUTRA', NULL, NULL),
('5687', '7711164', 'REFI RISKO, SE', 'PEL I', '', '1977-07-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'REFI.RISKO', NULL, NULL),
('5688', '9011292', 'REGI ENDA PRIMA PUTRA', 'PEL I', 'Male', '1990-10-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'REGI.PUTRA', NULL, NULL),
('5689', '9111304', 'REINHARD YERUZELKY POLII', 'PEL I', 'Male', '1991-05-14', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'REINHARD.POLII', NULL, NULL),
('5691', '8511082', 'RENO HARYANTO GUSTI', 'PEL I', 'Male', '1985-01-17', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Perpajakan', 'RENO.GUSTI', NULL, NULL),
('5692', '8811231', 'RESTY NOER', 'PEL I', 'Female', '1988-10-24', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'RESTY.NOER', NULL, NULL),
('5694', '8211040', 'RHODIAN ADHY HIDAYANTO', 'IV', 'Male', '1982-09-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RHODIAN.HIDAYANTO', NULL, NULL),
('5695', '8211037', 'RICKY AMRANUS', 'PEL I', 'Male', '1982-09-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RICKY.AMRANUS', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('5697', '8711213', 'RICKY KURNIAWAN, ST.', 'PEL I', 'Male', '1987-09-21', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'RICKY.KURNIAWAN', NULL, NULL),
('5698', '8211186', 'RICKY PRASETYO ANGGARA', 'PEL I', 'Male', '1982-11-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'RICKY.ANGGARA', NULL, NULL),
('5699', '9011275', 'RICO KURNIAWAN, SE.', 'PEL I', '', '1990-04-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RICO.KURNIAWAN', NULL, NULL),
('5702', '8111185', 'RIDWAN', 'PEL II', 'Male', '1981-05-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RIDWAN.5702', NULL, NULL),
('5703', '7611005', 'RIEZALTS', 'PEL I', 'Male', '1976-10-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RIEZALTS', NULL, NULL),
('5704', '8811235', 'RIHAN FERNANDO', 'PEL I', 'Male', '1988-11-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'RIHAN.FERNANDO', NULL, NULL),
('5705', '8911241', 'RIJAL IVANTRI AMRAN, ST.', 'PEL I', 'Male', '1989-10-09', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'RIJAL.AMRAN', NULL, NULL),
('5706', '8911265', 'RIKAWARNI, ST.', 'PEL I', '', '1989-07-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIKAWARNI', NULL, NULL),
('5707', '8311051', 'RIKI SAPUTRA, ST.', 'PEL I', '', '1983-01-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIKI.SAPUTRA', NULL, NULL),
('5708', '8411061', 'RIKY SYAMSIR', 'PEL I', 'Male', '1984-03-23', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'RIKY.SYAMSIR', NULL, NULL),
('5709', '9011270', 'RINALDO SAPUTRA', 'PEL II', 'Male', '1990-03-28', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'RINALDO.SAPUTRA', NULL, NULL),
('5710', '9111323', 'RIO FAHMA', 'PEL I', 'Male', '1991-08-25', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'RIO.FAHMA', NULL, NULL),
('5711', '9011300', 'RISKA APRODITYA', 'PEL I', '', '1990-02-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RISKA.APRODITYA', NULL, NULL),
('5712', '8111184', 'RIYAN HERMAWAN', 'PEL II', '', '1981-05-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIYAN.HERMAWAN', NULL, NULL),
('5713', '8511081', 'RIYANT MAYLANDO', 'PEL I', '', '1985-05-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIYANT.MAYLANDO', NULL, NULL),
('5714', '9011296', 'RIZKY NOVANDRA, SE.', 'PEL I', '', '1990-11-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIZKY.NOVANDRA', NULL, NULL),
('5715', '8911266', 'ROBBY SAPUTRA, S.M.', 'PEL I', 'Male', '1989-03-18', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'ROBBY.SAPUTRA', NULL, NULL),
('5716', '7511158', 'ROBY EDRIAN', 'PEL II', 'Male', '1975-09-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ROBY.EDRIAN', NULL, NULL),
('5717', '8611211', 'ROMI RAHMAN, SE., MM.', 'PEL I', 'Male', '1986-06-25', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'ROMI.RAHMAN', NULL, NULL),
('5718', '8411056', 'RONAL', 'PEL I', '', '1984-10-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RONAL', NULL, NULL),
('5719', '8911254', 'RONALDI NAZWAR', 'PEL II', 'Male', '1989-05-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'RONALDI.NAZWAR', NULL, NULL),
('5720', '8511094', 'ROSSI KURNIAWAN, ST.', 'PEL I', '', '1985-05-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROSSI.KURNIAWAN', NULL, NULL),
('5721', '7411162', 'ROSTIKA BUDI', 'PEL II', 'Male', '1974-12-22', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Pabrik Kantong', 'Sie. Produksi Kantong', 'ROSTIKA.BUDI', NULL, NULL),
('5722', '8311189', 'ROY FRISANO', 'PEL I', 'Male', '1983-07-22', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'ROY.FRISANO', NULL, NULL),
('5723', '8511255', 'RUDI ZULKARNAIN', 'PEL I', 'Male', '1985-05-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'RUDI.ZULKARNAIN', NULL, NULL),
('5724', '9011291', 'RUKI TRI JULMAN', 'PEL II', 'Male', '1990-07-31', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RUKI.JULMAN', NULL, NULL),
('5725', '8311044', 'RULY HANARI', 'PEL I', '', '1983-06-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RULY.HANARI', NULL, NULL),
('5726', '8611121', 'RUSMAN HIDAYAT, ST., MM.', 'PEL I', 'Male', '1986-05-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RUSMAN.HIDAYAT', NULL, NULL),
('5727', '9211330', 'RYAN ANDIKA PUTRA', 'PEL II', '', '1992-08-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RYAN.PUTRA5727', NULL, NULL),
('5728', '8811230', 'RYAN IRAMANA PUTRA', 'PEL I', 'Male', '1988-08-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'RYAN.PUTRA5728', NULL, NULL),
('5729', '9111310', 'SANDRA MARISSA', 'PEL II', '', '1991-05-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SANDRA.MARISSA', NULL, NULL),
('5730', '8411194', 'SAPARUDIN', 'PEL I', 'Male', '1984-06-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'SAPARUDIN', NULL, NULL),
('5731', '8611026', 'SARI SYUKRINA', 'PEL I', '', '1986-07-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SARI.SYUKRINA', NULL, NULL),
('5732', '9111309', 'SATRIA BUANA', 'PEL II', 'Male', '1991-02-28', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'SATRIA.BUANA', NULL, NULL),
('5733', '8211043', 'SIRJON ASRI, ST', 'PEL I', '', '1982-03-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SIRJON.ASRI', NULL, NULL),
('5734', '8011180', 'SISKA KURNIATI, ST.', 'PEL I', '', '1980-10-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SISKA.KURNIATI', NULL, NULL),
('5735', '8811219', 'SISKA NOFIANTI', 'PEL II', '', '1988-11-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SISKA.NOFIANTI', NULL, NULL),
('5736', '7811172', 'SOHKIP', 'PEL II', '', '1978-01-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SOHKIP', NULL, NULL),
('5737', '7911178', 'SONI ARIYANTO', 'PEL I', '', '1979-01-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SONI.ARIYANTO', NULL, NULL),
('5738', '7511001', 'SRI HARTATI', 'PEL I', '', '1975-06-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SRI.HARTATI', NULL, NULL),
('5739', '9011284', 'STIVANO HARDI', 'PEL II', 'Male', '1990-11-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'STIVANO.HARDI', NULL, NULL),
('5740', '8611130', 'SUHERDIAN SEPTA SARIANJA, ST.', 'PEL I', 'Male', '1986-09-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'SUHERDIAN.SARIANJA', NULL, NULL),
('5741', '8411070', 'SUHERMON, ST.', 'PEL I', '', '1984-04-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUHERMON', NULL, NULL),
('5742', '8511080', 'SUTAN MUHAMMAD IQBAL', 'PEL I', '', '1985-02-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUTAN.IQBAL', NULL, NULL),
('5743', '8411059', 'SYAFRIKA MAI DENDRA', 'PEL I', 'Male', '1984-05-14', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'SYAFRIKA.DENDRA', NULL, NULL),
('5744', '8511085', 'SYAIFUL RAMADHAN', 'PEL I', '', '1985-06-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SYAIFUL.RAMADHAN', NULL, NULL),
('5746', '9111308', 'TAUFIT', 'PEL II', 'Male', '1991-05-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'TAUFIT', NULL, NULL),
('5747', '7911014', 'TEDI FERDANA SANDY, SE.', 'PEL I', '', '1979-02-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TEDI.SANDY', NULL, NULL),
('5748', '8711138', 'TIFFANIE TELAMBANUA', 'PEL I', '', '1987-06-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TIFFANIE.TELAMBANUA', NULL, NULL),
('5749', '8111030', 'TONI KASWARA', 'PEL I', 'Male', '1981-02-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan Listrik & Instrumen Packer Indarung', 'TONI.KASWARA', NULL, NULL),
('5750', '8411071', 'TRI MAIZON', 'PEL I', 'Male', '1984-05-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'TRI.MAIZON', NULL, NULL),
('5751', '8911198', 'TRISNA YOLANDA, S.Kom.', 'PEL I', 'Female', '1989-07-07', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'TRISNA.YOLANDA', NULL, NULL),
('5752', '8611117', 'TRISNO NELSON, SE.', 'PEL I', 'Male', '1986-01-18', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'TRISNO.NELSON', NULL, NULL),
('5753', '8411073', 'ULKAMRI, ST.', 'IV', 'Male', '1984-08-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'ULKAMRI', NULL, NULL),
('5754', '8911261', 'VICBY AULIA', 'PEL II', 'Male', '1989-08-07', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'VICBY.AULIA', NULL, NULL),
('5755', '8711212', 'VIRA, SE.', 'PEL I', '', '1987-12-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'VIRA', NULL, NULL),
('5756', '8411063', 'VIVI KURNIATY, ST.', 'PEL I', '', '1984-12-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'VIVI.KURNIATY', NULL, NULL),
('5757', '8111031', 'WAHYU HIDAYAT, ST.', 'PEL I', '', '1981-08-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WAHYU.HIDAYAT5757', NULL, NULL),
('5758', '8811223', 'WAHYU KURNIAWAN', 'PEL II', '', '1988-08-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WAHYU.KURNIAWAN', NULL, NULL),
('5759', '8711208', 'WAHYU STUDIAWAN', 'PEL I', 'Male', '1987-10-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'WAHYU.STUDIAWAN', NULL, NULL),
('5760', '8811221', 'WAHYUDI', 'PEL II', 'Male', '1988-08-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'WAHYUDI.5760', NULL, NULL),
('5761', '8011018', 'WAHYUDI KARTIKA CANRA', 'PEL I', '', '1980-04-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WAHYUDI.CANRA', NULL, NULL),
('5762', '9111315', 'WAWAN PRASETYO', 'PEL II', 'Male', '1991-12-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'WAWAN.PRASETYO', NULL, NULL),
('5763', '8011108', 'WENDRA CHRIZTIAN', 'PEL I', 'Male', '1980-10-10', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'WENDRA.CHRIZTIAN', NULL, NULL),
('5764', '8311150', 'WERY FRIMA', 'PEL I', 'Male', '1983-10-12', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'WERY.FRIMA', NULL, NULL),
('5765', '8211038', 'WILLIE ANTHONI, ST.', 'PEL I', 'Male', '1982-05-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'WILLIE.ANTHONI', NULL, NULL),
('5766', '8611127', 'WILLY ADAM', 'PEL I', 'Male', '1986-05-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'WILLY.ADAM', NULL, NULL),
('5767', '8311054', 'WILMAN ISNAINI, ST.', 'PEL I', 'Male', '1983-03-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'WILMAN.ISNAINI', NULL, NULL),
('5768', '8411067', 'WISA PUTRA', 'PEL I', '', '1984-03-15', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WISA.PUTRA', NULL, NULL),
('5769', '9011283', 'YANDRI SAPUTRA', 'PEL I', 'Male', '1990-01-27', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'YANDRI.SAPUTRA', NULL, NULL),
('5770', '8511092', 'YEFRI YENDIKA, ST.', 'PEL I', '', '1985-02-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YEFRI.YENDIKA', NULL, NULL),
('5771', '7411153', 'YENNI YEFRITA', 'PEL II', 'Female', '1974-12-30', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'YENNI.YEFRITA', NULL, NULL),
('5772', '9111329', 'YOGA HAMNIKA', 'PEL II', 'Male', '1991-07-10', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'YOGA.HAMNIKA', NULL, NULL),
('5773', '9111303', 'YOGI PERSADA GUBTA', 'PEL II', '', '1991-01-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YOGI.GUBTA', NULL, NULL),
('5774', '8211187', 'YOGI SUPRIZARTO', 'PEL II', 'Male', '1982-10-19', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'YOGI.SUPRIZARTO', NULL, NULL),
('5775', '8611112', 'YOZA RENO HASTUTI', 'IV', 'Female', '1986-07-16', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'YOZA.HASTUTI', NULL, NULL),
('5776', '8611126', 'YUDISTIA HADI PRATAMA', 'PEL I', 'Male', '1986-09-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'YUDISTIA.PRATAMA', NULL, NULL),
('5777', '8811161', 'YULHENDRI', 'PEL I', 'Male', '1988-09-09', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'YULHENDRI', NULL, NULL),
('5778', '8911239', 'YULIA DAFITRI', 'PEL II', '', '1989-07-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YULIA.DAFITRI', NULL, NULL),
('5779', '8911260', 'YULIANDRI', 'PEL I', 'Male', '1989-07-04', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'YULIANDRI', NULL, NULL),
('5781', '9111320', 'YUSARDI', 'PEL II', '', '1991-02-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YUSARDI', NULL, NULL),
('5782', '7511002', 'YUSRAN AGUSTIN', 'IV', 'Male', '1975-08-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'YUSRAN.AGUSTIN', NULL, NULL),
('5784', '8511077', 'ZUL ADLI', 'IV', 'Male', '1985-12-16', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Asuransi', 'ZUL.ADLI', NULL, NULL),
('5785', '8911252', 'ZULFADHLY SAPUTRA', 'PEL I', 'Male', '1989-10-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'ZULFADHLY.SAPUTRA', NULL, NULL),
('5786', '9011293', 'ZULHENDRA RAIS', 'PEL I', 'Male', '1990-07-19', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'ZULHENDRA.RAIS', NULL, NULL),
('5788', '8311333', 'ARDIANSYAH, ST.', 'IV', 'Male', '1983-12-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'ARDIANSYAH.5788', NULL, NULL),
('5789', '8511334', 'VISCHA DIPAMA MEYOSI AZWAR', 'IV', 'Female', '1985-03-06', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'VISCHA.AZWAR', NULL, NULL),
('5790', '8511335', 'FEDLY RAESA', 'IV', 'Male', '1985-02-21', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Pengelolaan AP / AR', 'FEDLY.RAESA', NULL, NULL),
('5791', '9011336', 'HAFNIL', 'PEL II', 'Male', '1990-05-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'HAFNIL', NULL, NULL),
('5792', '8612001', 'RINI ADRI YANTI', 'PEL I', 'Female', '1986-08-15', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'RINI.YANTI', NULL, NULL),
('5793', '9111317', 'ACHMAD TAUFAN OHANA, ST.', 'PEL I', 'Male', '1991-06-01', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ACHMAD.OHANA', NULL, NULL),
('5794', '8511083', 'ACI LESTA TRIADI MUNIR, S.Si.', 'PEL I', '', '1985-07-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ACI.MUNIR', NULL, NULL),
('5795', '8811218', 'ADDINU EKA PUTRA, SH.', 'PEL I', 'Male', '1988-04-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'ADDINU.PUTRA', NULL, NULL),
('5799', '7611337', 'ALEX PARGA', 'PEL I', 'Male', '1976-12-24', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ALEX.PARGA', NULL, NULL),
('5800', '8311338', 'ALFET SIO ILYAS', 'PEL I', 'Male', '1983-08-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ALFET.ILYAS', NULL, NULL),
('5801', '8211339', 'ARIO SUMORI AMRAN', 'PEL I', 'Male', '1982-10-19', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ARIO.AMRAN', NULL, NULL),
('5802', '7711340', 'DEDI SUHENDRI', 'PEL I', 'Male', '1977-03-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'DEDI.SUHENDRI', NULL, NULL),
('5803', '7711341', 'ERWIN', 'PEL I', 'Male', '1977-09-11', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'ERWIN.5803', NULL, NULL),
('5804', '7711342', 'JHONNY FAIZAL', 'PEL I', 'Male', '1977-12-31', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'JHONNY.FAIZAL', NULL, NULL),
('5805', '8411343', 'NADRY HEROZA', 'PEL I', 'Male', '1984-09-22', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'NADRY.HEROZA', NULL, NULL),
('5806', '8511344', 'PULI MUHKLISIN', 'PEL I', 'Male', '1985-03-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'PULI.MUHKLISIN', NULL, NULL),
('5807', '7611345', 'TOTO SETYONO', 'PEL I', 'Male', '1976-06-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'TOTO.SETYONO', NULL, NULL),
('5824', '7197004', 'ACHMAD THOLCHAH, ST.', 'I', '', '1971-07-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ACHMAD.THOLCHAH', NULL, NULL),
('6429', '7197009', 'ADEL RAHADI R, ST., MCom.', 'I', '', '1971-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADEL.RAHADI', NULL, NULL),
('6594', '8814018', 'FEBBY ARIEF ZEINDRA, SE.', 'III', 'Male', '1988-02-10', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Anggaran', 'FEBBY.ZEINDRA', NULL, NULL),
('6595', '9014039', 'IHDA NULIZA LEYROS, SE.', 'III', 'Female', '1990-07-13', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Evaluasi Kinerja', 'IHDA.LEYROS', NULL, NULL),
('6596', '8614011', 'AISYAH NUR, SE.', 'III', 'Female', '1986-04-16', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'AISYAH.NUR', NULL, NULL),
('6597', '8614012', 'ATHARI ADI PUTRA, SE.', 'III', 'Male', '1986-12-14', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'ATHARI.PUTRA', NULL, NULL),
('6598', '9014041', 'RAHMAT NOVRIYAN, SE., Akt., CA.', 'III', 'Male', '1990-11-10', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Biaya', 'RAHMAT.NOVRIYAN', NULL, NULL),
('6599', '9114045', 'PRADIPTYA WIBAWA', 'II', '', '1991-04-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'PRADIPTYA.WIBAWA', NULL, NULL),
('6600', '8914034', 'ADITYA MAHENDRA DION WIJAYA, SE., Ak., C', 'III', 'Male', '1989-11-13', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'ADITYA.WIJAYA', NULL, NULL),
('6601', '9114043', 'ELISA MARIS HERU, SE., MM.', 'III', 'Female', '1991-03-10', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'ELISA.MARIS', NULL, NULL),
('6602', '8914030', 'RISA RIZKI PRIMAYANI, SE.', 'III', 'Female', '1989-01-21', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'RISA.PRIMAYANI', NULL, NULL),
('6604', '9114311', 'DEVIN TRIWINATA', 'III', '', '1991-04-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DEVIN.TRIWINATA', NULL, NULL),
('6605', '8814023', 'IBRAHIM HANIF', 'III', '', '1988-07-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IBRAHIM.HANIF', NULL, NULL),
('6606', '8814022', 'ANDRE FRANDIKO', 'III', '', '1988-05-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDRE.FRANDIKO', NULL, NULL),
('6607', '8514008', 'SISKA AYU SORAYA, SE.', 'III', 'Female', '1985-05-29', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'SISKA.SORAYA', NULL, NULL),
('6609', '8514009', 'OXIVIA, SH.', 'III', '', '1985-10-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'OXIVIA', NULL, NULL),
('6610', '8914029', 'ROBIE BRILLIANDO SUKANDA, SH., MKn.', 'III', 'Male', '1989-01-17', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Regulasi & Administrasi Legal', 'ROBIE.SUKANDA', NULL, NULL),
('6611', '9114044', 'FAUZAN PRASETYA, DR., SH., MKn.', 'III', 'Male', '1991-04-12', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Hukum', 'FAUZAN.PRASETYA', NULL, NULL),
('6612', '8914028', 'FEBRIANKI ULTARI S.Si, MM.', 'III', 'Male', '1989-02-14', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'FEBRIANKI.ULTARI', NULL, NULL),
('6613', '8814017', 'SISRI HANDA YANI', 'III', '', '1988-01-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SISRI.YANI', NULL, NULL),
('6614', '9014036', 'HENZO BERNANDO', 'III', '', '1990-03-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENZO.BERNANDO', NULL, NULL),
('6615', '9014035', 'YANUARDI, ST.', 'III', 'Male', '1990-01-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'YANUARDI.4444023', NULL, NULL),
('6616', '8714013', 'RAHMAN IKHLAS, ST.', 'III', 'Male', '1987-01-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Konstruksi', 'RAHMAN.IKHLAS', NULL, NULL),
('6617', '8714016', 'ANGGA DWI PERMANA PUTRA, ST.', 'III', 'Male', '1987-12-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'ANGGA.PUTRA', NULL, NULL),
('6618', '9014037', 'DANIEL EKO SULISTYO, ST., MT.', 'III', 'Male', '1990-06-05', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'DANIEL.SULISTYO', NULL, NULL),
('6619', '8414006', 'ESRON TARIGAN, ST.', 'III', 'Male', '1984-10-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'ESRON.TARIGAN', NULL, NULL),
('6620', '8714015', 'HARRI KURNIAWAN, ST', 'III', 'Male', '1987-08-30', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'HARRI.KURNIAWAN', NULL, NULL),
('6621', '8514307', 'MEDI AGUSTI, ST.', 'III', 'Male', '1985-08-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'MEDI.AGUSTI', NULL, NULL),
('6622', '8614010', 'YELMI ARYA PUTRA, ST.', 'III', 'Male', '1986-03-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Operasi Crusher & Conveyor', 'YELMI.PUTRA', NULL, NULL),
('6623', '9014038', 'RENDY FAHLEVI, ST.', 'III', 'Male', '1990-07-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'RENDY.FAHLEVI', NULL, NULL),
('6624', '8814153', 'ILHAM AKBAR, ST.', 'III', 'Male', '1988-06-06', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'ILHAM.AKBAR', NULL, NULL),
('6625', '8914033', 'BERVA LINDO, ST.', 'III', 'Male', '1989-09-04', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'BERVA.LINDO', NULL, NULL),
('6626', '8714014', 'ARIE RONALDO ALBERTHA', 'III', 'Male', '1987-06-11', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'ARIE.RONALDO', NULL, NULL),
('6627', '8914031', 'MOCHAMAD RIZKY ILMAWAN, S.Kom., MM.', 'III', 'Male', '1989-07-02', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'MOCHAMAD.ILMAWAN', NULL, NULL),
('6628', '8814026', 'DEBI SYAHPUTRA, S.Kom.', 'III', 'Male', '1988-12-11', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'DEBI.SYAHPUTRA', NULL, NULL),
('6629', '8814024', 'ANKA STEFANO', 'III', '', '1988-09-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANKA.STEFANO', NULL, NULL),
('6630', '8914032', 'VERDY RADINAL GUSMAN, ST.', 'III', 'Male', '1989-08-31', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'VERDY.GUSMAN', NULL, NULL),
('6631', '8314002', 'INDRIA HAPSARI, ST.', 'IV', 'Female', '1983-10-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'INDRIA.HAPSARI', NULL, NULL),
('6632', '9014040', 'DHEA NOVANDA', 'III', '', '1990-11-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DHEA.NOVANDA', NULL, NULL),
('6633', '8814025', 'RIKA PUTRI WAHYUNI, ST.', 'III', 'Female', '1988-11-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'RIKA.WAHYUNI', NULL, NULL),
('6634', '8814309', 'NANDA KURNIAWAN', 'III', '', '1988-09-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NANDA.KURNIAWAN', NULL, NULL),
('6635', '9014042', 'YOGI KHAIRI HASIBUAN', 'III', '', '1990-11-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YOGI.HASIBUAN', NULL, NULL),
('6636', '9114047', 'AJENG DWI UTAMI, ST.', 'III', '', '1991-06-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AJENG.UTAMI', NULL, NULL),
('6637', '9114046', 'RAUSYAN FIKRI, ST.', 'III', 'Male', '1991-05-27', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'RAUSYAN.FIKRI', NULL, NULL),
('6638', '9214049', 'MUHAMMAD THARIQ, ST.', 'III', 'Male', '1992-09-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'MUHAMMAD.THARIQ', NULL, NULL),
('6639', '8814020', 'AGRIAN PEBY, ST.', 'III', 'Male', '1988-04-27', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'AGRIAN.PEBY', NULL, NULL),
('6640', '8514007', 'FERDY DINARDO', 'III', '', '1985-02-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FERDY.DINARDO', NULL, NULL),
('6641', '8314003', 'TEGUH SOVIYANTO', 'III', '', '1983-12-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TEGUH.SOVIYANTO', NULL, NULL),
('6642', '8814027', 'ALFEIN RAHMAD, ST.', 'III', 'Male', '1988-12-11', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'ALFEIN.RAHMAD', NULL, NULL),
('6643', '8414005', 'AKHMAYANDA NASUTION, ST.', 'III', 'Male', '1984-05-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'AKHMAYANDA.NASUTION', NULL, NULL),
('6644', '8714308', 'DANI DARMA PUTRA, ST.', 'III', 'Male', '1987-10-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'DANI.PUTRA', NULL, NULL),
('6645', '8314001', 'WIRADANA DJUFRI, ST.', 'III', 'Male', '1983-06-19', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'WIRADANA.DJUFRI', NULL, NULL),
('6646', '8415323', 'ANDHIKA RIO, ST.', 'III', 'Male', '1984-03-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'ANDHIKA.RIO', NULL, NULL),
('6647', '8814019', 'RICKY APRINALDO, ST.', 'III', 'Male', '1988-04-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'RICKY.APRINALDO', NULL, NULL),
('6648', '8814021', 'ARIEF RAHMAN DASRIL, ST., MM.', 'III', 'Male', '1988-05-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'ARIEF.DASRIL', NULL, NULL),
('6649', '8414004', 'FEBI RIELDI, ST.', 'III', 'Male', '1984-02-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Pengelolaan Overhaul', 'FEBI.RIELDI', NULL, NULL),
('6650', '8714152', 'AULIA EKADANA FAUTHRISNO, ST', 'III', 'Male', '1987-01-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'AULIA.FAUTHRISNO', NULL, NULL),
('6651', '9115321', 'GERRY PRANATA', 'PEL II', '', '1991-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'GERRY.PRANATA', NULL, NULL),
('6652', '9015320', 'DESI SRI YANTI', 'PEL I', 'Female', '1990-12-25', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'DESI.YANTI', NULL, NULL),
('6653', '8815319', 'FAUZIAH WULANDARI', 'PEL I', 'Female', '1988-07-30', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'FAUZIAH.WULANDARI', NULL, NULL),
('6654', '9014126', 'IMELDA TELAMBANUA', 'PEL I', '', '1990-11-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'IMELDA.TELAMBANUA', NULL, NULL),
('6655', '9114139', 'AMY LA MARTHA', 'PEL I', 'Female', '1991-03-27', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'AMY.MARTHA', NULL, NULL),
('6656', '9114155', 'ANGGA FIKRI HIDAYAT', 'PEL I', 'Male', '1991-02-04', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Pengelolaan AP / AR', 'ANGGA.HIDAYAT', NULL, NULL),
('6659', '8914098', 'HAFIZHAH', 'PEL I', 'Female', '1989-12-21', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'HAFIZHAH', NULL, NULL),
('6660', '8514050', 'STIFON PRIMA. SE, MM', 'PEL I', '', '1985-08-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'STIFON.PRIMA', NULL, NULL),
('6662', '9114156', 'TRI YULIA PUSPA RINI', 'PEL I', '', '1991-07-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TRI.RINI', NULL, NULL),
('6663', '9214150', 'FURQAN FIRMAN MAKARIM', 'PEL I', '', '1992-02-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FURQAN.MAKARIM', NULL, NULL),
('6664', '8914093', 'ARI SURYA CIPTA', 'PEL I', 'Male', '1989-01-02', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'ARI.CIPTA', NULL, NULL),
('6665', '9014102', 'ABDUL RAHMAN', 'PEL I', '', '1990-04-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ABDUL.RAHMAN6665', NULL, NULL),
('6666', '8714079', 'JIMMY CHANDRA EDUARD ORAH', 'PEL I', 'Male', '1987-09-13', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Bina Lingkungan', 'JIMMY.CHANDRA', NULL, NULL),
('6667', '8614059', 'PINTO BAPANDA', 'PEL I', '', '1986-03-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'PINTO.BAPANDA', NULL, NULL),
('6668', '9014111', 'ATIKA MUTIARA WIHELMINA', 'PEL I', '', '1990-06-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ATIKA.WIHELMINA', NULL, NULL),
('6669', '8814090', 'FITRI RAMELIA', 'PEL I', '', '1988-06-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FITRI.RAMELIA', NULL, NULL),
('6670', '9114144', 'DALISURYA ANDIOKTIA PUTRA', 'PEL I', '', '1991-10-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DALISURYA.PUTRA', NULL, NULL),
('6671', '8514054', 'M SYAFRIL', 'PEL I', 'Male', '1985-10-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'M.SYAFRIL', NULL, NULL),
('6672', '9114143', 'IRFIANTO NUSA PUTRA', 'PEL I', 'Male', '1991-07-19', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'IRFIANTO.PUTRA', NULL, NULL),
('6673', '8614061', 'ZUL HENDRI', 'PEL I', '', '1986-05-31', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZULHENDRI', NULL, NULL),
('6674', '8914096', 'EMIL EFIRSON', 'PEL I', '', '1989-07-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'EMIL.EFIRSON', NULL, NULL),
('6675', '8614062', 'MUCHLIS', 'PEL I', 'Male', '1986-07-29', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'MUCHLIS.4444083', NULL, NULL),
('6676', '9014120', 'SEPRIADI, ST', 'PEL I', 'Male', '1990-09-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'SEPRIADI', NULL, NULL),
('6677', '9114140', 'TRIE RISZKI AULYA S', 'PEL I', 'Male', '1991-04-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'TRIE.AULYA', NULL, NULL),
('6678', '8614066', 'BAYU PUTRA', 'PEL II', 'Male', '1986-09-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'BAYU.PUTRA4444086', NULL, NULL),
('6679', '8614069', 'JHONNY WAN OF MANIK', 'PEL I', 'Male', '1986-11-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'JHONNY.MANIK', NULL, NULL),
('6680', '8614068', 'MULYADI', 'PEL I', 'Male', '1986-10-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'MULYADI.4444089', NULL, NULL),
('6681', '8514051', 'WANSOL PANAS', 'PEL I', 'Male', '1985-08-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'WANSOL.PANAS', NULL, NULL),
('6682', '9214151', 'MICHEL AA , ST', 'PEL I', 'Male', '1992-04-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'MICHEL.A', NULL, NULL),
('6683', '8614058', 'M TORIK', 'PEL I', 'Male', '1986-03-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'M.TORIK', NULL, NULL),
('6684', '8814092', 'BENY NASRI', 'PEL I', 'Male', '1988-10-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'BENY.NASRI', NULL, NULL),
('6685', '9114148', 'RIKO DARMANTO', 'PEL I', 'Male', '1991-12-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. Pemeliharaan EPDC', 'RIKO.DARMANTO', NULL, NULL),
('6686', '9014106', 'DERY SUWANDI', 'PEL I', 'Male', '1990-05-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'DERY.SUWANDI', NULL, NULL),
('6687', '9014099', 'ALEX SANDER AFRIANTO', 'PEL I', 'Male', '1990-01-31', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'ALEX.AFRIANTO', NULL, NULL),
('6688', '8614057', 'FAJRI HAKIM', 'PEL I', 'Male', '1986-02-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'FAJRI.HAKIM', NULL, NULL),
('6689', '8814085', 'RIZKY FEBRIO', 'PEL I', 'Male', '1988-02-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'RIZKY.FEBRIO', NULL, NULL),
('6690', '9014115', 'REFKI, ST', 'PEL I', 'Male', '1990-07-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'REFKI', NULL, NULL),
('6691', '9014134', 'JONI SULNARDI', 'PEL I', 'Male', '1990-02-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'JONI.SULNARDI', NULL, NULL),
('6692', '9114312', 'WANDI HASRI', 'PEL I', 'Male', '1991-08-20', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hubungan Kepegawaian', 'WANDI.HASRI', NULL, NULL),
('6693', '9014130', 'FERDARIA ZAHRAH PUTRI', 'PEL I', '', '1990-12-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FERDARIA.PUTRI', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('6695', '9014127', 'NIKO YURI PRATAMA', 'PEL I', 'Male', '1990-11-23', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'NIKO.PRATAMA', NULL, NULL),
('6696', '9114157', 'BAHRAIN BORU SINAGA', 'PEL I', 'Female', '1991-02-11', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'BAHRAIN.SINAGA', NULL, NULL),
('6697', '9114141', 'ARI SISWANTO', 'PEL I', 'Male', '1991-06-02', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'ARI.SISWANTO', NULL, NULL),
('6698', '9014101', 'BENIDIKTUS ANDREAN SALIM', 'PEL I', 'Male', '1990-03-04', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'BENIDIKTUS.SALIM', NULL, NULL),
('6699', '9014112', 'PUJI ASTUTI', 'PEL I', 'Female', '1990-06-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'PUJI.ASTUTI', NULL, NULL),
('6700', '8614056', 'HENGKI YAMA PUTRA', 'PEL I', 'Male', '1986-12-24', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'HENGKI.PUTRA', NULL, NULL),
('6701', '8814088', 'AFRIANTO RAMADANI', 'PEL I', 'Male', '1988-04-25', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'AFRIANTO.RAMADANI', NULL, NULL),
('6702', '9014119', 'ROCKY EDOS JUNAIDI', 'PEL I', 'Male', '1990-08-12', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'ROCKY.JUNAIDI', NULL, NULL),
('6703', '9014103', 'WAHYU ROSITA MADASARI', 'PEL I', '', '1990-04-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'WAHYU.MADASARI', NULL, NULL),
('6704', '8714074', 'MARTU RIZAL', 'PEL I', 'Male', '1987-03-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'MARTU.RIZAL', NULL, NULL),
('6705', '8714082', 'RAFKI BUDIMAN', 'PEL I', 'Male', '1987-12-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RAFKI.BUDIMAN', NULL, NULL),
('6706', '9114145', 'WAHYU ARISAL PUTRA, ST', 'PEL I', 'Male', '1991-10-31', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'WAHYU.PUTRA', NULL, NULL),
('6707', '9014125', 'IRSYADUNNAS', 'PEL I', 'Male', '1990-11-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'IRSYADUNNAS', NULL, NULL),
('6708', '8514055', 'RIKI ZUHENDRA', 'PEL I', 'Male', '1985-10-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RIKI.ZUHENDRA', NULL, NULL),
('6709', '9014121', 'MUHAMMAD REZA NATIGORDO, ST', 'PEL I', 'Male', '1990-09-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'REZA.NATIGORDO', NULL, NULL),
('6710', '9114135', 'ARI MULIA', 'PEL I', 'Male', '1991-02-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'ARI.MULIA', NULL, NULL),
('6711', '8714075', 'FAUZAN ARINALDI', 'PEL I', 'Male', '1987-06-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'FAUZAN.ARINALDI', NULL, NULL),
('6712', '9014107', 'M FAUZAN AKBAR', 'PEL I', 'Male', '1990-05-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'FAUZAN.AKBAR', NULL, NULL),
('6713', '9014118', 'FANDI RAHMANDA', 'PEL I', 'Male', '1990-08-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'FANDI.RAHMANDA', NULL, NULL),
('6714', '8714077', 'AKMAL', 'PEL I', 'Male', '1987-08-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI FM 2-3-4', 'AKMAL.4444124', NULL, NULL),
('6715', '9114146', 'SWILLYANOF', 'PEL I', 'Male', '1991-11-29', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'SWILLYANOF', NULL, NULL),
('6716', '8714154', 'AHMAD ILHAM', 'PEL I', 'Male', '1987-03-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'AHMAD.ILHAM', NULL, NULL),
('6717', '8714078', 'HENGKI SURYADI', 'PEL I', 'Male', '1987-08-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'HENGKI.SURYADI', NULL, NULL),
('6718', '8614072', 'GITA REZA FAHLEVI', 'PEL I', 'Male', '1986-12-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'GITA.FAHLEVI', NULL, NULL),
('6719', '8614065', 'BUDI HARTANTO', 'PEL II', 'Male', '1986-08-30', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'BUDI.HARTANTO', NULL, NULL),
('6720', '9014117', 'AHMAD SAIFULLAH', 'PEL I', 'Male', '1990-08-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'AHMAD.SAIFULLAH', NULL, NULL),
('6721', '8914095', 'ADE MULIANDA', 'PEL I', 'Male', '1989-04-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ADE.MULIANDA', NULL, NULL),
('6722', '9114132', 'EKI DESRIZAL', 'PEL I', 'Male', '1991-01-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'EKI.DESRIZAL', NULL, NULL),
('6723', '8614070', 'EKO PRABOWO', 'PEL I', 'Male', '1986-11-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'EKO.PRABOWO', NULL, NULL),
('6724', '9014105', 'ALFIANDO', 'PEL I', '', '1990-05-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ALFIANDO', NULL, NULL),
('6725', '9114137', 'MUHAMAD AKBAR', 'PEL I', 'Male', '1991-02-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', ' Sie Pemeliharaan Mesin Packer Indarung', 'MUHAMMAD.AKBAR', NULL, NULL),
('6726', '9214149', 'ICHSAN ZUSYA PUTRA', 'PEL I', 'Male', '1992-01-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'ICHSAN.PUTRA', NULL, NULL),
('6727', '8714084', 'YOLLI DWI PUTRA', 'PEL I', 'Male', '1987-12-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'YOLLI.PUTRA', NULL, NULL),
('6728', '8714083', 'M ADI PUTRA', 'PEL I', 'Male', '1987-12-20', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'ADI.PUTRA', NULL, NULL),
('6729', '8614071', 'DESMAN JARAS', 'PEL I', 'Male', '1986-12-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'DESMAN.JARAS', NULL, NULL),
('6730', '8714081', 'ANDA KHARISMA', 'PEL I', 'Male', '1987-12-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ANDA.KHARISMA', NULL, NULL),
('6731', '9014124', 'ZULFADHLY', 'PEL I', 'Male', '1990-11-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ZULFADHLY', NULL, NULL),
('6732', '8914094', 'ANDRE MARZA', 'PEL I', 'Male', '1989-03-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'ANDRE.MARZA', NULL, NULL),
('6733', '8814086', 'APRINALDI', 'PEL I', 'Male', '1988-04-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'APRINALDI', NULL, NULL),
('6734', '9114133', 'ARRIJALU QAUMIN NISA', 'PEL I', 'Male', '1991-02-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ARRIJALU.NISA', NULL, NULL),
('6735', '9014113', 'ADE JAYA PUTRA', 'PEL I', 'Male', '1990-07-17', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'ADE.JAYA', NULL, NULL),
('6736', '9014131', 'YUHARDES', 'PEL I', 'Male', '1990-12-31', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'YUHARDES', NULL, NULL),
('6737', '9014128', 'REZHA ARNALDY', 'PEL I', 'Male', '1990-12-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'REZHA.ARNALDY', NULL, NULL),
('6738', '8914097', 'HENDRI SAPUTRA', 'PEL I', 'Male', '1989-10-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'HENDRI.SAPUTRA', NULL, NULL),
('6739', '9014109', 'RINALDI GUNAWAN SIHOMBING, ST', 'PEL I', 'Male', '1990-05-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'RINALDI.SIHOMBING', NULL, NULL),
('6740', '8614063', 'JULIE IRDO', 'PEL I', 'Male', '1986-07-31', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Unit Pemeliharaan Mesin 2', 'JULIE.IRDO', NULL, NULL),
('6741', '8714073', 'BUDI CHANDRA', 'PEL I', 'Male', '1987-02-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'BUDI.CHANDRA', NULL, NULL),
('6742', '8814091', 'SALMAN ALFARISYI', 'PEL I', 'Male', '1988-10-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'SALMAN.ALFARISYI', NULL, NULL),
('6743', '8814087', 'KUSNAEDI RAKA PRATAMA', 'PEL I', 'Male', '1988-04-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'KUSNAEDI.PRATAMA', NULL, NULL),
('6744', '9114136', 'YUDA ADE WANDIRA', 'PEL I', 'Male', '1991-02-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'YUDA.WANDIRA', NULL, NULL),
('6745', '8614064', 'RICO PRASETIA', 'PEL I', 'Male', '1986-08-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RICO.PRASETIA', NULL, NULL),
('6746', '8614060', 'FUADDY AL FITRA', 'PEL I', 'Male', '1986-05-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'FUADDY.FITRA', NULL, NULL),
('6747', '9114142', 'ARI SATRIA UTAMA', 'PEL I', 'Male', '1991-07-13', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'ARI.UTAMA', NULL, NULL),
('6748', '9014104', 'MUHAMMAD IHSAN', 'PEL I', 'Male', '1990-05-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'MUHAMMAD.IHSAN', NULL, NULL),
('6749', '9114138', 'AKBAR RIVALDHI', 'PEL I', '', '1991-03-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AKBAR.RIVALDHI', NULL, NULL),
('6750', '9014116', 'YULLY KURNIA ILLAHI', 'PEL I', 'Male', '1990-07-27', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'YULLY.ILLAHI', NULL, NULL),
('6751', '9014114', 'ALBERTHO SONANDA', 'PEL I', 'Male', '1990-07-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'ALBERTHO.SONANDA', NULL, NULL),
('6752', '9014122', 'ANGGA PERMANA PUTRA', 'PEL I', 'Male', '1990-10-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'ANGGA.PERMANA', NULL, NULL),
('6753', '8714076', 'NIKMATULLAH', 'PEL I', 'Male', '1987-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'NIKMATULLAH', NULL, NULL),
('6754', '8614067', 'IRVAN', 'PEL I', 'Male', '1986-10-04', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'IRVAN', NULL, NULL),
('6755', '8814089', 'RIDO ANDESTA', 'PEL I', '', '1988-05-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIDO.ANDESTA', NULL, NULL),
('6756', '8714080', 'RAHMAN SATRIA', 'PEL I', 'Male', '1987-11-12', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'RAHMAN.SATRIA', NULL, NULL),
('6757', '9114147', 'IVAN ROSANDY', 'PEL I', 'Male', '1991-11-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'IVAN.ROSANDY', NULL, NULL),
('6758', '9014129', 'DEDI HANAFI, ST', 'PEL I', 'Male', '1990-12-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'DEDI.HANAFI', NULL, NULL),
('6759', '8514052', 'ROMI MASYUTI', 'PEL I', '', '1985-09-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ROMI.MASYUTI', NULL, NULL),
('6760', '9014108', 'FHAJRI ANANDYA, ST', 'PEL I', 'Male', '1990-05-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'FHAJRI.ANANDYA', NULL, NULL),
('6766', '7416001', 'MULYADI', 'III', 'Male', '1974-04-20', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Perpajakan', 'mulyadi.474006', NULL, NULL),
('6767', '8414207', 'ABDUL HAFIZ', 'PEL II', 'Male', '1984-06-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'ABDUL.HAFIZ', NULL, NULL),
('6768', '8014314', 'ADHI SUPANGAT', 'PEL II', '', '1980-08-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ADHI.SUPANGAT', NULL, NULL),
('6770', '9314286', 'AFIF AULIA', 'PEL II', 'Male', '1993-12-10', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'AFIF.AULIA', NULL, NULL),
('6771', '8814245', 'ARISMAN AGUS', 'PEL II', 'Male', '1988-08-25', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Crusher', 'ARISMAN.AGUS', NULL, NULL),
('6772', '8714237', 'ARIEF LAKSANANDO', 'PEL II', 'Male', '1987-10-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'ARIEF.LAKSANANDO', NULL, NULL),
('6773', '8714238', 'ARIZAL', 'PEL II', 'Male', '1987-06-06', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ARIZAL.4444187', NULL, NULL),
('6774', '8214184', 'ARLEN RISDIAN', 'PEL II', 'Male', '1982-12-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'ARLEN.RISDIAN', NULL, NULL),
('6775', '8814246', 'ASVINNA YOLANDA', 'PEL II', 'Female', '1988-10-21', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'ASVINNA.YOLANDA', NULL, NULL),
('6776', '9414298', 'AYURE SWASTI RATU', 'PEL II', 'Female', '1994-02-01', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Hubungan Institusional', 'AYURE.RATU', NULL, NULL),
('6777', '8614226', 'AZMI DARWIS', 'PEL II', 'Male', '1986-09-23', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'AZMI.DARWIS', NULL, NULL),
('6778', '9114267', 'ANDRI NALDI', 'PEL II', 'Male', '1991-12-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'ANDRI.NALDI', NULL, NULL),
('6779', '9214271', 'ANDRI SUMARLI', 'PEL I', 'Male', '1992-12-25', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'ANDRI.SUMARLI', NULL, NULL),
('6780', '9014261', 'ANGGI SEPTIANDIKA', 'PEL II', 'Male', '1990-09-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ANGGI.SEPTIANDIKA', NULL, NULL),
('6781', '8314196', 'ANTON RAHMA PUTRA', 'PEL II', 'Male', '1983-08-14', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'ANTON.PUTRA', NULL, NULL),
('6782', '8314195', 'AL MUTAKIR', 'PEL II', 'Male', '1983-06-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'AL.MUTAKIR', NULL, NULL),
('6783', '8414208', 'AKBAR RAHMADIAN', 'PEL II', 'Male', '1984-10-12', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Elins Crusher & Conveyor', 'AKBAR.RAHMADIAN', NULL, NULL),
('6784', '8614225', 'AHMAD ZIAMUDDIN SIREGAR', 'PEL II', 'Male', '1986-07-17', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'AHMAD.ZIAMUDDIN', NULL, NULL),
('6785', '8914252', 'AGUNG RAMADHAN', 'PEL II', 'Male', '1989-04-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'AGUNG.RAMADHAN', NULL, NULL),
('6786', '9015332', 'RIDHO ALTERNOFSINT', 'PEL II', 'Male', '1990-09-29', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'RIDHO.ALTERNOFSINT', NULL, NULL),
('6788', '9314287', 'AFRI JONI', 'PEL II', 'Male', '1993-04-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'AFRI.JONI', NULL, NULL),
('6789', '8514216', 'AFINO FEBRIAN', 'PEL II', 'Male', '1985-02-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'AFINO.FEBRIAN', NULL, NULL),
('6790', '8714239', 'BAMBANG AGUSTIANTO', 'PEL II', 'Male', '1987-08-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'BAMBANG.AGUSTIANTO', NULL, NULL),
('6791', '8514217', 'BAMBANG WAHYUDI', 'PEL II', 'Male', '1985-09-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'BAMBANG.WAHYUDI', NULL, NULL),
('6792', '9214272', 'BERAIS', 'PEL II', 'Male', '1992-05-01', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'BERAIS', NULL, NULL),
('6793', '8614227', 'BERNAST TANAMAL', 'PEL II', 'Male', '1986-12-02', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'BERNAST.TANAMAL', NULL, NULL),
('6794', '8415328', 'BOBBY PUTRA OSRA', 'PEL II', 'Male', '1984-03-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'BOBBY.OSRA', NULL, NULL),
('6795', '8914253', 'CANDRA PURNOMO', 'PEL II', 'Male', '1989-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'CANDRA.PURNOMO', NULL, NULL),
('6796', '9014262', 'DAFIT ZULKIFLI', 'PEL II', 'Male', '1990-08-03', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'DAFIT.ZULKIFLI', NULL, NULL),
('6797', '8114181', 'DAVID FEBRIAN', 'PEL II', 'Male', '1981-02-19', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'DAVID.FEBRIAN', NULL, NULL),
('6798', '8014170', 'DECKY ALATAS', 'PEL II', 'Male', '1980-08-03', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Manajemen Aset', 'DECKY.ALATAS', NULL, NULL),
('6799', '8814316', 'DEDE SEPTIKA PUTRA, SE', 'PEL II', 'Male', '1988-09-17', 'Finance Directorate', 'Unit Sistem Manajemen', 'Unit Sistem Manajemen', 'Staf Sistem Manajemen', 'DEDE.PUTRA', NULL, NULL),
('6800', '9314288', 'DEDE WAHYUDI', 'PEL II', 'Male', '1993-06-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'DEDE.WAHYUDI', NULL, NULL),
('6801', '8314197', 'DEDI CHANDRA', 'PEL II', 'Male', '1983-06-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'DEDI.CHANDRA', NULL, NULL),
('6802', '8514218', 'DEKI NURKHA HAMDANI', 'PEL II', 'Male', '1985-01-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'DEKI.HAMDANI', NULL, NULL),
('6803', '8014171', 'DESRIZAL', 'PEL II', 'Male', '1980-12-18', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'DESRIZAL', NULL, NULL),
('6804', '9414299', 'DEZI YULI LOVENDRA', 'PEL II', 'Male', '1994-07-23', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'DEZI.LOVENDRA', NULL, NULL),
('6805', '9114268', 'DHIO ARIDHARMA', 'PEL II', 'Male', '1991-01-18', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'DHIO.ARIDHARMA', NULL, NULL),
('6807', '7814158', 'DIANA ERAWATI', 'PEL II', 'Female', '1978-06-26', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'DIANA.ERAWATI', NULL, NULL),
('6808', '8514219', 'DICKY GUSRIADI', 'PEL II', 'Male', '1985-08-15', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'DICKY.GUSRIADI', NULL, NULL),
('6809', '7815324', 'DIDA EFFENDI', 'PEL II', 'Male', '1978-06-06', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'DIDA.EFFENDI', NULL, NULL),
('6810', '8414209', 'DIKO SUSANTO', 'PEL II', 'Male', '1984-11-01', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'DIKO.SUSANTO', NULL, NULL),
('6811', '8614228', 'DION WYASTA PERDANA', 'PEL III', 'Male', '1986-03-22', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Program Kemitraan', 'DION.PERDANA', NULL, NULL),
('6812', '8314198', 'DODOI WINDRA', 'PEL I', 'Male', '1983-08-19', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'DODOI.WINDRA', NULL, NULL),
('6813', '8214185', 'DODY AFRIADY', 'PEL II', 'Male', '1982-01-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'DODY.AFRIADY', NULL, NULL),
('6814', '8714240', 'DWI ANDIKA, SH', 'PEL II', 'Male', '1987-04-09', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'DWI.ANDIKA', NULL, NULL),
('6815', '8014172', 'EDIA SURYA UTAMA', 'PEL II', 'Male', '1980-01-18', 'President Directorate', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'Bisnis Inkubasi Non Semen', 'EDIA.UTAMA', NULL, NULL),
('6816', '9414300', 'EGA RENALDO', 'PEL II', 'Male', '1994-09-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'EGA.RENALDO', NULL, NULL),
('6817', '8514220', 'EKO PUTRA', 'PEL II', 'Male', '1985-01-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'EKO.PUTRA', NULL, NULL),
('6818', '8214186', 'ENDRI NOVAL', 'PEL II', '', '1982-08-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ENDRI.NOVAL', NULL, NULL),
('6819', '9114269', 'ERMANDA', 'PEL II', 'Male', '1991-12-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'ERMANDA', NULL, NULL),
('6820', '7814159', 'ERWAN AHYANI', 'PEL II', '', '1978-09-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ERWAN.AHYANI', NULL, NULL),
('6821', '9414301', 'FAJRI ARFA RAHMAT', 'PEL II', 'Male', '1994-02-20', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'FAJRI.RAHMAT', NULL, NULL),
('6822', '9314289', 'FAJRI YANDA', 'PEL I', 'Male', '1993-05-12', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'FAJRI.YANDA', NULL, NULL),
('6823', '9214274', 'FIRDAUS RAHMADANA', 'PEL II', 'Male', '1992-03-08', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. Utilitas', 'FIRDAUS.RAHMADANA', NULL, NULL),
('6824', '8314200', 'FITRI WATI', 'PEL II', 'Female', '1983-11-08', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'FITRI.WATI', NULL, NULL),
('6825', '7914163', 'FREDI JONAFRI', 'PEL II', 'Male', '1979-03-30', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'FREDI.JONAFRI', NULL, NULL),
('6826', '9114317', 'HALVIKA PADMA', 'PEL II', 'Male', '1991-06-11', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'HALVIKA.PADMA', NULL, NULL),
('6827', '9214273', 'FAMELA CHANDRA', 'PEL II', 'Female', '1992-02-07', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Verifikasi', 'FAMELA.CHANDRA', NULL, NULL),
('6828', '8014173', 'FARDIANTO', 'PEL II', 'Male', '1980-03-28', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'FARDIANTO', NULL, NULL),
('6829', '8514221', 'FARIDA', 'PEL II', '', '1985-03-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FARIDA', NULL, NULL),
('6830', '8114182', 'FEBRIZON', 'PEL II', 'Male', '1981-02-11', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'FEBRIZON', NULL, NULL),
('6831', '9314290', 'FEDRICO ANDRI', 'PEL III', 'Male', '1993-05-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'FEDRICO.ANDRI', NULL, NULL),
('6832', '8314199', 'FENRA RIO', 'PEL II', 'Male', '1983-11-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'FENRA.RIO', NULL, NULL),
('6833', '8214187', 'FERIZAL', 'PEL II', 'Male', '1982-02-15', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'FERIZAL.4444232', NULL, NULL),
('6834', '8914254', 'FERRY ANWAR', 'PEL II', 'Male', '1989-12-21', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'FERRY.ANWAR', NULL, NULL),
('6835', '8014175', 'HENGKI JUNAIDI', 'PEL II', '', '1980-09-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENGKI.JUNAIDI', NULL, NULL),
('6836', '9214275', 'HARI SAFUTRA', 'PEL II', 'Male', '1992-10-09', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'HARI.SAFUTRA', NULL, NULL),
('6837', '9414302', 'HARTO', 'PEL II', 'Male', '1994-10-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI FM 5-6', 'HARTO', NULL, NULL),
('6838', '8014174', 'HENDKY PERMANA', 'PEL II', 'Male', '1980-03-20', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 2-3-4', 'HENDKY.PERMANA', NULL, NULL),
('6839', '7915325', 'HENDRATMO, SH', 'PEL II', 'Male', '1979-04-17', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'HENDRATMO', NULL, NULL),
('6840', '8615329', 'HENDRI YANUS WEKING', 'PEL II', 'Male', '1986-03-13', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'HENDRI.WEKING', NULL, NULL),
('6841', '8914255', 'HENGKI SASTRA PUTRA', 'PEL II', '', '1989-10-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HENGKI.SASTRA', NULL, NULL),
('6842', '8314201', 'IDRIS', 'PEL II', 'Male', '1983-04-08', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'IDRIS.4444245', NULL, NULL),
('6843', '7814160', 'ILHAM MUZAKI', 'PEL II', 'Male', '1978-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'ILHAM.MUZAKI', NULL, NULL),
('6844', '7914313', 'ISMAN', 'PEL III', 'Male', '1979-03-28', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'ISMAN', NULL, NULL),
('6845', '9214276', 'JAFRIADI', 'PEL II', 'Male', '1992-06-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Bengkel', 'Sie. Bengkel Mesin', 'JAFRIADI', NULL, NULL),
('6846', '9314291', 'JIMMY MUHARMAN', 'PEL II', 'Male', '1993-06-21', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'JIMMY.MUHARMAN', NULL, NULL),
('6847', '7814161', 'JONNEIDI', 'PEL II', '', '1978-12-19', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JONNEIDI', NULL, NULL),
('6848', '9314292', 'JUMARDO AKBAR', 'PEL II', 'Male', '1993-07-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'JUMARDO.AKBAR', NULL, NULL),
('6849', '9214277', 'KARDINAL MARTIN', 'PEL II', 'Male', '1992-04-07', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'KARDINAL.MARTIN', NULL, NULL),
('6850', '8414210', 'KARTIKA CANDRA YULIANTO, ST.', 'PEL II', '', '1984-07-28', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'KARTIKA.CANDRA', NULL, NULL),
('6851', '7914164', 'KIKI DARMAWAN', 'PEL II', 'Male', '1979-10-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'KIKI.DARMAWAN', NULL, NULL),
('6852', '8815330', 'LEADER LAURA', 'PEL II', 'Male', '1988-12-24', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'LEADER.LAURA', NULL, NULL),
('6853', '9414303', 'LEODY RINANDO CORTIS', 'PEL III', 'Male', '1994-08-14', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'LEODY.CORTIS', NULL, NULL),
('6854', '8214188', 'LEOZATIUSFRI', 'PEL II', '', '1982-08-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'LEOZATIUSFRI', NULL, NULL),
('6855', '7914165', 'LIDYA ROSA LIZA', 'PEL II', '', '1979-06-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'LIDYA.LIZA', NULL, NULL),
('6856', '9414304', 'M AHMED ZAKI', 'PEL II', 'Male', '1994-03-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'AHMED.ZAKI', NULL, NULL),
('6857', '9314293', 'MUHAMMAD KHAIRUL WARMAN', 'PEL II', 'Male', '1993-12-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'KHAIRUL.WARMAN', NULL, NULL),
('6858', '8414211', 'MARTA CANDRA', 'PEL II', 'Male', '1984-03-07', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'MARTA.CANDRA', NULL, NULL),
('6859', '8014176', 'MELKY', 'PEL II', '', '1980-06-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MELKY', NULL, NULL),
('6860', '9414305', 'MENTARY', 'PEL II', '', '1994-02-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MENTARY', NULL, NULL),
('6861', '8714241', 'MIKEL MUHAMMAD', 'PEL II', 'Male', '1987-01-15', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Humas', 'MIKEL.MUHAMMAD', NULL, NULL),
('6862', '8614229', 'MUHARDIMAN', 'PEL II', '', '1986-09-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHARDIMAN', NULL, NULL),
('6863', '8014169', 'BENNY SETIAWAN', 'PEL II', 'Male', '1980-02-05', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Regulasi & Administrasi Legal', 'BENNY.SETIAWAN', NULL, NULL),
('6864', '8214189', 'MULYADI', 'PEL II', '', '1982-12-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MULYADI.4444266', NULL, NULL),
('6865', '9214278', 'NOVENDRI', 'PEL II', '', '1992-11-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NOVENDRI', NULL, NULL),
('6866', '8014177', 'NOVI ANDRI', 'PEL II', 'Male', '1980-11-07', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'NOVI.ANDRI', NULL, NULL),
('6867', '8614230', 'NOVI BUSRI', 'PEL II', 'Male', '1986-07-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'NOVI.BUSRI', NULL, NULL),
('6868', '9314294', 'NURUL ANNISA, SE', 'PEL II', '', '1993-12-16', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NURUL.ANNISA', NULL, NULL),
('6869', '9214279', 'OKTARIZALNI PUTRA', 'PEL II', 'Male', '1992-10-10', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'OKTARIZALNI.PUTRA', NULL, NULL),
('6870', '7914166', 'OLGA DE NIRA', 'PEL II', 'Female', '1979-10-17', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'OLGA.NIRA', NULL, NULL),
('6871', '8914256', 'ORIX BERY KARYA', 'PEL I', 'Male', '1989-11-08', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'ORIX.KARYA', NULL, NULL),
('6872', '8214190', 'PAULO ROSI', 'PEL II', 'Male', '1982-07-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'PAULO.ROSI', NULL, NULL),
('6873', '9314295', 'RAHMAD ARDIANTO', 'PEL II', 'Male', '1993-02-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RAHMAD.ARDIANTO', NULL, NULL),
('6874', '9314296', 'RAHMAD HIDAYAT', 'PEL II', 'Male', '1993-06-16', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'RAHMAD.HIDAYAT', NULL, NULL),
('6875', '9414306', 'RAMADHANI EFENDI', 'PEL II', '', '1994-02-23', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RAMADHANI.EFENDI', NULL, NULL),
('6876', '9214280', 'RANDI SAPUTRA', 'PEL II', 'Male', '1992-07-18', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Penunjang Produksi', 'Sie. Alat Berat & Transportasi Batu Bara', 'RANDI.SAPUTRA', NULL, NULL),
('6877', '9214281', 'RATHOMI ANDIKA', 'PEL I', 'Male', '1992-10-13', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'RATHOMI.ANDIKA', NULL, NULL),
('6878', '8714242', 'REBY ABRIAN', 'PEL II', 'Male', '1987-04-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'REBY.ABRIAN', NULL, NULL),
('6879', '8414212', 'RENO ZAPUTRA', 'PEL II', 'Male', '1984-05-29', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'RENO.ZAPUTRA', NULL, NULL),
('6880', '9014263', 'RESMADEWITA', 'PEL II', '', '1990-10-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RESMADEWITA', NULL, NULL),
('6881', '7914167', 'RESY WARDIA', 'PEL II', '', '1979-12-20', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RESY.WARDIA', NULL, NULL),
('6882', '8714243', 'REVELINO ANDY PUTRA', 'PEL II', 'Male', '1987-07-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'REVELINO.PUTRA', NULL, NULL),
('6883', '8914257', 'REZY MELANO ADAM', 'PEL II', 'Male', '1989-02-23', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'REZY.ADAM', NULL, NULL),
('6884', '8214191', 'RICKY PUTRA MAHYUDIN, SE', 'PEL I', 'Male', '1982-05-17', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'RICKY.MAHYUDIN', NULL, NULL),
('6885', '8614231', 'RICKY EDI SYAHPUTRA', 'PEL II', 'Male', '1986-02-17', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'RICKY.SYAHPUTRA', NULL, NULL),
('6886', '8614232', 'RIDHO ARISANDI', 'PEL II', 'Male', '1986-05-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RIDHO.ARISANDI', NULL, NULL),
('6887', '9214282', 'RIDHO PERMANA, S.Ak', 'PEL II', 'Male', '1992-06-20', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Pengelolaan AP / AR', 'RIDHO.PERMANA', NULL, NULL),
('6888', '8814247', 'RIKY SYURYA DINATA', 'PEL II', 'Male', '1988-06-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RIKY.SYURYADINATA', NULL, NULL),
('6889', '8414213', 'RIO MAYKANDRA', 'PEL II', '', '1984-02-10', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIO.MAYKANDRA', NULL, NULL),
('6890', '8415327', 'RIRI HARFENDA', 'PEL II', 'Male', '1984-02-21', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'RIRI.HARFENDA', NULL, NULL),
('6891', '8914258', 'RISE SANJEZ', 'PEL II', 'Female', '1989-11-21', 'Finance Directorate', 'Departemen Keuangan', 'Unit Keuangan', 'Staf Pengelolaan AP / AR', 'RISE.SANJEZ', NULL, NULL),
('6892', '8514222', 'RIZAL AMIN', 'PEL II', 'Male', '1985-12-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'RIZAL.AMIN', NULL, NULL),
('6893', '8314202', 'RIZKI APRINANDA, S. Kom', 'PEL II', 'Male', '1983-04-17', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'RIZKI.APRINANDA', NULL, NULL),
('6894', '9014264', 'ROBBY PERDANA KAROHAN', 'PEL III', 'Male', '1990-06-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'ROBBY.KAROHAN', NULL, NULL),
('6895', '8914259', 'ROLI GUSMAN PORI', 'PEL II', 'Male', '1989-08-18', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'ROLI.PORI', NULL, NULL),
('6896', '7914168', 'ROMI ANDRIA', 'PEL I', 'Male', '1979-02-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'ROMI.ANDRIA', NULL, NULL),
('6897', '8214192', 'ROMI MASRUL', 'PEL I', 'Male', '1982-06-23', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Coal Mixing', 'ROMI.MASRUL', NULL, NULL),
('6898', '8614233', 'RONAL SUHERNANDA', 'PEL II', 'Male', '1986-12-05', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'RONAL.SUHERNANDA', NULL, NULL),
('6899', '8514223', 'RONI HERMANTO', 'PEL II', 'Male', '1985-06-29', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'RONI.HERMANTO', NULL, NULL),
('6900', '8314203', 'RONI PUTRA', 'PEL II', 'Male', '1983-05-26', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Staf Administrasi & Keuangan', 'RONI.PUTRA', NULL, NULL),
('6901', '8214193', 'RONI IRAWAN, ST.', 'PEL II', 'Male', '1982-05-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'RONI.IRAWAN', NULL, NULL),
('6902', '9114270', 'RUDI NOVIANDRI', 'PEL II', 'Male', '1991-11-23', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 23', 'RUDI.NOFIANDRI', NULL, NULL),
('6903', '8814248', 'RUDWA IRGA, A. Md', 'PEL II', 'Male', '1988-01-22', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'RUDWA.IRGA', NULL, NULL),
('6904', '8314204', 'RYCKO SAPUTRA', 'PEL II', '', '1983-07-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RYCKO.SAPUTRA', NULL, NULL),
('6905', '9214283', 'SADRI HEDUSMAN', 'PEL II', '', '1992-06-18', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SADRI.HEDUSMAN', NULL, NULL),
('6906', '9314297', 'SANDI PUTRA', 'PEL II', 'Male', '1993-08-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'SANDI.PUTRA', NULL, NULL),
('6907', '8614234', 'SARI MADONA, ST.', 'PEL II', 'Female', '1986-03-24', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'SARI.MADONA', NULL, NULL),
('6908', '9014265', 'SISKA ANGELVA', 'PEL II', 'Female', '1990-05-02', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Hiperkes', 'SISKA.ANGELVA', NULL, NULL),
('6909', '8014178', 'SIUS', 'PEL II', '', '1980-05-17', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SIUS', NULL, NULL),
('6910', '8814249', 'SPRESDO ASKA AMDEYENDRA', 'PEL II', 'Male', '1988-06-13', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'SPRESDO.AMDEYENDRA', NULL, NULL),
('6911', '9214284', 'STEVAN MAHDANI', 'PEL III', 'Male', '1992-09-12', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'STEVAN.MAHDANI', NULL, NULL),
('6912', '8414214', 'SUCI RAHMAYANI', 'PEL II', '', '1984-06-06', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'SUCI.RAHMAYANI', NULL, NULL),
('6913', '8314205', 'SURI KURNIA', 'PEL II', 'Female', '1983-10-13', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Pengelolaan SDM', 'SURI.KURNIA', NULL, NULL),
('6914', '8214194', 'SUROSO', 'PEL II', 'Male', '1982-04-16', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'SUROSO', NULL, NULL),
('6915', '8414215', 'SYAIFUL PUTRA, A.Md', 'PEL II', 'Male', '1984-04-02', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'SYAIFUL.PUTRA', NULL, NULL),
('6916', '8714244', 'SYERWAN FATONI', 'PEL II', 'Male', '1987-12-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'SYERWAN.FATONI', NULL, NULL),
('6917', '8514224', 'SYOVIANTI IRSYAM, SE.', 'PEL II', 'Female', '1985-10-17', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Perpajakan', 'SYOVIANTI.IRSYAM', NULL, NULL),
('6918', '8814250', 'TRI DAYA JAKA PUTRA', 'PEL II', 'Male', '1988-06-07', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'TRI.PUTRA', NULL, NULL),
('6919', '7814162', 'ULMULYADI', 'PEL II', 'Male', '1978-10-01', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'ULMULYADI', NULL, NULL),
('6920', '8014179', 'USMAN EFFENDI', 'PEL II', 'Male', '1980-02-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 1', 'Sie. PLI RKC 2-3-4', 'USMAN.EFFENDI', NULL, NULL),
('6921', '9014266', 'VANNI VAMELLA NAINGGOLAN', 'PEL II', '', '1990-07-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'VANNI.VAMELLA', NULL, NULL),
('6922', '8114183', 'WAHYUDI', 'PEL II', 'Male', '1981-10-25', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'WAHYUDI.4444325', NULL, NULL);
INSERT INTO `karyawans` (`nik`, `nip`, `nama`, `band`, `gender`, `tgl_lahir`, `dir`, `dep`, `unit`, `seksi`, `email`, `created_at`, `updated_at`) VALUES
('6923', '8914260', 'WILY WARNEL JABAR', 'PEL II', 'Male', '1989-06-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'WILY.JABAR', NULL, NULL),
('6924', '8415322', 'YARNIS', 'PEL II', 'Female', '1984-01-08', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Operasional SDM', 'Staf Diklat & KM', 'YARNIS', NULL, NULL),
('6925', '8014180', 'YOSEP MARTA', 'PEL II', 'Male', '1980-09-07', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'YOSEP.MARTA', NULL, NULL),
('6926', '9214285', 'YUNDI ANDESA', 'PEL II', '', '1992-10-05', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'YUNDI.ANDESA', NULL, NULL),
('6927', '8814251', 'ZIKRA', 'PEL II', 'Male', '1988-10-14', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Loading & Hauling', 'ZIKRA', NULL, NULL),
('6928', '8315326', 'ZUL ARMEN', 'PEL II', 'Male', '1983-09-09', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi Packer Indarung', 'ZUL.ARMEN', NULL, NULL),
('6929', '8614235', 'ZULFIKAR, ST', 'PEL II', 'Male', '1986-03-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ZULFIKAR.4444332', NULL, NULL),
('6930', '8614236', 'ZULHAM ERYPIKO', 'PEL II', '', '1986-08-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZULHAM.ERYPIKO', NULL, NULL),
('6931', '8314206', 'ZULKARNAIN', 'PEL II', '', '1983-09-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZULKARNAIN.4444334', NULL, NULL),
('7305', '9998644', 'ROSMAWI, SH', 'II', 'Male', '1963-10-10', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Keamanan', 'Unit Keamanan', 'rosmawi', NULL, NULL),
('7490', '8718001', 'HARY PUTRA', 'PEL II', '', '1987-03-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'HARY.PUTRA', NULL, NULL),
('7491', '8718002', 'BAGUS ARIF RAKHMAN', 'PEL II', '', '1987-03-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BAGUS.RAKHMAN', NULL, NULL),
('7492', '8718003', 'FYOL LANRY', 'PEL II', '', '1987-03-29', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'FYOL.LANRY', NULL, NULL),
('7493', '8718004', 'MUHAMMAD THAHA ARIEF', 'PEL II', 'Male', '1987-05-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'MUHAMMAD.ARIEF7493', NULL, NULL),
('7494', '8818005', 'ZAINAL FACHRUDIN', 'PEL II', '', '1988-03-01', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZAINAL.FACHRUDIN', NULL, NULL),
('7495', '8818006', 'RIKI REGA PUTRA', 'PEL II', 'Male', '1988-03-10', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'RIKI.PUTRA', NULL, NULL),
('7496', '8818007', 'JOKO SULISTYANTO', 'PEL II', '', '1988-06-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JOKO.SULISTYANTO', NULL, NULL),
('7497', '8818008', 'IBNUL GHUFRON', 'PEL II', 'Male', '1988-09-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RKC 5-6', 'IBNUL.GHUFRON', NULL, NULL),
('7498', '8818009', 'DAVID SAPUTRA', 'PEL II', '', '1988-10-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DAVID.SAPUTRA', NULL, NULL),
('7499', '8818010', 'M HUSNI TAMRIN', 'PEL II', 'Male', '1988-11-03', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit CSR', 'Sie. Program Kemitraan', 'M.TAMRIN7499', NULL, NULL),
('7500', '8818011', 'IVAN RICHARDO', 'PEL II', 'Male', '1988-12-01', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf GRC', 'IVAN.RICHARDO', NULL, NULL),
('7501', '8918012', 'HANIF MERIZAL', 'PEL II', 'Male', '1989-01-11', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'HANIF.MERIZAL', NULL, NULL),
('7502', '8918013', 'ANDRI ADRINAL', 'PEL II', 'Male', '1989-01-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Produksi Bahan Baku', 'Sie. Pemeliharaan Mesin Conveyor', 'ANDRI.ADRINAL7502', NULL, NULL),
('7503', '8918014', 'JEN RIADI', 'PEL II', '', '1989-01-30', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'JEN.RIADI', NULL, NULL),
('7504', '8918015', 'AFRAN RAMADHANA', 'PEL II', 'Male', '1989-04-07', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf Perencanaan & Evaluasi Tambang', 'AFRAN.RAMADHANA', NULL, NULL),
('7505', '8918016', 'ICHWAN ICHSYAN', 'PEL II', '', '1989-05-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7507', '9418018', 'FIDEL MAULANA PUTRA', 'PEL II', '', '1994-05-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7508', '8918019', 'DIKI FIRDAUS', 'PEL II', '', '1989-07-22', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'DIKI.FIRDAUS', NULL, NULL),
('7509', '8918020', 'ILHAM AHMAD, ST.', 'PEL II', 'Male', '1989-09-15', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ILHAM.AHMAD', NULL, NULL),
('7510', '9018021', 'FUAD AHMAD', 'PEL II', 'Male', '1990-03-21', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'FUAD.AHMAD7510', NULL, NULL),
('7511', '9018022', 'REFKI BUDIMAN', 'PEL II', 'Male', '1990-05-05', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'REFKI.BUDIMAN', NULL, NULL),
('7513', '9018024', 'ANHAR', 'PEL II', '', '1990-08-03', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7514', '9118025', 'ANGGA FULAMDANA', 'PEL II', 'Male', '1991-04-04', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ANGGA.FULAMDANA', NULL, NULL),
('7515', '9118026', 'APRI KURNIAWAN', 'PEL II', 'Male', '1991-04-06', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin FM 5-6', 'APRI.KURNIAWAN', NULL, NULL),
('7516', '9118027', 'GUSWANDI', 'PEL II', 'Male', '1991-08-29', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'GUSWANDI7516', NULL, NULL),
('7517', '9118028', 'ANDI PUTRA', 'PEL II', 'Male', '1991-09-19', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'ANDI.PUTRA7517', NULL, NULL),
('7518', '9118029', 'RICKO OKTA FURGANI', 'PEL II', '', '1991-10-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RICKO.FURGANI', NULL, NULL),
('7519', '9118030', 'RONCE OKNANDES', 'PEL II', 'Male', '1991-10-27', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'RONCE.OKNANDES', NULL, NULL),
('7520', '9218031', 'HARI SURYA PURNAMA', 'PEL II', 'Male', '1992-01-15', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'HARI.PURNAMA', NULL, NULL),
('7521', '9218032', 'RENDY HIDAYAT', 'PEL II', 'Male', '1992-02-08', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'RENDY.HIDAYAT', NULL, NULL),
('7522', '9218033', 'RAHMAD HIDAYAT', 'PEL II', 'Male', '1992-09-06', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'RAHMAD.HIDAYAT7522', NULL, NULL),
('7523', '9218034', 'RIZKY DWI ERNALDI', 'PEL II', 'Male', '1992-03-29', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit WHRPG & Utilitas', 'Sie. WHRPG', 'RIZKY.ERNALDI', NULL, NULL),
('7524', '9218035', 'SETIANI DWININGTYAS', 'PEL II', 'Female', '1992-04-03', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'SETIANI.DWININGTYAS', NULL, NULL),
('7526', '9218037', 'FERI WIBOWO', 'PEL II', 'Male', '1992-05-05', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'FERI.WIBOWO', NULL, NULL),
('7527', '9218038', 'CHAIRUL AMRI', 'PEL II', '', '1992-06-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'CHAIRUL.AMRI7527', NULL, NULL),
('7528', '9218039', 'RYAN EKA SAPUTRA', 'PEL II', '', '1992-07-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7531', '9218042', 'IQBAL HILMAN', 'PEL II', 'Male', '1992-10-15', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Pemeliharaan Alat Berat Tambang', 'IQBAL.HILMAN', NULL, NULL),
('7532', '9218043', 'DEDI MEIER SILABAN', 'PEL II', 'Male', '1992-12-07', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 5', 'DEDI.SILABAN', NULL, NULL),
('7533', '9218044', 'RIDHO ALBERNANDES', 'PEL II', 'Male', '1992-12-26', 'Finance Directorate', 'Departemen Keuangan', 'Unit Akuntansi', 'Staf Akuntansi Keuangan', 'RIDHO.ALBERNANDES', NULL, NULL),
('7535', '9218046', 'SAYED MUHAMMAD AKBAR', 'PEL II', 'Male', '1992-11-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin FM 2-3-4', 'SAYED.AKBAR', NULL, NULL),
('7536', '9318047', 'FERDYAN MARTHA WINANDA', 'PEL II', 'Male', '1993-02-02', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'FERDYAN.WINANDA', NULL, NULL),
('7538', '9318049', 'EDO FEBRIANTO', 'PEL II', 'Male', '1993-02-23', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Perencanaan dan Pengawasan Tambang', 'Staf HSE Tambang & Reklamasi', 'EDO.FEBRIANTO', NULL, NULL),
('7539', '9318050', 'FRISCHA WIJAYANTI', 'PEL II', '', '1993-03-07', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7540', '9318051', 'RUDY ERVAN', 'PEL II', 'Male', '1993-04-13', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Quality Control', 'Staf Quality Control', 'RUDY.ERVAN', NULL, NULL),
('7541', '9318052', 'RIKY JOHAN', 'PEL II', 'Male', '1993-06-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Elins 2', 'Sie. PLI RKC 5-6', 'RIKY.JOHAN', NULL, NULL),
('7542', '9318053', 'AGUM ALHAKIM', 'PEL II', '', '1993-08-13', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AGUM.ALHAKIM', NULL, NULL),
('7543', '9318054', 'TRY UTAMA PUTRA', 'PEL II', '', '1993-09-24', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'TRY.PUTRA', NULL, NULL),
('7544', '9318055', 'AULIA RAHMAN', 'PEL II', 'Male', '1993-10-13', 'Operation Directorate', 'Departemen Produksi Semen', 'Unit Produksi Semen', 'Sie. Operasi FM 5-6', 'AULIA.RAHMAN7544', NULL, NULL),
('7545', '9318056', 'BOBBI ASARRI OKTOBERI', 'PEL II', '', '1993-10-21', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BOBBI.OKTOBERI', NULL, NULL),
('7546', '9318057', 'ATIQAH PUTRI SARI', 'PEL II', 'Female', '1993-12-28', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'ATIQAH.SARI', NULL, NULL),
('7547', '9418058', 'SYAHRUL MUBARAK', 'PEL II', 'Male', '1994-03-09', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'SYAHRUL.MUBARAK', NULL, NULL),
('7548', '9418059', 'ANUGRAH TRIANTONO', 'PEL II', 'Male', '1994-05-05', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ANUGRAH.TRIANTONO', NULL, NULL),
('7550', '9418061', 'BIMA LOVRINO PRAKASA', 'PEL II', '', '1994-05-25', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'BIMA.PRAKASA', NULL, NULL),
('7553', '9418064', 'EKO TRI SAPUTRA', 'PEL II', 'Male', '1994-12-20', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf Inspeksi Pemeliharaan', 'EKO.SAPUTRA', NULL, NULL),
('7554', '9418065', 'ERIK PRADIPTA', 'PEL II', 'Male', '1994-12-22', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 2', 'Sie. Operasi RKC 6', 'ERIK.PRADIPTA', NULL, NULL),
('7555', '9518066', 'MUHAMMAD IHKWAN', 'PEL II', '', '1995-06-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'MUHAMMAD.IHKWAN', NULL, NULL),
('7557', '9518068', 'DOAN CARLO TRIMORA', 'PEL II', '', '1995-09-27', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7558', '9518069', 'HARIS BUDIMAN', 'PEL II', 'Male', '1995-10-14', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'HARIS.BUDIMAN', NULL, NULL),
('7559', '9518070', 'ANDHIKA MADANG WIJAYA', 'PEL II', '', '1995-10-26', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDHIKA.WIJAYA', NULL, NULL),
('7560', '9518071', 'ZEFANYA MARANATHA MANGUNSONG', 'PEL II', '', '1995-11-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ZEFANYA.MANGUNSONG', NULL, NULL),
('7561', '8818072', 'NOVI YENI', 'PEL II', '', '1988-11-11', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'NOVI.YENI', NULL, NULL),
('7562', '8818073', 'HIDAYATIL KURNIA', 'PEL II', 'Female', '1988-06-13', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'HIDAYATIL.KURNIA', NULL, NULL),
('7563', '9018074', 'HERU ERTA SAPUTRA', 'PEL II', 'Male', '1990-07-12', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'HERU.SAPUTRA', NULL, NULL),
('7564', '9018075', 'CHOERUL AFFANDI', 'PEL II', '', '1990-07-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'CHOERUL.AFFANDI', NULL, NULL),
('7565', '9018076', 'ALMISBACHALFIF IDRAT', 'PEL II', 'Male', '1990-03-30', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'ALMISBACHALFIF.IDRAT', NULL, NULL),
('7567', '9218078', 'RIZKI SENTOSA', 'PEL II', 'Male', '1992-12-23', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'RIZKI.SENTOSA', NULL, NULL),
('7568', '9318079', 'YOGI SEFTIVA AYEDIA', 'PEL II', 'Male', '1993-09-21', 'President Directorate', 'Internal Audit', 'Staf Internal Audit', 'Staf Internal Audit', 'YOGI.AYEDIA', NULL, NULL),
('7569', '9318080', 'UTARI HANDAYANI', 'PEL II', 'Female', '1993-12-23', 'Operation Directorate', 'Departemen Rendal Produksi', 'Unit Perencanaan & Evaluasi Produksi', 'Staf Perencanaan & Evaluasi Proses Produksi', 'UTARI.HANDAYANI', NULL, NULL),
('7570', '9318081', 'DHOVA ARIDHARMA', 'PEL II', 'Female', '1993-05-06', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', 'DHOVA.ARIDHARMA', NULL, NULL),
('7571', '9318082', 'AULIA ABDI', 'PEL II', '', '1993-10-02', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'AULIA.ABDI', NULL, NULL),
('7572', '9318083', 'RANDI TRINANDA', 'PEL II', '', '1993-01-09', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RANDI.TRINANDA', NULL, NULL),
('7573', '9318084', 'ANDRI JULIANDA DAVICI', 'PEL II', 'Male', '1993-07-22', 'Operation Directorate', 'Departemen Produksi Terak', 'Unit Produksi Terak 1', 'Sie. Operasi RKC 4', 'ANDRI.DAVICI', NULL, NULL),
('7574', '9318085', 'RIO ANDI SAPUTRA', 'PEL II', 'Male', '1993-02-11', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 2', 'Sie. Pemeliharaan Mesin RM 5-6', 'RIO.SAPUTRA', NULL, NULL),
('7575', '9318086', 'BERRY PRATAMA, AMD.', 'PEL II', 'Male', '1993-08-12', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin KC 2-3-4', 'BERRY.PRATAMA', NULL, NULL),
('7576', '9318087', 'MUHAMMAD YOGIE FARSHA', 'PEL II', 'Male', '1993-08-16', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Pemeliharaan Mesin 1', 'Sie. Pemeliharaan Mesin RM 2-3-4', 'MUHAMMAD.FARSHA', NULL, NULL),
('7577', '9318088', 'KHAIRIL HUDA LUBIS', 'PEL II', 'Male', '1993-09-26', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan & Evaluasi Pemeliharaan', 'KHAIRIL.LUBIS', NULL, NULL),
('7578', '9318089', 'ASTRID OLIVIANA SUDIRMAN', 'PEL II', 'Female', '1993-01-10', 'Finance Directorate', 'Departemen SDM & Umum', 'Unit Sarana Umum', 'Staf Sarana Umum', 'ASTRID.SUDIRMAN', NULL, NULL),
('7579', '9318090', 'FRAN LENDRO ZAPUTRA', 'PEL II', 'Male', '1993-02-27', 'Operation Directorate', 'Departemen Tambang & Pengelolaan Bahan Baku', 'Unit Operasi Tambang', 'Sie. Drilling, Blasting & Mining Service', 'FRAN.ZAPUTRA', NULL, NULL),
('7580', '9418091', 'MULYA CIPTA NURMANSYAH, ST.', 'PEL II', 'Male', '1994-10-04', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Perencanaan dan Evaluasi Pemeliharaan', 'Staf Perencanaan Suku Cadang', 'MULYA.NURMANSYAH', NULL, NULL),
('7581', '9418092', 'FAKHROZI AHMAD RIZKY', 'PEL II', 'Male', '1994-04-21', 'Operation Directorate', 'Departemen Pemeliharaan', 'Unit Inspeksi Pemeliharaan & PGOH', 'Staf PGO', 'FAKHROZI.RIZKY', NULL, NULL),
('7582', '9618093', 'RIDO SAPUTRA', 'PEL II', '', '1996-09-12', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'RIDO.SAPUTRA', NULL, NULL),
('7585', '8918094', 'ANDRE INDRAGANI', 'PEL II', '', '1989-07-14', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'ANDRE.INDRAGANI', NULL, NULL),
('7615', '9118095', 'IKA FITRIANI', 'PEL II', 'Female', '1991-04-16', 'Finance Directorate', 'Departemen Keuangan', 'Unit Kinerja & Anggaran', 'Staf Perpajakan', 'IKA.FITRIANI', NULL, NULL),
('7623', '9218096', 'IMAM ARIFANDI', 'PEL II', '', '1992-12-08', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero), Tbk', '#N/A', NULL, NULL),
('7707', '9998663', 'RIKI WIRATAMA HERMAWAN', 'PEL II', 'Male', '1990-12-21', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Regulasi & Administrasi Legal', '#N/A', NULL, NULL),
('7708', '9998664', 'AHMAD HAFIZ', 'PEL II', 'Male', '1986-01-19', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Legal & GRC', 'Staf Regulasi & Administrasi Legal', '#N/A', NULL, NULL),
('7926', '9998665', 'FLORA MINCE GH P', 'II', 'Female', '1964-04-29', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Humas & Kesekretariatan', 'Staf Sekretariat & Protokoler', '#N/A', NULL, NULL),
('7930', '9998666', 'MASRI', 'III', 'Male', '1967-12-11', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Keamanan', 'Staf Keamanan', '#N/A', NULL, NULL),
('7931', '9998667', 'ELVI', 'III', 'Male', '1969-04-17', 'President Directorate', 'Departemen Komunikasi & Hukum Perusahaan', 'Unit Keamanan', 'Staf Keamanan', '#N/A', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_31_143011_create_categories_table', 1),
(5, '2021_04_08_044232_create_activities_table', 2),
(6, '2021_04_08_044749_create_activities_table', 3),
(7, '2021_04_08_075350_create_activities_table', 4),
(8, '2021_04_09_034054_create_possibilities_table', 5),
(9, '2021_04_09_052349_create_conditions_table', 6),
(10, '2021_04_09_052639_create_conditions_table', 7),
(11, '2021_04_09_062739_create_threats_table', 8),
(12, '2021_04_09_080749_create_vulnerabilities_table', 9),
(13, '2021_04_12_051435_create_terms_table', 10),
(14, '2021_04_12_065239_create_consequences_table', 11),
(15, '2021_04_12_070119_create_consequences_table', 12),
(16, '2021_04_13_041417_create_k3teams_table', 13),
(17, '2021_04_15_071608_create_registers_table', 14),
(18, '2021_04_19_025020_create_vulnerabilities_table', 15),
(19, '2021_04_19_035759_create_conditions_table', 16),
(20, '2021_04_19_042621_create_terms_table', 17),
(21, '2021_04_19_082617_create_threats_table', 18),
(22, '2021_04_19_082830_create_threats_table', 19),
(23, '2021_04_26_045331_create_k3teams_table', 20),
(24, '2021_04_26_045904_create_k3teams_table', 21),
(25, '2021_06_08_061004_create_assets_table', 22),
(26, '2021_06_15_063524_create_mitigasis_table', 23),
(27, '2021_08_04_075452_create_units_table', 24);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mitigasis`
--

CREATE TABLE `mitigasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register_id` int(10) UNSIGNED DEFAULT NULL,
  `program_mitigasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `possibility_id` int(10) UNSIGNED DEFAULT NULL,
  `consequence_id` int(10) UNSIGNED NOT NULL,
  `tingkat_resiko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aspek_lingkungan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resiko_ditoleransi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mitigasis`
--

INSERT INTO `mitigasis` (`id`, `register_id`, `program_mitigasi`, `possibility_id`, `consequence_id`, `tingkat_resiko`, `aspek_lingkungan`, `resiko_ditoleransi`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Simulasi Gempa', 5, 4, 'Sangat Tinggi', 'Penting', 'Ya', 'ss', '2021-08-20 02:44:57', '2021-08-20 02:44:57'),
(2, 4, 'Simulasi Gempa', 4, 5, 'Sangat Tinggi', 'Penting', 'Ya', 'Sering terjadi dan atau kejadiannya lebih dari 1 kali sebulan', '2021-08-25 02:08:14', '2021-08-25 02:08:14'),
(3, 1, 'saasas', 4, 4, 'Tinggi', 'Tidak Penting', 'Ya', 'asa', '2021-08-31 01:28:24', '2021-08-31 01:28:24'),
(4, 3, 'Mengganti kunci', 1, 1, 'Rendah', 'Penting', 'Tidak', 'Seharusnya terjadi dan atau minimal 1 kali per lima tahun hingga 1 kali per tahun', '2021-08-31 19:14:30', '2021-08-31 19:14:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `possibilities`
--

CREATE TABLE `possibilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` bigint(255) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `possibilities`
--

INSERT INTO `possibilities` (`id`, `nama`, `nilai`, `keterangan`, `created_at`, `updated_at`) VALUES
(2, 'Jarang Terjadi', 1, 'Kemungkinan kecil terjadi dan atau periode kejadiannya lebih dari 1 kali persepuluh tahun', '2021-04-08 22:13:50', '2021-04-09 01:39:44'),
(4, 'Kemungkinan Kecil', 2, 'Bisa terjadi pada suatu waktu dan atau 1 kali per sepuluh tahun', '2021-04-09 01:40:09', '2021-04-09 01:40:09'),
(5, 'Mungkin', 3, 'Seharusnya terjadi dan atau minimal 1 kali per lima tahun hingga 1 kali per tahun', '2021-04-09 01:40:40', '2021-04-09 01:40:40'),
(6, 'Kemungkinan Besar', 4, 'Dapat terjadi dengan mudah dan atau minimal kejadiannya lebih dari 1 kali setahun hingga 1 kali sebulan', '2021-04-09 01:41:04', '2021-04-09 01:41:04'),
(7, 'Hampir Pasti', 5, 'Sering terjadi dan atau kejadiannya lebih dari 1 kali sebulan', '2021-04-09 01:41:24', '2021-04-09 01:41:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registers`
--

CREATE TABLE `registers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `activity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `threat_id` bigint(20) UNSIGNED NOT NULL,
  `vulnerability_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengendalian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `possibility_id` bigint(20) UNSIGNED NOT NULL,
  `consequence_id` bigint(20) UNSIGNED NOT NULL,
  `tingkat_resiko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_regulasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aspek_lingkungan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peluang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resiko` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resiko_ditoleransi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cakupan_resiko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_program` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `registers`
--

INSERT INTO `registers` (`id`, `unit_id`, `category_id`, `activity`, `lokasi`, `condition_id`, `threat_id`, `vulnerability_id`, `pengendalian`, `possibility_id`, `consequence_id`, `tingkat_resiko`, `status_regulasi`, `aspek_lingkungan`, `peluang`, `resiko`, `resiko_ditoleransi`, `cakupan_resiko`, `status_program`, `status`, `created_at`, `updated_at`) VALUES
(1, 53, 7, 'Quisquam veritatis p', 'Velit consequatur ut', 5, 9, '27', 'Anim mollit sint ali', 4, 3, 'Tinggi', NULL, 'Penting', NULL, NULL, 'Ya', 'Unit Kerja', 'PUK', NULL, '2021-08-31 01:26:38', '2021-08-31 01:26:38'),
(2, 24, 2, 'Parkir Mobil', 'parkiran', 2, 7, '1', 'belum ada', 5, 1, 'Sedang', NULL, 'Tidak Penting', NULL, NULL, 'Tidak', 'Unit Kerja', 'Pengendalian Operasional', NULL, '2021-08-31 18:58:26', '2021-08-31 18:58:26'),
(3, 53, 7, 'Laptop di area kantor USM', 'USM', 5, 9, '27', 'belum ada', 1, 1, 'Rendah', NULL, 'Tidak Penting', NULL, NULL, 'Tidak', 'Unit Kerja', 'Pengendalian Operasional', NULL, '2021-08-31 19:13:11', '2021-08-31 19:13:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `istilah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `terms`
--

INSERT INTO `terms` (`id`, `category_id`, `kode`, `istilah`, `created_at`, `updated_at`) VALUES
(1, 2, 'Identifikasi', 'Kegiatan', '2021-04-18 22:05:41', '2021-05-24 21:47:23'),
(4, 6, 'Identifikasi', 'Kegiatan', '2021-04-20 20:54:42', '2021-05-24 21:47:38'),
(6, 7, 'Identifikasi', 'Asset', '2021-05-24 21:47:53', '2021-05-24 21:47:53'),
(7, 2, 'Threat', 'Potensi Bahaya', '2021-05-24 21:48:13', '2021-05-24 21:48:13'),
(8, 6, 'Threat', 'Aspek Lingkungan', '2021-05-24 21:48:25', '2021-05-24 21:48:25'),
(9, 7, 'Threat', 'Ancaman Keamanan', '2021-05-24 21:48:41', '2021-05-24 21:48:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `threats`
--

CREATE TABLE `threats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `threats`
--

INSERT INTO `threats` (`id`, `term_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 7, 'Kebisingan', '2021-05-24 20:28:09', '2021-05-24 21:51:28'),
(2, 7, 'Getaran', '2021-05-24 21:51:40', '2021-05-24 21:51:40'),
(3, 7, 'Emisi Debu', '2021-05-24 21:51:52', '2021-05-24 21:51:52'),
(4, 7, 'Emisi Gas', '2021-05-24 21:52:02', '2021-05-24 21:52:02'),
(5, 7, 'Tumpahan/ceceran minyak pelumas bekas', '2021-05-24 21:52:13', '2021-05-24 21:52:13'),
(6, 7, 'Tumpahan/ceceran B3/ limbah B3', '2021-05-24 21:52:20', '2021-05-24 21:52:20'),
(7, 7, 'Bekerja di Ketinggian', '2021-05-24 21:52:29', '2021-05-24 21:52:29'),
(8, 7, 'Kontak/radiasi', '2021-05-24 21:52:38', '2021-05-24 21:52:38'),
(9, 7, 'Pancaran/radiasi cahaya', '2021-05-24 21:52:46', '2021-05-24 21:52:46'),
(10, 7, 'Percikan api', '2021-05-24 21:53:15', '2021-05-24 21:53:15'),
(11, 7, 'Korsleting/Sengatan listrik', '2021-05-24 21:53:26', '2021-05-24 21:53:26'),
(12, 7, 'Lalu lintas kendaraan', '2021-05-24 21:53:34', '2021-05-24 21:53:34'),
(13, 7, 'Terpuntir alat kerja', '2021-05-24 21:53:41', '2021-05-24 21:53:41'),
(14, 8, 'Emisi debu (semen, fly ash, dll)', '2021-05-24 21:53:51', '2021-05-24 21:53:51'),
(15, 8, 'Emisi asap (kendaraan, dll)', '2021-05-24 21:54:00', '2021-05-24 21:54:00'),
(16, 8, 'Emisi Gas', '2021-05-24 21:54:09', '2021-05-24 21:54:09'),
(17, 8, 'Tumpahan limbah laboratorium', '2021-05-24 21:54:17', '2021-05-24 21:54:17'),
(18, 8, 'Tumpahan minyak pelumas bekas', '2021-05-24 21:54:26', '2021-05-24 21:54:26'),
(19, 8, 'Tumpahan material (batu kapur, batu bara, clay, semen, dll)', '2021-05-24 21:54:36', '2021-05-24 21:54:36'),
(20, 8, 'Penggunaan energi listrik', '2021-05-24 21:54:50', '2021-05-24 21:54:50'),
(21, 8, 'Penggunaan air', '2021-05-24 21:54:59', '2021-05-24 21:54:59'),
(22, 8, 'Penggunaan kertas', '2021-05-24 21:55:06', '2021-05-24 21:55:06'),
(23, 8, 'Penggunaan AC (freon)', '2021-05-24 21:55:15', '2021-05-24 21:55:15'),
(24, 8, 'Kebisingan', '2021-05-24 21:55:21', '2021-05-24 21:55:21'),
(25, 8, 'Getaran', '2021-05-24 21:55:28', '2021-05-24 21:55:28'),
(26, 8, 'Penggunaan Sumber Daya Alam', '2021-05-24 21:55:35', '2021-05-24 21:55:35'),
(27, 8, 'Tumpahan/ceceran material non B3', '2021-05-24 21:55:41', '2021-05-24 21:55:41'),
(28, 8, 'Tumpahan/ceceran material B3', '2021-05-24 21:55:51', '2021-05-24 21:55:51'),
(29, 8, 'Perubahan rona alam (lahan terbuka/gundul)', '2021-05-24 21:56:01', '2021-05-24 21:56:01'),
(30, 8, 'Penggunaan SDA (Energi)', '2021-05-24 21:56:16', '2021-05-24 21:56:16'),
(31, 8, 'Keanekaragaman hayati', '2021-05-24 21:56:23', '2021-05-24 21:56:23'),
(32, 9, 'Terorisme', '2021-05-24 21:56:35', '2021-05-24 21:56:35'),
(33, 9, 'Sabotase', '2021-05-24 21:56:46', '2021-05-24 21:56:46'),
(34, 9, 'Intimidasi', '2021-05-24 21:56:57', '2021-05-24 21:56:57'),
(35, 9, 'Pencurian', '2021-05-24 21:57:07', '2021-05-24 21:57:07'),
(36, 9, 'Pengrusakan aset', '2021-05-24 21:57:14', '2021-05-24 21:57:14'),
(37, 9, 'Pencurian Data', '2021-05-24 21:57:23', '2021-05-24 21:57:23'),
(38, 9, 'Pengrusakan Data', '2021-05-24 21:57:34', '2021-05-24 21:57:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_kerja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `units`
--

INSERT INTO `units` (`id`, `unit_kerja`, `created_at`, `updated_at`) VALUES
(2, 'Unit Operasional SDM', '2021-08-04 01:22:38', '2021-08-04 01:22:38'),
(3, 'Bisnis Inkubasi Non Semen', '2021-08-04 01:24:57', '2021-08-04 01:24:57'),
(4, 'Departemen Keuangan', '2021-08-04 01:25:07', '2021-08-04 01:25:07'),
(5, 'Unit Akuntansi', '2021-08-04 01:25:14', '2021-08-04 01:25:14'),
(6, 'Unit Keuangan', '2021-08-04 01:25:21', '2021-08-04 01:25:21'),
(7, 'Unit Kinerja & Anggaran', '2021-08-04 01:25:29', '2021-08-04 01:25:29'),
(8, 'Departemen Komunikasi & Hukum Perusahaan', '2021-08-04 01:25:41', '2021-08-04 01:25:41'),
(9, 'Unit CSR', '2021-08-04 01:25:52', '2021-08-04 01:25:52'),
(10, 'Unit Humas & Kesekretariatan', '2021-08-04 01:26:00', '2021-08-04 01:26:00'),
(11, 'Unit Keamanan', '2021-08-04 01:26:08', '2021-08-04 01:26:08'),
(12, 'Unit Legal & GRC', '2021-08-04 01:26:14', '2021-08-04 01:26:14'),
(13, 'Departemen Pemeliharaan', '2021-08-04 01:26:21', '2021-08-04 01:26:21'),
(14, 'TPM Officer', '2021-08-04 01:26:27', '2021-08-04 01:26:27'),
(15, 'Unit Bengkel', '2021-08-04 01:26:34', '2021-08-04 01:26:34'),
(16, 'Unit Inspeksi Pemeliharaan & PGOH', '2021-08-04 01:26:40', '2021-08-04 01:26:40'),
(17, 'Unit Pemeliharaan Elins 1', '2021-08-04 01:26:53', '2021-08-04 01:26:53'),
(18, 'Unit Pemeliharaan Elins 2', '2021-08-04 01:27:01', '2021-08-04 01:27:01'),
(19, 'Unit Pemeliharaan Mesin 1', '2021-08-04 01:27:07', '2021-08-04 01:27:07'),
(20, 'Unit Pemeliharaan Mesin 2', '2021-08-04 01:27:17', '2021-08-04 01:27:17'),
(21, 'Unit Perencanaan dan Evaluasi Pemeliharaan', '2021-08-04 01:27:24', '2021-08-04 01:27:24'),
(22, 'Departemen Produksi Semen', '2021-08-04 01:27:31', '2021-08-04 01:27:31'),
(23, 'Unit Pabrik Kantong', '2021-08-04 01:27:40', '2021-08-04 01:27:40'),
(24, 'Unit Produksi Semen', '2021-08-04 01:27:46', '2021-08-04 01:27:46'),
(25, 'Departemen Produksi Terak', '2021-08-04 01:27:51', '2021-08-04 01:27:51'),
(26, 'Unit Produksi Terak 1', '2021-08-04 01:27:57', '2021-08-04 01:27:57'),
(27, 'Unit Produksi Terak 2', '2021-08-04 01:28:02', '2021-08-04 01:28:02'),
(28, 'Departemen Rendal Produksi', '2021-08-04 01:28:31', '2021-08-04 01:28:31'),
(29, 'Unit Penunjang Produksi', '2021-08-04 01:28:37', '2021-08-04 01:28:37'),
(30, 'Unit Perencanaan & Evaluasi Produksi', '2021-08-04 01:28:48', '2021-08-04 01:28:48'),
(31, 'Unit Quality Control', '2021-08-04 01:29:00', '2021-08-04 01:29:00'),
(32, 'Departemen SDM & Umum', '2021-08-04 01:29:06', '2021-08-04 01:29:06'),
(33, 'Unit Sarana Umum', '2021-08-04 01:29:12', '2021-08-04 01:29:12'),
(34, 'Department of Mining & Raw Mtrl Mgt', '2021-08-04 01:29:19', '2021-08-04 01:29:19'),
(35, 'Unit Operasi Tambang', '2021-08-04 01:29:25', '2021-08-04 01:29:25'),
(36, 'Unit Perencanaan dan Pengawasan Tambang', '2021-08-04 01:29:30', '2021-08-04 01:29:30'),
(37, 'Unit Produksi Bahan Baku', '2021-08-04 01:29:36', '2021-08-04 01:29:36'),
(38, 'Unit WHRPG & Utilitas', '2021-08-04 01:29:41', '2021-08-04 01:29:41'),
(39, 'Internal Audit', '2021-08-04 01:29:47', '2021-08-04 01:29:47'),
(40, 'Staf Internal Audit', '2021-08-04 01:29:54', '2021-08-04 01:29:54'),
(41, 'Kary. Ditugaskan ke DPSP', '2021-08-04 01:29:59', '2021-08-04 01:29:59'),
(42, 'Kary. Ditugaskan ke KKSP', '2021-08-04 01:30:09', '2021-08-04 01:30:09'),
(43, 'Kary. Ditugaskan ke PT Bima Sepaja Abadi', '2021-08-04 01:30:16', '2021-08-04 01:30:16'),
(44, 'Kary. Ditugaskan ke PT Igasar', '2021-08-04 01:30:50', '2021-08-04 01:30:50'),
(45, 'Kary. Ditugaskan ke PT Pasoka Sumber Karya', '2021-08-04 01:30:58', '2021-08-04 01:30:58'),
(46, 'Kary. Ditugaskan ke PT Sepatim Batamtama', '2021-08-04 01:31:06', '2021-08-04 01:31:06'),
(47, 'Kary. Ditugaskan ke PT Yasiga Sarana Utama', '2021-08-04 01:31:14', '2021-08-04 01:31:14'),
(48, 'Kary. Ditugaskan ke Yayasan Igasar', '2021-08-04 01:31:21', '2021-08-04 01:31:21'),
(49, 'Kary. Ditugaskan ke Yayasan Semen Padang', '2021-08-04 01:31:28', '2021-08-04 01:31:28'),
(50, 'Karyawan Ditugaskan ke PT Kabau Sirah Semen Padang', '2021-08-04 01:31:35', '2021-08-04 01:31:35'),
(51, 'Karyawan Ditugaskan ke PT Semen Indonesia (Persero...', '2021-08-04 01:31:45', '2021-08-04 01:31:45'),
(52, 'Staf Direksi', '2021-08-04 19:38:25', '2021-08-04 19:38:25'),
(53, 'Unit Sistem Manajemen', '2021-08-04 19:38:30', '2021-08-04 19:38:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vulnerabilities`
--

CREATE TABLE `vulnerabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `vulnerabilities`
--

INSERT INTO `vulnerabilities` (`id`, `category_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 2, 'Gangguan pendengaran', NULL, '2021-05-24 21:30:04'),
(2, 2, 'Gangguan kenyamanan bekerja', '2021-05-24 21:30:13', '2021-05-24 21:30:13'),
(3, 2, 'Gangguan pernapasan', '2021-05-24 21:30:23', '2021-05-24 21:30:23'),
(4, 2, 'Gangguan penglihatan', '2021-05-24 21:30:38', '2021-05-24 21:30:38'),
(5, 2, 'Terkilir', '2021-05-24 21:30:50', '2021-05-24 21:30:50'),
(6, 2, 'Luka', '2021-05-24 21:31:04', '2021-05-24 21:31:04'),
(7, 2, 'Memar', '2021-05-24 21:31:16', '2021-05-24 21:31:16'),
(8, 2, 'Keracunan', '2021-05-24 21:31:27', '2021-05-24 21:31:27'),
(9, 2, 'Iritasi', '2021-05-24 21:31:36', '2021-05-24 21:31:36'),
(10, 2, 'Patah', '2021-05-24 21:31:47', '2021-05-24 21:31:47'),
(11, 2, 'Luka bakar', '2021-05-24 21:31:56', '2021-05-24 21:31:56'),
(12, 2, 'Pingsan', '2021-05-24 21:32:09', '2021-05-24 21:32:09'),
(13, 2, 'Meninggal', '2021-05-24 21:32:18', '2021-05-24 21:32:18'),
(14, 2, 'Hilang anggota tubuh (cacat)', '2021-05-24 21:32:29', '2021-05-24 21:32:29'),
(15, 6, 'Pencemaran udara', '2021-05-24 21:32:45', '2021-05-24 21:32:45'),
(16, 6, 'Pencemaran tanah *jika langsung dibuang ke tanah/lab berada di atas tanah', '2021-05-24 21:33:05', '2021-05-24 21:33:05'),
(17, 6, 'Pencemaran air *jika langsung terbuang ke selokan tanpa adanya oil trap', '2021-05-24 21:33:17', '2021-05-24 21:33:17'),
(18, 6, 'Estetika/Mengotori lingkungan', '2021-05-24 21:33:28', '2021-05-24 21:33:28'),
(19, 6, 'Pengurangan SDA', '2021-05-24 21:33:37', '2021-05-24 21:33:37'),
(20, 6, 'Penipisan lapisan ozon', '2021-05-24 21:33:47', '2021-05-24 21:33:47'),
(21, 6, 'Gangguan kenyamanan lingkungan', '2021-05-24 21:33:56', '2021-05-24 21:33:56'),
(22, 6, 'Banjir', '2021-05-24 21:34:05', '2021-05-24 21:34:05'),
(23, 6, 'Erosi', '2021-05-24 21:34:13', '2021-05-24 21:34:13'),
(24, 6, 'Berkurangnya SDA unrenewable energi (batubara)', '2021-05-24 21:34:25', '2021-05-24 21:34:25'),
(25, 6, 'Flora/Fauna berkurang', '2021-05-24 21:34:34', '2021-05-24 21:34:34'),
(26, 7, 'Terlalu banyak pintu akses masuk ke Area Kerja', '2021-05-24 21:34:46', '2021-05-24 21:34:46'),
(27, 7, 'Akses masuk area kerja tidak secure', '2021-05-24 21:34:57', '2021-05-24 21:34:57'),
(28, 7, 'Komputer atau laptop tidak di password', '2021-05-24 21:35:05', '2021-05-24 21:35:05'),
(29, 7, 'Komputer atau laptop tidak di password', '2021-05-24 21:35:18', '2021-05-24 21:35:18');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_unit`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_unit` (
`unit` varchar(200)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_unit`
--
DROP TABLE IF EXISTS `v_unit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_unit`  AS  select distinct `karyawans`.`unit` AS `unit` from `karyawans` order by `karyawans`.`dep`,`karyawans`.`unit` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `consequences`
--
ALTER TABLE `consequences`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `k3teams`
--
ALTER TABLE `k3teams`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawans`
--
ALTER TABLE `karyawans`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mitigasis`
--
ALTER TABLE `mitigasis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `possibilities`
--
ALTER TABLE `possibilities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `threats`
--
ALTER TABLE `threats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `consequences`
--
ALTER TABLE `consequences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `k3teams`
--
ALTER TABLE `k3teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `mitigasis`
--
ALTER TABLE `mitigasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `possibilities`
--
ALTER TABLE `possibilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `registers`
--
ALTER TABLE `registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `threats`
--
ALTER TABLE `threats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `threats`
--
ALTER TABLE `threats`
  ADD CONSTRAINT `threats_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
