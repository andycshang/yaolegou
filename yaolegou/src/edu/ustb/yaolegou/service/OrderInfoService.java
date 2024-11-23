package edu.ustb.yaolegou.service;

import edu.ustb.yaolegou.dao.OrderInfoMapper;
import edu.ustb.yaolegou.entity.*;
import edu.ustb.yaolegou.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class OrderInfoService {
    /**
     * 新增订单到数据库中
     * @param orderInfo
     * @return
     */
    public int orderAdd(OrderInfo orderInfo) {
        SqlSession session = null;
        int result = 0;
        try {
            session = MybatisUtil.getSession();
            OrderInfoMapper orderInfoMapper = session.getMapper(OrderInfoMapper.class);
            result = orderInfoMapper.insertOrderInfo(orderInfo);
            if(result>0){
                for(OrderItem item : orderInfo.getItemlist()){
                    result = orderInfoMapper.insertOrderItem(item);
                }
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
     * 通过用户名查询所有收货地址
     * @param userName
     * @return
     */
    public List<SHAddress> queryAddrByUsername(String userName){
        List<SHAddress> list = null;
        SqlSession session = null;
        try {
            session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
            OrderInfoMapper orderInfoMapper = session.getMapper(OrderInfoMapper.class);
            list = orderInfoMapper.queryShAddrByUserName(userName);
        }catch (Exception e){
            e.printStackTrace();
        }finally { //finally字段保证即使出现错误，也将执行完该代码块
            if(session!=null){
                session.close();
            }
        }
        return list;
    }
    /**
     * 查询所有省份
     * @return
     */
    public List<Province> queryAllProvince(){
        SqlSession session = null;
        List<Province> list = null;
        try{
            session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
            OrderInfoMapper orderInfoMapper = session.getMapper(OrderInfoMapper.class);
            list = orderInfoMapper.queryAllProvince();
        }catch (Exception e){
            e.printStackTrace();
        }finally { //finally字段保证即使出现错误，也将执行完该代码块
            if(session!=null){
                session.close();
            }
        }
        return list;
    }
    /**
     * 查询所有支付方式
     * @return
     */
    public List<PayType> queryAllPayType(){
        SqlSession session = null;
        List<PayType> list = null;
        try{
            session = MybatisUtil.getSession(); //Mybatis的工具类完成session工厂的建立与返回session
            OrderInfoMapper orderInfoMapper = session.getMapper(OrderInfoMapper.class);
            list = orderInfoMapper.queryAllPayType();
        }catch (Exception e){
            e.printStackTrace();
        }finally { //finally字段保证即使出现错误，也将执行完该代码块
            if(session!=null){
                session.close();
            }
        }return list;
    }




    /**
     * 更新支付状态
     * @param dingdanNumber
     * @param stateId
     * @return
     */
    public int updateState(String dingdanNumber, int stateId) {
        SqlSession session = null;
        int result = 0;
        try {
            session = MybatisUtil.getSession();
            OrderInfoMapper oiMapper = session.getMapper(OrderInfoMapper.class);
            result = oiMapper.updateState(dingdanNumber, stateId);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        }finally {
            session.close();
        }
        return result;
    }
}

