--1--
create table khachhang(
makh varchar(255) primary key,
tenkh nvarchar(255) not null,
scmt varchar(12) not null,
diachi nvarchar(255)
);
create table dkthuebao(
makh varchar(255) not null foreign key references khachhang(makh),
sothuebao varchar(11) primary key,
loaithuebao nvarchar(255) not null,
ngaydk datetime not null check (ngaydk <= getdate()),

);

--2--
insert into khachhang(makh,tenkh,scmt,diachi) 
values('KH01',N'Nguyễn Nguyệt Nga','123456789',N'Hà Nội');

insert into  dkthuebao(makh,sothuebao,loaithuebao,ngaydk)
values ('KH01','0123456789',N'Trả trước','2002/12/12');

--3--
insert into khachhang(makh,tenkh,scmt,diachi) 
values('KH02',N'Trương Văn Nhu','123456798',N'Hà Nội');

insert into  dkthuebao(makh,sothuebao,loaithuebao,ngaydk)
values ('KH02','0387445526',N'Trả trước','2005/12/09');

--4--
--a--
select *from khachhang;
--b--
select *from dkthuebao;

--5--
--a--
select A.makh,A.tenkh,A.scmt,A.diachi from khachhang A
inner join dkthuebao B on A.makh=B.makh where sothuebao = '0123456789'; 
--b--
select *from khachhang where scmt = '123456789';
--c--
select B.tenkh,A.sothuebao from dkthuebao A
inner join khachhang B on A.makh=B.makh where scmt = '123456789';
--d--
select * from dkthuebao where ngaydk = '2009/12/12';
--e--
select A.diachi,B.sothuebao from khachhang A
inner join dkthuebao B on A.makh=B.makh where diachi=N'Hà Nội';

--6--
--a--
select count(makh) as N'Số lượng khách' from khachhang;
--b--
select count(sothuebao) as N'tong Số thue bao' from dkthuebao;
--c--
select count(sothuebao) as N'tong Số thue bao' from dkthuebao where ngaydk ='2009/12/12';
--d--
select *from khachhang A inner join dkthuebao B on A.makh=B.makh; 
--7--
--a--
ALTER TABLE dkthuebao add constraint ngaydk not null ;