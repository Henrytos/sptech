package br.com.sptech.crud_pedidos.services;

import org.springframework.stereotype.Service;

import br.com.sptech.crud_pedidos.dtos.ClientResponseDTO;
import br.com.sptech.crud_pedidos.dtos.CreateClientRequestDTO;
import br.com.sptech.crud_pedidos.models.Client;
import br.com.sptech.crud_pedidos.repositories.ClientRepository;

@Service
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public ClientResponseDTO createClient(CreateClientRequestDTO request) {

        Client client = new Client(request.name(), request.email());

        client = this.clientRepository.save(client);
        System.out.println(client.getId() + " - " + client.getName() + " - " + client.getEmail());
        return new ClientResponseDTO(client.getId(), client.getName(), client.getEmail());
    }
}
