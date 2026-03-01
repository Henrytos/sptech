package br.com.sptech.crud_pedidos.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.sptech.crud_pedidos.dtos.ClientResponseDTO;
import br.com.sptech.crud_pedidos.dtos.CreateClientRequestDTO;
import br.com.sptech.crud_pedidos.services.ClientService;

@RestController
@RequestMapping("/api/v1/clients")
@RequiredArgsConstructor
@Log4j2
public class ClientController {

    private final ClientService clientService;

    @PostMapping
    public ResponseEntity<ClientResponseDTO> createClient(@RequestBody CreateClientRequestDTO request) {
        log.info("Creating client with name: " + request.name());

        ClientResponseDTO response = this.clientService.createClient(request);

        return ResponseEntity.ok(response);
    }

}
