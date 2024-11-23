package edu.ustb.yaolegou.entity;

public class Shopcart {
    private int id;
    private String userName;
    private String shopName;
    private String chiCun;
    private String color;
    private int count;
    private double price;
    private String image;
    private int shopId;
    private String zhuRenUser;
    private ShopInfo si;

    public String getZhuRenUser() {
        return zhuRenUser;
    }

    public void setZhuRenUser(String zhuRenUser) {
        this.zhuRenUser = zhuRenUser;
    }

    public ShopInfo getSi() {
        return si;
    }

    public void setSi(ShopInfo si) {
        this.si = si;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getChiCun() {
        return chiCun;
    }

    public void setChiCun(String chiCun) {
        this.chiCun = chiCun;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }
}
