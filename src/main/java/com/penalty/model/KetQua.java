package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KetQua extends AbstractModel<KetQua> {

    private int id;
    private int soTheVang;
    private int soTheDo;
    private int soBanThang;
    private int soPhaPhamLoi;
    private int banToChucId;
    private int tranDauId;

}
