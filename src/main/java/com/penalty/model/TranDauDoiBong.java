package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranDauDoiBong extends AbstractModel<TranDauDoiBong> {

    private int id;
    private int tranDauId;
    private int doiBongId;
    private String ma;
    private String ghiChu;

}
