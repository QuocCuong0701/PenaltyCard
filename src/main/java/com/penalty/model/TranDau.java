package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranDau extends AbstractModel<TranDau> {

    private int id;
    private int vongDauId;
    private int sanDauId;
    private String ngay;
    private String gio;
    private String listIdTrongTai;
    private String listIdDoiBong;

}
