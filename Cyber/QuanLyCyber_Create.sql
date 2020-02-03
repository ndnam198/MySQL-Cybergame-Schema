drop database QuanLyCyber;
create database QuanLyCyber;

use QuanLyCyber;
create table phong(
	so_phong int not null unique,
	tang int not null,
	loai_phong varchar(255) not null,
	primary key(so_phong)
);
show create table phong;


use QuanLyCyber;
create table dich_vu(
	id_dichvu varchar(25) not null unique,
    loai_mon varchar(25),
	ten_mon varchar(25) not null unique,
	gia decimal(12,3) unsigned,
	primary key(id_dichvu)
);
show create table dich_vu;


use QuanLyCyber;
create table cau_hinh(
	ma_cau_hinh varchar(25) not null unique,
	chip varchar(25),
	ram int,
	card varchar(25),
	monitor_inch int, 
	gia_tien_VND_h decimal(10,3),
	primary key(ma_cau_hinh)
);
show create table cau_hinh;


use QuanLyCyber;
create table may_tinh(
	so_may int not null unique,
	ma_cau_hinh varchar(25) not null,
	so_phong int not null,
	primary key(so_may),
	foreign key(ma_cau_hinh) references cau_hinh(ma_cau_hinh),
    foreign key(so_phong) references phong(so_phong)
);
show create table may_tinh;

use QuanLyCyber;
create table taikhoan(
  id_taikhoan int(11) NOT NULL AUTO_INCREMENT unique,
  ten_nguoi_dung varchar(25) NOT NULL unique,
  so_tien decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  thoi_gian_con time NOT NULL DEFAULT '00:00:00',
  trang_thai varchar(25) NOT NULL DEFAULT 'not active',
  so_may int(11) DEFAULT NULL ,
  id_dichvu varchar(25) DEFAULT NULL,
  time_stamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_taikhoan),
  foreign key(so_may) references may_tinh(so_may),
  foreign key(id_dichvu) references dich_vu(id_dichvu),
  CONSTRAINT `taikhoan_chk_1` CHECK ((so_may between 1 and 53))
); 
show create table taikhoan;

/* Cài đặt chế độ event update giá trị tiền và thời gian còn lại của người dùng tương ứng với giá máy mà người dùng sử dụng */
SET GLOBAL event_scheduler = off;
SET GLOBAL event_scheduler = on; -- enable event scheduler.
SELECT @@event_scheduler;  -- check whether event scheduler is ON/OFF

drop event IF EXISTS update_data;
DELIMITER $$
CREATE EVENT update_data  
ON SCHEDULE
EVERY 3 second  
DO
begin
/* Khai báo giá tiền tương ứng máy trong trường hợp thay đổi giá trong bảng cau_hinh 
	DECLARE gia_gaming_1 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-01");  
	DECLARE gia_gaming_2 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-02");  
	DECLARE gia_gaming_3 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-03");  
	DECLARE gia_gaming_4 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "gaming-04");  
	DECLARE gia_artwork_1 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "art-work-01");  
	DECLARE gia_artwork_2 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "art-work-02"); 
	DECLARE gia_ps4 decimal(10,3) default (select gia_tien_VND_h from cau_hinh where ma_cau_hinh = "ps4");  
*/
	declare update_time decimal(10,3) default 1200;
/* update số tiền còn lại trong tài khoản người dùng */
	UPDATE quanlycyber.taikhoan set so_tien =  so_tien - (5000/update_time) where trang_thai = 'active' and (so_may between 1 and 10);
    update quanlycyber.taikhoan set so_tien =  so_tien - (6000/update_time) where trang_thai = 'active' and (so_may between 11 and 20);
	update quanlycyber.taikhoan set so_tien =  so_tien - (6500/update_time) where trang_thai = 'active' and (so_may between 21 and 25);
	update quanlycyber.taikhoan set so_tien =  so_tien - (7000/update_time) where trang_thai = 'active' and (so_may between 26 and 36);
	update quanlycyber.taikhoan set so_tien =  so_tien - (10000/update_time) where trang_thai = 'active' and (so_may between 31 and 35);
    update quanlycyber.taikhoan set so_tien =  so_tien - (15000/update_time) where trang_thai = 'active' and (so_may between 36 and 40);
    update quanlycyber.taikhoan set so_tien =  so_tien - (20000/update_time) where trang_thai = 'active' and (so_may between 41 and 53);
/* update thời gian sử dụng còn lại của người dùng */
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/5000)  where trang_thai = 'active' and (so_may between 1 and 10);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/6000) where trang_thai = 'active' and (so_may between 11 and 20);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/6500) where trang_thai = 'active' and (so_may between 21 and 25);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/7000) where trang_thai = 'active' and (so_may between 26 and 36);
	UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/10000) where trang_thai = 'active' and (so_may between 31 and 35);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/15000) where trang_thai = 'active' and (so_may between 36 and 40);
    UPDATE quanlycyber.taikhoan set thoi_gian_con = sec_to_time(3600*so_tien/20000) where trang_thai = 'active' and (so_may between 41 and 53);
/* Thay đổi trạng thái sử dụng trong trường hợp hết thời gian hoặc ngừng sử dụng */

END $$
DELIMITER ;

drop event IF EXISTS update_status;
DELIMITER $$
CREATE EVENT update_status  
ON SCHEDULE
EVERY 10 second  
DO
begin 
/* update trạng thái tài khoản khi logout hoặc hết tiền trong tài khoản */
	update quanlycyber.taikhoan set so_may = NULL where trang_thai = 'not active';
	update quanlycyber.taikhoan set trang_thai = "not active" where trang_thai = 'active' and (thoi_gian_con = "00:00:00" or so_tien < 5.555);
    update quanlycyber.taikhoan set thoi_gian_con = "00:00:00" where trang_thai = 'not active';
    update quanlycyber.taikhoan set so_tien = 0 where thoi_gian_con = "00:00:00";
    update quanlycyber.taikhoan set id_dichvu = NULL where trang_thai ='not active';
END $$
DELIMITER ;

SHOW PROCESSLIST;
