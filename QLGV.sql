IF DB_ID('QLGV') is not null
drop database QLGV

CREATE DATABASE QLGV
GO

USE QLGV
GO

-- Khoa
CREATE TABLE KHOA 
(
	MAKHOA varchar(4),
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRGKHOA char(4)
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)
GO

-- Mon hoc
CREATE TABLE MONHOC
(
	MAMH varchar(10),
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA varchar(4),
	CONSTRAINT PK_MONHOC PRIMARY KEY (MAMH),
)
GO

-- Dieu kien
CREATE TABLE DIEUKIEN
(
	MAMH varchar(10),
	MAMH_TRUOC varchar(10),
	CONSTRAINT PK_DIEUKIEN PRIMARY KEY (MAMH, MAMH_TRUOC)
)
GO

-- Giao vien
CREATE TABLE GIAOVIEN
(
	MAGV char(4),
	HOTEN varchar(40),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO numeric(4,2),
	MUCLUONG money,
	MAKHOA varchar(4)
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
)
GO

-- Hoc vien
CREATE TABLE HOCVIEN
(
	MAHV char(5),
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3),
	CONSTRAINT PK_HOCVIEN PRIMARY KEY (MAHV)
)
GO

-- Lop
CREATE TABLE LOP
(
	MALOP char(3),
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4)
	CONSTRAINT PK_LOP PRIMARY KEY (MALOP)
)
GO

-- Giang day
CREATE TABLE GIANGDAY
(
	MALOP char(3),
	MAMH varchar(10),
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MALOP, MAMH),
)
GO

-- Ket qua thi
CREATE TABLE KETQUATHI
(
	MAHV char(5),
	MAMH varchar(10),
	LANTHI tinyint,
	NGTHI smalldatetime,
	DIEM numeric(4,2),
	KQUA varchar(10)
	CONSTRAINT PK_KETQUATHI PRIMARY KEY (MAHV, MAMH, LANTHI)
)
GO

--Khoa
insert into KHOA values('KHMT','Khoa hoc may tinh','6/7/2005','GV01')
insert into KHOA values('HTTT','He thong thong tin','6/7/2005','GV02')
insert into KHOA values('CNPM','Cong nghe phan mem','6/7/2005','GV04')
insert into KHOA values('MTT','Mang va truyen thong','10/20/2005','GV03')
insert into KHOA values('KTMT','Ky thuat may tinh','12/20/2005','')

-- Giao vien
insert into GIAOVIEN values('GV01','Ho Thanh Son','PTS','GS','Nam','5/2/1950','1/11/2004',5.00,2250000,'KHMT')
insert into GIAOVIEN values('GV02','Tran Tam Thanh','TS','PGS','Nam','12/17/1965','4/20/2004',4.50,2025000,'HTTT')
insert into GIAOVIEN values('GV03','Do Nghiem Phung','TS','GS','Nu','8/1/1950','9/23/2004',4.00,1800000,'CNPM')
insert into GIAOVIEN values('GV04','Tran Nam Son','TS','PGS','Nam','2/22/1961','1/12/2005',4.50,2025000,'KTMT')
insert into GIAOVIEN values('GV05','Mai Thanh Danh','ThS','GV','Nam','3/12/1958','1/12/2005',3.00,1350000,'HTTT')
insert into GIAOVIEN values('GV06','Tran Doan Hung','TS','GV','Nam','3/11/1953','1/12/2005',4.50,2025000,'KHMT')
insert into GIAOVIEN values('GV07','Nguyen Minh Tien','ThS','GV','Nam','11/23/1971','3/1/2005',4.00,1800000,'KHMT')
insert into GIAOVIEN values('GV08','Le Thi Tran','KS','','Nu','3/26/1974','3/1/2005',1.69,760500,'KHMT')
insert into GIAOVIEN values('GV09','Nguyen To Lan','ThS','GV','Nu','12/31/1966','3/1/2005',4.00,1800000,'HTTT')
insert into GIAOVIEN values('GV10','Le Tran Anh Loan','KS','','Nu','7/17/1972','3/1/2005',1.86,837000,'CNPM')
insert into GIAOVIEN values('GV11','Ho Thanh Tung','CN','GV','Nam','1/12/1980','5/15/2005',2.67,1201500,'MTT')
insert into GIAOVIEN values('GV12','Tran Van Anh','CN','','Nu','3/29/1981','5/15/2005',1.69,760500,'CNPM')
insert into GIAOVIEN values('GV13','Nguyen Linh Dan','CN','','Nu','5/23/1980','5/15/2005',1.69,760500,'KTMT')
insert into GIAOVIEN values('GV14','Truong Minh Chau','ThS','GV','Nu','11/30/1976','5/15/2005',3.00,1350000,'MTT')
insert into GIAOVIEN values('GV15','Le Ha Thanh','ThS','GV','Nam','5/4/1978','5/15/2005',3.00,1350000,'KHMT')
 
-- Mon hoc
insert into MONHOC values('THDC','Tin hoc dai cuong',4,1,'KHMT')
insert into MONHOC values('CTRR','Cau truc roi rac',5,0,'KHMT')
insert into MONHOC values('CSDL','Co so du lieu',3,1,'HTTT')
insert into MONHOC values('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
insert into MONHOC values('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
insert into MONHOC values('DHMT','Do hoa may tinh',3,1,'KHMT')
insert into MONHOC values('KTMT','Kien truc may tinh',3,0,'KTMT')
insert into MONHOC values('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
insert into MONHOC values('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
insert into MONHOC values('HDH','He dieu hanh',4,0,'KTMT')
insert into MONHOC values('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
insert into MONHOC values('LTCFW','Lap trinh C for win',3,1,'CNPM')
insert into MONHOC values('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- Lop
insert into LOP values('K11','Lop 1 khoa 1','K1108',11,'GV07')
insert into LOP values('K12','Lop 2 khoa 1','K1205',12,'GV09')
insert into LOP values('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- Hoc vien
insert into HOCVIEN values('K1101','Nguyen Van','A','1/27/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1102','Tran Ngoc','Han','3/1/1986','Nu','Kien Giang','K11')
insert into HOCVIEN values('K1103','Ha Duy','Lap','4/18/1986','Nam','Nghe An','K11')
insert into HOCVIEN values('K1104','Tran Ngoc','Linh','3/30/1986','Nu','Tay Ninh','K11')
insert into HOCVIEN values('K1105','Tran Minh','Long','2/27/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1106','Le Nhat','Minh','1/24/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1107','Nguyen Nhu','Nhut','1/27/1986','Nam','Ha Noi','K11')
insert into HOCVIEN values('K1108','Nguyen Manh','Tam','2/27/1986','Nam','Kien Giang','K11')
insert into HOCVIEN values('K1109','Phan Thi Thanh','Tam','1/27/1986','Nu','Vinh Long','K11')
insert into HOCVIEN values('K1110','Le Hoai','Thuong','2/5/1986','Nu','Can Tho','K11')
insert into HOCVIEN values('K1111','Le Ha','Vinh','12/25/1986','Nam','Vinh Long','K11')
insert into HOCVIEN values('K1201','Nguyen Van','B','2/11/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1202','Nguyen Thi Kim','Duyen','1/18/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1203','Tran Thi Kim','Duyen','9/17/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1204','Truong My','Hanh','5/19/1986','Nu','Dong Nai','K12')
insert into HOCVIEN values('K1205','Nguyen Thanh','Nam','4/17/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1206','Nguyen Thi Truc','Thanh','3/4/1986','Nu','Kien Giang','K12')
insert into HOCVIEN values('K1207','Tran Thi Bich','Thuy','2/8/1986','Nu','Nghe An','K12')
insert into HOCVIEN values('K1208','Huynh Thi Kim','Trieu','4/8/1986','Nu','Tay Ninh','K12')
insert into HOCVIEN values('K1209','Pham Thanh','Trieu','2/23/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1210','Ngo Thanh','Tuan','2/14/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1211','Do Thi','Xuan','3/9/1986','Nu','Ha Noi','K12')
insert into HOCVIEN values('K1212','Le Thi Phi','Yen','3/12/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1301','Nguyen Thi Kim','Cuc','6/9/1986','Nu','Kien Giang','K13')
insert into HOCVIEN values('K1302','Truong Thi My','Hien','3/18/1986','Nu','Nghe An','K13')
insert into HOCVIEN values('K1303','Le Duc','Hien','3/12/1986','Nam','Tay Ninh','K13')
insert into HOCVIEN values('K1304','Le Quang','Hien','4/18/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1305','Le Thi','Huong','3/27/1986','Nu','TpHCM','K13')
insert into HOCVIEN values('K1306','Nguyen Thai','Huu','3/30/1986','Nam','Ha Noi','K13')
insert into HOCVIEN values('K1307','Tran Minh','Man','5/28/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1308','Nguyen Hieu','Nghia','4/8/1986','Nam','Kien Giang','K13')
insert into HOCVIEN values('K1309','Nguyen Trung','Nghia','1/18/1987','Nam','Nghe An','K13')
insert into HOCVIEN values('K1310','Tran Thi Hong','Tham','4/22/1986','Nu','Tay Ninh','K13')
insert into HOCVIEN values('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1312','Nguyen Thi Kim','Yen','9/7/1986','Nu','TpHCM','K13')

-- Giang day
insert into GIANGDAY values('K11','THDC','GV07',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K12','THDC','GV06',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K13','THDC','GV15',1,2006,'1/2/2006','5/12/2006')
insert into GIANGDAY values('K11','CTRR','GV02',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K12','CTRR','GV02',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K13','CTRR','GV08',1,2006,'1/9/2006','5/17/2006')
insert into GIANGDAY values('K11','CSDL','GV05',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K12','CSDL','GV09',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K13','CTDLGT','GV15',2,2006,'6/1/2006','7/15/2006')
insert into GIANGDAY values('K13','CSDL','GV05',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K13','DHMT','GV07',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K11','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K12','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006')
insert into GIANGDAY values('K11','HDH','GV04',1,2007,'1/2/2007','2/18/2007')
insert into GIANGDAY values('K12','HDH','GV04',1,2007,'1/2/2007','3/20/2007')
insert into GIANGDAY values('K11','DHMT','GV07',1,2007,'2/18/2007','3/20/2007')

-- Dieu kien
insert into DIEUKIEN values('CSDL','CTRR')
insert into DIEUKIEN values('CSDL','CTDLGT')
insert into DIEUKIEN values('CTDLGT','THDC')
insert into DIEUKIEN values('PTTKTT','THDC')
insert into DIEUKIEN values('PTTKTT','CTDLGT')
insert into DIEUKIEN values('DHMT','THDC')
insert into DIEUKIEN values('LTHDT','THDC')
insert into DIEUKIEN values('PTTKHTTT','CSDL')

-- Ket qua thi
insert into KETQUATHI values('K1101','CSDL',1,'7/20/2006',10.00,'Dat')
insert into KETQUATHI values('K1101','CTDLGT',1,'12/28/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','THDC',1,'5/20/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','CTRR',1,'5/13/2006',9.50,'Dat')
insert into KETQUATHI values('K1102','CSDL',1,'7/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',2,'7/27/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',3,'8/10/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',1,'12/28/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',2,'1/5/2007',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',3,'1/15/2007',6.00,'Dat')
insert into KETQUATHI values('K1102','THDC',1,'5/20/2006',5.00,'Dat')
insert into KETQUATHI values('K1102','CTRR',1,'5/13/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','CSDL',1,'7/20/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1103','CSDL',2,'7/27/2006',8.25,'Dat')
insert into KETQUATHI values('K1103','CTDLGT',1,'12/28/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1103','CTRR',1,'5/13/2006',6.50,'Dat')
insert into KETQUATHI values('K1104','CSDL',1,'7/20/2006',3.75,'Khong Dat')
insert into KETQUATHI values('K1104','CTDLGT',1,'12/28/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',1,'5/13/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',2,'5/20/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',3,'6/30/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1201','CSDL',1,'7/20/2006',6.00,'Dat')
insert into KETQUATHI values('K1201','CTDLGT',1,'12/28/2006',5.00,'Dat')
insert into KETQUATHI values('K1201','THDC',1,'5/20/2006',8.50,'Dat')
insert into KETQUATHI values('K1201','CTRR',1,'5/13/2006',9.00,'Dat')
insert into KETQUATHI values('K1202','CSDL',1,'7/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1202','CTDLGT',1,'12/28/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTDLGT',2,'1/5/2007',5.00,'Dat')
insert into KETQUATHI values('K1202','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','THDC',2,'5/27/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',1,'5/13/2006',3.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',2,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',3,'6/30/2006',6.25,'Dat')
insert into KETQUATHI values('K1203','CSDL',1,'7/20/2006',9.25,'Dat')
insert into KETQUATHI values('K1203','CTDLGT',1,'12/28/2006',9.50,'Dat')
insert into KETQUATHI values('K1203','THDC',1,'5/20/2006',10.00,'Dat')
insert into KETQUATHI values('K1203','CTRR',1,'5/13/2006',10.00,'Dat')
insert into KETQUATHI values('K1204','CSDL',1,'7/20/2006',8.50,'Dat')
insert into KETQUATHI values('K1204','CTDLGT',1,'12/28/2006',6.75,'Dat')
insert into KETQUATHI values('K1204','THDC',1,'5/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1204','CTRR',1,'5/13/2006',6.00,'Dat')
insert into KETQUATHI values('K1301','CSDL',1,'12/20/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1301','CTDLGT',1,'7/25/2006',8.00,'Dat')
insert into KETQUATHI values('K1301','THDC',1,'5/20/2006',7.75,'Dat')
insert into KETQUATHI values('K1301','CTRR',1,'5/13/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CSDL',1,'12/20/2006',6.75,'Dat')
insert into KETQUATHI values('K1302','CTDLGT',1,'7/25/2006',5.00,'Dat')
insert into KETQUATHI values('K1302','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CTRR',1,'5/13/2006',8.50,'Dat')
insert into KETQUATHI values('K1303','CSDL',1,'12/20/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',1,'7/25/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',2,'8/7/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',3,'8/15/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1303','THDC',1,'5/20/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',1,'5/13/2006',3.25,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',2,'5/20/2006',5.00,'Dat')
insert into KETQUATHI values('K1304','CSDL',1,'12/20/2006',7.75,'Dat')
insert into KETQUATHI values('K1304','CTDLGT',1,'7/25/2006',9.75,'Dat')
insert into KETQUATHI values('K1304','THDC',1,'5/20/2006',5.50,'Dat')
insert into KETQUATHI values('K1304','CTRR',1,'5/13/2006',5.00,'Dat')
insert into KETQUATHI values('K1305','CSDL',1,'12/20/2006',9.25,'Dat')
insert into KETQUATHI values('K1305','CTDLGT',1,'7/25/2006',10.00,'Dat')
insert into KETQUATHI values('K1305','THDC',1,'5/20/2006',8.00,'Dat')
insert into KETQUATHI values('K1305','CTRR',1,'5/13/2006',10.00,'Dat')

-- Khoa ngoai --
ALTER TABLE LOP ADD CONSTRAINT FK_TRGLOP FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD	CONSTRAINT FK_MAGVCN FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAGV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE MONHOC ADD CONSTRAINT FK_MAKHOA_2 FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)

-- Tuan 1
-- CAU 1. T???o quan h??? v?? khai b??o t???t c??? c??c r??ng bu???c kh??a ch??nh, kh??a ngo???i. Th??m v??o 3 thu???c t??nh GHICHU, DIEMTB, XEPLOAI cho quan h??? HOCVIEN.
ALTER TABLE HOCVIEN ADD GHICHU varchar(40)
ALTER TABLE HOCVIEN ADD XEPLOAI char(2)
ALTER TABLE HOCVIEN ADD DIEMTB numeric(4,2)

-- CAU 2. M?? h???c vi??n l?? m???t chu???i 5 k?? t???, 3 k?? t??? ?????u l?? m?? l???p, 2 k?? t??? cu???i c??ng l?? s??? th??? t??? h???c vi??n trong l???p. VD: ???K1101???
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_MAHV 
CHECK(SUBSTRING(MAHV,1 ,3) = MALOP AND ISNUMERIC(SUBSTRING(MAHV, 4, 2)) = 1)
-- CAU 3. Thu???c t??nh GIOITINH ch??? c?? gi?? tr??? l?? ???Nam??? ho???c ???Nu???.
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_GIOITINHHV 
CHECK(GIOITINH IN('Nam', 'Nu'))
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_GIOITINHGV 
CHECK(GIOITINH IN('Nam', 'Nu'))
-- Cau 4. ??i???m s??? c???a m???t l???n thi c?? gi?? tr??? t??? 0 ?????n 10 v?? c???n l??u ?????n 2 s??? l??? (VD: 6.22).
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_KQTHI 
CHECK( DIEM BETWEEN 0 AND 10 AND RIGHT(CAST(DIEM AS varchar), 3) LIKE '.__')
-- Cau 5. K???t qu??? thi l?? ???Dat??? n???u ??i???m t??? 5 ?????n 10 v?? ???Khong dat??? n???u ??i???m nh??? h??n 5.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_KETQUA 
CHECK((KQUA = 'Dat' AND DIEM BETWEEN 5 AND 10) OR (KQUA = 'Khong dat' AND DIEM < 5))
-- Cau 6. H???c vi??n thi m???t m??n t???i ??a 3 l???n.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_LANTHI CHECK(LANTHI <= 3)
-- Cau 7. H???c k??? ch??? c?? gi?? tr??? t??? 1 ?????n 3.
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CHECK_HOCKY CHECK(HOCKY BETWEEN 1 AND 3)
--  Cau 8. H???c v??? c???a gi??o vi??n ch??? c?? th??? l?? ???CN???, ???KS???, ???Ths???, ???TS???, ???PTS???.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))

--Tuan 2 Phan 1 Cau 11 - 14
--Cau 11. H???c vi??n ??t nh???t l?? 18 tu???i.
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 18)
--Cau 12. Gi???ng d???y m???t m??n h???c ng??y b???t ?????u (TUNGAY) ph???i nh??? h??n ng??y k???t th??c (DENNGAY).
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CHECK_NGAYDAY CHECK (TUNGAY < DENNGAY)
--Cau 13. Gi??o vi??n khi v??o l??m ??t nh???t l?? 22 tu???i.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_TUOIGIAOVIEN CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 22)
--Cau 14. T???t c??? c??c m??n h???c ?????u c?? s??? t??n ch??? l?? thuy???t v?? t??n ch??? th???c h??nh ch??nh l???ch nhau kh??ng qu?? 5.
ALTER TABLE MONHOC 
ADD CONSTRAINT CHECK_TINCHI CHECK (TCLT - TCLT <=5)

--Tuan 2 Phan 3 Cau 1 - 5
--Cau 1. In ra danh s??ch (m?? h???c vi??n, h??? t??n, ng??y sinh, m?? l???p) l???p tr?????ng c???a c??c l???p.
SELECT HOCVIEN.MAHV,(HO +' '+ TEN) HOTEN, NGSINH, LOP.MALOP 
FROM HOCVIEN, LOP 
WHERE HOCVIEN.MAHV = LOP.TRGLOP
--Cau 2. In ra b???ng ??i???m khi thi (m?? h???c vi??n, h??? t??n , l???n thi, ??i???m s???) m??n CTRR c???a l???p ???K12???, s???p x???p theo t??n, h??? h???c vi??n.
SELECT HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, LANTHI, DIEM 
FROM KETQUATHI, HOCVIEN  
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND MAMH = 'CTRR' AND MALOP = 'K12' 
ORDER BY HO, TEN
--Cau 3. In ra danh s??ch nh???ng h???c vi??n (m?? h???c vi??n, h??? t??n) v?? nh???ng m??n h???c m?? h???c vi??n ???? thi l???n th??? nh???t ???? ?????t.
SELECT distinct HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, TENMH 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND LANTHI = 1 AND KQUA = 'Dat'
--Cau 4. In ra danh s??ch h???c vi??n (m?? h???c vi??n, h??? t??n) c???a l???p ???K11??? thi m??n CTRR kh??ng ?????t (??? l???n thi 1).
SELECT HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, TENMH 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND LANTHI = 1 
	AND KQUA = 'Khong Dat' 
	AND TENMH = 'CTRR'
--Cau 5. * Danh s??ch h???c vi??n (m?? h???c vi??n, h??? t??n) c???a l???p ???K??? thi m??n CTRR kh??ng ?????t (??? t???t c??? c??c l???n thi).
SELECT HOCVIEN.MAHV, (HO + ' '+ TEN) HOTEN 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND MALOP LIKE'K%' 
	AND TENMH = 'CTRR' 
	AND KQUA = 'Khong Dat'

-- Tuan 3
-- Phan 2 cau 1 - 4
-- Cau 1. T??ng h??? s??? l????ng th??m 0.2 cho nh???ng gi??o vi??n l?? tr?????ng khoa.
UPDATE GIAOVIEN
SET HESO = HESO + 0.2 
WHERE 
	MAGV IN (SELECT TRGKHOA FROM KHOA)
-- Cau 2. C???p nh???t gi?? tr??? ??i???m trung b??nh t???t c??? c??c m??n h???c (DIEMTB) c???a m???i h???c vi??n (t???t c??? c??c m??n h???c ?????u c?? h??? s??? 1 v?? n???u h???c vi??n thi m???t m??n nhi???u l???n, ch??? l???y ??i???m c???a l???n thi sau c??ng).
UPDATE HOCVIEN
SET DIEMTB = 
(
	SELECT AVG(DIEM)
	FROM KETQUATHI
	WHERE 
		LANTHI = (
			SELECT MAX(LANTHI) 
			FROM KETQUATHI KQ
			WHERE MAHV = KETQUATHI.MAHV 
			GROUP BY MAHV
			)
	GROUP BY MAHV
	HAVING MAHV = HOCVIEN.MAHV
)
-- Cau 3.C???p nh???t gi?? tr??? cho c???t GHICHU l?? ???Cam thi??? ?????i v???i tr?????ng h???p: h???c vi??n c?? m???t m??n b???t k??? thi l???n th??? 3 d?????i 5 ??i???m. 
UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE MAHV IN 
(
	SELECT MAHV
	FROM KETQUATHI
	WHERE 
		LANTHI = 3 
		AND DIEM < 5
)
-- Cau 4. C???p nh???t gi?? tr??? cho c???t XEPLOAI trong quan h??? HOCVIEN nh?? sau:
		--o N???u DIEMTB ??? 9 th?? XEPLOAI =???XS???
		--o N???u 8 ??? DIEMTB < 9 th?? XEPLOAI = ???G???
		--o N???u 6.5 ??? DIEMTB < 8 th?? XEPLOAI = ???K???
		--o N???u 5 ??? DIEMTB < 6.5 th?? XEPLOAI = ???TB???
		--o N???u DIEMTB < 5 th?? XEPLOAI = ???Y???
UPDATE HOCVIEN
SET XEPLOAI = 
(
	CASE 
		WHEN DIEMTB >= 9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
)
-- Phan 3 cau 6 - 10
-- Cau 6. T??m t??n nh???ng m??n h???c m?? gi??o vi??n c?? t??n ???Tran Tam Thanh??? d???y trong h???c k??? 1 n??m 2006.
SELECT DISTINCT TENMH 
FROM GIANGDAY, GIAOVIEN, MONHOC 
WHERE 
	GIANGDAY.MAGV = GIAOVIEN.MAGV 
	AND MONHOC.MAMH = GIANGDAY.MAMH 
	AND GIAOVIEN.HOTEN = 'Tran Thanh Tam' 
	AND HOCKY = 1 
	AND NAM = 2006
-- Cau 7. T??m nh???ng m??n h???c (m?? m??n h???c, t??n m??n h???c) m?? gi??o vi??n ch??? nhi???m l???p ???K11??? d???y trong h???c k??? 1 n??m 2006.
SELECT MONHOC.MAMH, TENMH 
FROM MONHOC, LOP, GIANGDAY
WHERE 
	MAGV IN (SELECT MAGVCN FROM LOP) 
	AND GIANGDAY.MALOP = 'K11' 
	AND HOCKY = 1 
	AND NAM =2006
-- Cau 8.T??m h??? t??n l???p tr?????ng c???a c??c l???p m?? gi??o vi??n c?? t??n ???Nguyen To Lan??? d???y m??n ???Co So Du Lieu???.
SELECT (HO+' '+TEN) HOTEN 
FROM LOP, GIAOVIEN, GIANGDAY, MONHOC, HOCVIEN
WHERE 
	LOP.MALOP = GIANGDAY.MALOP 
	AND LOP.TRGLOP = HOCVIEN.MAHV
	AND GIANGDAY.MAMH = MONHOC.MAMH
	AND GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIAOVIEN.HOTEN = 'Nguyen To Lan'
	AND MONHOC.TENMH = 'Co So Du Lieu'
-- Cau 9. In ra danh s??ch nh???ng m??n h???c (m?? m??n h???c, t??n m??n h???c) ph???i h???c li???n tr?????c m??n ???Co So Du Lieu???.
SELECT MONHOC.MAMH, TENMH 
FROM MONHOC JOIN DIEUKIEN ON MONHOC.MAMH=DIEUKIEN.MAMH_TRUOC
WHERE DIEUKIEN.MAMH =
	  (
	  SELECT MAMH
	  FROM MONHOC
	  WHERE TENMH = 'Co So Du Lieu'
	  )
-- Cau 10. M??n ???Cau Truc Roi Rac??? l?? m??n b???t bu???c ph???i h???c li???n tr?????c nh???ng m??n h???c (m?? m??n h???c, t??n m??n h???c) n??o.
SELECT MONHOC.MAMH, TENMH 
FROM DIEUKIEN, MONHOC
WHERE 
	MONHOC.MAMH = DIEUKIEN.MAMH_TRUOC
	AND DIEUKIEN.MAMH = MONHOC.MAMH
	AND MONHOC.TENMH = 'Co So Du Lieu'
-- Phan 3 cau 11 -- 18
-- Cau 11.T??m h??? t??n gi??o vi??n d???y m??n CTRR cho c??? hai l???p ???K11??? v?? ???K12??? trong c??ng h???c k??? 1 n??m 2006.
SELECT HOTEN 
FROM GIAOVIEN, GIANGDAY
WHERE 
	GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIANGDAY.MALOP = 'K11' 
	AND GIANGDAY.MALOP = 'K12'
	AND HOCKY = 1 
	AND NAM = 2006
-- Cau 12. T??m nh???ng h???c vi??n (m?? h???c vi??n, h??? t??n) thi kh??ng ?????t m??n CSDL ??? l???n thi th??? 1 nh??ng ch??a thi l???i m??n n??y.
SELECT HOCVIEN.MAHV, (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MAMH = 'CSDL' 
	AND LANTHI = 1 
	AND KQUA = 'Khong Dat'
	AND NOT EXISTS (
		SELECT * 
		FROM KETQUATHI 
		WHERE 
			LANTHI > 1 
			AND KETQUATHI.MAHV = HOCVIEN.MAHV
			)

-- Cau 13. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) kh??ng ???????c ph??n c??ng gi???ng d???y b???t k??? m??n h???c n??o.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE MAGV NOT IN (
	SELECT MAGV 
	FROM GIANGDAY
	)

-- Cau 14. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) kh??ng ???????c ph??n c??ng gi???ng d???y b???t k??? m??n h???c n??o thu???c khoa gi??o vi??n ???? ph??? tr??ch.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE NOT EXISTS
(
	SELECT *
	FROM MONHOC
	WHERE MONHOC.MAKHOA = GIAOVIEN.MAKHOA
	AND NOT EXISTS
	(
		SELECT *
		FROM GIANGDAY
		WHERE GIANGDAY.MAMH = MONHOC.MAMH
		AND GIANGDAY.MAGV = GIAOVIEN.MAGV
	)
)

-- Cau 15. T??m h??? t??n c??c h???c vi??n thu???c l???p ???K11??? thi m???t m??n b???t k??? qu?? 3 l???n v???n ???Khong dat??? ho???c thi l???n th??? 2 m??n CTRR ???????c 5 ??i???m.
SELECT DISTINCT (HO+' '+TEN) HOTEN
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MALOP = 'K11'
	AND ((LANTHI = 2 AND DIEM = 5)
	OR HOCVIEN.MAHV IN
		(	
		SELECT DISTINCT MAHV
		FROM KETQUATHI
		WHERE KQUA = 'Khong Dat'
		GROUP BY MAHV, MAMH
		HAVING COUNT(*) > 3	
		)
	)

-- C??u 16. T??m h??? t??n gi??o vi??n d???y m??n CTRR cho ??t nh???t hai l???p trong c??ng m???t h???c k??? c???a m???t n??m h???c.
SELECT HOTEN
FROM GIAOVIEN, GIANGDAY
WHERE
	GIAOVIEN.MAGV = GIANGDAY.MAGV
	AND MAMH = 'CTRR'
GROUP BY GIAOVIEN.MAGV, HOTEN, HOCKY
HAVING COUNT(*) >= 2

-- C??u 17. Danh s??ch h???c vi??n v?? ??i???m thi m??n CSDL (ch??? l???y ??i???m c???a l???n thi sau c??ng).
SELECT HOCVIEN.*, DIEM AS '??i???m thi CSDL sau c??ng'
FROM HOCVIEN, KETQUATHI
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND MAMH = 'CSDL'
	AND LANTHI = 
	(
		SELECT MAX(LANTHI) 
		FROM KETQUATHI 
		WHERE 
			MAMH = 'CSDL' 
			AND KETQUATHI.MAHV = HOCVIEN.MAHV
		GROUP BY MAHV
	)

-- C??u 18. Danh s??ch h???c vi??n v?? ??i???m thi m??n ???Co So Du Lieu??? (ch??? l???y ??i???m cao nh???t c???a c??c l???n thi).
SELECT HOCVIEN.*, DIEM AS '??i???m thi CSDL cao nh???t'
FROM HOCVIEN, KETQUATHI, MONHOC
WHERE
	HOCVIEN.MAHV = KETQUATHI.MAHV
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND TENMH = 'Co So Du Lieu'
	AND DIEM = 
	(
		SELECT MAX(DIEM) 
		FROM KETQUATHI, MONHOC
		WHERE
			KETQUATHI.MAMH = MONHOC.MAMH
			AND MAHV = HOCVIEN.MAHV
			AND TENMH = 'Co So Du Lieu'
		GROUP BY MAHV
	)

-- Tuan 4
-- Phan 3 Cau 19 - 25
-- Cau 19. Khoa n??o (m?? khoa, t??n khoa) ???????c th??nh l???p s???m nh???t.
select MAKHOA, TENKHOA
from KHOA
where NGTLAP <= all(
	select NGTLAP
	from KHOA
)
-- Cau 20. C?? bao nhi??u gi??o vi??n c?? h???c h??m l?? ???GS??? ho???c ???PGS???.
select count(*)
from GIAOVIEN
where 
	HOCHAM in ('GS', 'PGS')
-- Cau 21. Th???ng k?? c?? bao nhi??u gi??o vi??n c?? h???c v??? l?? ???CN???, ???KS???, ???Ths???, ???TS???, ???PTS??? trong m???i khoa.
select MAKHOA, HOCVI, count(*)
from GIAOVIEN
group by MAKHOA, HOCVI
order by MAKHOA
-- Cau 22. M???i m??n h???c th???ng k?? s??? l?????ng h???c vi??n theo k???t qu??? (?????t v?? kh??ng ?????t).
select MAMH, KQUA, count(*)
from KETQUATHI
group by MAMH, KQUA
order by MAMH
-- Cau 23. T??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) l?? gi??o vi??n ch??? nhi???m c???a m???t l???p, ?????ng th???i d???y cho l???p ???? ??t nh???t m???t m??n h???c.
select GIAOVIEN.MAGV, HOTEN
from GIAOVIEN JOIN LOP ON GIAOVIEN.MAGV = LOP.MAGVCN, GIANGDAY
where 
	GIANGDAY.MALOP = LOP.MALOP
	and GIANGDAY.MAGV = GIAOVIEN.MAGV
-- Cau 24. T??m h??? t??n l???p tr?????ng c???a l???p c?? s??? s??? cao nh???t.
select HO +' '+ TEN as 'H??? t??n l???p tr?????ng l???p c?? s?? s??? l???n nh???t'
from HOCVIEN, LOP
where 
	HOCVIEN.MAHV = LOP.TRGLOP
	and SISO >= all(
		select siso 
		from LOP
	)
-- Cau 25. * T??m h??? t??n nh???ng LOPTRG thi kh??ng ?????t qu?? 3 m??n (m???i m??n ?????u thi kh??ng ?????t ??? t???t c??? c??c l???n thi).
select HO+' '+TEN
from HOCVIEN, LOP, KETQUATHI
where
	HOCVIEN.MAHV = LOP.TRGLOP
	and HOCVIEN.MAHV = KETQUATHI.MAHV
	and KQUA = 'Khong Dat'
group by TRGLOP, HO, TEN
having count(*) > 3

-- Cau 26 - 35
-- Cau 26. T??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? s??? m??n ?????t ??i???m 9,10 nhi???u nh???t.
select top 1 with ties HOCVIEN.MAHV, (HO+' '+TEN) as HOTEN
from HOCVIEN, KETQUATHI
where
	HOCVIEN.MAHV = KETQUATHI.MAHV
	and DIEM >= 9
group by HOCVIEN.MAHV, HO, TEN
order by count(*) desc
-- Cau 27. Trong t???ng l???p, t??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? s??? m??n ?????t ??i???m 9,10 nhi???u nh???t.
select MALOP, MAHV, HO,TEN
from (
	select  MALOP, HOCVIEN.MAHV, HO,TEN, COUNT(*) SOLUONGDIEM, 
			-- xep hang so luong diem >= 9
			-- tra ve so thu tu
			RANK() over (
				partition by MALOP 
				order by COUNT(*) desc
				) as XEPHANG
	from HOCVIEN, KETQUATHI
	where
		HOCVIEN.MAHV = KETQUATHI.MAHV
		and DIEM >= 9
	group by MALOP, HOCVIEN.MAHV, HO, TEN
) as A
where A.XEPHANG = 1
-- Cau 28. Trong t???ng h???c k??? c???a t???ng n??m, m???i gi??o vi??n ph??n c??ng d???y bao nhi??u m??n h???c, bao nhi??u l???p.
select HOCKY, NAM, MAGV, count(distinct MAMH) 'S??? l?????ng m??n gi???ng d???y', count(distinct MALOP) 'S??? l?????ng l???p gi???ng d???y'
from GIANGDAY
group by NAM, HOCKY, MAGV
-- Cau 29. Trong t???ng h???c k??? c???a t???ng n??m, t??m gi??o vi??n (m?? gi??o vi??n, h??? t??n) gi???ng d???y nhi???u nh???t.
select HOCKY, NAM, A.MAGV, HOTEN
from GIAOVIEN, (
	select HOCKY, NAM, MAGV, rank() over 
		(
			partition by HOCKY, NAM 
			order by count(*)  desc
		) as XEPHANG
	from GIANGDAY
	group by HOCKY, NAM, MAGV
) as A
where 
	A.MAGV = GIAOVIEN.MAGV
	and XEPHANG = 1
order by NAM, HOCKY
-- Cau 30. T??m m??n h???c (m?? m??n h???c, t??n m??n h???c) c?? nhi???u h???c vi??n thi kh??ng ?????t (??? l???n thi th??? 1) nh???t.
select MONHOC.MAMH, TENMH
from MONHOC, KETQUATHI
where 
	MONHOC.MAMH = KETQUATHI.MAMH
	and KETQUATHI.KQUA = 'Khong Dat'
	and LANTHI = 1
group by MONHOC.MAMH, TENMH
having 
	count(*) >= all
	(
	select count(*) 
	from KETQUATHI
	where 
		LANTHI = 1
		and KQUA = 'Khong Dat'
	group by MAMH
	) 
-- Cau 31. T??m h???c vi??n (m?? h???c vi??n, h??? t??n) thi m??n n??o c??ng ?????t (ch??? x??t l???n thi th??? 1).
select distinct HOCVIEN.MAHV, (HO +' '+TEN) HOTEN
from HOCVIEN, KETQUATHI
where 	
	HOCVIEN.MAHV =KETQUATHI.MAHV
	and not exists 
		(
		select *
		from KETQUATHI
		where 
			KQUA = 'Khong Dat'
			and LANTHI = 1
			and MAHV = HOCVIEN.MAHV
		)
-- Cau 32. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) thi m??n n??o c??ng ?????t (ch??? x??t l???n thi sau c??ng).
select distinct HOCVIEN.MAHV, (HO +' '+TEN) HOTEN
from HOCVIEN, KETQUATHI
where 	
	HOCVIEN.MAHV =KETQUATHI.MAHV
	and not exists 
		(
		select *
		from KETQUATHI
		where 
			KQUA = 'Khong Dat'
			and LANTHI = 
				(
				select max(LANTHI) 
				from KETQUATHI 
				where MAHV = HOCVIEN.MAHV 
				group by MAHV
				)
			and MAHV = HOCVIEN.MAHV
		)
-- Cau 33. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) ???? thi t???t c??? c??c m??n ?????u ?????t (ch??? x??t l???n thi th??? 1).
select MAHV, (HO+' '+TEN) HOTEN
from HOCVIEN
where not exists
	(
		select *
		from MONHOC
		where not exists
			(
				select *
				from KETQUATHI
				where 
					KETQUATHI.MAMH = MONHOC.MAMH
					and KETQUATHI.MAHV = HOCVIEN.MAHV
					and LANTHI = 1
					and KQUA = 'Dat'
			)
	)
-- Cau 34. * T??m h???c vi??n (m?? h???c vi??n, h??? t??n) ???? thi t???t c??? c??c m??n ?????u ?????t (ch??? x??t l???n thi sau c??ng).
select MAHV, (HO+' '+TEN) HOTEN
from HOCVIEN
where not exists
	(
		select *
		from MONHOC
		where not exists
			(
				select *
				from KETQUATHI
				where 
					KETQUATHI.MAMH = MONHOC.MAMH
					and KETQUATHI.MAHV = HOCVIEN.MAHV
					and LANTHI =
						(
							select max(LANTHI)
							from KETQUATHI
							where 
								KETQUATHI.MAMH = MONHOC.MAMH
								and KETQUATHI.MAHV = HOCVIEN.MAHV
							group by MAHV, MAMH
						)
					and KQUA = 'Dat'
			)
	)
-- Cau 35. ** T??m h???c vi??n (m?? h???c vi??n, h??? t??n) c?? ??i???m thi cao nh???t trong t???ng m??n (l???y ??i???m ??? l???n thi sau c??ng).
select MAMH, MAHV, HOTEN
from 
	(
	select MAMH, HOCVIEN.MAHV, (HO+' '+TEN) HOTEN, rank() over (partition by MAMH order by max(DIEM) desc) 
	as XEPHANG
	from HOCVIEN, KETQUATHI
	where
		HOCVIEN.MAHV = KETQUATHI.MAHV
		and LANTHI = 
			(
			select max(LANTHI)
			from KETQUATHI
			where 
				KETQUATHI.MAHV = HOCVIEN.MAHV
			group by MAHV, MAMH
			)
	group by MAMH, HOCVIEN.MAHV, HO, TEN
	) as A
where A.XEPHANG = 1

-- Tuan 5
-- Phan 1 Cau 9 - 10, 15 - 24
-- Cau 9. L???p tr?????ng c???a m???t l???p ph???i l?? h???c vi??n c???a l???p ????.
-- Them, sua lop truong
create trigger trg_ins_upd_TRGLOP
on LOP
for insert, update
as
begin
	declare @TRGLOP char(5), 
			@MALOP char(3), 
			@MALOPTRGLOP char(3)
	select @TRGLOP = TRGLOP, @MALOPTRGLOP = MALOP
	from inserted 
	select @MALOP = MALOP
	from HOCVIEN
	where @TRGLOP = MAHV

	if (@MALOP <> @MALOPTRGLOP)
		begin
			print 'Lop truong khong phai thanh vien cua lop'
			rollback transaction
		end
end

-- Cau 10. Tr?????ng khoa ph???i l?? gi??o vi??n thu???c khoa v?? c?? h???c v??? ???TS??? ho???c ???PTS???.
create trigger trg_ins_upd_TRGKHOA
on KHOA
for insert, update
as
begin
	declare @makhoa_trgkhoa char(4), 
			@trgkhoa char(4), 
			@makhoa varchar(4),
			@hocvi varchar(10)

	select @trgkhoa = TRGKHOA, @makhoa_trgkhoa = MAKHOA
	from inserted

	select @makhoa = MAKHOA, @hocvi = HOCVI
	from GIAOVIEN
	where @trgkhoa = MAGV

	if((@makhoa <> @makhoa_trgkhoa) and (@hocvi not in('TS','pts')))
	begin
		print 'Truong khoa khong thuoc khoa hoac khong co hoc vi ts, pts'
		rollback transaction
	end
end

-- Cau 15 . H???c vi??n ch??? ???????c thi m???t m??n h???c n??o ???? khi l???p c???a h???c vi??n ???? h???c xong m??n h???c n??y.
create trigger trg_ins_upd_KQT_HOCVIEN
on KETQUATHI
for insert, update
as 
begin
	declare @ngthi smalldatetime,
			@ngkt smalldatetime
	
	select @ngthi = NGTHI, @ngkt = DENNGAY
	from inserted i, HOCVIEN hv, GIANGDAY gd
	where 
		i.MAHV = hv.MAHV
		and hv.MALOP = gd.MALOP
		and i.MAMH = gd.MAMH
	if (@ngthi < @ngkt)
	begin
		print 'Ngay thi khong the be hon ngay ket thuc mon'
		rollback transaction
	end
end

-- Cau 16. M???i h???c k??? c???a m???t n??m h???c, m???t l???p ch??? ???????c h???c t???i ??a 3 m??n
create trigger trg_ins_upd_MAXMON
on GIANGDAY
for insert, update
as
begin
	declare @count_mon tinyint
	select @count_mon = count(gd.MAMH)
	from GIANGDAY gd, inserted i
	where 
		gd.HOCKY = i.HOCKY
		and gd.NAM = i.NAM
		and gd.MALOP = i.MALOP
	
	if (@count_mon > 3)
	begin
		print 'Chi duoc toi da 3 mon hoc'
		rollback transaction
	end
end

-- Cau 17. S??? s??? c???a m???t l???p b???ng v???i s??? l?????ng h???c vi??n thu???c l???p ????.
create trigger trg_ins_upd_CHECK_SL_HV
on LOP
for insert, update
as
begin
	declare @count_hv tinyint, 
			@siso tinyint
	
	select @count_hv = count(hv.MAHV)
	from HOCVIEN hv, inserted i
	where 
		hv.MALOP = i.MALOP
	
	select @siso = SISO
	from LOP
	if (@count_hv <> @siso)
	begin
		print 'So hoc vien khac voi si so'
		rollback transaction
	end
end

-- Cau 18. Trong quan h??? DIEUKIEN gi?? tr??? c???a thu???c t??nh MAMH v?? MAMH_TRUOC trong c??ng m???t b??? kh??ng ???????c gi???ng nhau (???A???,???A???) v?? c??ng kh??ng t???n t???i hai b??? (???A???,???B???) v?? (???B???,???A???).
create trigger trg_ins_upd_DIEUKIENMONHOC
on DIEUKIEN
for insert, update
as 
begin
	declare @mamh varchar(10),
			@mamh_truoc varchar(10)
	
	select @mamh = MAMH, @mamh_truoc = MAMH_TRUOC
	from inserted
	if (@mamh_truoc = @mamh)
		or (@mamh in (
			select MAMH_TRUOC
			from DIEUKIEN
			where MAMH_TRUOC = @mamh
		))
		or (@mamh_truoc in (
			select MAMH
			from DIEUKIEN
			where  MAMH = @mamh_truoc
		))
	begin
		print 'Sai nhe'
		rollback transaction
	end
end
-- Cau 19. C??c gi??o vi??n c?? c??ng h???c v???, h???c h??m, h??? s??? l????ng th?? m???c l????ng b???ng nhau.
create trigger trg_ins_upd_SSGV
on GIAOVIEN
for insert, update
as
begin
	declare @mucluong money,
			@magv varchar(4)
		
	select @mucluong = gv.MUCLUONG, @magv = i.MAGV
	from GIAOVIEN gv, inserted i
	where 
		gv.HOCHAM = i.HOCHAM
		and gv.HOCVI = i.HOCVI
		and gv.HESO = i.HESO
		and gv.MAGV <> i.MAGV
	begin
		update GIAOVIEN
		set MUCLUONG = @mucluong
		where MAGV = @magv
	end
end
-- Cau 20. H???c vi??n ch??? ???????c thi l???i (l???n thi >1) khi ??i???m c???a l???n thi tr?????c ???? d?????i 5.
create trigger trg_ins_upd_CHECKTHILAI
on KETQUATHI
for insert, update
as
begin
	declare @lanthi tinyint, 
			@diemthi numeric(4,2)

	select @lanthi = LANTHI
	from inserted

	if (@lanthi > 1) 
	begin
		select @diemthi = kq.DIEM
		from KETQUATHI kq, inserted i
		where
			kq.MAHV = i.MAHV
			and kq.MAMH = i.MAMH
			and kq.LANTHI = @lanthi - 1

		if (@diemthi >= 5)
		begin
			print 'SV da dau'
			rollback transaction
		end
	end
end

-- Cau 21. Ng??y thi c???a l???n thi sau ph???i l???n h??n ng??y thi c???a l???n thi tr?????c (c??ng h???c vi??n, c??ng m??n h???c).
create trigger trg_ins_upd_CHECKNGTHI
on KETQUATHI
for insert, update
as
begin
	declare @ngthi1 smalldatetime,
			@ngthi2 smalldatetime,
			@lanthi1 tinyint,
			@lanthi2 tinyint
			@mamh char(10),
			@mahv char(5)
	select  @mamh = MAMH, 
			@mahv = MAHV, 
			@ngthi2 = NGTHI, 
			@lanthi2 = LANTHI
	from inserted

	select @ngthi1 = NGTHI, @lanthi1 = LANTHI
	from KETQUATHI
	where 
		@mahv = MAHV
		and @mamh = MAMH
		and @lanthi1 = @lanthi2 - 1
	
	if (@ngthi2 < ngthi1)
	begin
		print 'Ngay thi chua hop le'
		rollback transaction
	end 		
end

-- Cau 22. H???c vi??n ch??? ???????c thi nh???ng m??n m?? l???p c???a h???c vi??n ???? ???? h???c xong.
create trigger trg_ins_upd_THIHOCXONG
on KETQUATHI
for insert, update
as
begin
	declare @ngthi smalldatetime,
			@denngay smalldatetime
	
	select @ngthi = NGTHI, @denngay = DENNGAY
	from HOCVIEN hv, inserted i, GIANGDAY gd
	where
		hv.MAHV = i.MAHV
		and i.MAMH = gd.MAMH
		and hv.MALOP = gd.MALOP
	if (@ngthi < @denngay) 
	begin
		print 'Chua hoc xong'
		rollback transaction
	end 
end

-- Cau 23. . Khi ph??n c??ng gi???ng d???y m???t m??n h???c, ph???i x??t ?????n th??? t??? tr?????c sau gi???a c??c m??n h???c (sau khi h???c xong nh???ng m??n h???c ph???i h???c tr?????c m???i ???????c h???c nh???ng m??n li???n sau).
create trigger trg_ins_upd_PHANMON_DK
on GIANGDAY
for insert, update
as
begin
	declare @mamh char(10),
			@mamh_truoc char(10),
			@mamh_gd char(10),
			@malop char(3)
	select @malop = MALOP, @mamh = MAMH
	from inserted
	-- MAMH truoc cua @mamh
	select @mamh_truoc = MAMH_TRUOC
	from DIEUKIEN
	where
		@mamh = MAMH
	-- MAMH giang day
	select @mamh_gd = MAMH
	from GIANGDAY
	where 
		@malop = MALOP
	
	if (@mamh_truoc <> @mamh_gd)
	begin
		print 'Chua duoc day mon nay'
		rollback transaction
	end	
end

-- Cau 24 . Gi??o vi??n ch??? ???????c ph??n c??ng d???y nh???ng m??n thu???c khoa gi??o vi??n ???? ph??? tr??ch.
create trigger trg_ins_upd_PHANCONGMONTHUOCKHOA
on GIANGDAY
for insert, update
as
begin
	declare	@makhoa_mon varchar(4), 
			@makhoa_gv varchar(4)

	select @makhoa_mon = mon.MAKHOA, @makhoa_gv = gv.MAKHOA
	from inserted i, MONHOC mon, GIAOVIEN gv
	where	
		i.MAMH = mon.MAMH 
		and i.MAGV = gv.MAGV

	if(@makhoa_mon <> @makhoa_gv)
	begin
		print 'Giao vien khong duoc day mon nay'
		rollback transaction
	end
end
