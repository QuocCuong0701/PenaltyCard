package com.penalty.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BanToChuc extends AbstractModel<BanToChuc> {

    private int id;
    private String maBanToChuc;
    private String soDienThoai;
    private String email;

}
