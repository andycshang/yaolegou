package edu.ustb.yaolegou.controller;

import edu.ustb.yaolegou.entity.Banner;
import edu.ustb.yaolegou.entity.User;
import edu.ustb.yaolegou.service.BannerService;
import edu.ustb.yaolegou.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "IndexServlet", value = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BannerService bannerService = new BannerService();
        //获取数据
        ArrayList<Banner> list = bannerService.getAll();
        //放入request域
        request.setAttribute("BannerList", list);
        //请求转发
        request.getRequestDispatcher("/index.jsp").forward(request,response);


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理登录功能
        request.setCharacterEncoding("utf-8"); //设置编码
        response.setCharacterEncoding("utf-8");
        UserService userService = new UserService();
        //登录
        String name = request.getParameter("UserName"); //从文本框拿到对应数据
        String pwd = request.getParameter("PassWord");

        User user = new User();
        user.setUserName(name);
        user.setPassword(pwd);

        //调用service校验账户信息
        String result = userService.login(user);
        if("true".equals(result)) { //这样写不会报空指针错误
            //加载user数据
            user = userService.getUserByName(user.getUserName());
            //登录成功将用户信息放入user
            request.getSession(true).setAttribute("user",user);
        }

        //将结果写回客户端，即作为回调函数的参数
        PrintWriter out = response.getWriter();
        out.write(result);
        out.flush();
        out.close();
    }
}
