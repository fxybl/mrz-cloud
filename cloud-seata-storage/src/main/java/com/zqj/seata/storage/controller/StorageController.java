package com.zqj.seata.storage.controller;

import com.zqj.seata.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-16 10:31
 */

@RestController
public class StorageController {

    @Autowired
    private StorageService storageService;
}
