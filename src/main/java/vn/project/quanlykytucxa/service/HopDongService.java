package vn.project.quanlykytucxa.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.repository.HopDongRepository;

@Service
public class HopDongService {

    @Autowired
    private HopDongRepository hopDongRepository;

    // Kiểm tra hợp đồng hết hạn
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
}
