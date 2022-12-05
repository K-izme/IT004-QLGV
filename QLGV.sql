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
-- CAU 1. Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN ADD GHICHU varchar(40)
ALTER TABLE HOCVIEN ADD XEPLOAI char(2)
ALTER TABLE HOCVIEN ADD DIEMTB numeric(4,2)

-- CAU 2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_MAHV 
CHECK(SUBSTRING(MAHV,1 ,3) = MALOP AND ISNUMERIC(SUBSTRING(MAHV, 4, 2)) = 1)
-- CAU 3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_GIOITINHHV 
CHECK(GIOITINH IN('Nam', 'Nu'))
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_GIOITINHGV 
CHECK(GIOITINH IN('Nam', 'Nu'))
-- Cau 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_KQTHI 
CHECK( DIEM BETWEEN 0 AND 10 AND RIGHT(CAST(DIEM AS varchar), 3) LIKE '.__')
-- Cau 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_KETQUA 
CHECK((KQUA = 'Dat' AND DIEM BETWEEN 5 AND 10) OR (KQUA = 'Khong dat' AND DIEM < 5))
-- Cau 6. Học viên thi một môn tối đa 3 lần.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CHECK_LANTHI CHECK(LANTHI <= 3)
-- Cau 7. Học kỳ chỉ có giá trị từ 1 đến 3.
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CHECK_HOCKY CHECK(HOCKY BETWEEN 1 AND 3)
--  Cau 8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))

--Tuan 2 Phan 1 Cau 11 - 14
--Cau 11. Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CHECK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 18)
--Cau 12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CHECK_NGAYDAY CHECK (TUNGAY < DENNGAY)
--Cau 13. Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CHECK_TUOIGIAOVIEN CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 22)
--Cau 14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 5.
ALTER TABLE MONHOC 
ADD CONSTRAINT CHECK_TINCHI CHECK (TCLT - TCLT <=5)

--Tuan 2 Phan 3 Cau 1 - 5
--Cau 1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT HOCVIEN.MAHV,(HO +' '+ TEN) HOTEN, NGSINH, LOP.MALOP 
FROM HOCVIEN, LOP 
WHERE HOCVIEN.MAHV = LOP.TRGLOP
--Cau 2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, LANTHI, DIEM 
FROM KETQUATHI, HOCVIEN  
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND MAMH = 'CTRR' AND MALOP = 'K12' 
ORDER BY HO, TEN
--Cau 3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT distinct HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, TENMH 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND LANTHI = 1 AND KQUA = 'Dat'
--Cau 4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT HOCVIEN.MAHV,(HO+' '+TEN) HOTEN, TENMH 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND KETQUATHI.MAMH = MONHOC.MAMH
	AND LANTHI = 1 
	AND KQUA = 'Khong Dat' 
	AND TENMH = 'CTRR'
--Cau 5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT HOCVIEN.MAHV, (HO + ' '+ TEN) HOTEN 
FROM HOCVIEN, KETQUATHI, MONHOC 
WHERE 
	KETQUATHI.MAHV = HOCVIEN.MAHV 
	AND MALOP LIKE'K%' 
	AND TENMH = 'CTRR' 
	AND KQUA = 'Khong Dat'

-- Tuan 3
-- Phan 2 cau 1 - 4
-- Cau 1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN
SET HESO = HESO + 0.2 
WHERE 
	MAGV IN (SELECT TRGKHOA FROM KHOA)
-- Cau 2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
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
-- Cau 3.Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm. 
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
-- Cau 4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
		--o Nếu DIEMTB  9 thì XEPLOAI =”XS”
		--o Nếu 8  DIEMTB < 9 thì XEPLOAI = “G”
		--o Nếu 6.5  DIEMTB < 8 thì XEPLOAI = “K”
		--o Nếu 5  DIEMTB < 6.5 thì XEPLOAI = “TB”
		--o Nếu DIEMTB < 5 thì XEPLOAI = ”Y”
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
-- Cau 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT TENMH 
FROM GIANGDAY, GIAOVIEN, MONHOC 
WHERE 
	GIANGDAY.MAGV = GIAOVIEN.MAGV 
	AND MONHOC.MAMH = GIANGDAY.MAMH 
	AND GIAOVIEN.HOTEN = 'Tran Thanh Tam' 
	AND HOCKY = 1 
	AND NAM = 2006
-- Cau 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT MONHOC.MAMH, TENMH 
FROM MONHOC, LOP, GIANGDAY
WHERE 
	MAGV IN (SELECT MAGVCN FROM LOP) 
	AND GIANGDAY.MALOP = 'K11' 
	AND HOCKY = 1 
	AND NAM =2006
-- Cau 8.Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT (HO+' '+TEN) HOTEN 
FROM LOP, GIAOVIEN, GIANGDAY, MONHOC, HOCVIEN
WHERE 
	LOP.MALOP = GIANGDAY.MALOP 
	AND LOP.TRGLOP = HOCVIEN.MAHV
	AND GIANGDAY.MAMH = MONHOC.MAMH
	AND GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIAOVIEN.HOTEN = 'Nguyen To Lan'
	AND MONHOC.TENMH = 'Co So Du Lieu'
-- Cau 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT MONHOC.MAMH, TENMH 
FROM MONHOC JOIN DIEUKIEN ON MONHOC.MAMH=DIEUKIEN.MAMH_TRUOC
WHERE DIEUKIEN.MAMH =
	  (
	  SELECT MAMH
	  FROM MONHOC
	  WHERE TENMH = 'Co So Du Lieu'
	  )
-- Cau 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT MONHOC.MAMH, TENMH 
FROM DIEUKIEN, MONHOC
WHERE 
	MONHOC.MAMH = DIEUKIEN.MAMH_TRUOC
	AND DIEUKIEN.MAMH = MONHOC.MAMH
	AND MONHOC.TENMH = 'Co So Du Lieu'
-- Phan 3 cau 11 -- 18
-- Cau 11.Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT HOTEN 
FROM GIAOVIEN, GIANGDAY
WHERE 
	GIANGDAY.MAGV = GIAOVIEN.MAGV
	AND GIANGDAY.MALOP = 'K11' 
	AND GIANGDAY.MALOP = 'K12'
	AND HOCKY = 1 
	AND NAM = 2006
-- Cau 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
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

-- Cau 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE MAGV NOT IN (
	SELECT MAGV 
	FROM GIANGDAY
	)

-- Cau 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
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

-- Cau 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
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

-- Câu 16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT HOTEN
FROM GIAOVIEN, GIANGDAY
WHERE
	GIAOVIEN.MAGV = GIANGDAY.MAGV
	AND MAMH = 'CTRR'
GROUP BY GIAOVIEN.MAGV, HOTEN, HOCKY
HAVING COUNT(*) >= 2

-- Câu 17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HOCVIEN.*, DIEM AS 'Điểm thi CSDL sau cùng'
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

-- Câu 18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT HOCVIEN.*, DIEM AS 'Điểm thi CSDL cao nhất'
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
-- Cau 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
select MAKHOA, TENKHOA
from KHOA
where NGTLAP <= all(
	select NGTLAP
	from KHOA
)
-- Cau 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
select count(*)
from GIAOVIEN
where 
	HOCHAM in ('GS', 'PGS')
-- Cau 21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
select MAKHOA, HOCVI, count(*)
from GIAOVIEN
group by MAKHOA, HOCVI
order by MAKHOA
-- Cau 22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
select MAMH, KQUA, count(*)
from KETQUATHI
group by MAMH, KQUA
order by MAMH
-- Cau 23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
select GIAOVIEN.MAGV, HOTEN
from GIAOVIEN JOIN LOP ON GIAOVIEN.MAGV = LOP.MAGVCN, GIANGDAY
where 
	GIANGDAY.MALOP = LOP.MALOP
	and GIANGDAY.MAGV = GIAOVIEN.MAGV
-- Cau 24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
select HO +' '+ TEN as 'Họ tên lớp trưởng lớp có sĩ số lớn nhất'
from HOCVIEN, LOP
where 
	HOCVIEN.MAHV = LOP.TRGLOP
	and SISO >= all(
		select siso 
		from LOP
	)
-- Cau 25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
select HO+' '+TEN
from HOCVIEN, LOP, KETQUATHI
where
	HOCVIEN.MAHV = LOP.TRGLOP
	and HOCVIEN.MAHV = KETQUATHI.MAHV
	and KQUA = 'Khong Dat'
group by TRGLOP, HO, TEN
having count(*) > 3

-- Cau 26 - 35
-- Cau 26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
select top 1 with ties HOCVIEN.MAHV, (HO+' '+TEN) as HOTEN
from HOCVIEN, KETQUATHI
where
	HOCVIEN.MAHV = KETQUATHI.MAHV
	and DIEM >= 9
group by HOCVIEN.MAHV, HO, TEN
order by count(*) desc
-- Cau 27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
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
-- Cau 28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
select HOCKY, NAM, MAGV, count(distinct MAMH) 'Số lượng môn giảng dạy', count(distinct MALOP) 'Số lượng lớp giảng dạy'
from GIANGDAY
group by NAM, HOCKY, MAGV
-- Cau 29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
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
-- Cau 30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
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
-- Cau 31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
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
-- Cau 32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
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
-- Cau 33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
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
-- Cau 34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
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
-- Cau 35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
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
-- Cau 9. Lớp trưởng của một lớp phải là học viên của lớp đó.
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

-- Cau 10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
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

-- Cau 15 . Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
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

-- Cau 16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn
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

-- Cau 17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
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

-- Cau 18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
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
-- Cau 19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
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
-- Cau 20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
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

-- Cau 21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
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

-- Cau 22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
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

-- Cau 23. . Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).
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

-- Cau 24 . Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
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
