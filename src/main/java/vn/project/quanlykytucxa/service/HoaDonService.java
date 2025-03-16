package vn.project.quanlykytucxa.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.HoaDon;
import vn.project.quanlykytucxa.repository.HoaDonRepository;

@Service
public class HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    // Lấy tất cả hóa đơn
    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    // Lấy hóa đơn theo ID
    public HoaDon findById(String id) {
        return hoaDonRepository.findById(id).orElse(null);  // Trả về null nếu không tìm thấy
    }

    // Lấy doanh thu theo tháng và năm
    public BigDecimal baoCaoDoanhThuTheoThang(int thang, int nam, boolean trangThai) {
        return hoaDonRepository.baoCaoDoanhThuTheoThang(thang, nam, trangThai);
    }

    // Lấy danh sách hóa đơn theo trạng thái thanh toán
    public List<HoaDon> findAllByTrangThaiThanhToan(boolean trangThai) {
        return hoaDonRepository.findAllByTrangThaiThanhToan(trangThai);
    }
}
