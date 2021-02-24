package com.example.liweitest.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/mytest")
@RestController
public class mytest {


    /**
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String testAutoTest() throws Exception {
        return "mytest";

    }

}
