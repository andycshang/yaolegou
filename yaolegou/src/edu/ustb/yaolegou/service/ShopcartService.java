package edu.ustb.yaolegou.service;

import edu.ustb.yaolegou.dao.ShopcartMapper;
import edu.ustb.yaolegou.entity.Shopcart;
import edu.ustb.yaolegou.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public class ShopcartService {

    public int shopcartItemAdd(Shopcart sc) {
        SqlSession session = null;
        int result = 0;
        try{
            session = MybatisUtil.getSession();
            ShopcartMapper scMapper = session.getMapper(ShopcartMapper.class);
            Shopcart shopcart = scMapper.selectByUserNameAndShopId(sc);
            if(shopcart == null)
            {
//判断购物车里面没有该商品 则会增加一条购物车记录
                result = scMapper.insert(sc);
            }else{
                shopcart.setCount(shopcart.getCount()+sc.getCount());
                result = scMapper.updateCnt(shopcart);
            }
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        }
        return result;
    }



    /**
     * 根据用户名获取用户购物车信息
     * @param userName
     * @return
     */
    public ArrayList<Shopcart> shopcartSelectItem(String userName) {
        SqlSession session = null;
        ArrayList<Shopcart> list =null;
        try{
            session = MybatisUtil.getSession();
            ShopcartMapper scMapper = session.getMapper(ShopcartMapper.class);
            list = scMapper.selectByUserName(userName);
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        } return list;
    }
/**
 * 更新数据库
* @param id
* @param cnt
* @return
        */
    public int shopcartUpdateItem(int id, int cnt) {
        SqlSession session = null;
        int result = 0;
        try{
            session = MybatisUtil.getSession();
            ShopcartMapper scMapper = session.getMapper(ShopcartMapper.class);
            Shopcart shopcart = new Shopcart();
            shopcart.setId(id);
            shopcart.setCount(cnt);
            result = scMapper.updateCnt(shopcart);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        } return result;
    }
/**
* 根据id查询shopcart
* @param id
* @return
        */
    public Shopcart shopcartSelectByIdItem(int id) {
        SqlSession session = null;
        Shopcart shopcart = null;
        try{
            session = MybatisUtil.getSession();
            ShopcartMapper scMapper = session.getMapper(ShopcartMapper.class);
            shopcart = scMapper.selectById(id);
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        } return shopcart;
    }
/**
* 根据id删除购物车中对应商品
* @param id
* @return
        */
    public int shopcartDeleteById(int id) {
        SqlSession session = null;
        int result = 0;
        try{
            session = MybatisUtil.getSession();
            ShopcartMapper scMapper = session.getMapper(ShopcartMapper.class);
            result = scMapper.delete(id);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        } return result;
    }
}

