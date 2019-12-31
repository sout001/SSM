package com.zking.SSM.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Author Administrator
 * CreateTime 2019-12-01 15:28
 */
public class DataProtocol extends HashMap<String,Object> {

    public static int SUCCESS = 1;

    public static int FAIL = -1;

    private long ts = System.currentTimeMillis();

    public DataProtocol(){
        this.put("code",SUCCESS);
        this.put("ts",ts);
        this.put("message","操作成功");
    }

    public void setCode(int code){
        this.put("code",code);
    }

    public void setData(Object data){
        this.put("data",data);
    }

    public void setErrors(Map<String,String> errors){
        this.put("errors",errors);
    }
    public void setMessage(String message){
        this.put("message",message);
    }

}
