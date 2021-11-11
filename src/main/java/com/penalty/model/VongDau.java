package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VongDau extends AbstractModel<VongDau> {

    private int id;
    private int giaiDauId;
    private String maVongDau;
    private String tenVongDau;

}
