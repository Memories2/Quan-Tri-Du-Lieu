

# Kiểm tra trước khi chèn hợp đồng
Use quanlykytucxa
DELIMITER //
CREATE TRIGGER before_hop_dong_insert
BEFORE INSERT ON hop_dong
FOR EACH ROW
BEGIN
	DECLARE sv_exists INT;
    DECLARE phong_status VARCHAR(20);
    DECLARE so_sv INT;
    DECLARE max_sv INT;

    -- Kiểm tra sinh viên đã có hợp đồng với trang_thai = 0 hay chưa
    SELECT IF(
        EXISTS(SELECT 1 FROM hop_dong WHERE masv = NEW.masv AND trang_thai = 1), 
        1, 0
    ) INTO sv_exists;
    
    -- Kiểm tra trạng thái phòng --
    select tinh_trang into phong_status
    from phong
    where ma_phong = NEW.ma_phong;
    
    -- Đếm số sinh viên trong phòng --
    Select count(*) into so_sv
    from hop_dong
    where ma_phong = NEW.ma_phong and ngay_ket_thuc >= curdate();
    
     -- Lấy số lượng tối đa của phòng
    SELECT so_luong_toi_da INTO max_sv 
    FROM phong 
    WHERE ma_phong = NEW.ma_phong;
    
    -- Kiểm tra các điều kiện -- 
     IF sv_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sinh viên này đã có hợp đồng đang hoạt động';
    ELSEIF phong_status = 'SUACHUA' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phòng đang trong tình trạng sửa chữa';
    ELSEIF so_sv >= max_sv THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phòng đã đầy';
    END IF;
END //
DELIMITER ;
    

# Cập nhật trạng thái phòng sau khi chèn hợp đồng
DELIMITER //
CREATE TRIGGER after_hop_dong_insert
AFTER INSERT ON hop_dong
FOR EACH ROW
BEGIN
    DECLARE so_sv INT;
    DECLARE max_sv INT;
    
    -- Đếm số sinh viên trong phòng
        SELECT COUNT(*) INTO so_sv 
        FROM hop_dong 
        WHERE ma_phong = NEW.ma_phong AND trang_thai = 1;
    
    -- Lấy số lượng tối đa của phòng
    SELECT so_luong_toi_da INTO max_sv 
    FROM phong 
    WHERE ma_phong = NEW.ma_phong;
    
    -- Cập nhật trạng thái phòng nếu đầy
    IF so_sv >= max_sv THEN
        UPDATE phong SET tinh_trang = 'DAY' WHERE ma_phong = NEW.ma_phong;
    END IF;
END //
DELIMITER ;


# Cập nhật trạng thái phòng sau khi xóa hợp đồng
DELIMITER //
CREATE TRIGGER after_hop_dong_delete
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
    DECLARE so_sv INT;
    
    -- Đếm số sinh viên còn lại trong phòng
    SELECT COUNT(*) INTO so_sv 
    FROM hop_dong 
    WHERE ma_phong = OLD.ma_phong AND ngay_ket_thuc >= CURDATE();
    
    -- Nếu không còn sinh viên, cập nhật trạng thái phòng thành trống
    IF so_sv = 0 THEN
        UPDATE phong SET tinh_trang = 'TRONG' WHERE ma_phong = OLD.ma_phong;
    END IF;
END //
DELIMITER ;



# Tự động cập nhật hợp đồng hằng ngày
-- Bật tính năng event scheduler
SET GLOBAL event_scheduler = ON;

-- Tạo event chạy mỗi ngày vào 00:01 để cập nhật trạng thái
DELIMITER //
CREATE EVENT update_hop_dong_trang_thai
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_DATE + INTERVAL 1 DAY
DO
BEGIN
    -- Cập nhật hợp đồng hết hạn (ngày kết thúc < ngày hiện tại)
    UPDATE hop_dong 
    SET trang_thai = 0
    WHERE ngay_ket_thuc < CURDATE() AND trang_thai = 1;
    
    -- Cập nhật hợp đồng còn hạn (ngày kết thúc >= ngày hiện tại)
    UPDATE hop_dong 
    SET trang_thai = 1
    WHERE ngay_ket_thuc >= CURDATE() AND trang_thai = 0;
END//
DELIMITER ;
