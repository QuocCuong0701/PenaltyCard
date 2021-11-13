package ThongKe;

import com.penalty.dao.impl.ThongKeDAO;
import com.penalty.dao.impl.TranDauDoiBongDAO;
import com.penalty.model.ThongKe;
import com.penalty.model.TranDauDoiBong;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class ThongKeTest {

    @Inject
    private ThongKeDAO thongKeDAO;

    @Inject
    private TranDauDoiBongDAO tranDauDoiBongDAO;

    @Before
    public void before() {
        thongKeDAO = new ThongKeDAO();
        tranDauDoiBongDAO = new TranDauDoiBongDAO();
    }

    // Lấy danh sách thẻ phạt các đội
    @Test
    public void getPenaltyCardsOfAllTeams() {
        TranDauDoiBong tddb1 = TranDauDoiBong.builder().id(1).tranDauId(1).doiBongId(1)
                .maDoi("D1").tenDoi("MU").ghiChu("khong").soTheVang(2).soTheDo(3).soPhaPhamLoi(4)
                .build();
        TranDauDoiBong tddb2 = TranDauDoiBong.builder().id(2).tranDauId(1).doiBongId(2)
                .maDoi("D2").tenDoi("Juve").ghiChu("good").soTheVang(3).soTheDo(4).soPhaPhamLoi(9)
                .build();
        List<TranDauDoiBong> listExpect = new ArrayList<>();
        listExpect.add(tddb1);
        listExpect.add(tddb2);

        List<TranDauDoiBong> tranDauDoiBongs = tranDauDoiBongDAO.findPenaltyCardsOfAllTeams();
        List<TranDauDoiBong> listActual = new ArrayList<>();
        listActual.add(tranDauDoiBongs.get(0));
        listActual.add(tranDauDoiBongs.get(1));

        Assert.assertTrue(listActual.size() > 0);
        Assert.assertEquals(listExpect, listActual);
    }

    // Danh sách thẻ phạt trống
    @Test
    public void getPenaltyCardsOfAllTeams_Empty() {
        List<TranDauDoiBong> actual = new ArrayList<>();
        Assert.assertEquals(0, actual.size());
    }

    // Lấy thống kê thẻ phạt của 1 đội trong 1 trân đấu
    @Test
    public void getTeamPenaltyCard() {
        ThongKe expect = ThongKe.builder()
                .maDoi("D1").tenDoi("MU").tenSan("Hola")
                .soTheVang(2).soTheDo(3).soPhaPhamLoi(4)
                .tenVongDau("Vong loai 1").ngay("12/11/2021").gio("17")
                .build();

        List<ThongKe> actual = thongKeDAO.findAllPenaltyCardsByDoiBongId(1);

        Assert.assertNotNull(actual);
        Assert.assertTrue(actual.size() > 0);
        Assert.assertEquals(expect, actual.get(0));
    }

    // Danh sách thẻ phạt của 1 đội bóng chưa đá trận nào
    @Test
    public void getPenaltyCardsOfTeamPlayNoMatch() {
        List<ThongKe> actual = thongKeDAO.findAllPenaltyCardsByDoiBongId(5);
        int result = actual.size();
        Assert.assertEquals(0, result);
    }

    // Danh sách thẻ phạt của đội bóng không tồn tại
    @Test
    public void getPenaltyCardsOfTeamDoesntExist() {
        List<ThongKe> actual = thongKeDAO.findAllPenaltyCardsByDoiBongId(999);
        int result = actual.size();
        Assert.assertEquals(0, result);
    }

}
