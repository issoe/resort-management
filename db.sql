CREATE DATABASE DBSysAss;

USE DBSysAss;

CREATE TABLE IF NOT EXISTS chi_nhanh (
	ma_chi_nhanh VARCHAR(10) NOT NULL PRIMARY KEY,
    tinh VARCHAR(50),
    dia_chi VARCHAR(300),
    dien_thoai VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS hinh_anh_chi_nhanh (
	ma_chi_nhanh VARCHAR(255),
    hinh_anh VARCHAR(255),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_chi_nhanh, hinh_anh)
);

CREATE TABLE IF NOT EXISTS khu (
	ma_chi_nhanh VARCHAR(255),
    ten_khu VARCHAR(255),
	FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_chi_nhanh, ten_khu)
);

CREATE TABLE IF NOT EXISTS loai_phong (
	ma_loai_phong INT AUTO_INCREMENT PRIMARY KEY,
	ten_loai_phong VARCHAR(255),
    dien_tich INT,
    so_khach INT NOT NULL,
    CHECK (so_khach > 0 AND so_khach < 11),
    mo_ta_khac VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS thong_tin_giuong (
	ma_loai_phong VARCHAR(255),
    kich_thuoc FLOAT(1, 1),
    so_luong INT DEFAULT 1,
    CHECK (so_luong > 0 AND so_luong < 11),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_loai_phong, kich_thuoc)
);

CREATE TABLE IF NOT EXISTS chi_nhanh_co_loai_phong (
	ma_loai_phong VARCHAR(255),
    ma_chi_nhanh VARCHAR(255),
    gia_thue INT NOT NULL,
    
	FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    PRIMARY KEY (ma_loai_phong, ma_chi_nhanh)
);

CREATE TABLE IF NOT EXISTS phong (
	ma_chi_nhanh VARCHAR(255),
    so_phong VARCHAR(3),
    ma_loai_phong VARCHAR(255),
    ten_khu VARCHAR(255),
	FOREIGN KEY (ma_chi_nhanh, ten_khu) REFERENCES khu(ma_chi_nhanh, ten_khu),
    FOREIGN KEY (ma_chi_nhanh) REFERENCES chi_nhanh(ma_chi_nhanh),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_chi_nhanh, so_phong)
);

CREATE TABLE IF NOT EXISTS loai_vat_tu (
	ma_vat_tu VARCHAR(6) PRIMARY KEY NOT NULL,
    ten_loai_vat_tu VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS loai_vat_tu_trong_phong (
	ma_loai_vat_tu VARCHAR(255),
    ma_loai_phong VARCHAR(255),
    so_luong INT NOT NULL DEFAULT 1,
    CHECK (so_luong > 0 AND so_luong < 21),
    
    FOREIGN KEY (ma_loai_vat_tu) REFERENCES loai_vat_tu(ma_loai_vat_tu),
    FOREIGN KEY (ma_loai_phong) REFERENCES loai_phong(ma_loai_phong),
    PRIMARY KEY (ma_loai_vat_tu, ma_loai_phong)
);
