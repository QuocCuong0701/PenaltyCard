package com.penalty.service;

import com.penalty.model.UserModel;
import com.penalty.paging.Pageble;

import java.util.List;

public interface IUserService {
    UserModel findByUserNameAndPassword(String userName, String password);
    UserModel save(UserModel userModel);
    UserModel update(UserModel userModel);
    void delete(int[] ids);
    List<UserModel> findAll(Pageble pageble);
    List<UserModel> findAll();
    List<UserModel> findAllUserName();
    int getTotalItem();
}
