package com.zqj.eureka_client.controller;

import com.zqj.feign_api.student.Student;
import com.zqj.feign_api.student.StudentRemoteClient;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-02 11:44
 */

@RestController
public class StudentController implements StudentRemoteClient {

    @Override
    public Student getStudent(String name) {
        Student student = new Student();
        student.setName(name);
        student.setAge(18);
        return student;
    }
}
