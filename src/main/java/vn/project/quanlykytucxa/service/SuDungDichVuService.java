package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.SuDungDichVu;
import vn.project.quanlykytucxa.repository.SuDungDichVuRepository;

@Service
public class SuDungDichVuService {

    private final SuDungDichVuRepository suDungDichVuRepository;

    @Autowired
    public SuDungDichVuService(SuDungDichVuRepository suDungDichVuRepository) {
        this.suDungDichVuRepository = suDungDichVuRepository;
    }

	public void save(SuDungDichVu dangKy) {
		suDungDichVuRepository.save(dangKy);
		
	}

	public boolean existsById(String maSDDV) {
		// TODO Auto-generated method stub
		return suDungDichVuRepository.existsById(maSDDV);
	}

    // Viết các phương thức xử lý nghiệp vụ tại đây
}
