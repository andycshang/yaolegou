package edu.ustb.yaolegou.dao;

import edu.ustb.yaolegou.entity.ShopInfo;
import edu.ustb.yaolegou.entity.ShopInfoVO;
import edu.ustb.yaolegou.entity.ShopMingxi;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

public interface ShopInfoMapper {
    @Select("select * from shopinfo where shopid= #{id}")
    public ShopInfo selectById(int id);
    @Select("select * from shopinfo limit #{begin}, #{count}")
    public ArrayList<ShopInfo> selectByPage(@Param("begin") int begin, @Param("count") int count); //@Param注解用于标注参数映射到哪个名字
    @Select("select count(1) from shopinfo")
    public int selectCount();




    @Select("<script>" +
            "select count(1) from shopinfo where true" +
            "<if test='siv.sexFenlei!=null'> and shopname like concat('%',#{siv.sexFenlei},'%')</if>" +
            "<if test='siv.sizeFenlei!=null'> and shopname like concat('%',#{siv.sizeFenlei},'%')</if>" +
            "<if test='siv.banXing!=null'> and shopname like concat('%',#{siv.banXing},'%')</if>" +
            "</script>")
    public int selectCountByCondition(@Param("siv") ShopInfoVO siv);


    @Select("<script>" +
            "select * from shopinfo where true" +
            "<if test='siv.sexFenlei!=null'> and shopname like concat('%',#{siv.sexFenlei},'%')</if>" +
            "<if test='siv.sizeFenlei!=null'> and shopname like concat('%',#{siv.sizeFenlei},'%')</if>" +
            "<if test='siv.banXing!=null'> and shopname like concat('%',#{siv.banXing},'%')</if>" +
            " limit #{begin}, #{count}" +
            "</script>")
    public ArrayList<ShopInfo> queryPageByCondition(
            @Param("begin") int begin, @Param("count") int count, @Param("siv")
            ShopInfoVO siv);






    @Select("select * from shopmingxi where shopid = #{id}")
    public ArrayList<ShopMingxi> selectAllMingxi(int id);

}
