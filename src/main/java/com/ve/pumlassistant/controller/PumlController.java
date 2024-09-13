package com.ve.pumlassistant.controller;


import net.sourceforge.plantuml.SourceStringReader;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

@RestController
public class PumlController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/generate")
    public String generatePuml(@RequestParam String diagram) {
        SourceStringReader reader = new SourceStringReader(diagram);
        try (ByteArrayOutputStream os = new ByteArrayOutputStream()) {
            // Write the first image to "os"
            String desc = reader.generateImage(os);
            os.close();

            // The image is encoded as a Base64 string
            String base64 = Base64.getEncoder().encodeToString(os.toByteArray());
            return "<img src='data:image/png;base64," + base64 + "' />";
        } catch (IOException e) {
            e.printStackTrace();
            return "Error generating diagram";
        }
    }

}
