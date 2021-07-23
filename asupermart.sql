-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2021 at 06:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asupermart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `pembelian` int(11) DEFAULT NULL,
  `penjualan` int(11) DEFAULT NULL,
  `id_supplier` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `jumlah`, `pembelian`, `penjualan`, `id_supplier`) VALUES
('B001', 'Pensil', 49, 1000, 3000, 'S002');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `no_telp` char(14) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` varchar(10) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `telepon`, `alamat`, `tanggal`) VALUES
('S001', 'Bambang', '085245899976', 'Jl. Abu Bakar', '2021-06-01'),
('S002', 'Prina', '082288426203', 'Jalan Jenderal Sudirman Sungai Majo', '2021-01-05'),
('S003', 'Budi', '081234551123', 'Jl. Intisari', '2021-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_nota` varchar(10) NOT NULL,
  `kode_barang` varchar(10) DEFAULT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `jumlah_beli` int(10) DEFAULT NULL,
  `total_bayar` int(20) DEFAULT NULL,
  `bayar` int(20) DEFAULT NULL,
  `kembalian` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_nota`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `id_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`),
  ADD CONSTRAINT `kode_barang` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
