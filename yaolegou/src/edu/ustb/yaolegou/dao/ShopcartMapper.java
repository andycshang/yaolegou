package edu.ustb.yaolegou.dao;

import edu.ustb.yaolegou.entity.Shopcart;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

public interface ShopcartMapper {
    //根据userName获取购物车数据


    //插入购物车
    @Insert("INSERT INTO `gouwuche`(`UserName`,`ShopName`,`ChiCun`,`Color`,`Count`,`Price`,`Image`,`ShopId`) "
            +" VALUES (#{userName},#{shopName},#{chiCun},#{color},#{count},#{price},#{image},#{shopId})")
    public int insert(Shopcart shopcart);




    @Select("select * from gouwuche where UserName= #{sc.userName} and ShopId = #{sc.shopId} and ChiCun = #{sc.chiCun} and Color = #{sc.color}")
    public Shopcart selectByUserNameAndShopId(@Param("sc") Shopcart shopcart);



    //select by id
    @Select("select * from gouwuche where Id = #{id}")
    public Shopcart selectById(int id);
//select by userName
    @Select("select gwc.*,si.ZhuRenUser from gouwuche gwc INNER JOIN shopinfo si on gwc.ShopId=si.ShopId where gwc.UserName= #{username}")
    public ArrayList<Shopcart> selectByUserName(@Param("username") String username);

    //update购物车数量
    @Update("update gouwuche set Count=#{Shopcart.count} where Id=#{Shopcart.id}")
    public int updateCnt(@Param("Shopcart") Shopcart shopcart);

    //delete by id
    @Delete("delete from gouwuche where Id=#{id}")
    public int delete(int id);

}
