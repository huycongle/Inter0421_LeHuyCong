CREATE DATABASE  IF NOT EXISTS `resort_furama` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resort_furama`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: resort_furama
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bophan`
--

DROP TABLE IF EXISTS `bophan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bophan` (
  `IdBoPhan` int NOT NULL AUTO_INCREMENT,
  `TenBoPhan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdBoPhan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `IdDichVu` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(45) DEFAULT NULL,
  `DienTich` int DEFAULT NULL,
  `SoTang` int DEFAULT NULL,
  `SoNguoiToiDa` varchar(45) DEFAULT NULL,
  `ChiPhiThue` varchar(45) DEFAULT NULL,
  `IdKieuThue` int DEFAULT NULL,
  `IdLoaiDichVu` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdDichVu`),
  KEY `IdKieuThue` (`IdKieuThue`),
  KEY `IdLoaiDichVu` (`IdLoaiDichVu`),
  CONSTRAINT `dichvu_ibfk_1` FOREIGN KEY (`IdKieuThue`) REFERENCES `kieuthue` (`IdKieuThue`),
  CONSTRAINT `dichvu_ibfk_2` FOREIGN KEY (`IdLoaiDichVu`) REFERENCES `loaidichvu` (`IdLoaiDichVu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dichvudikem`
--

DROP TABLE IF EXISTS `dichvudikem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvudikem` (
  `IdDichVuDiKem` int NOT NULL AUTO_INCREMENT,
  `TenDichVUDiKem` varchar(45) DEFAULT NULL,
  `Gia` int DEFAULT NULL,
  `DonVi` int DEFAULT NULL,
  `TrangThaiKhaDung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdDichVuDiKem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `IdHopDong` int NOT NULL AUTO_INCREMENT,
  `IdNhanVien` int DEFAULT NULL,
  `IdKhachHang` int DEFAULT NULL,
  `IdDichVu` int DEFAULT NULL,
  `NgayLamHopDong` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `TienDatCoc` int DEFAULT NULL,
  `TongTien` int DEFAULT NULL,
  PRIMARY KEY (`IdHopDong`),
  KEY `IdNhanVien` (`IdNhanVien`),
  KEY `IdKhachHang` (`IdKhachHang`),
  KEY `IdDichVu` (`IdDichVu`),
  CONSTRAINT `hopdong_ibfk_1` FOREIGN KEY (`IdNhanVien`) REFERENCES `nhanvien` (`IdNhanVien`),
  CONSTRAINT `hopdong_ibfk_2` FOREIGN KEY (`IdKhachHang`) REFERENCES `khachhang` (`IdKhachHang`),
  CONSTRAINT `hopdong_ibfk_3` FOREIGN KEY (`IdDichVu`) REFERENCES `dichvu` (`IdDichVu`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hopdongchitiet`
--

DROP TABLE IF EXISTS `hopdongchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdongchitiet` (
  `IdHopDongChiTiet` int NOT NULL AUTO_INCREMENT,
  `IdHopDong` int DEFAULT NULL,
  `IdDichVuDiKem` int DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`IdHopDongChiTiet`),
  KEY `IdHopDong` (`IdHopDong`),
  KEY `IdDichVuDiKem` (`IdDichVuDiKem`),
  CONSTRAINT `hopdongchitiet_ibfk_1` FOREIGN KEY (`IdHopDong`) REFERENCES `hopdong` (`IdHopDong`),
  CONSTRAINT `hopdongchitiet_ibfk_2` FOREIGN KEY (`IdDichVuDiKem`) REFERENCES `dichvudikem` (`IdDichVuDiKem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `IdKhachHang` int NOT NULL AUTO_INCREMENT,
  `IdLoaiKhach` int DEFAULT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMND` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdKhachHang`),
  KEY `IdLoaiKhach` (`IdLoaiKhach`),
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`IdLoaiKhach`) REFERENCES `loaikhach` (`IdLoaiKhach`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kieuthue`
--

DROP TABLE IF EXISTS `kieuthue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieuthue` (
  `IdKieuThue` int NOT NULL AUTO_INCREMENT,
  `TenKieuThue` varchar(45) DEFAULT NULL,
  `Gia` int DEFAULT NULL,
  PRIMARY KEY (`IdKieuThue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `IdLoaiDichVu` int NOT NULL AUTO_INCREMENT,
  `TenLoaiDichVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdLoaiDichVu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loaikhach`
--

DROP TABLE IF EXISTS `loaikhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaikhach` (
  `IdLoaiKhach` int NOT NULL AUTO_INCREMENT,
  `TenLoaiKhach` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdLoaiKhach`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `IdNhanVien` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(45) DEFAULT NULL,
  `IdViTri` int DEFAULT NULL,
  `IdTrinhDo` int DEFAULT NULL,
  `IdBoPhan` int DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMND` varchar(45) DEFAULT NULL,
  `Luong` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdNhanVien`),
  KEY `IdViTri` (`IdViTri`),
  KEY `IdTrinhDo` (`IdTrinhDo`),
  KEY `IdBoPhan` (`IdBoPhan`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`IdViTri`) REFERENCES `vitri` (`IdVitri`),
  CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`IdTrinhDo`) REFERENCES `trinhdo` (`IdTrinhDo`),
  CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`IdBoPhan`) REFERENCES `bophan` (`IdBoPhan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trinhdo`
--

DROP TABLE IF EXISTS `trinhdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinhdo` (
  `IdTrinhDo` int NOT NULL AUTO_INCREMENT,
  `TenTrinhDo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdTrinhDo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vitri`
--

DROP TABLE IF EXISTS `vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitri` (
  `IdVitri` int NOT NULL AUTO_INCREMENT,
  `TenVitri` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdVitri`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'resort_furama'
--

--
-- Dumping routines for database 'resort_furama'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-15 15:09:09
