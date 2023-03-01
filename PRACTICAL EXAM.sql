--2--
create table Customer(
CustomerId int primary key,
Name nvarchar(50) not null,
City nvarchar(50) not null,
Country nvarchar(50) not null,
Phone nvarchar(15) not null,
Email nvarchar(50) not null,
);
create table CustomerAccount(
AccountNumber char(9) primary key,
CustomerId int foreign key references Customer(CustomerId),
Balance money,
MinAccount money not null,
);
create table CustomerTransaction(
TransactionId int primary key,
AccountNumber char(9) not null foreign key references CustomerAccount(AccountNumber),
TranssactionDate smalldatetime not null,
Amount money not null,
DepositorWithdraw bit not null,
);

--3--
insert into Customer(CustomerId,Name,City,Country,Phone,Email) values 
(1,'Nguyen Van Tuan','Ha Noi','Viet Nam', '84384695214','nguyenvantuan@gmail.com'),
(2,'Nguyen Thi Ben','Ha Tay','Viet Nam', '84384695361','nguyenBen@gmail.com'),
(3,'Ngo Dinh Nam','Da Nang','Viet Nam', '84398451262','ngodinhnam@gmail.com');
insert into CustomerAccount(AccountNumber,CustomerId,Balance,MinAccount) values
('123456789',1,1000000,50),
('234567891',2,600000,50),
('345678912',3,850000,50);
insert into CustomerTransaction(TransactionId,AccountNumber,TranssactionDate,Amount,DepositorWithdraw) values
(1,'123456789','2008-09-04',4000,0),
(2,'234567891','2009-05-07',2000,1),
(3,'345678912','2009-08-11',1500,0);
--4--
select * from Customer where City = 'Ha Noi';
--5--
select A.Name,A.Phone,A.Email,B.AccountNumber,B.Balance from Customer A
 left join CustomerAccount B
 on A.CustomerId= B.CustomerId;
 --6--
