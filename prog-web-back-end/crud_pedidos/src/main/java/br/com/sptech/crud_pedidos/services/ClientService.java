package br.com.sptech.crud_pedidos.services;

import org.springframework.stereotype.Service;

import br.com.sptech.crud_pedidos.dtos.ClientResponseDTO;
import br.com.sptech.crud_pedidos.dtos.CreateClientRequestDTO;
import br.com.sptech.crud_pedidos.models.Client;
import br.com.sptech.crud_pedidos.repositories.ClientRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Log4j2
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientResponseDTO createClient(CreateClientRequestDTO request) {
        log.info("Creating client with name: " + request.name());

        Client client = new Client(request.name(), request.email());

        client = this.clientRepository.save(client);
        System.out.println(client.getId() + " - " + client.getName() + " - " + client.getEmail());
        return new ClientResponseDTO(client.getId(), client.getName(), client.getEmail());
    }
}
