package edu.ustb.yaolegou.service;

import edu.ustb.yaolegou.dao.ShopInfoMapper;
import edu.ustb.yaolegou.entity.ShopInfo;
import edu.ustb.yaolegou.entity.ShopInfoVO;
import edu.ustb.yaolegou.entity.ShopMingxi;
import edu.ustb.yaolegou.utils.MybatisUtil;
import edu.ustb.yaolegou.utils.PageBean;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public class ShopInfoService {
    /**
     * 获取分页数据
     *
     * @param pageBean
     * @return
     **/
    public PageBean<ShopInfo> getPage(PageBean<ShopInfo> pageBean, ShopInfoVO
            siv) {
        SqlSession session = null;
        try {
            session = MybatisUtil.getSession(); //新构建的Mybatis的工具类完成session工厂的建立与返回session
            ShopInfoMapper siMapper = session.getMapper(ShopInfoMapper.class);
//获取总记录数
            pageBean.setTotalRecord(siMapper.selectCountByCondition(siv));
//计算总页数
            int pageCnt = pageBean.getTotalRecord() / pageBean.getPageRecord();
            if (pageBean.getTotalRecord() % pageBean.getPageRecord() > 0) {
                pageCnt++;
            }
            pageBean.setPageCount(pageCnt);
//计算表中起始位置
            int begin = (pageBean.getPageIndex() - 1) * pageBean.getPageRecord();
            pageBean.setResultList(siMapper.queryPageByCondition(begin, pageBean.getPageRecord(), siv));
        } catch (Exception e) {
            e.printStackTrace();
        } finally { //finally字段保证即使出现错误，也将执行完该代码块
            if (session != null) {
                session.close();
            }
        }
        return pageBean;
    }




    /**
     * 通过id搜索商品信息
     * @param id 商品id
     * @return 商品信息
     */
    public ShopInfo selectById(int id) {
        SqlSession session = null;
        ShopInfo shopInfo = null;
        try {
            session = MybatisUtil.getSession(); //新构建的Mybatis的工具类完成session工厂的建立与返回session
            ShopInfoMapper siMapper = session.getMapper(ShopInfoMapper.class);
            shopInfo = siMapper.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally { //finally字段保证即使出现错误，也将执行完该代码块
            if (session != null) {
                session.close();
            }
        }
        return shopInfo;
    }




    /**
     * 返回商品明细
     * @param id 商品id
     * @return 商品明细
     */
    public ArrayList<ShopMingxi> selectAllMingxi(int id){
        SqlSession session = null;
        ArrayList<ShopMingxi> list = null;
        try {
            session = MybatisUtil.getSession(); //新构建的Mybatis的工具类完成session工厂的建立与返回session
            ShopInfoMapper siMapper = session.getMapper(ShopInfoMapper.class);
            list = siMapper.selectAllMingxi(id);
        }catch (Exception e){
            e.printStackTrace();
        }finally { //finally字段保证即使出现错误，也将执行完该代码块
            if(session!=null){
                session.close();
            }
        }
        return list;
    }
}
