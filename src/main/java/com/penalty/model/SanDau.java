package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SanDau extends AbstractModel<SanDau> {

    private int id;
    private String maSan;
    private String tenSan;
    private String diaChi;

}
