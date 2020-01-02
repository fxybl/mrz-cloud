package com.zqj.eureka_client.controller;

import com.zqj.feign_api.student.Student;
import com.zqj.feign_api.student.StudentRemoteClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-02 14:04
 */

@RestController
public class StudentController {

    @Autowired
    private StudentRemoteClient studentRemoteClient;

    @GetMapping("/student/info")
    public Student getStudentInfo(String name){
        return studentRemoteClient.getStudent(name);
    }
}
