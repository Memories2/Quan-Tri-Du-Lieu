package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.repository.SuDungDichVuRepository;

@Service
public class SuDungDichVuService {

    private final SuDungDichVuRepository suDungDichVuRepository;

    @Autowired
    public SuDungDichVuService(SuDungDichVuRepository suDungDichVuRepository) {
        this.suDungDichVuRepository = suDungDichVuRepository;
    }

    // Viết các phương thức xử lý nghiệp vụ tại đây
}
