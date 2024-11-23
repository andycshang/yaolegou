package edu.ustb.yaolegou.entity;

import java.util.Date;

public class User {

    private int id;
    private String userName;
    private String password;
    private int  state;
    private String userNick;
    private Date CreateTime;
    private String phone;
    private String image;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", state=" + state +
                ", userNick='" + userNick + '\'' +
                ", CreateTime=" + CreateTime +
                '}';
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getUserNick() {
        return userNick;
    }

    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }

    public Date getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public String getImage() { return image;  }

    public void setImage(String image) { this.image = image; }
}
