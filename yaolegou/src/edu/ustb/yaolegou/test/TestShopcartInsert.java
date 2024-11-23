package edu.ustb.yaolegou.test;

import edu.ustb.yaolegou.dao.ShopcartMapper;
import edu.ustb.yaolegou.entity.Shopcart;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.io.IOException;

public class TestShopcartInsert {
    @Test
    public void TestShopcartInsert() throws IOException {

        SqlSession session = null;

        ShopcartMapper shopcartMapper = session.getMapper(ShopcartMapper.class);
        Shopcart shopcart = new Shopcart();
        shopcart.setUserName("123456");
        shopcart.setShopName("YiFu");
        shopcart.setChiCun("中");
        shopcart.setColor("浅灰色");
        shopcart.setCount(1);
        shopcart.setImage("attached/image/1.jpg");
        shopcart.setPrice(20);
        shopcartMapper.insert(shopcart);
        session.commit();
    }
}
