package edu.ustb.yaolegou.dao;

import edu.ustb.yaolegou.entity.Banner;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

public interface BannerMapper {

    @Select("select * from banner")
    public ArrayList<Banner> selectAll();
}
