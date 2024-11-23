package edu.ustb.yaolegou.controller;

import edu.ustb.yaolegou.entity.*;
import edu.ustb.yaolegou.service.OrderInfoService;
import edu.ustb.yaolegou.service.ShopInfoService;
import edu.ustb.yaolegou.service.ShopcartService;
import edu.ustb.yaolegou.service.UserService;
import edu.ustb.yaolegou.utils.UUIDUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShopcartServlet", value = "/Shopcart")
public class ShopcartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("test/html;charset=UTF-8");

        String State = request.getParameter("State");
        if(State==null) {
//没有状态，代表可能从任何地方跳转到购物车界面，此时读取用户名，展示该用户的所有商品
            String UserName = request.getParameter("UserName");
            UserService userService = new UserService();
            User user = userService.getUserByName(UserName);
            ShopcartService shopcartService = new ShopcartService();
            ArrayList<Shopcart> list = shopcartService.shopcartSelectItem(user.getUserName());
            request.setAttribute("GouWuChelist", list);
            request.setAttribute("user", user);
            request.getRequestDispatcher("GouWuChe.jsp").forward(request, response);
        }else if(State.equals("AddCount")||State.equals("JianCount")){
//购物车中商品数量的变化
            String id = request.getParameter("id");
            ShopcartService shopcartService = new ShopcartService();
            Shopcart shopcart = shopcartService.shopcartSelectByIdItem(Integer.parseInt(id));
            if(State.equals("AddCount")){
                shopcart.setCount(shopcart.getCount()+1);
            } if(State.equals("JianCount")&&shopcart.getCount()>1) {
                shopcart.setCount(shopcart.getCount()-1);
            } int result = shopcartService.shopcartUpdateItem(shopcart.getId(),shopcart.getCount());
            response.getWriter().print(result);
        }else if(State.equals("del")){
//根据id删除商品，并写回是否成功删除
            String id = request.getParameter("id");
            ShopcartService shopcartService = new ShopcartService();
            int result = shopcartService.shopcartDeleteById(Integer.parseInt(id));
            response.getWriter().print(result>0);
        }
        else if(State.equals("submit")){
/**
 * 前往订单页面
 */
            OrderInfoService orderInfoService = new OrderInfoService();
            ShopInfoService shopInfoService = new ShopInfoService();
            String UserName = request.getParameter("UserName");
            List<SHAddress> shAddressList = orderInfoService.queryAddrByUsername(UserName);
//创建一个订单
            OrderInfo orderInfo = new OrderInfo();
//给订单生成订单编号(UUDID)
            UUIDUtil uuidUtil = new UUIDUtil();
            String uuid = uuidUtil.getUUID();
            orderInfo.setDingdanNumber(uuid);
            orderInfo.setUserName(UserName);
            orderInfo.setZhuRenUser(UserName);
//处理订单,得到订单相关信息
            String[] id = request.getParameterValues("ids");
            String[] shopid = request.getParameterValues("shopid");
            String[] shangpincount = request.getParameterValues("shangpincount");
            String[] shangpincolor = request.getParameterValues("shangpincolor");
            String[] shangpinchicun = request.getParameterValues("shangpinchicun");
            String[] username = request.getParameterValues("usernames");
//王订单详情商品列表插入数据
            OrderItem orderItem;
            orderInfo.setItemlist(new ArrayList<OrderItem>());
            int totalCnt = 0;
            double totalPrice = 0;
            for(int i=0;i<shangpinchicun.length;++i){
                if(!shangpinchicun[i].equals("")){
                    orderItem = new OrderItem();
                    orderItem.setChiCun(shangpinchicun[i]);
                    orderItem.setColor(shangpincolor[i]);
                    int count = Integer.parseInt(shangpincount[i]);
                    orderItem.setCount(count);
                    orderItem.setDingdanNumber(uuid);
                    orderItem.setShopId(Integer.parseInt(shopid[i]));
                    orderItem.setUserName(username[i]);
                    orderItem.setMyUser(UserName);
                    orderItem.setSi(shopInfoService.selectById(orderItem.getShopId()));
                    orderInfo.getItemlist().add(orderItem);
                    totalCnt+=count;
                    totalPrice+=orderItem.getSi().getShopPrice()*count;
                }
            }
            orderInfo.setPrice(totalPrice);
//订单数据添加
            orderInfoService.orderAdd(orderInfo);
            List<Province> proList = orderInfoService.queryAllProvince();
            List<PayType> ptList = orderInfoService.queryAllPayType();
//订单详情表里面的信息
            request.setAttribute("list",orderInfo.getItemlist());
            request.setAttribute("ZhiFuTypeList",ptList);
            request.setAttribute("ShengList",proList);
            request.setAttribute("ShouHuolist",shAddressList);
            request.setAttribute("UserName",UserName);
            request.setAttribute("totalCnt",totalCnt);
            request.setAttribute("orderInfo",orderInfo);
            request.getRequestDispatcher("/order.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request,response);
    }
}