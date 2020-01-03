package com.zqj.gateway.controller;

import com.zqj.common.base.ResponseCode;
import com.zqj.common.base.ResponseData;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * 熔断回退controller
 * @author zqj
 * @create 2020-01-03 15:02
 */

@RestController
public class FallbackController {

    @GetMapping("/gateway/fallback")
    public ResponseData<Void> fallback(){
        ResponseData<Void> result = new ResponseData<>();
        result.setCode(ResponseCode.DOWNGRADE.getCode());
        result.setMessage(ResponseCode.DOWNGRADE.getMessage());
        return result;
    }


}
