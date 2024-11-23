package edu.ustb.yaolegou.entity;

public class ShopInfo {
    private int shopId;
    private String shopName;
    private double shopPrice;
    private String image;
    private String shopMiaoShu;
    private String color;
    private String chiCun;
    private String Context;

    public String getContext() {
        return Context;
    }

    public void setContext(String context) {
        Context = context;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getChiCun() {
        return chiCun;
    }

    public void setChiCun(String chiCun) {
        this.chiCun = chiCun;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getShopMiaoShu() {
        return shopMiaoShu;
    }

    public void setShopMiaoShu(String shopMiaoShu) {
        this.shopMiaoShu = shopMiaoShu;
    }
}
