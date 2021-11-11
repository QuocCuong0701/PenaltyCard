package com.penalty.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrongTaiTranDau extends AbstractModel<TrongTaiTranDau> {

    private int id;
    private int tranDauId;
    private int trongTaiId;
    private String ghiChu;
    private float soTien;


}
