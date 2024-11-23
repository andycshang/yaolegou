package edu.ustb.yaolegou.controller;

import edu.ustb.yaolegou.entity.ShopInfo;
import edu.ustb.yaolegou.entity.ShopInfoVO;
import edu.ustb.yaolegou.service.ShopInfoService;
import edu.ustb.yaolegou.utils.PageBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ShopListServlet", value = "/shoplist")
public class ShopListServlet extends HttpServlet {
    ShopInfoService shopInfoService = new ShopInfoService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("test/html;charset=UTF-8");
        String State = request.getParameter("State");
        if(State == null) {
//分页
            PageBean<ShopInfo> pb = new PageBean<>();
            String page = request.getParameter("page");
            if (page != null && !page.equals("")) {
                pb.setPageIndex(Integer.parseInt(page));
            }else{
                pb.setPageIndex(1);
            }
            pb.setPageRecord(20);
//接收性别分类
            String SexFenLei = request.getParameter("SexFenLei");
            String ma = request.getParameter("ma");
            String banxing = request.getParameter("banxing");
            String s = request.getParameter("s");
            String b = request.getParameter("b");
            ShopInfoVO siv = new ShopInfoVO();
//进行判断
            if(SexFenLei != null && !SexFenLei.equals("全")){
                siv.setSexFenlei(SexFenLei);
            }
            if(ma != null && !ma.equals("部")){
                siv.setSizeFenlei(ma);
            }
            if(banxing != null && !banxing.equals("全部")){
                siv.setBanXing(banxing);
            }
//热度、销量排序
//暂未实现
            pb = shopInfoService.getPage(pb, siv);
//由于http是无状态协议，因此这里将保存到上次跳转前的状态参数初始化再次回到此界面的状态，依次保证页面记住用户上次选择
            request.setAttribute("SexFenLei", SexFenLei);
            request.setAttribute("ma", ma);
            request.setAttribute("banxing", banxing);
            request.setAttribute("s", s);
            request.setAttribute("b", b);
            request.setAttribute("si",pb.getResultList());
            request.setAttribute("pb", pb);
            request.getRequestDispatcher("/shoplist.jsp").forward(request,
                    response);
        }else if(State.equals("Select")){
//通往商品详情页
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request,response);
    }
}
