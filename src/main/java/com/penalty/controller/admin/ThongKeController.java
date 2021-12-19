package com.penalty.controller.admin;

import com.penalty.constant.SystemConstant;
import com.penalty.model.ThongKe;
import com.penalty.model.TranDauDoiBong;
import com.penalty.service.IThongKeService;
import com.penalty.service.ITranDauDoiBongService;
import com.penalty.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/admin-thong-ke"})
public class ThongKeController extends HttpServlet {

    @Inject
    private IThongKeService iThongKeService;
    @Inject
    private ITranDauDoiBongService iTranDauDoiBongService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TranDauDoiBong tranDauDoiBong = FormUtil.toModel(TranDauDoiBong.class, req);
        ThongKe thongKe = FormUtil.toModel(ThongKe.class, req);
        String view = "";
        switch (tranDauDoiBong.getType()) {
            case "menu":
                view = "/views/admin/thongKe/thongKeMenu.jsp";
                break;
            case SystemConstant.LIST:
                List<TranDauDoiBong> penaltyCardsOfAllTeams = iTranDauDoiBongService.findAll();
                tranDauDoiBong.setListResult(penaltyCardsOfAllTeams);
                view = "/views/admin/thongKe/thongKeThePhat.jsp";
                req.setAttribute(SystemConstant.MODEL, tranDauDoiBong);
                break;
            case SystemConstant.EDIT:
                List<ThongKe> listThongKe = iThongKeService.findAllByDoiBongId(tranDauDoiBong.getId());
                List<Integer> listTranDauIds = listThongKe.stream()
                        .map(ThongKe::getTranDauId).collect(Collectors.toList());
                List<TranDauDoiBong> listOpponents = iTranDauDoiBongService.findOpponentByTranDauId(listTranDauIds);
                setOpponentName(listThongKe, listOpponents);
                listThongKe.sort(Comparator.comparing(ThongKe::getSoTheDo).reversed());
                if (tranDauDoiBong.getId() != 0) {
                    thongKe.setListResult(listThongKe);
                }
                view = "/views/admin/thongKe/thongKeChiTiet.jsp";
                req.setAttribute(SystemConstant.MODEL, thongKe);
                break;
        }

        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    private void setOpponentName(List<ThongKe> listThongKe, List<TranDauDoiBong> listOpponents) {
        for (ThongKe tk : listThongKe) {
            for (TranDauDoiBong tddb : listOpponents) {
                if (!tk.getMaDoi().equals(tddb.getMaDoi()) && tk.getTranDauId() == tddb.getTranDauId()) {
                    tk.setTenDoiThu(tddb.getTenDoi());
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
