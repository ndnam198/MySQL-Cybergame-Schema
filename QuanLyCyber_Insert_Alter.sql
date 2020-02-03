/* Xem khai báo table */
show create table cau_hinh;
show create table may_tinh;
show create table temp_table;
/* Add foreign key */
ALTER TABLE quanlycyber.may_tinh
ADD FOREIGN KEY (so_phong) REFERENCES phong(so_phong);

/* drop constraint unique*/
use QuanLyCyber; 
alter table phong
drop index loai_phong;

/* Thay đổi kiểu dữ liệu của một cột */
ALTER TABLE quanlycyber.taikhoan MODIFY so_tien decimal(10,3) unsigned;
alter table quanlycyber.dich_vu modify gia decimal(10,3);
alter table quanlycyber.taikhoan modify id_taikhoan int auto_increment;
alter table quanlycyber.cau_hinh modify gia_tien_VND_h decimal(10,3);

/* Đổi tên cột */
ALTER TABLE quanlycyber.taikhoan RENAME COLUMN tien_con_lai TO so_tien ; 
alter table quanlycyber.cau_hinh rename column gia_tien to gia_tien_VND_h;
alter table quanlycyber.may_tinh rename column phong to so_phong;

/* Đặt lại giá trị default của một cột */
ALTER TABLE quanlycyber.taikhoan MODIFY COLUMN trang_thai VARCHAR(25) NOT NULL DEFAULT 'not active';
ALTER TABLE quanlycyber.taikhoan MODIFY COLUMN so_tien decimal(10,3) unsigned NOT NULL DEFAULT 0;
ALTER TABLE quanlycyber.taikhoan MODIFY COLUMN thoi_gian_con time NOT NULL DEFAULT "00:00:00";
/* Thêm cột  */
use QuanLyCyber; 
ALTER TABLE dich_vu
ADD COLUMN loai_mon VARCHAR(25) after id_dichvu;

alter table quanlycyber.cau_hinh
add column gia_tien int after monitor_inch;

alter table quanlycyber.taikhoan
add column thoi_gian_con time after so_tien;

alter table quanlycyber.taikhoan
add column gia_tien_VND_h decimal(10,3) references cau_hinh(gia_tien_VND_h) after so_may;
        
alter table quanlycyber.taikhoan
add column time_stamp TIMESTAMP not null default current_timestamp on update current_timestamp after id_dichvu;

/* Thêm điều kiện check */
ALTER TABLE quanlycyber.taikhoan
ADD CHECK (so_tien >= 0);
ALTER TABLE quanlycyber.taikhoan
ADD CHECK (so_may between 1 and 53);

/* Xóa */
ALTER TABLE taikhoan
DROP FOREIGN KEY taikhoan_ibfk_2;
ALTER TABLE taikhoan DROP COLUMN gia_tien_VND_h;

SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;