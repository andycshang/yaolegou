package edu.ustb.yaolegou.controller;

import edu.ustb.yaolegou.entity.ShopInfo;
import edu.ustb.yaolegou.entity.ShopMingxi;
import edu.ustb.yaolegou.entity.Shopcart;
import edu.ustb.yaolegou.service.ShopInfoService;
import edu.ustb.yaolegou.service.ShopcartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopDetailServlet", value = "/ShopDetail")
public class ShopDetailServlet extends HttpServlet {
    ShopInfoService shopInfoService = new ShopInfoService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("test/html;charset=UTF-8");
        String State = request.getParameter("State");
        if(State == null){
            String ShopId = request.getParameter("ShopId");
            ShopInfo si = shopInfoService.selectById(Integer.parseInt(ShopId));
            String color = si.getColor();
            String[] Color = color.split(",");
            String chicun = si.getChiCun();
            String[] ChiCun = chicun.split(",");
            List<ShopMingxi> ShopMingXiList =
                    shopInfoService.selectAllMingxi(Integer.parseInt(ShopId));
            request.setAttribute("ChiCun",ChiCun);
            request.setAttribute("Color",Color);
            request.setAttribute("ShopMingXiList",ShopMingXiList);
            request.setAttribute("si",si);
            request.getRequestDispatcher("/shopdetail.jsp").forward(request,response);
        }else if(State.equals("Color")){
        }else if(State.equals("add")){
            String img = request.getParameter("img");
            String shopid = request.getParameter("id");
            String shopname = request.getParameter("shopname");
            String yanse = request.getParameter("yanse");
            String chicun = request.getParameter("chicun");
            String jiage = request.getParameter("jiage");
            String count = request.getParameter("count");
            String userName = request.getParameter("UserName");
            Shopcart sc = new Shopcart();
            sc.setShopName(shopname);
            sc.setImage(img);
            sc.setUserName(userName);
            sc.setPrice(Double.parseDouble(jiage));
            sc.setShopId(Integer.parseInt(shopid));
            sc.setCount(Integer.parseInt(count));
            sc.setColor(yanse);
            sc.setChiCun(chicun);
            ShopcartService scService = new ShopcartService();
            int result = scService.shopcartItemAdd(sc);
            response.getWriter().print(result>0);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request,response);
    }
}
