import Card from "./Card.jsx";

function App() {
  const usuarios = [
    { id: 1, nome: "henry", idade: "12", status: true },
    { id: 2, nome: "maria", idade: "15", status: false },
    { id: 3, nome: "joao", idade: "20", status: true },
  ];

  return (
    <>
      <div>
        {usuarios.map((usuario) => (
          <Card
            key={usuario.id}
            nome={usuario.nome}
            idade={usuario.idade}
            status={usuario.status}
          />
        ))}{" "}
      </div>
    </>
  );
}

export default App;
