INSERT INTO `DBSysLab`.`chi_nhanh` (`ma_chi_nhanh`, `tinh`, `dia_chi`, `dien_thoai`, `email`) 
VALUES 	('CN1', 'Province 001', 'Tiền Giang Address', '0123456789', 'tienggian@gmail.com'),
		('CN2', 'Province 002', 'Long An Address', '0123456789', 'longan@gmail.com'),
		('CN3', 'Province 003', 'Lâm Đồng Address', '0123456789', 'lamdong@gmail.com'),
		('CN4', 'Province 004', 'Đà Lạt Address', '0123456789', 'dalat@gmail.com'),
		('CN5', 'Province 005', 'Hà Nội Address', '0123456789', 'hanoi@gmail.com');
        
INSERT INTO `DBSysLab`.`hinh_anh_chi_nhanh` (`ma_chi_nhanh`, `hinh_anh`) 
VALUES	('CN1', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN2', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN3', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN4', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg'),
		('CN5', 'https://thuvienanime.com/wp-content/uploads/2021/10/thach-hao-thegioihoanmy.jpeg');

INSERT INTO `DBSysLab`.`khu` (`ma_chi_nhanh`, `ten_khu`) 
VALUES	('CN1', 'zone_01'), ('CN1', 'zone_02'), ('CN1', 'zone_03'), ('CN1', 'zone_04'), ('CN1', 'zone_05'),
		('CN2', 'zone_01'), ('CN2', 'zone_02'), ('CN2', 'zone_03'), ('CN2', 'zone_04'), ('CN2', 'zone_05'),
		('CN3', 'zone_01'), ('CN3', 'zone_02'), ('CN3', 'zone_03'), ('CN3', 'zone_04'), ('CN3', 'zone_05'),
		('CN4', 'zone_01'), ('CN4', 'zone_02'), ('CN4', 'zone_03'), ('CN4', 'zone_04'), ('CN4', 'zone_05'),
		('CN5', 'zone_01'), ('CN5', 'zone_02'), ('CN5', 'zone_03'), ('CN5', 'zone_04'), ('CN5', 'zone_05');

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
        ('10', 'Murphy', '30', '3', 'A room that is fitted with a sofa bed or a Murphy bed ');

INSERT INTO `DBSysLab`.`thong_tin_giuong` (`ma_loai_phong`, `kich_thuoc`, `so_luong`) 
VALUES 	('1', '5.5', '5'), ('2', '5.6', '4'), ('3', '5.7', '3'), ('4', '5.8', '2'), ('5', '5.9', '1'),
		('6', '6.0', '6'), ('7', '6.1', '7'), ('8', '6.2', '8'), ('9', '6.3', '9'), ('10', '6.4', '10');
    
INSERT INTO `DBSysLab`.`chi_nhanh_co_loai_phong` (`ma_loai_phong`, `ma_chi_nhanh`, `gia_thue`) 
VALUES 	('1', 'CN1', '1000'), ('2', 'CN1', '1010'), ('3', 'CN2', '1020'), ('4', 'CN2', '1030'), ('5', 'CN3', '1040'),
		('6', 'CN3', '1050'), ('7', 'CN4', '1060'), ('8', 'CN4', '1070'), ('9', 'CN5', '1080'), ('10', 'CN5', '1090');

INSERT INTO `DBSysLab`.`phong` (`ma_chi_nhanh`, `so_phong`, `ma_loai_phong`, `ten_khu`) 
VALUES 	('CN1', '101', '1', 'zone_01'), ('CN1', '201', '2', 'zone_02'), ('CN1', '301', '3', 'zone_03'), 
		('CN1', '401', '4', 'zone_04'), ('CN1', '501', '5', 'zone_05'),	-- 5 rooms at CN1, zone_01, zone_02, zone_03, zone_04, zone_05
		('CN2', '101', '1', 'zone_01'), ('CN2', '201', '2', 'zone_02'), ('CN2', '301', '3', 'zone_03'), 
        ('CN2', '401', '4', 'zone_04'), ('CN2', '501', '5', 'zone_05'),	-- 5 rooms at CN2, zone_01, zone_02, zone_03, zone_04, zone_05
		('CN3', '101', '1', 'zone_01'), ('CN3', '201', '2', 'zone_02'), ('CN3', '301', '3', 'zone_03'), 
        ('CN3', '401', '4', 'zone_04'), ('CN3', '501', '5', 'zone_05'),	-- 5 rooms at CN3, zone_01, zone_02, zone_03, zone_04, zone_05
        ('CN4', '101', '1', 'zone_01'), ('CN4', '201', '2', 'zone_02'), ('CN4', '301', '3', 'zone_03'), 
        ('CN4', '401', '4', 'zone_04'), ('CN4', '501', '5', 'zone_05'),	-- 5 rooms at CN4, zone_01, zone_02, zone_03, zone_04, zone_05
        ('CN5', '101', '1', 'zone_01'), ('CN5', '201', '2', 'zone_02'), ('CN5', '301', '3', 'zone_03'), 
        ('CN5', '401', '4', 'zone_04'), ('CN5', '501', '5', 'zone_05');	-- 5 rooms at CN5, zone_01, zone_02, zone_03, zone_04, zone_05
        
INSERT INTO `DBSysLab`.`loai_vat_tu` (`ma_loai_vat_tu`, `ten_loai_vat_tu`) 
VALUES 	('VT0001', 'Tên loại vật tư 1'), ('VT0002', 'Tên loại vật tư 2'), 
		('VT0003', 'Tên loại vật tư 3'), ('VT0004', 'Tên loại vật tư 4'),
        ('VT0005', 'Tên loại vật tư 5'), ('VT0006', 'Tên loại vật tư 6'),
		('VT0007', 'Tên loại vật tư 7'), ('VT0008', 'Tên loại vật tư 8'),
		('VT0009', 'Tên loại vật tư 9'), ('VT0010', 'Tên loại vật tư 10');
        
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
VALUES 	('312483817', 'Fullname001', '0342741004', '001@gmail.com', 'u001', 'p001', '2', '2'),
		('312483818', 'Fullname002', '0342741005', '002@gmail.com', 'u002', 'p001', '2', '2'),
        ('312483819', 'Fullname003', '0342741006', '003@gmail.com', 'u003', 'p001', '2', '2'),
        ('312483820', 'Fullname004', '0342741007', '004@gmail.com', 'u004', 'p001', '2', '2'),
        ('312483821', 'Fullname005', '0342741008', '005@gmail.com', 'u005', 'p001', '2', '2');


-- INSERT INTO `DBSysLab`.`khach_hang` (`ma_khach_hang`, `cccd`, `ho_ten`, `dien_thoai`, `email`, `username`, `passwordd`, `pointt`, `typee`)
-- VALUES 	('KH000001', '312483850', 'Đức Huy', '0342741001', '001@gmail.com', 'u001', 'p001', '2', '2'),
-- 		('KH000002', '312483851', 'Châu Nguyễn', '0342741002', '002@gmail.com', 'u002', 'p001', '2', '2'),
--         ('KH000003', '312483852', 'Nguyễn Trần', '0342741003', '003@gmail.com', 'u003', 'p001', '2', '2'),
--         ('KH000004', '312483853', 'Trần Anh', '0342741004', '004@gmail.com', 'u004', 'p001', '2', '2'),
--         ('KH000005', '312483854', 'Cao Nguyễn', '0342741005', '005@gmail.com', 'u005', 'p001', '2', '2'),
--         ('KH000006', '312483855', 'Phạm Nguyễn', '0342741006', '006@gmail.com', 'u006', 'p001', '2', '2'),
--         ('KH000007', '312483856', 'Trần Nguyễn', '0342741007', '007@gmail.com', 'u007', 'p001', '2', '2'),
--         ('KH000008', '312483857', 'Phan Anh', '0342741008', '008@gmail.com', 'u008', 'p001', '2', '2'),
--         ('KH000009', '312483858', 'Đức Anh', '0342741009', '009@gmail.com', 'u009', 'p001', '2', '2'),
--         ('KH000010', '312483859', 'Châu Kiệt', '0342741010', '010@gmail.com', 'u010', 'p001', '2', '2'),
--         ('KH000013', '312483899', 'FullName003', '0342741013', '013@gmail.com', 'u013', 'p001', '2', '2'),
-- 		('KH000014', '312483862', 'FullName004', '0342741014', '014@gmail.com', 'u014', 'p001', '2', '2'),
-- 		('KH000015', '312483863', 'FullName005', '0342741015', '015@gmail.com', 'u015', 'p001', '2', '2'),
-- 		('KH000016', '312483864', 'FullName006', '0342741016', '016@gmail.com', 'u016', 'p001', '2', '2'),
-- 		('KH000017', '312483865', 'FullName007', '0342741017', '017@gmail.com', 'u017', 'p001', '2', '2'),
-- 		('KH000018', '312483866', 'FullName008', '0342741018', '018@gmail.com', 'u018', 'p001', '2', '2'),
-- 		('KH000019', '312483867', 'FullName009', '0342741019', '019@gmail.com', 'u019', 'p001', '2', '2'),
-- 		('KH000020', '312483868', 'FullName010', '0342741020', '020@gmail.com', 'u020', 'p001', '2', '2'),
-- 		('KH000021', '312483869', 'FullName011', '0342741021', '021@gmail.com', 'u021', 'p001', '2', '2'),
-- 		('KH000022', '312483870', 'FullName012', '0342741022', '022@gmail.com', 'u022', 'p001', '2', '2'),
-- 		('KH000023', '312483871', 'FullName013', '0342741023', '023@gmail.com', 'u023', 'p001', '2', '2'),
-- 		('KH000024', '312483872', 'FullName014', '0342741024', '024@gmail.com', 'u024', 'p001', '2', '2'),
-- 		('KH000025', '312483873', 'FullName015', '0342741025', '025@gmail.com', 'u025', 'p001', '2', '2'),
-- 		('KH000026', '312483874', 'FullName016', '0342741026', '026@gmail.com', 'u026', 'p001', '2', '2');
        
INSERT INTO `DBSysLab`.`goi_dich_vu` (`ten_goi`, `so_ngay`, `so_khach`, `gia`) 
VALUES 	('tengoi001', '12', '1', '14'),
		('tengoi002', '13', '2', '15'),
		('tengoi003', '14', '3', '16'),
        ('tengoi004', '15', '4', '17'),
        ('tengoi005', '16', '5', '18');
        
INSERT INTO `DBSysLab`.`hoa_don_goi_dich_vu` (`ma_khach_hang`, `ten_goi`, `ngay_gio_mua`, `ngay_bat_dau`, `tong_tien`) 
VALUES 	('1', 'tengoi001', '2010-12-31 01:15:00', '2011-12-31', '1000'),
		('2', 'tengoi002', '2010-12-31 01:15:00', '2012-12-31', '1001'),
        ('3', 'tengoi003', '2010-12-31 01:15:00', '2013-12-31', '1002'),
        ('4', 'tengoi004', '2010-12-31 01:15:00', '2014-12-31', '1003'),
        ('5', 'tengoi005', '2010-12-31 01:15:00', '2015-12-31', '1004');

INSERT INTO `DBSysLab`.`don_dat_phong` (`ma_dat_phong`, `ngay_gio_dat`, `so_khach`, `ngay_nhan_phong`, `ngay_tra_phong`, `trinh_trang`, `tong_tien`, `ma_khach_hang`, `ten_goi_dich_vu`) 
VALUES 	('DP02022022000001', '2015-04-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '1', 'tengoi001'),
		('DP03022022000001', '2015-04-03 14:00:45', '1', '2016-04-03', '2017-04-03', '1', '1010', '2', 'tengoi002'),
        ('DP04022022000001', '2015-04-03 14:00:45', '2', '2016-04-03', '2017-04-03', '1', '1010', '3', 'tengoi003'),
        ('DP05022022000001', '2015-04-03 14:00:45', '3', '2016-04-03', '2017-04-03', '1', '1010', '4', 'tengoi004'),
        ('DP06022022000001', '2015-04-03 14:00:45', '5', '2016-04-03', '2017-04-03', '1', '1010', '5', 'tengoi005'),
        ('DP07022022000001', '2015-04-03 14:00:45', '4', '2016-04-03', '2017-04-03', '1', '1010', '1', 'tengoi001');
        
INSERT INTO `DBSysLab`.`phong_thue` (`ma_dat_phong`, `ma_chi_nhanh`, `so_phong`) 
VALUES 	('DP02022022000001', 'CN1', '101'),
		('DP02022022000001', 'CN2', '201'),
		('DP02022022000001', 'CN3', '301'),
		('DP02022022000001', 'CN4', '401'),
		('DP02022022000001', 'CN5', '501');

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
        