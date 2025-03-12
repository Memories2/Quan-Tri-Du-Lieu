package vn.project.quanlykytucxa.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.exception.BusinessException;
import vn.project.quanlykytucxa.repository.HopDongRepository;

@Service
public class HopDongService {

    @Autowired
    private HopDongRepository hopDongRepository;

    @Transactional(readOnly = true)
    public String kiemTraHopDong(String maSV) {
        // Kiểm tra mã sinh viên có hợp đồng hay không
        if (!hopDongRepository.existsBySinhVienMaSV(maSV)) {
            return "Không có hợp đồng cho sinh viên này.";
        }

        // Lấy ngày kết thúc hợp đồng của sinh viên
        LocalDate ngayKetThuc = hopDongRepository.getNgayKetThucByMaSV(maSV);
        
        if (ngayKetThuc == null) {
            return "Không có hợp đồng cho sinh viên này.";
        }

        // So sánh ngày kết thúc hợp đồng với ngày hiện tại
        if (ngayKetThuc.isBefore(LocalDate.now())) {
            return "Hợp đồng đã hết hạn.";
        } else {
            return "Hợp đồng còn hạn.";
        }
    }

    /////////// Đỗ Thành Tài//////

    // check hợp đồng tồn tại
    public boolean existsById(String maHopDong) {
        return hopDongRepository.existsById(maHopDong);
    }

    @Transactional(readOnly = true)
    public List<HopDong> layTatCaHopDongHopLeCuaMotPhong(String maPhong) {

        List<HopDong> hopDongs = hopDongRepository.findAllByPhongId(maPhong);
        List<HopDong> hopDongsHopLe = hopDongs.stream()
                .filter(hopDong -> hopDong.getTrangThai() == 1).toList();
        return hopDongsHopLe;
    }

    public void themHopDong(HopDong hopDong) {
        try {
            hopDongRepository.save(hopDong);
        } catch (Exception e) {
            // Add debug logging to see the exact exception
            System.out.println("Exception type: " + e.getClass().getName());
            System.out.println("Exception message: " + e.getMessage());

            // Get the root cause
            Throwable rootCause = ExceptionUtils.getRootCause(e);
            String message = rootCause != null ? rootCause.getMessage() : e.getMessage();

            if (message.contains("Sinh viên này đã có hợp đồng đang hoạt động")) {
                throw new BusinessException("SV_EXISTS", "Sinh viên này đã có hợp đồng đang hoạt động");
            } else if (message.contains("Phòng đang trong tình trạng sửa chữa")) {
                throw new BusinessException("ROOM_MAINTENANCE", "Phòng đang trong tình trạng sửa chữa");
            } else if (message.contains("Phòng đã đầy")) {
                throw new BusinessException("ROOM_FULL", "Phòng đã đầy, không thể thêm sinh viên");
            } else {
                // Nếu có lỗi khác từ database
                throw new BusinessException("DB_ERROR", "Lỗi khi lưu hợp đồng: " + message);
            }
        }
        
    }

    /////////// lấy tất cả hợp động ////
    @Transactional(readOnly = true)
    public List<HopDong> layTatCaHopDong() {
        return hopDongRepository.findAll();
    }

}