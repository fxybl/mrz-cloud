package com.zqj.gateway.util;


import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author zqj
 * @create 2020-01-03 11:13
 */
public class IPUtils {

    //根据原生request获取真实IP
    public static String getIP(HttpServletRequest request){
        String ip = request.getHeader("x-real-ip");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("x-forwarded-for");
            if (ip != null) {
                ip = ip.split(",")[0].trim();
            }
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }

    //根据spring封装的request（reactive包）获取真实IP
    public static String getIP(ServerHttpRequest request){
        HttpHeaders headers = request.getHeaders();
        List<String> ips = headers.get("X-Forwarded-For");
        if(ips !=null && ips.size()>0){
            //第一个为真实IP
            return ips.get(0);
        }else {
            return request.getRemoteAddress().getHostName();
        }

    }
}
