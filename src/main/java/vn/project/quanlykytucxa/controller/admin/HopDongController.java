package vn.project.quanlykytucxa.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.project.quanlykytucxa.service.HopDongService;

@RestController
public class HopDongController {

    @Autowired
    private HopDongService hopDongService;

    @GetMapping("/hopdong/kiemTraHetHan")
    public boolean kiemTraHopDongHetHan(@RequestParam("maSV") String maSV) {
        return hopDongService.kiemTraHopDongHetHan(maSV);
    }
}