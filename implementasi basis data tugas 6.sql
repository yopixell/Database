-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Mar 2025 pada 07.47
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
-- Database: `akademikv3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `Kode_Dosen` varchar(10) NOT NULL,
  `Nama_Dosen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`Kode_Dosen`, `Nama_Dosen`) VALUES
('D001', 'Dr. Budi'),
('D002', 'Dr. Siti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` varchar(10) NOT NULL,
  `Nama_Mahasiswa` varchar(100) NOT NULL,
  `Prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama_Mahasiswa`, `Prodi`) VALUES
('22001', 'Andi Wijaya', 'Informatika'),
('22002', 'Rina Lestari', 'Informatika'),
('22003', 'Dika Pratama', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `Kode_MK` varchar(10) NOT NULL,
  `Nama_Mata_Kuliah` varchar(100) NOT NULL,
  `SKS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`Kode_MK`, `Nama_Mata_Kuliah`, `SKS`) VALUES
('IF101', 'Basis Data', 3),
('IF102', 'Pemrograman', 4),
('SI201', 'Manajemen Proyek', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `NIM` varchar(10) NOT NULL,
  `Kode_MK` varchar(10) NOT NULL,
  `Nilai` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`NIM`, `Kode_MK`, `Nilai`) VALUES
('22001', 'IF101', 'A'),
('22001', 'IF102', 'B+'),
('22002', 'IF101', 'A-'),
('22003', 'SI201', 'B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajaran`
--

CREATE TABLE `pengajaran` (
  `Kode_MK` varchar(10) NOT NULL,
  `Kode_Dosen` varchar(10) NOT NULL,
  `Kode_Ruang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajaran`
--

INSERT INTO `pengajaran` (`Kode_MK`, `Kode_Dosen`, `Kode_Ruang`) VALUES
('IF101', 'D001', 'R101'),
('IF102', 'D002', 'R102'),
('SI201', 'D001', 'R103');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_kelas`
--

CREATE TABLE `ruang_kelas` (
  `Kode_Ruang` varchar(10) NOT NULL,
  `Ruang_Kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruang_kelas`
--

INSERT INTO `ruang_kelas` (`Kode_Ruang`, `Ruang_Kelas`) VALUES
('R101', 'A101'),
('R102', 'B202'),
('R103', 'C303');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Kode_Dosen`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`Kode_MK`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`NIM`,`Kode_MK`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- Indeks untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD PRIMARY KEY (`Kode_MK`,`Kode_Dosen`,`Kode_Ruang`),
  ADD KEY `Kode_Dosen` (`Kode_Dosen`),
  ADD KEY `Kode_Ruang` (`Kode_Ruang`);

--
-- Indeks untuk tabel `ruang_kelas`
--
ALTER TABLE `ruang_kelas`
  ADD PRIMARY KEY (`Kode_Ruang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`);

--
-- Ketidakleluasaan untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD CONSTRAINT `pengajaran_ibfk_1` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`),
  ADD CONSTRAINT `pengajaran_ibfk_2` FOREIGN KEY (`Kode_Dosen`) REFERENCES `dosen` (`Kode_Dosen`),
  ADD CONSTRAINT `pengajaran_ibfk_3` FOREIGN KEY (`Kode_Ruang`) REFERENCES `ruang_kelas` (`Kode_Ruang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
