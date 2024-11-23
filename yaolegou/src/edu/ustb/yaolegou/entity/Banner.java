package edu.ustb.yaolegou.entity;

import java.util.Date;

public class Banner {

    private int id;
    private String image;
    private String bgColor;
    private String href;
    private int isTingYong;
    private String beiZhu;
    private Date CreateTime;

    @Override
    public String toString() {
        return "Banner{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", bgColor='" + bgColor + '\'' +
                ", href='" + href + '\'' +
                ", isTingYong=" + isTingYong +
                ", beiZhu='" + beiZhu + '\'' +
                ", CreateTime=" + CreateTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBgColor() {
        return bgColor;
    }

    public void setBgColor(String BgColor) {
        bgColor = BgColor;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public int getIsTingYong() {
        return isTingYong;
    }

    public void setIsTingYong(int isTingYong) {
        this.isTingYong = isTingYong;
    }

    public String getBeiZhu() {
        return beiZhu;
    }

    public void setBeiZhu(String beiZhu) {
        this.beiZhu = beiZhu;
    }

    public Date getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }


}
