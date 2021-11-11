package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CauThu extends AbstractModel<CauThu> {

    private int id;
    private int doiBongId;
    private String maCauThu;
    private String tenCauThu;
    private int namSinh;
    private String viTri;
    private String chanThuan;
    private int chieuCao;
    private int canNang;
    private String dacDiem;

}
