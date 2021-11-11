package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiaiDau extends AbstractModel<GiaiDau> {

    private int id;
    private String maGiaiDau;
    private String tenGiaiDau;

}
