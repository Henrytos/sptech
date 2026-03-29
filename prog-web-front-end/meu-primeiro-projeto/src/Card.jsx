function Card({ nome, idade, status }) {
  return (
    <div
      style={{
        background: status ? "green" : "red",
        color: "white",
        padding: "1rem",
      }}
      className={`
        text-center card
      ${status ? "card-ativo" : "card-inativo"}
       `}
    >
      <h2>Pessoa </h2>
      <p>Nome: {nome}</p>
      <p>Idade: {idade}</p>
      <p>Ativo: {status ? "Sim" : "Não"}</p>
    </div>
  );
}

export default Card;
