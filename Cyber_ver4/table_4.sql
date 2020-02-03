drop database QuanlyCyber_Ver4;
create database QuanlyCyber_Ver4;

use QuanlyCyber_Ver4;
create table COSO(
	IDCS int unsigned NOT NULL UNIQUE AUTO_INCREMENT,
	TenCoSo varchar(50) NOT NULL UNIQUE PRIMARY KEY,
	DiaChi varchar(100) NOT NULL
);

create table PHONG(
	IDP int unsigned NOT NULL,
	Tang int NOT NULL,
	TenCoSo varchar(50) NOT NULL,
	LoaiPhong varchar(100) NOT NULL,
    CONSTRAINT PrimaryKey_Phong PRIMARY KEY (IDP,TenCoSo),
    FOREIGN KEY(TenCoSo) REFERENCES COSO(TenCoSo)
);

create table DICHVU(
	IDDV varchar(25) NOT NULL UNIQUE PRIMARY KEY,
    LoaiMon varchar(25) NOT NULL,
	TenMon varchar(25) NOT NULL UNIQUE,
	DonGia decimal(8,1) unsigned
);

create table CAUHINH(
	IDCH varchar(25) NOT NULL UNIQUE PRIMARY KEY,
	ChipCPU varchar(25),
	RAM int,
	Card varchar(25),
	ManHinh int, 
	DonGia decimal(10,3) unsigned
);

create table MAY(
	IDM int unsigned NOT NULL UNIQUE PRIMARY KEY,
	IDCH varchar(25) NOT NULL,
	IDP int unsigned NOT NULL,
	TenCoSo varchar(50) NOT NULL,
	FOREIGN KEY(IDCH) REFERENCES CAUHINH(IDCH),
    FOREIGN KEY(IDP) REFERENCES PHONG(IDP),
    FOREIGN KEY(TenCoSo) REFERENCES COSO(TenCoSo)
);

create table THONGTINKHACHHANG(
	IDKH int NOT NULL UNIQUE,
	TenKhachHang varchar(30) NOT NULL,
	SoCMT decimal(9,0) unsigned NOT NULL UNIQUE,
	SoDienThoai int UNIQUE,
    TenTaiKhoan varchar(25) NOT NULL UNIQUE PRIMARY KEY
);

create table TAIKHOAN(
	TenTaiKhoan varchar(25) NOT NULL UNIQUE, 
	SoTienConLai decimal(10,3) UNSIGNED NOT NULL DEFAULT '0.000',
	ThoiGianConLai time NOT NULL DEFAULT '00:00:00',
	TrangThai varchar(25) NOT NULL DEFAULT 'not active',
	IDM int unsigned DEFAULT NULL,
	IDDV varchar(25) DEFAULT NULL,
    Time_Stamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(IDM) REFERENCES MAY(IDM),
	FOREIGN KEY(IDDV) REFERENCES DICHVU(IDDV),
    FOREIGN KEY(TenTaiKhoan) REFERENCES THONGTINKHACHHANG(TenTaiKhoan)
);

    

