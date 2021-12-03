-- Create Database --
create database skilvulbookstore;

-- Go to Database --
use skilvulbookstore;

-- Create Tabel penerbit, penulis, buku --
create table penerbit (
	id int(10) not null auto_increment primary key,
	nama varchar(50),
	kota varchar(50)
);

create table penulis (
	id int(10) not null auto_increment primary key,
	nama varchar(50),
	kota varchar(50)
);

create table buku (
	id int not null auto_increment primary key,
	isbn varchar(50),
	judul varchar(50),
	penulis int(10),
	penerbit int(10),
	harga int(10),
	stock int(10)
);

-- Make Relation at buku and penerbit --
alter table buku
	add constraint fk_penerbit
	foreign key (penerbit) references penerbit(id);
	
-- Make Relation at buku and penulis --
alter table buku
	add constraint fk_penulis
	foreign key (penulis) references penulis(id);
	
-- Insert Value on penerbit --
insert into penerbit (nama, kota)
values	('Penerbit 1', 'Balikpapan'),
		('Penerbit 2', 'Batu Licin'),
		('Penerbit 3', 'Batam');
	
-- Insert Value on penulis --
insert into penulis (nama, kota)
values	('Andre Bapakau', 'Sorong'),
		('Asep', 'Cicalengka'),
		('Mustopa Ibrahim', 'Wakanda');
		
-- Insert Value on buku table --
insert into buku (isbn, judul, penulis, penerbit, harga, stock)
values	('978-6969696969', 'Bapakau', 1, 2, 55000, 360),
		('978-9696969696', 'Cewe Tercantik di Kelurahan', 2, 2, 69000, 144),
		('978-5555555555', 'Balonku Meletus Tapi Boong', 3, 1, 96000, 5);
	
-- Do INNER JOIN from buku on penerbit --
select buku.judul, penerbit.nama
from buku
inner join penerbit on buku.id = penerbit.id;

-- Do LEFT JOIN from buku on penerbit --
select buku.judul, buku.stock, penerbit.kota
from buku
left join penerbit on buku.penerbit = penerbit.id;

-- Do RIGHT JOIN from buku on penerbit --
select buku.judul, buku.stock, penerbit.kota
from buku
right join penerbit on buku.penerbit = penerbit.id;

-- Check MAX from Price Column --
select max(harga)
from buku
where stock < 10;

-- Check MIN from Price Column --
select min(harga)
from buku;

-- Use COUNT on Minimum Price Data Under 100000 --
select count(harga)
from buku
where harga < 100000;
