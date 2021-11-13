--
-- Dumping data for table `ban_to_chuc`
--

LOCK TABLES `ban_to_chuc` WRITE;
/*!40000 ALTER TABLE `ban_to_chuc` DISABLE KEYS */;
INSERT INTO `ban_to_chuc` VALUES (1,'BTC1','0123456789','bct@gmail.com');
/*!40000 ALTER TABLE `ban_to_chuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cau_thu`
--

LOCK TABLES `cau_thu` WRITE;
/*!40000 ALTER TABLE `cau_thu` DISABLE KEYS */;
INSERT INTO `cau_thu` VALUES (1,1,'CT1','Rooney',2000,'TD','Trai',190,70,'nothing'),(2,2,'CT2','Google',2001,'GK','Phai',195,75,'=))'),(3,3,'CT3','Neymar',1999,'TD','Trai',194,73,'<3'),(4,4,'CT4','CR7',1998,'HV','Phai',194,80,'ok');
/*!40000 ALTER TABLE `cau_thu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `doi_bong`
--

LOCK TABLES `doi_bong` WRITE;
/*!40000 ALTER TABLE `doi_bong` DISABLE KEYS */;
INSERT INTO `doi_bong` VALUES (1,'D1','MU','Red','In UK'),(2,'D2','Juve','White','Italy'),(3,'D3','MC','Blue','UK'),(4,'D4','PSG','Black','Germany'),(5,'D5','Barca','Blue & Red','Spain');
/*!40000 ALTER TABLE `doi_bong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `giai_dau`
--

LOCK TABLES `giai_dau` WRITE;
/*!40000 ALTER TABLE `giai_dau` DISABLE KEYS */;
INSERT INTO `giai_dau` VALUES (1,'GD1','V-League');
/*!40000 ALTER TABLE `giai_dau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ket_qua`
--

LOCK TABLES `ket_qua` WRITE;
/*!40000 ALTER TABLE `ket_qua` DISABLE KEYS */;
INSERT INTO `ket_qua` VALUES (1,1,1,4,0,2,4),(2,1,1,3,1,3,5);
/*!40000 ALTER TABLE `ket_qua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `san_dau`
--

LOCK TABLES `san_dau` WRITE;
/*!40000 ALTER TABLE `san_dau` DISABLE KEYS */;
INSERT INTO `san_dau` VALUES (1,'S1','Hola','Hanoi'),(2,'S2','Hang Day','Ha Noi'),(3,'S3','Lach Tray','HP');
/*!40000 ALTER TABLE `san_dau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tran_dau`
--

LOCK TABLES `tran_dau` WRITE;
/*!40000 ALTER TABLE `tran_dau` DISABLE KEYS */;
INSERT INTO `tran_dau` VALUES (1,1,1,'12/11/2021','17','1','1'),(2,1,1,'11/11/2021','19','1','1'),(3,2,3,'13/11/2021','18','1','1,2,3');
/*!40000 ALTER TABLE `tran_dau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tran_dau_doi_bong`
--

LOCK TABLES `tran_dau_doi_bong` WRITE;
/*!40000 ALTER TABLE `tran_dau_doi_bong` DISABLE KEYS */;
INSERT INTO `tran_dau_doi_bong` VALUES (1,1,1,'khong',2,3,4),(2,1,2,'good',1,0,3),(3,3,3,NULL,1,2,3),(4,3,4,'hihi',3,1,2),(5,2,2,NULL,2,4,6),(6,2,4,NULL,4,1,7);
/*!40000 ALTER TABLE `tran_dau_doi_bong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trong_tai`
--

LOCK TABLES `trong_tai` WRITE;
/*!40000 ALTER TABLE `trong_tai` DISABLE KEYS */;
INSERT INTO `trong_tai` VALUES (1,'1','Ali','0987654321','Arab');
/*!40000 ALTER TABLE `trong_tai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trong_tai_tran_dau`
--

LOCK TABLES `trong_tai_tran_dau` WRITE;
/*!40000 ALTER TABLE `trong_tai_tran_dau` DISABLE KEYS */;
INSERT INTO `trong_tai_tran_dau` VALUES (1,1,1,NULL,3000);
/*!40000 ALTER TABLE `trong_tai_tran_dau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vong_dau`
--

LOCK TABLES `vong_dau` WRITE;
/*!40000 ALTER TABLE `vong_dau` DISABLE KEYS */;
INSERT INTO `vong_dau` VALUES (1,1,'VD1','Vong loai 1'),(2,2,'VD2','Vong loai 2');
/*!40000 ALTER TABLE `vong_dau` ENABLE KEYS */;
UNLOCK TABLES;

