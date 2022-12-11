USE `DBSysLab`;
DROP procedure IF EXISTS `GoiDichVu`;

DELIMITER $$
USE `DBSysLab`$$
CREATE PROCEDURE `GoiDichVu` (input_ma_khach_hang VARCHAR(255))
BEGIN
	SELECT hd.ten_goi, gdv.so_khach, hd.ngay_bat_dau, 
    DATE_ADD(hd.ngay_bat_dau, INTERVAL 12 MONTH) as ngay_het_han,
    IF (DATEDIFF(DATE_ADD(hd.ngay_bat_dau, INTERVAL 12 MONTH), CURRENT_DATE()) > 0, 
    DATEDIFF(DATE_ADD(hd.ngay_bat_dau, INTERVAL 12 MONTH), CURRENT_DATE()), 0) as so_ngay_con_lai
    FROM hoa_don_goi_dich_vu hd, goi_dich_vu gdv
    WHERE hd.ma_khach_hang = input_ma_khach_hang
    AND hd.ten_goi = gdv.ten_goi
    ;
END$$

DELIMITER ;

CALL GoiDichVu("KH000001")

