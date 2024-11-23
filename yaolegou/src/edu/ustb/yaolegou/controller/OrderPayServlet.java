package edu.ustb.yaolegou.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import edu.ustb.yaolegou.utils.AlipayConfig;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderPayServlet", value = "/order/pay")
public class OrderPayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String orderNumber = request.getParameter("dingdannumber");
        String orderPrice = request.getParameter("dingdanjine");
        String orderName = request.getParameter("UserName");
        String orderAddr = request.getParameter("address");
// 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
// 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        try {
            alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderNumber +
                    "\"," + "\"total_amount\":\""
                    + orderPrice + "\"," + "\"subject\":\"" + orderName + "\","
                    + "\"body\":\"" + orderAddr + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
// 请求
            String result = alipayClient.pageExecute(alipayRequest).getBody();
// 输出 pay页面取出
// model.addAttribute("result", result);
            request.setAttribute("result", result);
        } catch (Exception e) {
            e.printStackTrace();
        }
// 这个是渲染到视图中,在pay视图中使用el方式将 result对象数据展示,由result对象进行向阿里支付系统发送构建的请求
// return "order/alipay";
        request.getRequestDispatcher("/order/alipay.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request,response);
    }
}
