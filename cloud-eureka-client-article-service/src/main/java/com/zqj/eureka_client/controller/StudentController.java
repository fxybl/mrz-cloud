package com.zqj.eureka_client.controller;

import brave.Tracer;
import com.zqj.feign_api.student.Student;
import com.zqj.feign_api.student.StudentRemoteClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-02 14:04
 */

@RestController
@Slf4j
public class StudentController {

    @Autowired
    private StudentRemoteClient studentRemoteClient;

    //@Autowired
    //Tracer tracer;

    @GetMapping("/student/info")
    public Student getStudentInfo(String name){
        //tracer.currentSpan().tag("zqj","666");
        return studentRemoteClient.getStudent(name);
    }
}
