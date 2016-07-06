package com.dao;

import com.model.Staffs;

/**
 * Created by mesutaygun on 6/26/2016.
 */
public interface ILogin  {
    public Staffs getStaff(String username,String password);
}
