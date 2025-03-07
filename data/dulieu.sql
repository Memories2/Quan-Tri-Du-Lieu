#drop database quanlykytucxa;

use quanlykytucxa;

-- Bảng sinh_vien
INSERT INTO `quanlykytucxa`.`sinh_vien` (`masv`, `so_dien_thoai`, `ho_ten`, `mat_khau`, `gioi_tinh`, `role`) VALUES
('SV016', '0901234565', 'Nguyen Van 16', 'matkhau1', 'Nam', 'admin'),
('SV001', '0901234567', 'Nguyen Van A', 'matkhau1', 'Nam', 'user'),
('SV002', '0912345678', 'Tran Thi B', 'matkhau2', 'Nữ', 'user'),
('SV003', '0923456789', 'Le Van C', 'matkhau3', 'Nam', 'user'),
('SV004', '0934567890', 'Pham Thi D', 'matkhau4', 'Nữ', 'user'),
('SV005', '0945678901', 'Bui Van E', 'matkhau5', 'Nam', 'user'),
('SV006', '0956789012', 'Do Thi F', 'matkhau6', 'Nữ', 'user'),
('SV007', '0967890123', 'Hoang Van G', 'matkhau7', 'Nam', 'user'),
('SV008', '0978901234', 'Dang Thi H', 'matkhau8', 'Nữ', 'user'),
('SV009', '0989012345', 'Vo Van I', 'matkhau9', 'Nam', 'user'),
('SV010', '0990123456', 'Ngo Thi J', 'matkhau10', 'Nữ', 'user'),
('SV011', '0901122334', 'Pham Van K', 'matkhau11', 'Nam', 'user'),
('SV012', '0911223344', 'Tran Thi L', 'matkhau12', 'Nữ', 'user'),
('SV013', '0922334455', 'Le Van M', 'matkhau13', 'Nam', 'user'),
('SV014', '0933445566', 'Nguyen Thi N', 'matkhau14', 'Nữ', 'user'),
('SV015', '0944556677', 'Bui Van O', 'matkhau15', 'Nam', 'user');

-- Bảng dich_vu
INSERT INTO `quanlykytucxa`.`dich_vu` (`don_gia`, `madv`, `ten_dich_vu`) VALUES
(50000, 'DV001', 'Giặt ủi'),
(70000, 'DV002', 'Internet'),
(30000, 'DV003', 'Nước uống'),
(100000, 'DV004', 'Điện'),
(40000, 'DV005', 'Bảo trì'),
(60000, 'DV006', 'Dọn dẹp'),
(50000, 'DV007', 'Nước nóng'),
(20000, 'DV008', 'Chỗ để xe'),
(80000, 'DV009', 'Cáp truyền hình'),
(30000, 'DV010', 'Dịch vụ an ninh'),
(90000, 'DV011', 'Điều hòa'),
(75000, 'DV012', 'Phòng tập gym'),
(85000, 'DV013', 'Thư viện'),
(95000, 'DV014', 'Nước giếng khoan'),
(65000, 'DV015', 'Dịch vụ vệ sinh');

-- Bảng loai_phong
INSERT INTO `quanlykytucxa`.`loai_phong` (`gia_thue`, `ma_loai_phong`, `ten_loai_phong`) VALUES
(2000000, 'LP001', 'Phòng đơn'),
(1800000, 'LP002', 'Phòng đôi'),
(1600000, 'LP004', 'Phòng bốn'),
(1400000, 'LP006', 'Phòng sáu'),
(1200000, 'LP008','Phòng tám');
-- Bảng phong
INSERT INTO `quanlykytucxa`.`phong` (`ma_loai_phong`, `ma_phong`, `so_luong_toi_da`, `so_phong`, `tinh_trang`) VALUES
('LP001', 'P001', 1, 101, 'Trống'),
('LP002', 'P002', 2, 102, 'Đầy'),
('LP001', 'P003', 1, 103, 'Trống'),
('LP004', 'P004', 4, 104, 'Đầy'),
('LP001', 'P005', 1, 105, 'Trống'),
('LP006', 'P006', 6, 106, 'Đầy'),
('LP002', 'P007', 2, 107, 'Trống'),
('LP008', 'P008', 8, 108, 'Đầy'),
('LP001', 'P009', 1, 109, 'Trống'),
('LP002', 'P010', 2, 110, 'Đầy'),
('LP004', 'P011', 4, 111, 'Trống'),
('LP006', 'P012', 6, 112, 'Đầy'),
('LP001', 'P013', 1, 113, 'Trống'),
('LP008', 'P014', 8, 114, 'Đầy'),
('LP008', 'P015', 3, 115, 'Trống');

-- Bảng hop_dong
INSERT INTO `quanlykytucxa`.`hop_dong` (`ma_phong`, `mahd`, `ngay_bat_dau`, `ngay_ket_thuc`, `masv`) VALUES
('P001', 'HD016', '2024-01-01', '2025-01-01', 'SV016'),
('P001', 'HD001', '2024-01-01', '2025-01-01', 'SV001'),
('P002', 'HD002', '2024-02-01', '2025-02-01', 'SV002'),
('P003', 'HD003', '2024-03-01', '2025-03-01', 'SV003'),
('P004', 'HD004', '2024-04-01', '2025-04-01', 'SV004'),
('P005', 'HD005', '2024-05-01', '2025-05-01', 'SV005'),
('P006', 'HD006', '2024-06-01', '2025-06-01', 'SV006'),
('P007', 'HD007', '2024-07-01', '2025-07-01', 'SV007'),
('P008', 'HD008', '2024-08-01', '2025-08-01', 'SV008'),
('P009', 'HD009', '2024-09-01', '2025-09-01', 'SV009'),
('P010', 'HD010', '2024-10-01', '2025-10-01', 'SV010'),
('P011', 'HD011', '2024-11-01', '2025-11-01', 'SV011'),
('P012', 'HD012', '2024-12-01', '2025-12-01', 'SV012'),
('P013', 'HD013', '2025-01-01', '2026-01-01', 'SV013'),
('P014', 'HD014', '2025-02-01', '2026-02-01', 'SV014'),
('P015', 'HD015', '2025-03-01', '2026-03-01', 'SV015');


-- Bảng su_dung_dich_vu
INSERT INTO `quanlykytucxa`.`su_dung_dich_vu` (`madv`, `mahd`, `masddv`, `nam_su_dung`, `so_luong_su_dung`, `thang_su_dung`) VALUES
('DV001', 'HD001', 'SDDV001', 2024, 5, 1),
('DV002', 'HD002', 'SDDV002', 2024, 3, 2),
('DV003', 'HD003', 'SDDV003', 2024, 2, 3),
('DV004', 'HD004', 'SDDV004', 2024, 4, 4),
('DV005', 'HD005', 'SDDV005', 2024, 1, 5),
('DV006', 'HD006', 'SDDV006', 2024, 3, 6),
('DV007', 'HD007', 'SDDV007', 2024, 2, 7),
('DV008', 'HD008', 'SDDV008', 2024, 5, 8),
('DV009', 'HD009', 'SDDV009', 2024, 4, 9),
('DV010', 'HD010', 'SDDV010', 2024, 3, 10),
('DV011', 'HD011', 'SDDV011', 2024, 6, 11),
('DV012', 'HD012', 'SDDV012', 2024, 5, 12),
('DV013', 'HD013', 'SDDV013', 2024, 3, 1),
('DV014', 'HD014', 'SDDV014', 2024, 2, 2),
('DV015', 'HD015', 'SDDV015', 2024, 4, 3);

-- Bảng hoa_don
INSERT INTO `quanlykytucxa`.`hoa_don` (`ma_hoa_don`, `masddv`, `ngay_het_han`, `ngay_lap`, `tong_tien`) VALUES
('HDN001', 'SDDV001', '2024-02-01', '2024-01-15', 250000),
('HDN002', 'SDDV002', '2024-03-01', '2024-02-15', 210000),
('HDN003', 'SDDV003', '2024-04-01', '2024-03-15', 150000),
('HDN004', 'SDDV004', '2024-05-01', '2024-04-15', 200000),
('HDN005', 'SDDV005', '2024-06-01', '2024-05-15', 120000),
('HDN006', 'SDDV006', '2024-07-01', '2024-06-15', 180000),
('HDN007', 'SDDV007', '2024-08-01', '2024-07-15', 140000),
('HDN008', 'SDDV008', '2024-09-01', '2024-08-15', 300000),
('HDN009', 'SDDV009', '2024-10-01', '2024-09-15', 270000),
('HDN010', 'SDDV010', '2024-11-01', '2024-10-15', 250000),
('HDN011', 'SDDV011', '2024-12-01', '2024-11-15', 320000),
('HDN012', 'SDDV012', '2025-01-01', '2024-12-15', 290000),
('HDN013', 'SDDV013', '2025-02-01', '2025-01-15', 170000),
('HDN014', 'SDDV014', '2025-03-01', '2025-02-15', 150000),
('HDN015', 'SDDV015', '2025-04-01', '2025-03-15', 220000);

#lấy số dinh viên trong 1 phòng ktx
DELIMITER //
CREATE PROCEDURE GetSinhVienTrongPhong(IN ma_phong_input VARCHAR(10))
BEGIN
    SELECT sv.*
    FROM sinh_vien sv
    JOIN hop_dong hd ON sv.masv = hd.masv
    WHERE hd.ma_phong = ma_phong_input;
END //
DELIMITER ;

#Lấy danh sách tất cả sinh viên
DELIMITER //
CREATE PROCEDURE GetSinhVien()
BEGIN
    SELECT sv.*
    FROM sinh_vien sv;
END //
DELIMITER ;

#lấy số dinh viên theo số điện thoại
DELIMITER //
CREATE PROCEDURE GetSinhVienSDT(IN sdt VARCHAR(15))
BEGIN
    SELECT sv.*
    FROM sinh_vien sv
    WHERE sv.so_dien_thoai = sdt;
END //
DELIMITER ;
#call GetSinhVienSDT('0978901234')


#lấy số dinh viên theo tên sinh viên
DELIMITER //
CREATE PROCEDURE GetSinhVienTen(IN ten NVARCHAR(255))
BEGIN
   SELECT sv.*
FROM sinh_vien sv
WHERE UPPER(sv.ho_ten) = UPPER(ten);

END //
DELIMITER ;
#call GetSinhVienTen('nguyen van a')

#lấy số dinh viên theo ma so sinh viên
DELIMITER //
CREATE PROCEDURE GetSinhVienMasv(IN masv VARCHAR(8))
BEGIN
    SELECT sv.*
    FROM sinh_vien sv
    WHERE upper(sv.masv) = upper(masv);
END //
DELIMITER ;

