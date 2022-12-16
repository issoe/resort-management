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
	ma_khach_hang 	INT,
    ten_goi 		VARCHAR(255),
    ngay_gio_mua 	DATETIME,
    ngay_bat_dau 	DATE,
    tong_tien 		INT NOT NULL DEFAULT 0,
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
    ma_khach_hang 	INT,
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


-- DATA

INSERT INTO `DBSysLab`.`chi_nhanh` (`ma_chi_nhanh`, `tinh`, `dia_chi`, `dien_thoai`, `email`) 
VALUES 	('CN1', 'Province 001', 'District 07, HCM City', '0123456789', '07@gmail.com'),
		('CN2', 'Province 002', 'District 08, HCM City', '0123456789', '08@gmail.com'),
		('CN3', 'Province 003', 'District 09, HCM City', '0123456789', '09@gmail.com'),
        ('CN4', 'Province 004', 'District 10, HCM City', '0123456789', '10@gmail.com'),
		('CN5', 'Province 005', 'District 11, HCM City', '0123456789', '11@gmail.com'),
		('CN6', 'Province 006', 'District 12, HCM City', '0123456789', '12@gmail.com'),
		('CN7', 'Province 007', 'District 13, HCM City', '0123456789', '13@gmail.com'),
		('CN8', 'Province 008', 'District 14, HCM City', '0123456789', '14@gmail.com');
        
INSERT INTO `DBSysLab`.`hinh_anh_chi_nhanh` (`ma_chi_nhanh`, `hinh_anh`) 
VALUES	('CN1', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN2', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN3', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN4', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN5', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
        ('CN6', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
        ('CN7', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
        ('CN8', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg');

INSERT INTO `DBSysLab`.`khu` (`ma_chi_nhanh`, `ten_khu`) 
VALUES	('CN1', 'zone_01_CN1'), ('CN1', 'zone_02_CN1'), ('CN1', 'zone_03_CN1'), ('CN1', 'zone_04_CN1'), ('CN1', 'zone_05_CN1'),
		('CN2', 'zone_01_CN2'), ('CN2', 'zone_02_CN2'), ('CN2', 'zone_03_CN2'), ('CN2', 'zone_04_CN2'), ('CN2', 'zone_05_CN2'),
		('CN3', 'zone_01_CN3'), ('CN3', 'zone_02_CN3'), ('CN3', 'zone_03_CN3'), ('CN3', 'zone_04_CN3'), ('CN3', 'zone_05_CN3'),
		('CN4', 'zone_01_CN4'), ('CN4', 'zone_02_CN4'), ('CN4', 'zone_03_CN4'), ('CN4', 'zone_04_CN4'), ('CN4', 'zone_05_CN4'),
		('CN5', 'zone_01_CN5'), ('CN5', 'zone_02_CN5'), ('CN5', 'zone_03_CN5'), ('CN5', 'zone_04_CN5'), ('CN5', 'zone_05_CN5'),
        ('CN6', 'zone_01_CN6'), ('CN6', 'zone_02_CN6'), ('CN6', 'zone_03_CN6'), ('CN6', 'zone_04_CN6'), ('CN6', 'zone_05_CN6'),
        ('CN7', 'zone_01_CN7'), ('CN7', 'zone_02_CN7'), ('CN7', 'zone_03_CN7'), ('CN7', 'zone_04_CN7'), ('CN7', 'zone_05_CN7'),
        ('CN8', 'zone_01_CN8'), ('CN8', 'zone_02_CN8'), ('CN8', 'zone_03_CN8'), ('CN8', 'zone_04_CN8'), ('CN8', 'zone_05_CN8');

INSERT INTO `DBSysLab`.`loai_phong` (`ma_loai_phong`, `ten_loai_phong`, `dien_tich`, `so_khach`, `mo_ta_khac`) 
VALUES 	('1', 'Single', '35', '1', 'A room assigned to one person. May have one or more beds.'),
		('2', 'Double', '40', '2', 'A room assigned to two people. May have one or more beds.'),
		('3', 'Trible', '50', '3', 'A room that can accommodate three persons and has been fitted with three twin beds'),
		('4', 'Quad', '50', '4', 'A room assigned to four people. May have two or more beds.'),
        ('5', 'Queen', '50', '3', 'A room with a queen-sized bed. May be occupied by one or more people.'),
        ('6', 'King', '50', '3', ' room with a king-sized bed.'),
        ('7', 'Twin', '50', '3', 'A room with two twin beds. May be occupied by one or more people.'),
        ('8', 'Studio', '50', '3', 'A room with a studio bed- a couch which can be converted into a bed'),
        ('9', 'Suite', '50', '3', 'The most expensive room provided by a hotel'),
        ('10', 'Murphy', '30', '3', 'A room that is fitted with a sofa bed or a Murphy bed');

INSERT INTO `DBSysLab`.`thong_tin_giuong` (`ma_loai_phong`, `kich_thuoc`, `so_luong`) 
VALUES 	('1', '5.5', '5'), ('2', '5.6', '4'), ('3', '5.7', '3'), ('4', '5.8', '2'), ('5', '5.9', '1'),
		('6', '6.0', '6'), ('7', '6.1', '7'), ('8', '6.2', '8'), ('9', '6.3', '9'), ('10', '6.4', '10');
    
INSERT INTO `DBSysLab`.`chi_nhanh_co_loai_phong` (`ma_loai_phong`, `ma_chi_nhanh`, `gia_thue`) 
VALUES 	('1', 'CN1', '1000'), ('2', 'CN1', '1010'), ('3', 'CN2', '1020'), ('4', 'CN2', '1030'), ('5', 'CN3', '1040'),
		('6', 'CN3', '1050'), ('7', 'CN4', '1060'), ('8', 'CN4', '1070'), ('9', 'CN5', '1080'), ('10', 'CN5', '1090'),
        ('6', 'CN6', '1050'), ('7', 'CN7', '1060'), ('8', 'CN8', '1070'), ('9', 'CN6', '1080'), ('10', 'CN7', '1090');

INSERT INTO `DBSysLab`.`phong` (`ma_chi_nhanh`, `so_phong`, `ma_loai_phong`, `ten_khu`) 
VALUES 	('CN1', '101', '1', 'zone_01_CN1'), ('CN1', '201', '2', 'zone_02_CN1'), ('CN1', '301', '3', 'zone_03_CN1'), 
		('CN1', '401', '4', 'zone_04_CN1'), ('CN1', '501', '5', 'zone_05_CN1'),	-- 5 rooms at CN1, zone_01, zone_02, zone_03, zone_04, zone_05
		('CN2', '101', '1', 'zone_01_CN2'), ('CN2', '201', '2', 'zone_02_CN2'), ('CN2', '301', '3', 'zone_03_CN2'), 
        ('CN2', '401', '4', 'zone_04_CN2'), ('CN2', '501', '5', 'zone_05_CN2'),	-- 5 rooms at CN2, zone_01, zone_02, zone_03, zone_04, zone_05
		('CN3', '101', '1', 'zone_01_CN3'), ('CN3', '201', '2', 'zone_02_CN3'), ('CN3', '301', '3', 'zone_03_CN3'), 
        ('CN3', '401', '4', 'zone_04_CN3'), ('CN3', '501', '5', 'zone_05_CN3'),	-- 5 rooms at CN3, zone_01, zone_02, zone_03, zone_04, zone_05
        ('CN4', '101', '1', 'zone_01_CN4'), ('CN4', '201', '2', 'zone_02_CN4'), ('CN4', '301', '3', 'zone_03_CN4'), 
        ('CN4', '401', '4', 'zone_04_CN4'), ('CN4', '501', '5', 'zone_05_CN4'),	-- 5 rooms at CN4, zone_01, zone_02, zone_03, zone_04, zone_05
        ('CN5', '101', '1', 'zone_01_CN5'), ('CN5', '201', '2', 'zone_02_CN5'), ('CN5', '301', '3', 'zone_03_CN5'), 
        ('CN5', '401', '4', 'zone_04_CN5'), ('CN5', '501', '5', 'zone_05_CN5');	-- 5 rooms at CN5, zone_01, zone_02, zone_03, zone_04, zone_05
        
INSERT INTO `DBSysLab`.`loai_vat_tu` (`ma_loai_vat_tu`, `ten_loai_vat_tu`) 
VALUES 	('VT0001', 'Trundle bed'), ('VT0002', 'Cupboard'), 
		('VT0003', 'Basket chair'), ('VT0004', 'Stool'),
        ('VT0005', 'Bookcase'), ('VT0006', 'Dressing table'),
		('VT0007', 'Wardrobe'), ('VT0008', 'Ogee clock'),
		('VT0009', 'Settle'), ('VT0010', 'Love seat');
        
INSERT INTO `DBSysLab`.`loai_vat_tu_trong_phong` (`ma_loai_vat_tu`, `ma_loai_phong`, `so_luong`) 
VALUES 	('VT0001', '1', '1'), ('VT0002', '1', '2'), ('VT0003', '1', '3'), ('VT0004', '1', '4'), ('VT0005', '1', '5'), 
		('VT0006', '2', '1'), ('VT0007', '2', '2'), ('VT0008', '2', '3'), ('VT0009', '2', '4'), ('VT0010', '2', '5'), 
		('VT0001', '3', '1'), ('VT0002', '3', '2'), ('VT0003', '3', '3'), ('VT0004', '3', '4'), ('VT0005', '3', '5'), 
		('VT0006', '4', '1'), ('VT0007', '4', '2'), ('VT0008', '4', '3'), ('VT0009', '4', '4'), ('VT0010', '4', '5'), 
        ('VT0001', '5', '1'), ('VT0002', '5', '2'), ('VT0003', '5', '3'), ('VT0004', '5', '4'), ('VT0005', '5', '5'), 
		('VT0006', '6', '1'), ('VT0007', '6', '2'), ('VT0008', '6', '3'), ('VT0009', '6', '4'), ('VT0010', '6', '5'), 
        ('VT0001', '7', '1'), ('VT0002', '7', '2'), ('VT0003', '7', '3'), ('VT0004', '7', '4'), ('VT0005', '7', '5'), 
		('VT0006', '8', '1'), ('VT0007', '8', '2'), ('VT0008', '8', '3'), ('VT0009', '8', '4'), ('VT0010', '8', '5'), 
        ('VT0001', '9', '1'), ('VT0002', '9', '2'), ('VT0003', '9', '3'), ('VT0004', '9', '4'), ('VT0005', '9', '5'), 
		('VT0006', '10', '1'), ('VT0007', '10', '2'), ('VT0008', '10', '3'), ('VT0009', '10', '4'), ('VT0010', '10', '5');        

INSERT INTO `DBSysLab`.`vat_tu` (`ma_chi_nhanh`, `ma_loai_vat_tu`, `stt_vat_tu`, `trinh_trang`, `so_phong`) 
VALUES 	('CN1', 'VT0001', '1', 'ok', '101'), ('CN1', 'VT0002', '2', 'not_ok', '201'), ('CN1', 'VT0003', '3', 'ok', '301'), 
		('CN1', 'VT0004', '4', 'not_ok', '401'), ('CN1', 'VT0005', '5', 'ok', '501'), 
		('CN2', 'VT0001', '1', 'ok', '101'), ('CN2', 'VT0002', '2', 'not_ok', '201'), ('CN2', 'VT0003', '3', 'ok', '301'), 
		('CN2', 'VT0004', '4', 'not_ok', '401'), ('CN2', 'VT0005', '5', 'ok', '501'), 
        ('CN3', 'VT0001', '1', 'ok', '101'), ('CN3', 'VT0002', '2', 'not_ok', '201'), ('CN3', 'VT0003', '3', 'ok', '301'), 
		('CN3', 'VT0004', '4', 'not_ok', '401'), ('CN3', 'VT0005', '5', 'ok', '501'), 
        ('CN4', 'VT0001', '1', 'ok', '101'), ('CN4', 'VT0002', '2', 'not_ok', '201'), ('CN4', 'VT0003', '3', 'ok', '301'), 
		('CN4', 'VT0004', '4', 'not_ok', '401'), ('CN4', 'VT0005', '5', 'ok', '501'), 
        ('CN5', 'VT0001', '1', 'ok', '101'), ('CN5', 'VT0002', '2', 'not_ok', '201'), ('CN5', 'VT0003', '3', 'ok', '301'), 
		('CN5', 'VT0004', '4', 'not_ok', '401'), ('CN5', 'VT0005', '5', 'ok', '501');
        
INSERT INTO `DBSysLab`.`nha_cung_cap` (`ma_nha_cung_cap`, `ten_nha_cung_cap`, `email`, `dia_chi`) 
VALUES 	('NCC0001', 'Apple', 'apple@gmail.com', 'Apple address'), 
		('NCC0002', 'Samsung', 'samsung@gmail.com', 'Samsung address'),
		('NCC0003', 'Lavie', 'lavie@gmail.com', 'Lavie address'),
		('NCC0004', 'Nescafe', 'nescafe@gmail.com', 'Nescafe address'),
		('NCC0005', 'Tempo', 'tempo@gmail.com', 'Tempo address');
        
INSERT INTO `DBSysLab`.`cung_cap_vat_tu` (`ma_nha_cung_cap`, `ma_loai_vat_tu`, `ma_chi_nhanh`) 
VALUES 	('NCC0001', 'VT0001', 'CN1'),
		('NCC0002', 'VT0002', 'CN2'),
		('NCC0003', 'VT0003', 'CN3'),
		('NCC0004', 'VT0004', 'CN4'),
		('NCC0005', 'VT0005', 'CN5');

INSERT INTO `DBSysLab`.`khach_hang` (`cccd`, `ho_ten`, `dien_thoai`, `email`, `username`, `passwordd`, `pointt`, `typee`) 
VALUES 	('312483818', 'Jayden Ezra', '0342741005', '002@gmail.com', 'u002', 'p001', '2', '2'),
        ('312483819', 'Luca Rowan', '0342741006', '003@gmail.com', 'u003', 'p001', '2', '2'),
        ('312483820', 'Nova amara', '0342741007', '004@gmail.com', 'u004', 'p001', '2', '2'),
        ('312483821', 'Aaliyah Finn', '0342741008', '005@gmail.com', 'u005', 'p001', '2', '2'),
        ('312483822', 'Zion Maeve', '0342741009', '006@gmail.com', 'u006', 'p001', '2', '2'),
		('312483823', 'Kayden Mia', '0342741010', '007@gmail.com', 'u007', 'p001', '2', '2'),
        ('312483824', 'Mila Aurora', '0342741011', '008@gmail.com', 'u008', 'p001', '2', '2'),
        ('312483825', 'Alina Remi', '0342741012', '009@gmail.com', 'u009', 'p001', '2', '2'),
        ('312483826', 'Amaya Ari', '0342741013', '010@gmail.com', 'u010', 'p001', '2', '2'),
        ('312483827', 'Brake Elliot', '0342741014', '011@gmail.com', 'u011', 'p001', '2', '2'),
		('312483828', 'Ivy Quinn', '0342741015', '012@gmail.com', 'u012', 'p001', '2', '2'),
        ('312483829', 'Leo Arthur', '0342741016', '013@gmail.com', 'u013', 'p001', '2', '2'),
        ('312483830', 'Rachel River', '0342741017', '014@gmail.com', 'u014', 'p001', '2', '2'),
        ('312483831', 'Axel Aria', '0342741018', '015@gmail.com', 'u015', 'p001', '2', '2'),
        ('312483832', 'Alex Molly', '0342741019', '016@gmail.com', 'u016', 'p001', '2', '2'),
		('312483833', 'Jude Elias', '0342741020', '017@gmail.com', 'u017', 'p001', '2', '2'),
        ('312483834', 'Milo Malachi', '0342741021', '018@gmail.com', 'u018', 'p001', '2', '2'),
        ('312483835', 'Charlie Ira', '0342741022', '019@gmail.com', 'u019', 'p001', '2', '2'),
        ('312483836', 'Atlas Evelyn', '0342741023', '020@gmail.com', 'u020', 'p001', '2', '2'),
        ('312483837', 'Rhys Isabella', '0342741024', '021@gmail.com', 'u021', 'p001', '2', '2'),
		('312483838', 'Ariella Millie', '0342741025', '022@gmail.com', 'u022', 'p001', '2', '2'),
        ('312483839', 'Olivia Lyda', '0342741026', '023@gmail.com', 'u023', 'p001', '2', '2'),
        ('312483840', 'Gianna Everett', '0342741027', '024@gmail.com', 'u024', 'p001', '2', '2'),
        ('312483841', 'Hudson Sienna', '0342741028', '025@gmail.com', 'u025', 'p001', '2', '2'),
        ('312483842', 'Emerson Alice', '0342741029', '026@gmail.com', 'u026', 'p001', '2', '2'),
		('312483843', 'Sharon Isla', '0342741030', '027@gmail.com', 'u027', 'p001', '2', '2'),
        ('312483844', 'Thea Alma', '0342741031', '028@gmail.com', 'u028', 'p001', '2', '2'),
        ('312483845', 'Jesse Zoey', '0342741032', '029@gmail.com', 'u029', 'p001', '2', '2'),
        ('312483846', 'Amelia Xavier', '0342741033', '030@gmail.com', 'u030', 'p001', '2', '2'),
        ('312483847', 'Kai Eliana', '0342741034', '031@gmail.com', 'u031', 'p001', '2', '2');

INSERT INTO `DBSysLab`.`goi_dich_vu` (`ten_goi`, `so_ngay`, `so_khach`, `gia`) 
VALUES 	('Package-001', '12', '1', '14'),
		('Package-002', '13', '2', '15'),
		('Package-003', '14', '3', '16'),
        ('Package-004', '15', '4', '17'),
        ('Package-005', '16', '5', '18');
        
INSERT INTO `DBSysLab`.`hoa_don_goi_dich_vu` (`ma_khach_hang`, `ten_goi`, `ngay_gio_mua`, `ngay_bat_dau`, `tong_tien`) 
VALUES 	('1', 'Package-001', '2010-12-31 01:15:00', '2011-12-31', '1000'),
		('2', 'Package-002', '2010-12-31 01:15:00', '2012-12-31', '1001'),
        ('3', 'Package-003', '2010-12-31 01:15:00', '2013-12-31', '1002'),
        ('4', 'Package-004', '2010-12-31 01:15:00', '2014-12-31', '1003'),
        ('5', 'Package-005', '2010-12-31 01:15:00', '2015-12-31', '1004');

INSERT INTO `DBSysLab`.`don_dat_phong` (`ma_dat_phong`, `ngay_gio_dat`, `so_khach`, `ngay_nhan_phong`, `ngay_tra_phong`, `trinh_trang`, `tong_tien`, `ma_khach_hang`, `ten_goi_dich_vu`) 
VALUES 	('DP02022022000001', '2015-01-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
		('DP03022022000001', '2015-02-03 14:00:45', '1', '2016-04-03', '2017-04-03', '1', '1010', '2', 'Package-004'),
        ('DP04022022000001', '2015-03-03 14:00:45', '2', '2016-04-03', '2017-04-03', '1', '1010', '3', 'Package-003'),
        ('DP05022022000001', '2015-04-03 14:00:45', '3', '2016-04-03', '2017-04-03', '1', '1010', '4', 'Package-002'),
        ('DP06022022000001', '2015-05-03 14:00:45', '1', '2016-04-03', '2017-04-03', '1', '1010', '5', 'Package-001'),
        ('DP07022022000001', '2015-06-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
        ('DP08022022000001', '2015-07-03 14:00:45', '8', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-004'),
        ('DP09022022000001', '2015-08-03 14:00:45', '9', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-003'),
        ('DP10022022000001', '2015-09-03 14:00:45', '7', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-002'),
        ('DP11022022000001', '2015-10-03 14:00:45', '6', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-001'),
        ('DP12022022000001', '2015-11-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
        ('DP13022022000001', '2015-12-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-004'),
        ('DP14022022000001', '2015-02-03 14:00:45', '6', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-003'),
        ('DP15022022000001', '2015-03-03 14:00:45', '7', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-002'),
        ('DP16022022000001', '2015-04-03 14:00:45', '8', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-001'),
        ('DP17022022000001', '2015-05-03 14:00:45', '9', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
        ('DP18022022000001', '2015-06-03 14:00:45', '1', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-004'),
        ('DP19022022000001', '2015-07-03 14:00:45', '2', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-003'),
        ('DP20022022000001', '2015-08-03 14:00:45', '3', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-002'),
        ('DP21022022000001', '2015-09-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-001'),
        ('DP22022022000001', '2015-10-03 14:00:45', '6', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
        ('DP23022022000001', '2015-11-03 14:00:45', '7', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-004'),
        ('DP24022022000001', '2015-12-03 14:00:45', '8', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-003'),
        ('DP25022022000001', '2015-01-03 14:00:45', '9', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-002'),
        ('DP26022022000001', '2015-01-03 14:00:45', '4', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-001'),
        ('DP27022022000001', '2015-02-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-005'),
        ('DP28022022000001', '2015-03-03 14:00:45', '1', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-004'),
        ('DP29022022000001', '2015-04-03 14:00:45', '3', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-003'),
        ('DP30022022000001', '2015-05-03 14:00:45', '2', '2016-04-03', '2017-04-03', '1', '1010', '1', 'Package-002');
        
INSERT INTO `DBSysLab`.`phong_thue` (`ma_dat_phong`, `ma_chi_nhanh`, `so_phong`) 
VALUES 	('DP02022022000001', 'CN5', '101'),
		('DP03022022000001', 'CN4', '201'),
		('DP04022022000001', 'CN3', '301'),
		('DP05022022000001', 'CN2', '401'),
		('DP06022022000001', 'CN1', '501'),
        ('DP07022022000001', 'CN5', '101'),
		('DP08022022000001', 'CN4', '201'),
		('DP09022022000001', 'CN3', '301'),
		('DP10022022000001', 'CN2', '401'),
		('DP11022022000001', 'CN1', '501'),
        ('DP12022022000001', 'CN5', '101'),
		('DP13022022000001', 'CN4', '201'),
		('DP14022022000001', 'CN3', '301'),
		('DP15022022000001', 'CN2', '401'),
		('DP16022022000001', 'CN1', '501'),
        ('DP17022022000001', 'CN5', '101'),
		('DP18022022000001', 'CN4', '201'),
		('DP19022022000001', 'CN3', '301'),
		('DP20022022000001', 'CN2', '401'),
		('DP21022022000001', 'CN1', '501'),
        ('DP22022022000001', 'CN5', '101'),
		('DP23022022000001', 'CN4', '201'),
		('DP24022022000001', 'CN3', '301'),
		('DP25022022000001', 'CN2', '401'),
		('DP26022022000001', 'CN1', '501'),
        ('DP27022022000001', 'CN5', '101'),
		('DP28022022000001', 'CN4', '201'),
		('DP29022022000001', 'CN3', '301'),
		('DP30022022000001', 'CN2', '401');

INSERT INTO `DBSysLab`.`hoa_don` (`ma_hoa_don`, `thoi_gian_nhan_phong`, `thoi_gian_tra_phong`, `ma_dat_phong`) 
VALUES 	('HD02032021', '14:00:45', '15:00:45', 'DP02022022000001'),
		('HD03032021', '14:00:45', '15:00:45', 'DP03022022000001'),
        ('HD04032021', '14:00:45', '15:00:45', 'DP04022022000001'),
        ('HD05032021', '14:00:45', '15:00:45', 'DP05022022000001'),
        ('HD06032021', '14:00:45', '15:00:45', 'DP06022022000001'),
        ('HD07032021', '14:00:45', '15:00:45', 'DP07022022000001');

INSERT INTO `DBSysLab`.`doanh_nghiep` (`ma_doanh_nghiep`, `ten_doanh_nghiep`) 
VALUES 	('DN0001', 'Tên Doanh Nghiệp 1'),
		('DN0002', 'Tên Doanh Nghiệp 2'),
        ('DN0003', 'Tên Doanh Nghiệp 3'),
        ('DN0004', 'Tên Doanh Nghiệp 4'),
        ('DN0005', 'Tên Doanh Nghiệp 5');
        
INSERT INTO `DBSysLab`.`dich_vu` (`ma_dich_vu`, `loai_dich_vu`, `so_khach`, `phong_cach`, `ma_doanh_nghiep`) 
VALUES 	('DVR001', 'R', '5', 'unknown', 'DN0001'), ('DVS001', 'S', '5', 'unknown', 'DN0001'),
		('DVC001', 'C', '5', 'unknown', 'DN0002'), ('DVM001', 'M', '5', 'unknown', 'DN0002'),
        ('DVB001', 'B', '5', 'unknown', 'DN0003'), ('DVR002', 'R', '5', 'unknown', 'DN0003'),
        ('DVS002', 'S', '5', 'unknown', 'DN0004'), ('DVC002', 'C', '5', 'unknown', 'DN0004'),
        ('DVM002', 'M', '5', 'unknown', 'DN0005'), ('DVB002', 'B', '5', 'unknown', 'DN0005');
        
INSERT INTO `DBSysLab`.`dich_vu_spa` (`ma_dich_vu`, `dich_vu_spa`) 
VALUES 	('DVS001', 'des001'), ('DVS001', 'des002'), ('DVS002', 'des001'), ('DVS002', 'des002');

INSERT INTO `DBSysLab`.`loai_hang_do_luu_niem` (`ma_dich_vu`, `loai_hang`) 
VALUES 	('DVM001', 'des001'), ('DVM001', 'des002'), ('DVM002', 'des001'), ('DVM002', 'des002');
        
INSERT INTO `DBSysLab`.`thuong_hieu_do_luu_niem` (`ma_dich_vu`, `thuong_hieu`) 
VALUES 	('DVM001', 'thuong_hieu_des001'), ('DVM001', 'thuong_hieu_des002'), 
		('DVM002', 'thuong_hieu_des001'), ('DVM002', 'thuong_hieu_des002');      
        
INSERT INTO `DBSysLab`.`mat_bang` (`ma_chi_nhanh`, `stt_mat_bang`, `chieu_dai`, `chieu_rong`, `gia_thue`, `mo_ta`, `ma_dich_vu`, `ten_cua_hang`, `logo`) 
VALUES 	('CN1', '24', '7', '8', '2000', 'No description', 'DVB001', 'Tên cửa hàng 1', 'Link here'),
		('CN2', '25', '81', '9', '2010', 'No description', 'DVB002', 'Tên cửa hàng 2', 'Link here'),
        ('CN3', '26', '7', '10', '2020', 'No description', 'DVC001', 'Tên cửa hàng 3', 'Link here'),
        ('CN4', '27', '7', '12', '2300', 'No description', 'DVM002', 'Tên cửa hàng 4', 'Link here'),
        ('CN5', '28', '7', '14', '2400', 'No description', 'DVR002', 'Tên cửa hàng 5', 'Link here');

INSERT INTO `DBSysLab`.`hinh_anh_cua_hang` (`ma_chi_nhanh`, `stt_mat_bang`, `hinh_anh`) 
VALUES 	('CN1', '24', 'Link_01'),
		('CN2', '25', 'Link_02'),
		('CN3', '26', 'Link_03'),
		('CN4', '27', 'Link_04'),
		('CN5', '28', 'Link_05');

INSERT INTO `DBSysLab`.`khung_gio_hoat_dong_cua_hang` (`ma_chi_nhanh`, `stt_mat_bang`, `gio_bat_dau`, `gio_ket_thuc`) 
VALUES 	('CN1', '24', '08:00:00', '19:00:00'),
		('CN2', '25', '08:00:00', '19:00:00'),
		('CN3', '26', '08:00:00', '19:00:00'),
		('CN4', '27', '08:00:00', '19:00:00'),
		('CN5', '28', '08:00:00', '19:00:00');
        
