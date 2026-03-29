import * as Card from "./components/ui/card/Card";

function App() {
  const listCardAnimes = [
    {
      title: "Naruto",
      imageUrl:
        "https://m.media-amazon.com/images/I/91RpwagB7uL._AC_UF1000,1000_QL80_.jpg",
      description:
        "Naruto Uzumaki é um jovem ninja que busca reconhecimento e sonha em se tornar o Hokage, o líder de sua vila.",
      type: "dark",
      disabled: false,
    },
    {
      title: "One Piece",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_LNUf0lMG2QSgP1raOGoDIMWNuApOBUrScg&s",
      description:
        "Monkey D. Luffy é um jovem pirata que parte em uma jornada para encontrar o tesouro lendário conhecido como One Piece e se tornar o Rei dos Piratas.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Attack on Titan",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdp4RVWOMD8EeOjt7CLC1gG8ArwEMSn2keKw&s",
      description:
        "Eren Yeager é um jovem que vive em um mundo onde a humanidade está à beira da extinção devido a gigantes devoradores de humanos chamados Titãs. Ele se junta à luta para proteger a humanidade e descobrir a verdade por trás dos Titãs.",
      type: "dark",
      disabled: true,
    },
    {
      title: "Demon Slayer",
      imageUrl:
        "https://comicboom.com.br/shop/wp-content/uploads/2025/03/demonslayer1.webp",
      description:
        "Tanjiro Kamado é um jovem que se torna um caçador de demônios após sua família ser massacrada por demônios e sua irmã Nezuko ser transformada em um deles. Ele busca uma maneira de transformar Nezuko de volta em humana e vingar sua família.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Death Note",
      imageUrl: "https://cdn.myanimelist.net/images/anime/9/9453.jpg",
      description:
        "Light Yagami encontra um caderno sobrenatural que permite matar qualquer pessoa ao escrever seu nome. Ele o usa para criar um novo mundo livre do crime, mas suas ações atraem a atenção de um detetive genial.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Bleach",
      imageUrl: "https://cdn.myanimelist.net/images/anime/3/40451.jpg",
      description:
        "Ichigo Kurosaki é um adolescente que pode ver espíritos. Após ganhar os poderes de um Shinigami, ele se vê obrigado a proteger o mundo dos espíritos malignos e da corrupção.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Code Geass",
      imageUrl:
        "https://m.media-amazon.com/images/M/MV5BNTk4MWYwNmUtODFjNC00NWJhLWExNGYtMGU4YmRlNzEwOTY1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
      description:
        "Lelouch vi Britannia é um exilado príncipe que ganha o poder de controlar a mente das pessoas. Ele lidera uma rebelião contra a Britannia, usando estratégia e poder sobrenatural.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Fullmetal Alchemist",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbfWZtyEEBh8jIPufiiZGT4yO6w--x1fWs4Q&s",
      description:
        "Edward e Alphonse Elric são irmãos que buscam a Pedra Filosofal para restaurar seus corpos após um experimento de alquimia dar errado. Sua jornada revela segredos profundos sobre o mundo.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Jujutsu Kaisen",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcnispILQdnHUPtxRUknnbu6S72VOWovrmkg&s",
      description:
        "Yuji Itadori é um jovem que ingere um dedo de um demônio antigo e se torna recipiente de uma maldição poderosa. Ele se junta a um grupo de feiticeiros para aprender a controlar seus novos poderes.",
      type: "dark",
      disabled: false,
    },
    {
      title: "My Hero Academia",
      imageUrl:
        "https://m.media-amazon.com/images/M/MV5BY2QzODA5OTQtYWJlNi00ZjIzLThhNTItMDMwODhlYzYzMjA2XkEyXkFqcGc@._V1_.jpg",
      description:
        "Izuku Midoriya é um adolescente sem super poderes em um mundo onde 80% das pessoas possuem Quirks. Ele trabalha duro para se tornar um herói e entra em uma prestigiosa academia para heróis.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Tokyo Ghoul",
      imageUrl:
        "https://m.media-amazon.com/images/I/71aIUtWoqHL._AC_UF1000,1000_QL80_.jpg",
      description:
        "Ken Kaneki é um jovem que se torna metade-ghoul após um acidente. Ele deve aprender a sobreviver em um mundo onde ghouls vivem entre humanos e lutam pela existência.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Neon Genesis Evangelion",
      imageUrl:
        "https://m.media-amazon.com/images/I/811rqpJatCL._AC_UF894,1000_QL80_.jpg",
      description:
        "Shinji Ikari é recrutado para pilotar um meca gigante e defender a humanidade de criaturas misteriosas chamadas Anjos. A série explora temas profundos sobre identidade, isolamento e existência.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Cowboy Bebop",
      imageUrl:
        "https://m.media-amazon.com/images/M/MV5BMTU3ZTdiOGQtYmYwYy00OGM5LThmNjMtZGJmNTVlZjk1ZmEyXkEyXkFqcGc@._V1_.jpg",
      description:
        "Um grupo de caçadores de recompensas viaja pelo espaço a bordo da nave Bebop em busca de criminosos procurados. Cada episódio revela mais sobre os mistérios e passados de seus personagens.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Steins;Gate",
      imageUrl:
        "https://m.media-amazon.com/images/M/MV5BZjI1YjZiMDUtZTI3MC00YTA5LWIzMmMtZmQ0NTZiYWM4NTYwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
      description:
        "Rintaro Okabe descobre como enviar mensagens ao passado usando um microondas modificado. Ele se vê preso em um loop temporal enquanto tenta salvar a vida de uma amiga e evitar uma guerra mundial.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Mob Psycho 100",
      imageUrl:
        "https://m.media-amazon.com/images/M/MV5BYzU3NDM4ZjgtY2UyMi00YTczLTgyNDEtMjBiMDJlOGUxNjcxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
      description:
        "Shigeo Kageyama é um adolescente comum com poderes psíquicos extraordinários que ele tenta suprimir. Ele navega pela adolescência enquanto lida com suas emoções e habilidades sobrenaturais.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "The Promised Neverland",
      imageUrl:
        "https://m.media-amazon.com/images/I/81GIb6GMhRL._AC_UF1000,1000_QL80_.jpg",
      description:
        "Orphãos em uma casa idílica descobrem uma verdade aterradora sobre seu destino. Eles devem trabalhar juntos em um plano de fuga arriscado para sobreviver e encontrar a liberdade.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Vinland Saga",
      imageUrl:
        "https://br.web.img2.acsta.net/c_310_420/pictures/19/09/16/17/09/4903250.jpg",
      description:
        "Thorfinn é um jovem guerreiro viking em busca de vingança contra Askeladd, o homem que matou seu pai. Sua jornada o leva através de terras distantes enquanto busca redenção e paz.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Re:Zero",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeA66tpuZRt4UpnwiHV5mjZ_QAC2EW7TVZuQ&s",
      description:
        "Subaru Natsuki é transportado para um mundo de fantasia onde descobre que pode voltar no tempo toda vez que morre. Ele deve aprender a usar este poder para salvar a princesa Emilia.",
      type: "minimalist",
      disabled: false,
    },
    {
      title: "Chainsaw Man",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq19IM0GeH-G5iqw8bZedp5BKFZiXMBaGpUA&s",
      description:
        "Denji é um jovem pobre que faz um contrato com um demônio motosserra. Ele ganha o poder de se transformar em Chainsaw Man e se torna um caçador de demônios para a Divisão de Segurança Pública.",
      type: "dark",
      disabled: false,
    },
    {
      title: "Spy x Family",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwl-y8Sq7AoDU2abKkHbRnyPik-Ekndu2R-Q&s",
      description:
        "Um espião, uma assassina e uma telepatia se reúnem para formar uma família falsa em uma missão secreta. Eles devem manter suas identidades verdadeiras enquanto aprendem o significado de ser uma família.",
      type: "minimalist",
      disabled: false,
    },
  ];

  return (
    <main
      style={{
        padding: "2rem",
        margin: "0",
        backgroundColor: "#f0f0f0",
        minHeight: "100vh",
        height: "100%",
        width: "100%",
        fontFamily: "Arial, sans-serif",
      }}
    >
      <h1>LISTA DE ANIMES</h1>
      <br />
      <section
        style={{
          gap: "1rem",
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
        }}
      >
        {listCardAnimes.map((anime) => (
          <Card.Container
            key={anime.title}
            type={anime.type}
            disabled={anime.disabled}
          >
            <Card.Image imageUrl={anime.imageUrl} title={anime.title} />

            <Card.Title>{anime.title}</Card.Title>

            <Card.Description>{anime.description}</Card.Description>
            <Card.Button disabled={anime.disabled} type={anime.type} />
          </Card.Container>
          // <Card.Card {...anime} key={anime.title} />
        ))}
      </section>
    </main>
  );
}

export default App;
