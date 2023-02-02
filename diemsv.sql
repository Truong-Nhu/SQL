Câu 1:

create table NHACUNGCAP(
	MaNhaCC varchar(255) primary key,
	TenNhaCC varchar(255) not null unique,
	DiaChi varchar(255) not null,
	SoDT varchar (12) not null unique,
	MaSoThue varchar(50) not null unique,
);
create table LOAIDICHVU(
	MaLoaiDV varchar(255) primary key,
	TenLoaiDV varchar(255) not null unique,
);
create table MUCPHI(
	MaMP varchar(255) primary key,
	DonGia decimal(12,4) not null check (DonGia >= 0),
	MoTa text not null,
);
create table DONGXE(
	DongXe varchar(255) primary key,
	HangXe varchar(255) not null,
	SoChoNgoi int not null check (SoChoNgoi > 1),
);
create table DANGKYCUNGCAP(
	MaDKCC varchar(255) primary key,
	MaNhaCC varchar(255) not null foreign key references NHACUNGCAP(MaNhaCC),
	MaLoaiDV varchar(255) not null foreign key references LOAIDICHVU(MaLoaiDV),
	DongXe varchar(255) not null foreign key references DONGXE(DongXe),
	MaMP varchar(255) not null foreign key references MUCPHI(MaMP),
	NgayBatDauCungCap datetime not null check (NgayBatDauCungCap <= getdate()),	 	 
	NgayKetThucCungCap datetime not null check (NgayKetThucCungCap <= getdate()),
	SoLuongXeDangKy int not null check (SoLuongXeDangKy >0),
);

Câu 2:

insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue)
values('NCC001','Cty TNHH Toan Phap','Hai Chau',05113999888,568941),
('NCC002','Cty TNHH Dong Du','Lien CHieu',05113999889,568942),
('NCC003','Nguyen Van A','Hoa Thuan',05113999890,568943),
('NCC004','Cty Co phan Toan Cau Xanh','Hai Chau',05113999891,568944),
('NCC005','Cty TNHH AMA','Thanh Khe',05113999892,568945),
('NCC006','Ba Bich Van','Lien Chieu',05113999893,568946),
('NCC007','Cty TNHH Phan Thanh','Thanh Khe',05113999894,568947),
('NCC008','Ong Phan Dinh Nam','Hoa Thuan',05113999895,568948),
('NCC009','Tap doan TNHH Dong Nam A','Lien Chieu',05113999896,568949),
('NCC010','Cty Co phan Rang Dong','Lien Chieu',05113999854,187864);

select * from NHACUNGCAP;

insert into LOAIDICHVU(MaLoaiDV,TenLoaiDV)
values('DV01','Dich vu xe taxi'),
('DV02','Dich vu xe buyt cong cong theo tuyen co dinh'),
('DV03','Dich vu xe cho thue theo hop dong');

insert into MUCPHI(MaMP,DonGia,MoTa)
values('MP01',10000,'ap dung tu 1/2015'),
('MP02',15000,'ap dung tu 2/2015'),
('MP03',20000,'ap dung tu 1/2010'),
('MP04',25000,'ap dung tu 2/2011');

insert into DONGXE(DongXe,HangXe,SoChoNgoi)
values('Hiace','Toyota',16),
('Vios','Toyota',5),
('Escape','Ford',5),
('Cerato','KIA',7),
('Forte','KIA',5),
('Starex','Huyndai',7),
('Grand-i10','Huyndai',7);

insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values('DK001','NCC001','DV01','Hiace','MP01','2015/11/20','2016/11/20',4);

insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values('DK002','NCC002','DV02','Vios','MP02','2015/11/20','2017/11/20',3),
('DK003','NCC003','DV03','Escape','MP03','2017/11/20','2018/11/20',5),
('DK004','NCC005','DV01','Cerato','MP04','2015/11/20','2019/11/20',7),
('DK005','NCC002','DV02','Forte','MP03','2019/11/20','2020/11/20',1),
('DK006','NCC004','DV03','Starex','MP04','2016/11/10','2016/11/20',2),
('DK007','NCC005','DV01','Cerato','MP03','2015/11/30','2016/01/25',8),
('DK008','NCC006','DV01','Vios','MP02','2016/02/28','2016/08/15',9),
('DK009','NCC005','DV03','Grand-i10','MP02','2016/04/27','2017/04/30',10),
('DK010','NCC006','DV01','Forte','MP02','2015/11/21','2016/02/22',4),
('DK011','NCC007','DV01','Forte','MP01','2016/12/25','2017/02/20',5),
('DK012','NCC007','DV03','Cerato','MP01','2016/04/14','2017/12/20',6),
('DK013','NCC003','DV02','Cerato','MP01','2015/12/21','2016/12/21',8),
('DK014','NCC008','DV02','Cerato','MP01','2016/05/20','2016/12/30',1),
('DK015','NCC003','DV01','Hiace','MP02','2018/04/24','2019/11/20',6),
('DK016','NCC001','DV03','Grand-i10','MP02','2016/06/22','2016/12/21',8),
('DK017','NCC002','DV03','Cerato','MP03','2016/09/30','2019/09/30',4),
('DK018','NCC006','DV03','Escape','MP04','2017/12/13','2018/09/30',2),
('DK019','NCC003','DV03','Escape','MP03','2016/01/24','2016/12/30',8),
('DK020','NCC002','DV03','Cerato','MP04','2016/05/03','2017/10/21',7),
('DK021','NCC006','DV01','Forte','MP02','2015/01/30','2016/12/30',9),
('DK022','NCC002','DV02','Cerato','MP04','2016/07/25','2017/12/30',6),
('DK023','NCC002','DV01','Forte','MP03','2017/11/30','2018/05/20',5),
('DK024','NCC003','DV03','Forte','MP04','2017/12/23','2019/11/30',8),
('DK025','NCC003','DV03','Hiace','MP02','2016/08/24','2017/10/25',1);

Câu 3:

SELECT *from DONGXE WHERE SoChoNgoi > 5;
--Cau 4: 

SELECT *from NhaCungCap WHERE MaNhaCC IN (
	SELECT DISTINCT MaNhaCC from DangKyCungCap WHERE (DongXe IN (
		SELECT DongXe FROM DongXe WHERE HangXe = 'Toyota') AND MaMP IN (
		SELECT MaMP FROM DangKyCungCap WHERE MaMP = 'MP02')) OR ( DongXe IN (
		SELECT DongXe FROM DongXe WHERE HangXe = 'KIA') AND MaMP IN (
		SELECT MaMP FROM DangKyCungCap WHERE MaMP = 'MP03')));
--cau 5:

select * from NHACUNGCAP order by TenNhaCC asc, MaSoThue desc
--cau 6:
SELECT *
FROM NhaCungCap
JOIN (
	SELECT MaNhaCC, COUNT(MaDKCC) AS SoLanDangKy
	FROM DangKyCungCap
	WHERE NgayBatDauCungCap = '2015-11-20'
	GROUP BY MaNhaCC
) sl
	ON NhaCungCap.MaNhaCC = sl.MaNhaCC;