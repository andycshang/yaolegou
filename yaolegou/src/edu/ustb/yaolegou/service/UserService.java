package edu.ustb.yaolegou.service;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import edu.ustb.yaolegou.dao.BannerMapper;
import edu.ustb.yaolegou.dao.UserMapper;
import edu.ustb.yaolegou.entity.Banner;
import edu.ustb.yaolegou.entity.User;
import edu.ustb.yaolegou.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;


    public class UserService {
        /**
         * 判断登录信息是否正确，并返回对应的判断结果
         * @return String
         */
        public String login(User user) {
            SqlSession session = null;
            String result = ""; //进行登录信息校验
            try {
                session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
                UserMapper userMapper = session.getMapper(UserMapper.class);
                User u = userMapper.selectByName(user.getUserName());
                if(u == null){
                    result = "用户名不存在";
                } else if(!user.getPassword().equals(u.getPassword())){ //比较输入密码和数据库密码是否一致，这里是能使用equals方法比较字符串而不能使用==
                            result = "密码有误，请重新输入"; //密码错误请重新输入
                } else {
                    result = "true";
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally { //finally字段保证即使出现错误，也将执行完该代码块
                if(session!=null){
                    session.close();
                }
            } return result;
        }


        /**
         *用于通过用户名查询用户信息
         * @param userName 用户姓名
         * @return 用户类
         */
        public User getUserByName(String userName) {
            SqlSession session = null;
            User user = null;
            try {
                session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
                UserMapper userMapper = session.getMapper(UserMapper.class);
                user = userMapper.selectByName(userName);
            }catch (Exception e){
                e.printStackTrace();
            } return user;
        }

        /**
         *用于添加用户
         * @param user 用户信息
         * @return int 是否成功
         */
        public int userAdd(User user){
            SqlSession session = null;
            int result = 0;
            try {session = MybatisUtil.getSession();
                user.setImage("attached/TouXiang/default.gif");
                UserMapper userMapper = session.getMapper(UserMapper.class);
                result = userMapper.insertUser(user);
                result += userMapper.insertUserInfo(user);
                session.commit();
            }catch (Exception ex){
                ex.printStackTrace();
                session.rollback();
                result = 0;
            }finally {
                session.close();
            }
            return result;
        }



        /**
         *通过手机号查询用户，在注册时验证改用户是否被注册过
         * @param phone 用户电话
         * @return 用户类
         */
        public User getUserByPhone(String phone) {
            SqlSession session = null;
            User user = null;
            try {
                session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
                UserMapper userMapper = session.getMapper(UserMapper.class);
                user = userMapper.selectByPhone(phone);
            }catch (Exception e){
                e.printStackTrace();
            }
            return user;
        }



        /**
         * 向目标手机号发送目标验证码
         * @param phone 用户手机号
         * @param code 生成的验证码
         * @return 包含是否成功发送的json
         */
        public String sendSms(String phone, String code) {
            String result = null;
/********************此处需要设置为自己的accessKeyId和secret*********************************/
            DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "", "");
            /** keyId: LTAI5tF4qtknSteAsmdEFhZH**/
            /* secret: qH0jZNQ2zYWARKfJRo3E5PNequUgYI*/
            IAcsClient client = new DefaultAcsClient(profile);

            CommonRequest request = new CommonRequest();
            request.setMethod(MethodType.POST);//注意这四行，与官网所展示的方法不同
            request.setDomain("dysmsapi.aliyuncs.com");
            request.setVersion("2017-05-25");
            request.setAction("SendSms");
            request.putQueryParameter("RegionId", "cn-hangzhou");
            request.putQueryParameter("PhoneNumbers", phone);
            request.putQueryParameter("SignName", "ustb");
            request.putQueryParameter("TemplateCode", "SMS_461775353");
            request.putQueryParameter("TemplateParam", "{\"code\": "+ code +" }");
            try {
                CommonResponse response = client.getCommonResponse(request);
                result = response.getData();
            } catch (ServerException e) {
                e.printStackTrace();
            } catch (ClientException e) {
                e.printStackTrace();
            }
            return result;
        }


    }
