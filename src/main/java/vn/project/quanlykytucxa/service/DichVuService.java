package vn.project.quanlykytucxa.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.repository.DichVuRepository;

@Service
public class DichVuService {

    private final DichVuRepository dichVuRepository;
 
    public DichVuService(DichVuRepository dichVuRepository) {
        this.dichVuRepository = dichVuRepository;
      
    }

    public void handleDichVu(DichVu dichVu) {
        dichVuRepository.save(dichVu);
    }
    
}
