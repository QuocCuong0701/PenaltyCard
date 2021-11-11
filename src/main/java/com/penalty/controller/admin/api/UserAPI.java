package com.penalty.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.penalty.model.UserModel;
import com.penalty.service.IUserService;
import com.penalty.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api-admin-user"})
public class UserAPI extends HttpServlet {
    @Inject
    private IUserService iUserService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel addUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        List<UserModel> allUser = iUserService.findAllUserName();
        boolean check = true;
        for (UserModel userModel : allUser) {
            if (addUser.getUser_name().equalsIgnoreCase(userModel.getUser_name()) || addUser.getUser_email().equalsIgnoreCase(userModel.getUser_email())) {
                check = false;
                break;
            }
        }
        if (check) {
            iUserService.save(addUser);
            mapper.writeValue(resp.getOutputStream(), addUser);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel updateUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        updateUser = iUserService.update(updateUser);
        mapper.writeValue(resp.getOutputStream(), updateUser);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel deleteUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        iUserService.delete(deleteUser.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
