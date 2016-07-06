package com.model;

import java.util.Date;

/**
 * Created by mesutaygun on 6/26/2016.
 */
public class SalesReport {

    public String sku_name;
    public Double amount;
    public Date sales_date;


    public Date getSales_date() {
        return sales_date;
    }

    public void setSales_date(Date sales_date) {
        this.sales_date = sales_date;
    }

    public String getSku_name() {
        return sku_name;
    }

    public void setSku_name(String sku_name) {
        this.sku_name = sku_name;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }
}
