package vn.project.quanlykytucxa.domain;

import java.math.BigDecimal;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class DichVu {
	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 8)
	//private Integer maDV;
	private String maDV;
	public DichVu(String maDV, String tenDichVu, BigDecimal donGia) {
		super();
		this.maDV = maDV;
		this.tenDichVu = tenDichVu;
		this.donGia = donGia;
	}

	public void setMaDV(String maDV) {
		this.maDV = maDV;
	}

	@Column(nullable = false, length = 255)
	private String tenDichVu;

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal donGia;

	public DichVu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DichVu(String tenDichVu, BigDecimal donGia) {
		super();
		this.tenDichVu = tenDichVu;
		this.donGia = donGia;
	}

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public BigDecimal getDonGia() {
		return donGia;
	}

	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}

	public String getMaDV() {
		return maDV;
	}

	@Override
	public int hashCode() {
		return Objects.hash(maDV);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DichVu other = (DichVu) obj;
		return Objects.equals(maDV, other.maDV);
	}

}
