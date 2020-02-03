create database QuanLyCyber;

use QuanLyCyber;
create table phong(
	so_phong int not null unique,
	tang int not null,
	loai_phong varchar(255) not null unique,
	primary key(so_phong)
);

use QuanLyCyber;
create table dich_vu(
	id_dichvu varchar(25) not null unique,
	ten_mon varchar(25) not null unique,
	gia decimal(12,3),
	primary key(id_dichvu)
);

use QuanLyCyber;
create table cau_hinh(
	ma_cau_hinh varchar(25) not null unique,
	chip varchar(25),
	ram int,
	card varchar(25),
	monitor_inch int, 
	primary key(ma_cau_hinh)
);


use QuanLyCyber;
create table may_tinh(
	so_may int not null unique,
	ma_cau_hinh varchar(25) not null,
	phong int not null,
	primary key(so_may),
	foreign key(ma_cau_hinh) references cau_hinh(ma_cau_hinh)
);

use QuanLyCyber;
create table taikhoan(
	id_taikhoan varchar(25) not null unique,
    ten_nguoi_dung varchar(25) not null unique,
    tien_con_lai decimal(12,3) not null,
    trang_thai varchar(25) not null,
    so_may int,
    so_phong int,
    id_dichvu varchar(25),
    primary key(id_taikhoan),
    foreign key (so_may) references may_tinh(so_may),
	foreign key (id_dichvu) references dich_vu(id_dichvu)
); 

/* Cài đặt chế độ event update giá trị tiền và thời gian còn lại của người dùng tương ứng với giá máy mà người dùng sử dụng */
SET GLOBAL event_scheduler = off;
SET GLOBAL event_scheduler = on; -- enable event scheduler.
SELECT @@event_scheduler;  -- check whether event scheduler is ON/OFF

drop event IF EXISTS update_data;
DELIMITER $$
CREATE EVENT update_data  
ON SCHEDULE
EVERY 1 second  
DO
begin
/* Khai báo giá tiền tương ứng máy trong trường hợp thay đổi giá trong bảng cau_hinh */
	DECLARE gia_gaming_1 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-01");  
	DECLARE gia_gaming_2 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-02");  
	DECLARE gia_gaming_3 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-03");  
	DECLARE gia_gaming_4 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-04");  
	DECLARE gia_artwork_1 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "art-work-01");  
	DECLARE gia_artwork_2 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "art-work-02"); 
	DECLARE gia_ps4 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "ps4");  

/* update số tiền còn lại trong tài khoản người dùng */
	UPDATE quanlycyber.taikhoan set so_tien =  so_tien - (gia_gaming_1/3600) where trang_thai = 'active' and (so_may between 1 and 10);
    update quanlycyber.taikhoan set so_tien =  so_tien - (gia_gaming_2/3600) where trang_thai = 'active' and (so_may between 11 and 20);
	update quanlycyber.taikhoan set so_tien =  so_tien - (gia_gaming_3/3600) where trang_thai = 'active' and (so_may between 21 and 25);
	update quanlycyber.taikhoan set so_tien =  so_tien - (gia_gaming_4/3600) where trang_thai = 'active' and (so_may between 26 and 36);
	update quanlycyber.taikhoan set so_tien =  so_tien - (gia_artwork_1/3600) where trang_thai = 'active' and (so_may between 31 and 35);
    update quanlycyber.taikhoan set so_tien =  so_tien - (gia_artwork_2/3600) where trang_thai = 'active' and (so_may between 36 and 40);
    update quanlycyber.taikhoan set so_tien =  so_tien - (gia_ps4/3600) where trang_thai = 'active' and (so_may between 41 and 53);
/* update thời gian sử dụng còn lại của người dùng */
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_gaming_1)  where trang_thai = 'active' and (so_may between 1 and 10);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_gaming_2) where trang_thai = 'active' and (so_may between 11 and 20);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_gaming_3) where trang_thai = 'active' and (so_may between 21 and 25);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_gaming_4) where trang_thai = 'active' and (so_may between 26 and 36);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_artwork_1) where trang_thai = 'active' and (so_may between 31 and 35);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_artwork_2) where trang_thai = 'active' and (so_may between 36 and 40);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/gia_ps4) where trang_thai = 'active' and (so_may between 41 and 53);
/* Thay đổi trạng thái sử dụng trong trường hợp hết thời gian hoặc ngừng sử dụng */

END $$
DELIMITER ;

drop event IF EXISTS update_status;
DELIMITER $$
CREATE EVENT update_status  
ON SCHEDULE
EVERY 2 second  
DO
begin 
/* update trạng thái tài khoản khi logout hoặc hết tiền trong tài khoản */
	update quanlycyber.taikhoan set so_may = NULL where trang_thai = 'not active';
	update quanlycyber.taikhoan set trang_thai = "not active" where trang_thai = 'active' and thoi_gian_con = "00:00:00" and so_tien < 5.555;
END $$
DELIMITER ;

    

