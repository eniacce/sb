package com.jsonResponse;

import com.model.Sales;
import com.model.Staffs;

import java.util.List;

/**
 * Created by mesutaygun on 6/26/2016.
 */
public class StaffsJson {
    int iTotalRecords;

    int iTotalDisplayRecords;

    String sEcho;

    String sColumns;

    List<Staffs> aaData;


    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public String getsEcho() {
        return sEcho;
    }

    public void setsEcho(String sEcho) {
        this.sEcho = sEcho;
    }

    public String getsColumns() {
        return sColumns;
    }

    public void setsColumns(String sColumns) {
        this.sColumns = sColumns;
    }

    public List<Staffs> getAaData() {
        return aaData;
    }

    public void setAaData(List<Staffs> aaData) {
        this.aaData = aaData;
    }
}
