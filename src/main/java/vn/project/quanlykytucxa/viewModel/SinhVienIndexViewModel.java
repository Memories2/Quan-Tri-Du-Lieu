package vn.project.quanlykytucxa.viewModel;

import vn.project.quanlykytucxa.domain.SinhVien.GioiTinh;

public class SinhVienIndexViewModel {

	public String maSV;

	public String hoTen;
	public GioiTinh gioiTinh;
	public String soDienThoai;
	public SinhVienIndexViewModel(String maSV, String hoTen, GioiTinh gioiTinh, String soDienThoai) {
	
		this.maSV = maSV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
	}
	
	

}
