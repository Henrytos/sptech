package com.sptech.school.Aula2.controller;

import com.sptech.school.Aula2.dto.EchoRequest;
import com.sptech.school.Aula2.dto.EchoResponse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EchoController {

    @PostMapping("/echo")
    public EchoResponse echo(@RequestBody EchoRequest request) {
        return new EchoResponse("Voce enviou : " + request.mensagem);
    }

}
