package com.zqj.feign_api.student;

/**
 *
 * hystrix调用失败后的处理
 * @author zqj
 * @create 2020-01-02 15:46
 */
public class StudentRemoteClientFallback implements StudentRemoteClient {

    @Override
    public Student getStudent(String name) {
        return new Student();
    }
}
