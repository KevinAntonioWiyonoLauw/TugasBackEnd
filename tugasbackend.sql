-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Agu 2024 pada 12.14
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasbackend`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `name`, `description`) VALUES
(1, 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6', 'Dengan arsitektur NVIDIA® Ampere terbaru, ASUS Dual GeForce RTX™ 3050 6G memadukan kinerja termal yang dinamis dengan kompatibilitas yang luas. Solusi pendinginan canggih dari kartu grafis flagship didesain ke dalam ukuran kartu 2-slot sepanjang 20 cm untuk memberikan lebih banyak daya dalam ruangan yang lebih kecil. Peningkatan ini menjadikan ASUS Dual sebagai pilihan yang pas untuk para gamer yang menginginkan kinerja grafis kelas tinggi dalam bentuk yang ringkas.'),
(2, 'ZOTAC GAMING GeForce RTX 4060 8GB Twin Edge OC', 'The ZOTAC GAMING GeForce RTX 4060 8GB Twin Edge OC is a compact and capable graphics card, featuring the NVIDIA Ada Lovelace architecture and an aerodynamic-inspired design. With a reduced 2 slot size, it\'s an excellent choice for those who want to build a SFF gaming PC capable of smooth framerate and 1080p performance in the latest title releases.'),
(3, 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6', 'Dengan arsitektur NVIDIA® Ampere terbaru, ASUS Dual GeForce RTX™ 3050 6G memadukan kinerja termal yang dinamis dengan kompatibilitas yang luas. Solusi pendinginan canggih dari kartu grafis flagship didesain ke dalam ukuran kartu 2-slot sepanjang 20 cm untuk memberikan lebih banyak daya dalam ruangan yang lebih kecil. Peningkatan ini menjadikan ASUS Dual sebagai pilihan yang pas untuk para gamer yang menginginkan kinerja grafis kelas tinggi dalam bentuk yang ringkas.');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
