package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrongTai extends AbstractModel<TrongTai> {

    private int id;
    private String maTrongTai;
    private String tenTrongTai;
    private String soDienThoai;
    private String diaChi;

}
