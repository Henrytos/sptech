package br.com.sptech.crud_pedidos.repositories;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import br.com.sptech.crud_pedidos.models.Client;

@Repository
public class ClientRepository {

    private final List<Client> items = new ArrayList<>();
   public Client save(Client client) {
        if (client.getId() == null) {
            Client newClient = new Client(
                    (long) (items.size() + 1),
                    client.getName(),
                    client.getEmail()
                );

            items.add(newClient);

            return newClient;
        }
        Client clientFind = this.items.get(client.getId().intValue() - 1);

        clientFind.setName(client.getName());
        clientFind.setEmail(client.getEmail());

        return clientFind;
    }

    public Optional<Client> findById(Long clientId) {
        return this.items.stream().filter(client -> client.getId().equals(clientId)).findAny();
    }

    public void delete(Client client) {
        this.items.remove(client);
    }

    public List<Client> findAll() {

        return this.items;
    }
}
