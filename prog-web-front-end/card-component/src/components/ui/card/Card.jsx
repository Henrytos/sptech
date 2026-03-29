/**
 * Componente de cartão para exibição de informações.
 * @component
 * @param {Object} props - Propriedades do componente.
 * @param {string} props.title - texto principal exibido no Card
 * @param {string} props.imageUrl - caminho da imagem a ser exibida.
 * @param {string} props.description - texto secundário do Card.
 * @param {string} props.type - pode assumir dois valores:
    "dark" → estilo escuro
    "minimalist" → estilo minimalista.
 * @param {boolean} props.disabled - define se o Card estará ativo ou desabilitado
 */

/**
 * Container é um componente auxiliar para estilização do Card, aplicando diferentes estilos com base no tipo e estado de desabilitado.
 * @component
 * @param {Object} props - Propriedades do componente.
 * @param {React.ReactNode} props.children - Elementos filhos a serem renderizados dentro do container.
 * @param {string} props.type - Define o estilo do container, podendo ser "dark" ou "minimalist".
 * @param {boolean} props.disabled - Indica se o container está desabilitado, afetando a aparência e interatividade.
 */
function Container({ children, type, disabled }) {
  const onCardHover = (ev) => {
    if (!disabled) {
      ev.currentTarget.style.transform = "scale(1.05)";
    }
  };

  const onCardHoverOut = (ev) => {
    ev.currentTarget.style.transform = "scale(1)";
  };
  return (
    <div
      style={{
        color: type === "dark" ? "#fff" : "#000",
        backgroundColor: type === "dark" ? "#333" : "#fff",
        border: type === "minimalist" ? "1px solid #ccc" : "none",
        padding: "1rem",
        borderRadius: "8px",
        opacity: disabled ? 0.5 : 1,
        pointerEvents: disabled ? "none" : "auto",
        cursor: disabled ? "not-allowed" : "pointer",
        height: "auto",
        transition: "transform 0.3s ease",
        display: "flex",
        flexDirection: "column",
        gap: "0.5rem",
      }}
      onMouseOver={onCardHover}
      onMouseOut={onCardHoverOut}
    >
      {children}
    </div>
  );
}

function Title({ children }) {
  return <h2>{children}</h2>;
}

/** Componente de botão para ações dentro do Card, adaptando seu estilo e comportamento com base no estado de desabilitado e tipo do Card.
 * @component
 * @param {Object} props - Propriedades do componente.
 * @param {boolean} props.disabled - Indica se o botão está desabilitado, afetando sua aparência e interatividade.
 * @param {string} props.type - Define o estilo do botão, podendo ser "dark" ou "minimalist".
 */
function Button({ disabled, type }) {
  return (
    <>
      <div
        style={{
          flexGrow: 1,
          display: "flex",
          alignItems: "flex-end",
        }}
      >
        <button
          disabled={disabled}
          style={{
            width: "100%",
            padding: ".75rem",
            fontSize: "1rem",
            backgroundColor: type === "dark" ? "#555" : "#eee",
            color: type === "dark" ? "#fff" : "#000",
            border: "none",
            borderRadius: "4px",
            cursor: disabled ? "not-allowed" : "pointer",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            gap: "0.5rem",

            flexShrink: 0,
          }}
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-info-icon lucide-info"
          >
            <circle cx="12" cy="12" r="10" />
            <path d="M12 16v-4" />
            <path d="M12 8h.01" />
          </svg>
          {disabled ? "Indisponível" : "Saiba mais"}
        </button>
      </div>
    </>
  );
}

/**
 * Componente de imagem para exibição dentro do Card, garantindo que a imagem seja exibida corretamente e responsivamente.
 * @component
 * @param {Object} props - Propriedades do componente.
 * @param {string} props.imageUrl - URL da imagem a ser exibida.
 * @param {string} props.title - Título associado à imagem, utilizado para o atributo alt.
 */
function Image({ imageUrl, title }) {
  return (
    <>
      <picture>
        <img
          src={imageUrl}
          alt={`Imagem de ${title}`}
          style={{
            width: "100%",
            height: 200,
            objectFit: "cover",
          }}
        />
      </picture>
    </>
  );
}

/** Componente de descrição para exibição de texto dentro do Card, aplicando formatação para limitar o comprimento do texto e adicionar reticências quando necessário.
 * @component
 * @param {Object} props - Propriedades do componente.
 * @param {string} props.children - Texto a ser exibido como descrição, que será formatado para limitar seu comprimento.
 */
function Description({ children }) {
  return <p>{formatText(children)}</p>;
}

/* Função auxiliar para formatar o texto, limitando-o a 100 caracteres e adicionando reticências se exceder esse limite.
 * @param {string} text - O texto a ser formatado.
 * @param {number} length - O comprimento máximo permitido para o texto antes de adicionar reticências (padrão é 100).
 * @returns {string} O texto formatado, com reticências se exceder 100 caracteres.
 */
function formatText(text, length = 100) {
  if (text.length > length) {
    return text.slice(0, length) + "...";
  }
}

/**
    * Componente principal do Card, que compõe os subcomponentes de Container, Image, Title, Description e Button para exibir um cartão completo com base nas propriedades fornecidas.
    * @param {Object} props - Propriedades do componente.
    * @param {string} props.title - texto principal exibido no Card
    * @param {string} props.imageUrl - caminho da imagem a ser exibida.
    * @param {string} props.description - texto secundário do Card.
    * @param {string} props.type - pode assumir dois valores:
       "dark" → estilo escuro
       "minimalist" → estilo minimalista.
    * @param {boolean} props.disabled - define se o Card estará ativo ou desabilitado
 */
function Card({ title, imageUrl, description, type, disabled }) {
  return (
    <Container key={title} type={type} disabled={disabled}>
      <Image imageUrl={imageUrl} title={title} />

      <Title>{title}</Title>

      <Description>{description}</Description>
      <Button disabled={disabled} type={type} />
    </Container>
  );
}

export { Card, Container, Title, Button, Image, Description };
