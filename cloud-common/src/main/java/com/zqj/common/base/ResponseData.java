package com.zqj.common.base;

import lombok.Data;

/**
 * @author zqj
 * @create 2020-01-03 10:08
 */

@Data
public class ResponseData<T> {

    private int code;

    private String message = "";

    private T data;
}
