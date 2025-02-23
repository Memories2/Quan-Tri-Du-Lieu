package vn.project.quanlykytucxa.DTO;

public class SearchSVDTO {
	public String masv;
	public String tenSV;
	public String maPhong;
	public String soDienThoai;

	public SearchSVDTO() {

	}

	public SearchSVDTO(String masv, String tenSV, String maPhong, String soDienThoai) {
		super();
		this.masv = masv;
		this.tenSV = tenSV;
		this.maPhong = maPhong;
		this.soDienThoai = soDienThoai;
	}

	public String getMasv() {
		return masv;
	}

	public void setMasv(String masv) {
		this.masv = masv;
	}

	public String getTenSV() {
		return tenSV;
	}

	public void setTenSV(String tenSV) {
		this.tenSV = tenSV;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

}
