package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ThongKe extends AbstractModel<ThongKe> {

    private String maDoi;
    private String tenDoi;
    private String tenSan;
    private String tenDoiThu;
    private int soTheVang;
    private int soTheDo;
    private int soPhaPhamLoi;
    private String tenVongDau;
    private String ngay;
    private String gio;
    private int tranDauId;

}
