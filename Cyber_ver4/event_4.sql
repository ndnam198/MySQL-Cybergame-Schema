SET GLOBAL event_scheduler = off;
SET GLOBAL event_scheduler = on; -- enable event scheduler.
SELECT @@event_scheduler;  -- check whether event scheduler is ON/OFF

drop event IF EXISTS update_money_4;
DELIMITER $$
CREATE EVENT update_money_4  
ON SCHEDULE
EVERY 3 second  
DO
begin
/* Khai báo giá tiền tương ứng máy trong trường hợp thay đổi giá trong bảng cauhinh */
	DECLARE gia_gaming_1 decimal(10,3) default (select DonGia from cauhinh where IDCH = "gaming-01");  
	DECLARE gia_gaming_2 decimal(10,3) default (select DonGia from cauhinh where IDCH = "gaming-02");  
	DECLARE gia_gaming_3 decimal(10,3) default (select DonGia from cauhinh where IDCH = "gaming-03");  
	DECLARE gia_gaming_4 decimal(10,3) default (select DonGia from cauhinh where IDCH = "gaming-04");  
	DECLARE gia_artwork_1 decimal(10,3) default (select DonGia from cauhinh where IDCH = "art-work-01");  
	DECLARE gia_artwork_2 decimal(10,3) default (select DonGia from cauhinh where IDCH = "art-work-02"); 
	DECLARE gia_artwork_3 decimal(10,3) default (select DonGia from cauhinh where IDCH = "art-work-03"); 
	DECLARE gia_artwork_4 decimal(10,3) default (select DonGia from cauhinh where IDCH = "art-work-04"); 
	DECLARE gia_ps4 decimal(10,3) default (select DonGia from cauhinh where IDCH = "ps4");  

	declare period decimal(10,3) default 1200;
/* update số tiền còn lại trong tài khoản người dùng */
	UPDATE QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_gaming_1/period) where TrangThai = 'active' and ((IDM between 1 and 5) or (IDM between 77 and 86));
    update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_gaming_2/period) where TrangThai = 'active' and ((IDM between 6 and 10)or (IDM between 29 and 38));
	update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_gaming_3/period) where TrangThai = 'active' and ((IDM between 11 and 14)or (IDM between 39 and 50) or (IDM between 87 and 90));
	update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_gaming_4/period) where TrangThai = 'active' and ((IDM between 15 and 19)or (IDM between 51 and 60) or (IDM between 91 and 95));
	update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_artwork_1/period) where TrangThai = 'active' and (IDM between 96 and 98);
    /*update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_artwork_2/period) where TrangThai = 'active' and (IDM between 36 and 40);*/
    update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_artwork_3/period) where TrangThai = 'active' and (IDM between 61 and 65);
    update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_artwork_4/period) where TrangThai = 'active' and ((IDM between 20 and 24)or (IDM between 66 and 70) or (IDM between 99 and 100));
    update QuanlyCyber_Ver4.taikhoan set SoTienConLai =  SoTienConLai - (gia_ps4/period) where TrangThai = 'active' and ((IDM between 26 and 28)or (IDM between 71 and 76) or (IDM between 101 and 102));

/* update thời gian sử dụng còn lại của người dùng */
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_gaming_1) where TrangThai = 'active' and ((IDM between 1 and 5) or (IDM between 77 and 86));
    UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_gaming_2) where TrangThai = 'active' and ((IDM between 6 and 10)or (IDM between 29 and 38));
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_gaming_3) where TrangThai = 'active' and ((IDM between 11 and 14)or (IDM between 39 and 50) or (IDM between 87 and 90));
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_gaming_4)where TrangThai = 'active' and ((IDM between 15 and 19)or (IDM between 51 and 60) or (IDM between 91 and 95));
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_artwork_1) where TrangThai = 'active' and (IDM between 96 and 98);
    /*UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_artwork_2) where TrangThai = 'active' and (IDM between 36 and 40);*/
    UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_artwork_3) where TrangThai = 'active' and (IDM between 61 and 65);
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_artwork_4) where TrangThai = 'active' and ((IDM between 20 and 24)or (IDM between 66 and 70) or (IDM between 99 and 100));
	UPDATE QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = sec_to_time(3600*SoTienConLai/gia_ps4) where TrangThai = 'active' and ((IDM between 26 and 28)or (IDM between 71 and 76) or (IDM between 101 and 102));

/* Thay đổi trạng thái sử dụng trong trường hợp hết thời gian hoặc ngừng sử dụng */

END $$
DELIMITER ;

drop event IF EXISTS update_status_4;
DELIMITER $$
CREATE EVENT update_status_4  
ON SCHEDULE
EVERY 10 second  
DO
begin 
/* update trạng thái tài khoản khi logout hoặc hết tiền trong tài khoản */
	update QuanlyCyber_Ver4.taikhoan set IDM = NULL where TrangThai = 'not active';
	update QuanlyCyber_Ver4.taikhoan set TrangThai = "not active" where TrangThai = 'active' and (ThoiGianConLai = "00:00:00" or SoTienConLai < 5.555);
    update QuanlyCyber_Ver4.taikhoan set ThoiGianConLai = "00:00:00" where TrangThai = 'not active';
    update QuanlyCyber_Ver4.taikhoan set SoTienConLai = 0 where ThoiGianConLai = "00:00:00";
    update QuanlyCyber_Ver4.taikhoan set IDDV = NULL where TrangThai ='not active';
END $$
DELIMITER ;

SHOW PROCESSLIST;