package edu.ustb.yaolegou.entity;

public class OrderItem {
    private int id;
    private String dingdanNumber;
    private int shopId;
    private String chiCun;
    private String color;
    private int count;
    private String userName;
    private ShopInfo si;
    private User user;
    private String myUser;
    private String createTime;
    private String state;
    private OrderState orderState;
    private int stateId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDingdanNumber() {
        return dingdanNumber;
    }

    public void setDingdanNumber(String dingdanNumber) {
        this.dingdanNumber = dingdanNumber;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public ShopInfo getSi() {
        return si;
    }

    public void setSi(ShopInfo si) {
        this.si = si;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMyUser() {
        return myUser;
    }

    public void setMyUser(String myUser) {
        this.myUser = myUser;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public OrderState getOrderState() {
        return orderState;
    }

    public void setOrderState(OrderState orderState) {
        this.orderState = orderState;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }
}
