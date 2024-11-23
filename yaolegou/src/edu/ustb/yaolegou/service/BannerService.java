package edu.ustb.yaolegou.service;

import edu.ustb.yaolegou.dao.BannerMapper;
import edu.ustb.yaolegou.entity.Banner;
import edu.ustb.yaolegou.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public class BannerService {
    /**
     * 返回所有Banner列表
     * @return
     */
    public ArrayList<Banner> getAll()
    {
        ArrayList<Banner> list = null;
        SqlSession session = null;
        try {
            session = MybatisUtil.getSession();
            BannerMapper bannerMapper = session.getMapper(BannerMapper.class);
            list = bannerMapper.selectAll();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }

        }
        return list;

    }
}
