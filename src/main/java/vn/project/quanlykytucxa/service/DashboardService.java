package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.repository.HoaDonRepository;
import vn.project.quanlykytucxa.repository.HopDongRepository;
import vn.project.quanlykytucxa.repository.PhongRepository;
import vn.project.quanlykytucxa.repository.SinhVienRepository;

@Service
public class DashboardService {

    @Autowired
    private PhongRepository phongRepository;

    @Autowired
    private SinhVienRepository sinhVienRepository;

    @Autowired
    private HopDongRepository hopDongRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    // Lấy tổng số phòng
    public long getCountPhong() {
        return phongRepository.countAllPhong();
    }

    // Lấy tổng số sinh viên
    public long getCountSinhVien() {
        return sinhVienRepository.countSinhVien();
    }

    // Lấy tổng số hợp đồng
    public long getCountHopDong() {
        return hopDongRepository.countAllHopDong();
    }

    // Lấy tổng số hóa đơn chưa thanh toán
    public long getCountHoaDonChuaThanhToan() {
        return hoaDonRepository.countHoaDonChuaThanhToan();
    }
}
