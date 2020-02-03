select * from QuanLyCyber.phong;
select * from QuanLyCyber.dich_vu;
select * from QuanLyCyber.cau_hinh;
select * from QuanLyCyber.may_tinh;
select * from QuanLyCyber.taikhoan;

/* Kết hợp kết quả tra cứu = union, phép hợp theo một cột */
select so_may
from taikhoan
union 
select so_may
from may_tinh;

/* Tạo tài khoản mới - Cập nhật dữ liệu tài khoản: Tạo mới tài khoản, Nạp tiền, Đăng nhập, Đăng xuất, Món ăn */
insert into taikhoan(ten_nguoi_dung, so_tien, trang_thai, so_may) 
values ("huyaltium", 30000, "active", 17);

insert into quanlycyber.taikhoan(ten_nguoi_dung, so_tien, trang_thai) 
values ("hoangbach", 16000, "not active");

UPDATE quanlycyber.taikhoan 
SET 
    trang_thai = 'active',
    -- so_tien = so_tien + 10000,
    so_may = 44,
	id_dichvu = 'dv_023'
WHERE
    ten_nguoi_dung = 'huyviet11';
    
update quanlycyber.taikhoan
set 
	trang_thai = 'not active'	/* tài khoảng ngắt kết nối */
where 
	ten_nguoi_dung = "trungbk";

update quanlycyber.taikhoan
set 
	id_dichvu = "dv_004"
where 
	ten_nguoi_dung = "huyhoang98" and trang_thai = 'active';
    
/* Tìm kiếm một giá trị cụ thế - Tra cứu giá máy của một khách hàng bất kì đang sử dụng */
select gia_tien_VND_h from cau_hinh
	where ma_cau_hinh = (select ma_cau_hinh from may_tinh where so_may = (select so_may from taikhoan where ten_nguoi_dung = 'minhvuong69'));

/* Tìm kiếm phòng người sử dụng đang ngồi */
select so_phong 
	from may_tinh
		where may_tinh.so_may = (select so_may from taikhoan where taikhoan.ten_nguoi_dung = "minhvuong69");
    
/* Tìm kiếm và sắp xếp số dư trong tài khoản của khách hàng */
select taikhoan.ten_nguoi_dung, taikhoan.so_tien
	from taikhoan
		order by so_tien DESC;

/* Tìm kiếm nhiều cột - Tạo bảng dữ liệu bao gồm tên tài khoảng, 
số tiền trong tài khoảng, thời gian còn lại và giá tiền với máy 
tính tương ứng - Tìm kiếm những khách hàng đang active */
select taikhoan.ten_nguoi_dung ,taikhoan.so_tien as "budget", taikhoan.thoi_gian_con as "time_remain" ,cau_hinh.gia_tien_VND_h as "price_per_hour"
	from  taikhoan, cau_hinh, may_tinh
		where taikhoan.so_may = may_tinh.so_may and may_tinh.ma_cau_hinh = cau_hinh.ma_cau_hinh;

SELECT taikhoan.ten_nguoi_dung, taikhoan.so_tien, taikhoan.thoi_gian_con, taikhoan.so_may, may_tinh.so_phong, cau_hinh.ma_cau_hinh, cau_hinh.gia_tien_VND_h
FROM
    taikhoan
INNER JOIN may_tinh, cau_hinh
    where taikhoan.so_may = may_tinh.so_may and may_tinh.ma_cau_hinh = cau_hinh.ma_cau_hinh;

/* tìm kiếm những khách hàng không active */
select  taikhoan.ten_nguoi_dung, taikhoan.time_stamp as last_time_access
	from  taikhoan
		where taikhoan.trang_thai = 'not active';

/* Tra cứu lần cuối sử dụng của một tài khoản  */
select time_stamp from quanlycyber.taikhoan where ten_nguoi_dung = "binhminh2k";
 
/* Xóa tài khoản hết tiền lâu không hoạt động (30 ngày)*/
delete from quanlycyber.taikhoan where id_taikhoan between 5 and 10; 


/* Tìm kiếm nhiều cột - Tìm đơn hàng order dịch vụ của người dùng */
select taikhoan.ten_nguoi_dung, taikhoan.so_may, may_tinh.so_phong, dich_vu.ten_mon
	from taikhoan
inner join may_tinh, dich_vu
	where taikhoan.id_dichvu = dich_vu.id_dichvu and  trang_thai = 'active' and taikhoan.so_may = may_tinh.so_may;

/* Tra cứu cấu hình máy tính của một máy bất kì và phòng chứ máy tính đó */
select may_tinh.so_may, cau_hinh.chip, cau_hinh.ram, cau_hinh.card, cau_hinh.monitor_inch, cau_hinh.gia_tien_VND_h as 'price_per_hour', may_tinh.so_phong, phong.tang
from may_tinh, phong, cau_hinh
where may_tinh.so_phong = phong.so_phong and may_tinh.ma_cau_hinh = cau_hinh.ma_cau_hinh;

/* Tra cứu số máy và vị trí trong tầm giá mong muốn */
select may_tinh.so_may , may_tinh.so_phong, phong.tang, cau_hinh.gia_tien_VND_h as 'price_per_hour'
from may_tinh, phong, cau_hinh 
where may_tinh.so_phong = phong.so_phong and may_tinh.ma_cau_hinh = cau_hinh.ma_cau_hinh and cau_hinh.gia_tien_VND_h between 5000 and 7000;

/* Tra cứu máy tính có màn hình >25 inch  */
select may_tinh.so_may , may_tinh.so_phong, phong.tang, cau_hinh.monitor_inch, may_tinh.ma_cau_hinh
from may_tinh, phong, cau_hinh 
where may_tinh.so_phong = phong.so_phong and may_tinh.ma_cau_hinh = cau_hinh.ma_cau_hinh and cau_hinh.monitor_inch >23;

/* Tìm phòng theo yêu cầu -no smoking-điều hòa-  */
select phong.so_phong, phong.tang, phong.loai_phong 
from phong 
where loai_phong like '%no smoking%';