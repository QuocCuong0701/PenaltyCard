package com.penalty.service.impl;

import com.penalty.dao.IUserDAO;
import com.penalty.model.UserModel;
import com.penalty.paging.Pageble;
import com.penalty.service.IUserService;

import javax.inject.Inject;
import java.util.List;

public class UserService implements IUserService {
    @Inject
    private IUserDAO iUserDAO;

    @Override
    public UserModel findByUserNameAndPassword(String userName, String password) {
        return iUserDAO.findByUserNameAndPassword(userName, password);
    }

    @Override
    public UserModel save(UserModel userModel) {
        int user_id = iUserDAO.save(userModel);
        return iUserDAO.findOne(user_id);
    }

    @Override
    public UserModel update(UserModel userModel) {
        iUserDAO.update(userModel);
        return iUserDAO.findOne(userModel.getUser_id());
    }

    @Override
    public void delete(int[] ids) {
        for (int id :ids) {
            iUserDAO.delete(id);
        }
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        return iUserDAO.findAll(pageble);
    }

    @Override
    public List<UserModel> findAll() {
        return iUserDAO.findAll();
    }

    @Override
    public List<UserModel> findAllUserName() {
        return iUserDAO.findAllUserName();
    }

    @Override
    public int getTotalItem() {
        return iUserDAO.getTotalItem();
    }
}
