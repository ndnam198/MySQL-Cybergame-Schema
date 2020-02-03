SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;
SET foreign_key_checks = 1;
SET SQL_SAFE_UPDATES = 1;


/* Xem toàn bộ bảng */ 
select * from QuanlyCyber_Ver4.taikhoan;
select * from QuanlyCyber_Ver4.cauhinh;
select * from QuanlyCyber_Ver4.coso;
select * from QuanlyCyber_Ver4.dichvu;
select * from QuanlyCyber_Ver4.may;
select * from QuanlyCyber_Ver4.phong;
select * from QuanlyCyber_Ver4.thongtinkhachhang;

/* Tìm toàn bộ IDM máy có cấu hình tương ứng */
select IDM from MAY where IDCH = 'gaming-01';
select IDM from MAY where IDCH = 'gaming-02';
select IDM from MAY where IDCH = 'gaming-03';
select IDM from MAY where IDCH = 'gaming-04';
select IDM from MAY where IDCH = 'art-work-01';
select IDM from MAY where IDCH = 'art-work-02';
select IDM from MAY where IDCH = 'art-work-03';
select IDM from MAY where IDCH = 'art-work-04';
select IDM from MAY where IDCH = 'ps4';

/* Tìm kiếm tên khách hàng, tài khoản đứng tên, trạng thái sử dụng, id máy đang sử dụng*/
select thongtinkhachhang.TenKhachHang, taikhoan.TenTaiKhoan, taikhoan.TrangThai, taikhoan.IDM  from thongtinkhachhang, taikhoan
where thongtinkhachhang.TenTaiKhoan = taikhoan.TenTaiKhoan;

/* Tìm kiếm dịch vụ và giá dịch vụ dựa trên order của khách hàng và truy xuất vị trí cần phục vụ */
select dichvu.TenMon, dichvu.DonGia, taikhoan.IDM  from dichvu,taikhoan
where  (dichvu.IDDV = taikhoan.IDDV) and (taikhoan.TrangThai = 'active');

/* TÌm vị trí một máy trong hệ thống cyber */
select may.TenCoSo, coso.DiaChi, may.IDM, phong.Tang from coso, may, phong 
where coso.TenCoSo = phong.TenCoSo and  phong.TenCoSo= may.TenCoSo and may.IDP = phong.IDP
order by  may.IDM desc;

/* Truy xuất vị trí của một tài khoản đang active, thời gian còn lại */
select may.TenCoSo, coso.DiaChi, may.IDM, phong.Tang, taikhoan.TrangThai, taikhoan.TenTaiKhoan, taikhoan.ThoiGianConLai from taikhoan, phong,may,coso
where taikhoan.TrangThai ='active' and taikhoan.IDM = may.IDM and may.IDP = phong.IDP and may.TenCoSo = coso.TenCoSo and phong.TenCoSo = may.TenCoSo
order by ThoiGianConLai desc;

UPDATE QuanlyCyber_Ver4.taikhoan 
SET 
    TrangThai = 'active',
    SoTienConLai = SoTienConLai + 100,
    IDM = 41
	-- IDDV = 'dv_02'
WHERE
    TenTaiKhoan = 'thanh123';
    
