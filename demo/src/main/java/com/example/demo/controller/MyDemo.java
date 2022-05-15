package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyDemo {
    
    @GetMapping("/getDemo")
    public String getDemo(String userId) {
        return userId;
    }

}


