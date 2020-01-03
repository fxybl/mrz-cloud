package com.zqj.common.base;

/**
 * @author zqj
 * @create 2020-01-03 10:08
 */

public enum ResponseCode {

    //请求成功
    SUCCESS(200,"请求成功"),
    //参数错误
    PARAM_ERROR(400,"参数错误"),
    //限制调用（限流）
    LIMIT_ERROR(401,"请求过于频繁，请稍后再试"),
    //token过期
    TOKEN_TIMEOUT(402,"token过期"),
    //没有权限
    NOT_AUTH(403,"没有权限"),
    //资源没找到
    NOT_FOUND(404,"资源没找到"),
    //服务器错误
    SERVER_ERROR(500,"服务器错误"),
    //服务已降级
    DOWNGRADE(406,"服务已降级");


    private int code;

    private String message;

    ResponseCode(int code,String message){
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }}
