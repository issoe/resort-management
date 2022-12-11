
USE `DBSysLab`;
DROP procedure IF EXISTS `ThongKeLuotKhach`;

DELIMITER $$
USE `DBSysLab`$$
CREATE PROCEDURE `ThongKeLuotKhach` (input_chi_nhanh CHAR(255), input_year INTEGER)
BEGIN
	SELECT MONTH(don_dat_phong.ngay_gio_dat) AS thang, sum(so_khach) AS tong_so_luot_khach
	FROM phong_thue, don_dat_phong 
	WHERE phong_thue.ma_dat_phong = don_dat_phong.ma_dat_phong
	AND phong_thue.ma_chi_nhanh = input_chi_nhanh
	AND don_dat_phong.trinh_trang = 1
	AND YEAR(don_dat_phong.ngay_gio_dat) = input_year
	GROUP BY MONTH(don_dat_phong.ngay_gio_dat)
	ORDER BY MONTH(don_dat_phong.ngay_gio_dat) ASC;
END$$
DELIMITER ;

CALL ThongKeLuotKhach("CN5", 2015)