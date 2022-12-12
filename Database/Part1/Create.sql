CREATE DATABASE DBSysLab;
USE DBSysLab;

CREATE TABLE IF NOT EXISTS chi_nhanh (
	ma_chi_nhanh 	VARCHAR(255) NOT NULL PRIMARY KEY, -- Form
    tinh 			VARCHAR(255),
    dia_chi 		VARCHAR(255),
    dien_thoai 		VARCHAR(255),
    email 			VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS hinh_anh_chi_nhanh (
	ma_chi_nhanh 	VARCHAR(255),
    hinh_anh 		VARCHAR(255),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_chi_nhanh, hinh_anh)
);

CREATE TABLE IF NOT EXISTS khu (
	ma_chi_nhanh 	VARCHAR(255),
    ten_khu 		VARCHAR(255),
	FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_chi_nhanh, ten_khu)
);

CREATE TABLE IF NOT EXISTS loai_phong (
	ma_loai_phong 	INT AUTO_INCREMENT PRIMARY KEY,
	ten_loai_phong 	VARCHAR(255),
    dien_tich 		INT,
    so_khach 		INT NOT NULL,
    mo_ta_khac 		VARCHAR(255),
    CHECK (so_khach >= 1 AND so_khach <= 10)
);

CREATE TABLE IF NOT EXISTS thong_tin_giuong (
	ma_loai_phong 	INT,
    kich_thuoc 		FLOAT,
    so_luong 		INT DEFAULT 1,
    CHECK (so_luong >= 1 AND so_luong <= 10),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_loai_phong, kich_thuoc)
);

CREATE TABLE IF NOT EXISTS chi_nhanh_co_loai_phong (
	ma_loai_phong 	INT,
    ma_chi_nhanh 	VARCHAR(255),
    gia_thue 		INT NOT NULL,
	FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_loai_phong, ma_chi_nhanh)
);

CREATE TABLE IF NOT EXISTS phong (
	ma_chi_nhanh 	VARCHAR(255),
    so_phong 		VARCHAR(3),
    ma_loai_phong 	INT,
    ten_khu 		VARCHAR(255),
	FOREIGN KEY (ma_chi_nhanh, ten_khu) REFERENCES khu(ma_chi_nhanh, ten_khu),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_chi_nhanh, so_phong)
);

CREATE TABLE IF NOT EXISTS loai_vat_tu (
	ma_loai_vat_tu 	VARCHAR(6) PRIMARY KEY NOT NULL,	-- form
    ten_loai_vat_tu	VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS loai_vat_tu_trong_phong (
	ma_loai_vat_tu 	VARCHAR(6),
    ma_loai_phong 	INT,
    so_luong 		INT NOT NULL DEFAULT 1,
    CHECK (so_luong >= 1 AND so_luong <= 20),
    FOREIGN KEY (ma_loai_vat_tu) REFERENCES loai_vat_tu(ma_loai_vat_tu),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_loai_vat_tu, ma_loai_phong)
);

CREATE TABLE IF NOT EXISTS vat_tu (
	ma_chi_nhanh 	VARCHAR(255),
    ma_loai_vat_tu 	VARCHAR(255),
    stt_vat_tu 		VARCHAR(255),
    trinh_trang 	VARCHAR(255),
    so_phong 		VARCHAR(255),
    CHECK (stt_vat_tu > 0),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    FOREIGN KEY (ma_loai_vat_tu) REFERENCES loai_vat_tu(ma_loai_vat_tu),
    FOREIGN KEY (ma_chi_nhanh, so_phong) REFERENCES phong(ma_chi_nhanh, so_phong),
    PRIMARY KEY (ma_chi_nhanh, ma_loai_vat_tu, stt_vat_tu)
);
    
CREATE TABLE IF NOT EXISTS nha_cung_cap (
	ma_nha_cung_cap 	VARCHAR(7) PRIMARY KEY NOT NULL,
    ten_nha_cung_cap 	VARCHAR(255),
    email 				VARCHAR(255),
    dia_chi 			VARCHAR(255)
);    
    
CREATE TABLE IF NOT EXISTS cung_cap_vat_tu (
	ma_nha_cung_cap	VARCHAR(255),
    ma_loai_vat_tu 	VARCHAR(255),
    ma_chi_nhanh 	VARCHAR(255),
    FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    FOREIGN KEY (ma_loai_vat_tu) REFERENCES loai_vat_tu(ma_loai_vat_tu),
    PRIMARY KEY (ma_loai_vat_tu, ma_chi_nhanh)
);

CREATE TABLE IF NOT EXISTS khach_hang (
	ma_khach_hang 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cccd 			VARCHAR(12) NOT NULL UNIQUE,
    ho_ten 			VARCHAR(255),
    dien_thoai 		VARCHAR(15) NOT NULL UNIQUE, 
    email 			VARCHAR(255) UNIQUE,
    username 		VARCHAR(255) UNIQUE,
    passwordd 		VARCHAR(255),
    pointt 			INT NOT NULL DEFAULT 0,
    typee 			INT NOT NULL DEFAULT 1,
    CHECK (pointt > 0),
    CHECK (typee > 0 AND pointt < 5)
);

CREATE TABLE IF NOT EXISTS goi_dich_vu (
	ten_goi 		VARCHAR(255) NOT NULL PRIMARY KEY,
    so_ngay 		INT NOT NULL,
    so_khach 		INT NOT NULL,
    gia 			INT NOT NULL,
    CHECK (so_ngay >= 1 AND so_ngay <= 100),
    CHECK (so_khach >= 1 AND so_khach <= 10),
    CHECK (gia > 0)
);

CREATE TABLE IF NOT EXISTS hoa_don_goi_dich_vu (
	ma_khach_hang 	VARCHAR(255),
    ten_goi 		VARCHAR(255),
    ngay_gio_mua 	DATETIME,
    ngay_bat_dau 	DATE,
    tong_tien 		INT NOT NULL,
	FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ten_goi) REFERENCES goi_dich_vu(ten_goi),
    PRIMARY KEY (ma_khach_hang, ten_goi, ngay_gio_mua)
);

CREATE TABLE IF NOT EXISTS don_dat_phong (
	ma_dat_phong 	VARCHAR(16) PRIMARY KEY,
    ngay_gio_dat 	DATETIME,
    so_khach 		INT,
    ngay_nhan_phong DATETIME,
    ngay_tra_phong 	DATETIME,
    trinh_trang 	INT NOT NULL,
    tong_tien 		INT NOT NULL DEFAULT 0,
    ma_khach_hang 	VARCHAR(255),
    ten_goi_dich_vu VARCHAR(255),
    CHECK (trinh_trang >= 1 AND trinh_trang <= 3),
    CHECK (ngay_nhan_phong > ngay_gio_dat AND ngay_tra_phong > ngay_nhan_phong),
    FOREIGN KEY (ten_goi_dich_vu) REFERENCES goi_dich_vu(ten_goi)
);

CREATE TABLE IF NOT EXISTS phong_thue (
	ma_dat_phong 	VARCHAR(255),
    ma_chi_nhanh 	VARCHAR(255),
    so_phong 		VARCHAR(255),
    FOREIGN KEY (ma_dat_phong) REFERENCES don_dat_phong(ma_dat_phong),
    FOREIGN KEY (ma_chi_nhanh, so_phong) REFERENCES phong(ma_chi_nhanh, so_phong),
    PRIMARY KEY (ma_dat_phong, ma_chi_nhanh, so_phong)
);

CREATE TABLE IF NOT EXISTS hoa_don (
	ma_hoa_don 				VARCHAR(16) PRIMARY KEY NOT NULL,
    thoi_gian_nhan_phong 	TIME,
    thoi_gian_tra_phong 	TIME,
    ma_dat_phong 			VARCHAR(255),
    FOREIGN KEY (ma_dat_phong) REFERENCES don_dat_phong(ma_dat_phong)		-- no description in pdf 
);

CREATE TABLE IF NOT EXISTS doanh_nghiep (
	ma_doanh_nghiep 	VARCHAR(6) PRIMARY KEY NOT NULL,
    ten_doanh_nghiep 	VARCHAR(255)
);
	
CREATE TABLE IF NOT EXISTS dich_vu (
	ma_dich_vu 		VARCHAR(6) PRIMARY KEY NOT NULL,
    loai_dich_vu 	VARCHAR(1),
    so_khach 		INT,
    phong_cach 		VARCHAR(255),
    ma_doanh_nghiep VARCHAR(6), 
    CHECK (so_khach > 0),	-- no description in pdf 							
    FOREIGN KEY (ma_doanh_nghiep) REFERENCES doanh_nghiep(ma_doanh_nghiep)	-- no description in pdf 
);

CREATE TABLE IF NOT EXISTS dich_vu_spa (
	ma_dich_vu 		VARCHAR(6),
    dich_vu_spa 	VARCHAR(255),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu),	-- new ma_dich_vu
    PRIMARY KEY (ma_dich_vu, dich_vu_spa)
);

CREATE TABLE IF NOT EXISTS loai_hang_do_luu_niem (
	ma_dich_vu 		VARCHAR(6),
    loai_hang 		VARCHAR(255),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu),
    PRIMARY KEY (ma_dich_vu, loai_hang)
);

CREATE TABLE IF NOT EXISTS thuong_hieu_do_luu_niem (
	ma_dich_vu 		VARCHAR(6),
    thuong_hieu 	VARCHAR(255),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu),
    PRIMARY KEY (ma_dich_vu, thuong_hieu)
);

CREATE TABLE IF NOT EXISTS mat_bang (
	ma_chi_nhanh 	VARCHAR(255),
    stt_mat_bang 	INT NOT NULL DEFAULT 1,
    chieu_dai 		INT,
    chieu_rong 		INT,
    gia_thue 		INT NOT NULL,
    mo_ta 			VARCHAR(255),
    ma_dich_vu 		VARCHAR(255),
    ten_cua_hang 	VARCHAR(255),
    logo 			VARCHAR(255),
    CHECK (stt_mat_bang >= 1 AND stt_mat_bang <= 50),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu),
    PRIMARY KEY (ma_chi_nhanh, stt_mat_bang)
);

CREATE TABLE IF NOT EXISTS hinh_anh_cua_hang (
	ma_chi_nhanh 	VARCHAR(255),
    stt_mat_bang 	INT,
    hinh_anh 		VARCHAR(255),
    FOREIGN KEY (ma_chi_nhanh, stt_mat_bang) REFERENCES mat_bang(ma_chi_nhanh, stt_mat_bang),
    PRIMARY KEY (ma_chi_nhanh, stt_mat_bang, hinh_anh)
);

CREATE TABLE IF NOT EXISTS khung_gio_hoat_dong_cua_hang (
	ma_chi_nhanh 	VARCHAR(255),
    stt_mat_bang 	INT,
    gio_bat_dau 	TIME,
    gio_ket_thuc 	TIME,
    FOREIGN KEY (ma_chi_nhanh, stt_mat_bang) REFERENCES mat_bang(ma_chi_nhanh, stt_mat_bang),
    PRIMARY KEY (ma_chi_nhanh, stt_mat_bang, gio_bat_dau)
);