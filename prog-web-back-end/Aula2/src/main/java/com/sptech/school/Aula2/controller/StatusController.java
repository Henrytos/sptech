package com.sptech.school.Aula2.controller;

import com.sptech.school.Aula2.dto.StatusResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {

    @GetMapping("/status")
    public StatusResponse statusResponse(){
        return new StatusResponse("Aula Rest", "1.0.0");
    }
}
