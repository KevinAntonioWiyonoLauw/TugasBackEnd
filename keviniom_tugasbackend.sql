-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 11 Nov 2024 pada 19.28
-- Versi server: 10.6.19-MariaDB-cll-lve
-- Versi PHP: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keviniom_tugasbackend`
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
(49, 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6', 'Dengan arsitektur NVIDIA® Ampere terbaru, ASUS Dual GeForce RTX™ 3050 6G memadukan kinerja termal yang dinamis dengan kompatibilitas yang luas. Solusi pendinginan canggih dari kartu grafis flagship didesain ke dalam ukuran kartu 2-slot sepanjang 20 cm untuk memberikan lebih banyak daya dalam ruangan yang lebih kecil. Peningkatan ini menjadikan ASUS Dual sebagai pilihan yang pas untuk para gamer yang menginginkan kinerja grafis kelas tinggi dalam bentuk yang ringkas.'),
(50, 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6', 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6'),
(51, 'tes', 'tes'),
(53, 'hebat', 'hebat'),
(56, 'Adam', 'Ini barang keren'),
(57, 'kenji', 'kenjo');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
