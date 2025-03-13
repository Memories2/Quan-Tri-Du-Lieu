package vn.project.quanlykytucxa.DTO;

import java.util.Objects;

public class SuaTrangThaiPhongDTO {
	public String maPhong;
	public int sldangchua;

	public SuaTrangThaiPhongDTO() {
	}

	public SuaTrangThaiPhongDTO(String maPhong, int sldangchua) {
		super();
		this.maPhong = maPhong;
		this.sldangchua = sldangchua;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public int getSldangchua() {
		return sldangchua;
	}

	public void setSldangchua(int sldangchua) {
		this.sldangchua = sldangchua;
	}

	@Override
	public String toString() {
		return "SuaTrangThaiPhongDTO [maPhong=" + maPhong + ", sldangchua=" + sldangchua + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(maPhong, sldangchua);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SuaTrangThaiPhongDTO other = (SuaTrangThaiPhongDTO) obj;
		return Objects.equals(maPhong, other.maPhong) && sldangchua == other.sldangchua;
	}

}
