package com.zqj.eureka_client.pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author zqj
 * @create 2020-01-08 11:35
 */

@Data
@ApiModel("司机")
public class Driver {

    @ApiModelProperty(value = "司机ID",dataType = "int")
    private Long id;

    @ApiModelProperty(value = "司机名",dataType = "string")
    private String name;
}
