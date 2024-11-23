package edu.ustb.yaolegou.dao;

import edu.ustb.yaolegou.entity.Banner;
import edu.ustb.yaolegou.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

public interface UserMapper {

    @Select("select u.*, ui.UserNick from user u INNER JOIN userinfo ui on u.Username = ui.UserName where u.username = #{username}")
            public User selectByName(@Param("username") String userName);


    @Select("select u.*, ui.UserNick from user u INNER JOIN userinfo ui on u.Username = ui.UserName where ui.phone = #{phone}")
                public User selectByPhone(@Param("phone") String phone);

    @Insert("INSERT INTO user (UserName,PassWord,State) "
            +" VALUES (#{userName},#{password},#{state})")
    public int insertUser(User user);

    @Insert("INSERT INTO userinfo (username,usernick,phone,sexid,isdianpu,money,dianpumoney,image)"
    +" VALUES (#{userName},#{userNick},#{phone},3,0,0,0,#{image})")
    public int insertUserInfo(User user);
}
