package br.com.sptech.crud_pedidos.controllers;

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
public class ClientController {

    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @PostMapping
    public ResponseEntity<ClientResponseDTO> createClient(@RequestBody CreateClientRequestDTO request) {
        System.out.println(request);
        ClientResponseDTO response = this.clientService.createClient(request);

        return ResponseEntity.ok(response);
    }

}
