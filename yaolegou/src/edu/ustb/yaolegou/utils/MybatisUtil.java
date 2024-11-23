package edu.ustb.yaolegou.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.sql.SQLException;

public class MybatisUtil {

    private static SqlSessionFactory sqlSessionFactory ;
    static {// 静态代码块，特点：运行一次。加载数据源对象
        try {
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static SqlSession getSession() throws SQLException {

        return sqlSessionFactory.openSession();
    }


}

