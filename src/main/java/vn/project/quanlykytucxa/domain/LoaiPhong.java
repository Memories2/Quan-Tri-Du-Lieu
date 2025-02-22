package vn.project.quanlykytucxa.domain;

import java.math.BigDecimal;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class LoaiPhong {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maLoaiPhong;

	@Column(nullable = false, length = 255)
	private String tenLoaiPhong;

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal giaThue;

	public LoaiPhong(Integer maLoaiPhong, String tenLoaiPhong, BigDecimal giaThue) {
		super();
		this.maLoaiPhong = maLoaiPhong;
		this.tenLoaiPhong = tenLoaiPhong;
		this.giaThue = giaThue;
	}

	public String getTenLoaiPhong() {
		return tenLoaiPhong;
	}

	public void setTenLoaiPhong(String tenLoaiPhong) {
		this.tenLoaiPhong = tenLoaiPhong;
	}

	public BigDecimal getGiaThue() {
		return giaThue;
	}

	public void setGiaThue(BigDecimal giaThue) {
		this.giaThue = giaThue;
	}

	public Integer getMaLoaiPhong() {
		return maLoaiPhong;
	}

	public LoaiPhong() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		return Objects.hash(maLoaiPhong);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoaiPhong other = (LoaiPhong) obj;
		return Objects.equals(maLoaiPhong, other.maLoaiPhong);
	}
}
