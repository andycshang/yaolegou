package edu.ustb.yaolegou.dao;

import edu.ustb.yaolegou.entity.*;
import org.apache.ibatis.annotations.Select;

import edu.ustb.yaolegou.entity.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderInfoMapper {


    @Select("select u.*,ui.usernick from user u inner join userinfo ui on u.username=ui.username where u.username=#{username}")
    public User selectByName(@Param("username") String userName);


    @Select("select * from dingdanbiao where DingDanNumber=#{orderNumber}")
    public OrderInfo selectOrderInfoByOrderNumber(String oderNumber);


    @Insert("INSERT INTO `dingdanbiao` " +
            "(`DingDanNumber`, `ZhuRenUser`, `Price`, `StateId`, `UserName`, `ZhiFuId`, `AddressId`) " +
            "VALUES " +
            "(#{dingdanNumber}, #{zhuRenUser}, #{price}, #{stateId}, #{userName}, #{zhifuId}, #{addressId})")
    public int insertOrderInfo(OrderInfo orderInfo);


    @Select("SELECT * from dingdanxiangqing where DingDanNumber=#{orderNum}")
    public List<OrderItem> selectItemByNumber(String orderNum);

    @Insert("INSERT into dingdanxiangqing " +
            "(DingDanNumber,ShopId,ChiCui,Color,Count,UserName,MyUser) " +
            "VALUE" +
            "(#{dingdanNumber},#{shopId},#{chiCun},#{color},#{count},#{userName},0)")
    public int insertOrderItem(OrderItem orderItem);

    //�ջ���ַ�� insert select
    @Insert("INSERT INTO `shaddress` " +
            "(`UserName`, `Name`, `Phone`, `ByPhone`, `City`, `Address`) " +
            "VALUES " +
            "(#{userName}, #{name}, #{phone}, #{byPhone}, #{city}, #{address},0)")
    public int insertShAddress(Province shAddress);

    @Select("select * from shaddress where UserName=#{userName}")
    public List<SHAddress> queryShAddrByUserName(String userName);


    @Select("select * from _zhifutype")
    public List<PayType> queryAllPayType();

    @Select("select * from sheng")
    public List<Province> queryAllProvince();

    @Select("select * from sheng where shengname=#{name}")
    public Province queryProvinceByName(@Param("name") String name);

    @Select("select * from city where shengid=#{provId}")
    public List<City> queryCityByProvId(@Param("provId") int provId);

    @Select("select * form city where cityname=#{name}")
    public City queryCityByName(@Param("name") String name);

    @Select("select * from qu where cityid=#{cityId}")
    public List<Distric> queryDistricByCityId(@Param("cityId") int cityId);


    @Select("select * from _dingdanstate")
    public List<OrderState> queryAllOrderState();



    //更新支付状态
    @Insert("update dingdanbiao set StateId=#{stateId} where DingDanNumber=#{dingdanNumber}")
    public int updateState(@Param("dingdanNumber") String dingdanNumber, @Param("stateId") int stateId);
}
