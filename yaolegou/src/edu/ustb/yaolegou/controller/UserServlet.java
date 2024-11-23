package edu.ustb.yaolegou.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.ustb.yaolegou.entity.User;
import edu.ustb.yaolegou.service.UserService;
import edu.ustb.yaolegou.utils.CheckCodeUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

@WebServlet(name = "UserServlet", value = "/reg")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*PrintWriter out = response.getWriter();*/
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String State = request.getParameter("State");
        String phone = request.getParameter("phone");
        if(State == null){
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("/reg2.jsp").forward(request,response);
        }else if(State.equals("add")){
            //获取手机号和密码
            String pwd = request.getParameter("pwd");
            //生成八位随机数
            Random random = new Random();
            int suiji = random.nextInt(99999999);
            String UserName = suiji+"";
            //赋值
            User u = new User();
            u.setUserName(UserName);
            u.setPassword(pwd);
            u.setPhone(phone);
            //随机生成网名
            String[] name1 = new String[]{"最帅的","好看的","美丽的","会撩妹的","爱玩快手的","可爱的","爱听音乐的","爱斗图的","细心的","爱玩抖音的"};
            String[] name2 = new String[]{"小红","小仙女","小清新","郭德纲","小白","翠花","熊大","熊二","光头强","老崔"};
            int n1 = random.nextInt(10);
            int n2 = random.nextInt(10);
            String UserNick = name1[n1]+name2[n2];
            u.setUserNick(UserNick);
// //执行增加用户
// boolean is = ud.AddUserNameInfo(u);
/*****************************重点区域
 ***************************************/
            userService.userAdd(u);
//此处的State状态由前端传输得到
            response.getWriter().print(UserName);
        }else if(State.equals("yanzhengs")){ //此处是前端当不聚焦于电话对话框是，就会向后端请求yanzhengs，用于确定电话号是否有效
                User user = userService.getUserByPhone(phone);
                response.getWriter().print(user == null);
            }else if(State.equals("sendsms")){ //此处是按下发送验证码的按钮时向后端请求，作用是随机生成验证码并且发送验证码短信给目标手机号
                String code = CheckCodeUtil.getCode(6);
                String result = userService.sendSms(phone, code);
                ObjectMapper objMapper = new ObjectMapper();
                Map<String, String> rst = objMapper.readValue(result, Map.class);
                if("OK".equals(rst.get("Code"))){ //如果成功发送验证短信，此时将生成的验证码存储于request域中，以便检查用户输入是否一致
//if("OK".equals(result)){
                    request.getSession().setAttribute("smsCode", code);
                    response.getWriter().print("true");
                }
            }else if(State.equals("checksms")){ //当前端点击注册按钮时且验证码blank不为空的时候，将发起该请求，进行验证码输入与生成的对比
                String code = request.getParameter("smscode");
                boolean data = code.equals(request.getSession().getAttribute("smsCode"));
                response.getWriter().print(data);
/*****************************重点区域
 ***************************************/
            }
}
            @Override
            protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
                doGet(request, response);
            }
        }
