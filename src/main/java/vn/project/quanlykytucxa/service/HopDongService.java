package vn.project.quanlykytucxa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.lang3.exception.ExceptionUtils;

import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.repository.HopDongRepository;
import vn.project.quanlykytucxa.exception.BusinessException;

@Service
public class HopDongService {

    @Autowired
    private HopDongRepository hopDongRepository;

    @Transactional(readOnly = true)
    public boolean kiemTraHopDongHetHan(String maSV) {
        int result = hopDongRepository.kiemTraHopDongHetHan(maSV);
        return result == 1;
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