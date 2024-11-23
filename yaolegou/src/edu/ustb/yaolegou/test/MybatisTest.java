package edu.ustb.yaolegou.test;

import edu.ustb.yaolegou.dao.BannerMapper;
import edu.ustb.yaolegou.entity.Banner;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class MybatisTest {
    private SqlSession session = null;
    @Before
    public void Before() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new
                SqlSessionFactoryBuilder().build(inputStream);
        session = sqlSessionFactory.openSession();
    }

            @Test
    public void TestSelectAll() throws IOException{
        BannerMapper bannerMapper = session.getMapper(BannerMapper.class);
//dao层的实现
        ArrayList<Banner> list = bannerMapper.selectAll();
        System.out.println(list.toString());
    }
            @After
    public void After() throws IOException{
        session.close();
    }
}