package com.penalty.dao;

import com.penalty.model.UserModel;
import com.penalty.paging.Pageble;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
    UserModel findByUserNameAndPassword(String userName, String password);
    int save(UserModel userModel);
    void delete(int user_id);
    void update(UserModel userModel);
    List<UserModel> findAll(Pageble pageble);
    List<UserModel> findAll();
    List<UserModel> findAllUserName();
    UserModel findOne(int user_id);
    int getTotalItem();
}
