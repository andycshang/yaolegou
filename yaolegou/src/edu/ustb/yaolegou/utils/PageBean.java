package edu.ustb.yaolegou.utils;

import java.util.List;

/*
分页相关参数及结果list
 */
public class PageBean <T>{//范型，用的时候再指定是什么类型
    //当前页数
    private int pageIndex;
    //每页记录数
    private int pageRecord;
    //总页数
    private  int pageCount;
    //总记录数
    private  int totalRecord;

    private List<T> resultList;//规定集合里元素的类型

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageRecord() {
        return pageRecord;
    }

    public void setPageRecord(int pageRecord) {
        this.pageRecord = pageRecord;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public List<T> getResultList() {
        return resultList;
    }

    public void setResultList(List<T> resultList) {
        this.resultList = resultList;
    }



}
