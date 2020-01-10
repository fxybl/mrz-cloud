package com.zqj.eureka_client.controller;

import com.zqj.eureka_client.pojo.Driver;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-08 11:37
 */

@RestController
public class DriverController {

    @ApiOperation(value = "查询司机")
    @GetMapping("/driver/info")
    public Driver info(@ApiParam(value = "司机名",required = true) String name){
        Driver d = new Driver();
        d.setName(name);
        d.setId(1L);
        return d;
    }
}
