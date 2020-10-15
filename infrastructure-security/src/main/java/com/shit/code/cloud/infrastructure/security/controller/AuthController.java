package com.shit.code.cloud.infrastructure.security.controller;

import com.shit.code.cloud.infrastructure.test.expose.TestFeignClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import shit.code.cloud.spring.response.ShitCodeHttpResponse;

import javax.annotation.Resource;

/**
 * @author anthonychen
 * @date 2020/10/14
 **/
@Slf4j
@RestController
public class AuthController {
    public AuthController(){
        log.info("====================");
    }

    @Resource
    private TestClient testClient;

    @GetMapping("auth")
    public ShitCodeHttpResponse<String> ok() {
        return new ShitCodeHttpResponse<>("ok");
    }

    @GetMapping("auth2")
    public ShitCodeHttpResponse<String> ok2() {
        testClient.redisSet("aaaa", "11111");
        log.info("test:{}", testClient.redisGet("aaaa"));
        log.info("======哦啦啦");
        return new ShitCodeHttpResponse<>("ok");
    }
}