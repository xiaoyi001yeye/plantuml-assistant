package com.ve.pumlassistant.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PumlController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/generate")
    public String generatePuml(@RequestParam String diagram) {
        // 这里你可以调用生成PUML图的逻辑
        return "PUML Diagram: " + diagram;
    }

}
