package edu.ustb.yaolegou.utils;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    // ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "9021000123602666";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbzgRsaF49XTYkS8hvdlwgb1vKmFCLXOsKbPrV+kEVuWsJCxhmi+EkTXiCLNKPXMmNfFC8MkGnRrJBnsRH20dhQuRI+xgDOsmyE/43HdSi1Or2MnKHWDaMVJkFh0MadgqkEMd7ZtBRuE7BqDGI+JVebw1WA7vOH2lfXeGlMMAgQrEm1d4q0XGSf0toQb0sQOZYsGCM+gR9HPsZYA181Vb9wQfErK796GulBmHxcN5gyO4mmdewz2r8wc25oP5WDqU35C/YtEoExQQkEWSJsBWA+/G3n5TmPHkYuMJ1lkya+N6t7NC4MVXliuexTtH2UZi0KLHTXt7b1z/ItZzGWtkpAgMBAAECggEAIKOC17bxbwd0zRu3DGqOGBlb8FACJ3+6mT+FOIgpVES4gHd7kBfjfThhc1uybGfyrRoKy7H3gPRVaVu6IJd2F5Dsw8EeIacSE6UOjztHjSjvY83joii/nJwoRjk0vHlX91CwiVBbeZMTpIv4fIoeuF6pO4iisiZwa5L+Lx3MUbVyUdSLOUMBBzIlyLr/pzow2uC3PrSiNNfKvn9Uez4nSf+OV88iti8bpi/hfh6D0z9eubHLXjw7oP5Vi9KyjRLqGyzDx1A8jz1qqgWi/u4adw1AQ0nLRTlyBnBkgrLyht53yTVvmpeg7G3X6I7MjQo7B94NjKhCO5n9BoVbBBq1hQKBgQDnguMbuTCrPtJqSQ8AetzGivhvv+w9kkEm5KhDZGblue9gnIxbEveYgvKu2cxvwjRsxYdftalLSbGwPrUMC9iBsAMjKBxrEO8hiHxIZ98OUxxiEWevzIYEEYK3ZfKRoG+CKCAbcuSla9WgI1uMrDOBmOr84qADGOXlUkKjUtWmOwKBgQCsSREnEJru0txkNc1PjMDaQBFeIxxEYcS7wTgY9crwSHvHWkunJoUpevSoqzsBQt9HbJYJ0Ocs3BrdPU79k0w2jHf1NlOp7l9Zo8zOoEH2p8WUmWgysFiCt4t26WMA7PsE7TqAzGiv4K3oZKJ9xfQ+7xDHewhiX9Tn0ENSewCz6wKBgBDirwXan/4deuNdqMZ0L54bjLs52FU1UaMwkkU4EXk38omtYV9TJtPs2R5/rDWKiKBWV+VXLp3bJiagrDvQsV3kJJZv2oLEnWxotAfj65Tz4uIUOufLlwq87DfMK8ELXpazroPSAXM/RjmD2q2L8cXGDX2cWedf7YSoV0vqQsL5AoGANfLjZiIzAdoRnWejlOd0dGNfjOTdsyQSYODOWjKNi9SGvhQuYHcVd7nC5xZHccuo80qzaPt7iHacCu9pzsnTMbmmzqhmZm34ea9rMMDKJxy+KBwpnsXN0ZD8IQ5QLDgJGq/WhAJ+PaTTkFQC9fOI2jQuQujp5TQxDS4QBsHxpGUCgYAUYP0GCOFjhiMHuN5O5dL7L1DTtgRWs3f6AK4vpK/sHCMZmFj89XsUbu3f0EfL2jKB79igptpKEgBPaEXMWpVxAMeakU/mjbstGs7GRboBxBuPPAB2WFlIgtTtFSkbvFajG/D2B4EFOOG1U5IDm6+W2VdCUk25F68EzP2/LFmVSQ==";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
    // 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2ty41tTq3WFJDiRLwDlSogL+7z8P+vPP56Ozb4Go5o3j3Ot0yomz6V180ymVg4K3vTcKSAITCAGMFcyk/WGhxB9NmyAtYVELuq0N88iOq2xO1cOk1AB9jicVNmuRYWhAenSK4BaXy6sFLKK8tWWzCFPuZ60FCbLFXS2fQNRBze2dQ1FBahxr/TZVbbBeoW7x99R1rNqBODnhx5xiURSLDUW0TqvTVEyUQupITogSKsMVRQpZ4yRECFS6eQ/48uYeLjz+PyS2/QgxcpA9PY8ZETwdfqlwjngBNT8k1YOLWQb6GPj2e7hEYZF3Wls3L+wyEC0pPJHJbfz+VRempM1BXwIDAQAB";
    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/yaolegou_war_exploded/order/payresult";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/yaolegou_war_exploded/order/payresult";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关 //
    // public static String gatewayUrl ="https://openapi.alipay.com/gateway.do";// 正式
//	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";// 测试
    public static String gatewayUrl = "https://openapi-sandbox.dl.alipaydev.com/gateway.do";// 测试

    // 支付宝网关 日志
    public static String log_path = "D:\\alipay\\";

    // ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord
     *            要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
