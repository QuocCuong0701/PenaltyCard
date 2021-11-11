package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DoiBong extends AbstractModel<DoiBong> {

    private int id;
    private String maDoi;
    private String tenDoi;
    private String trangPhucTruyenThong;
    private String moTa;

}
