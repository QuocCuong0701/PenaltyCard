package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TranDauDoiBong extends AbstractModel<TranDauDoiBong> {

    private int id;
    private int tranDauId;
    private int doiBongId;
    private String maDoi;
    private String tenDoi;
    private String ghiChu;
    private int soTheVang;
    private int soTheDo;
    private int soPhaPhamLoi;

}
