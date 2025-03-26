1. Operadores Lógicos AND/OR
1. Sistema de Avaliação de Atendimento: Dê Sua Nota! 

Crie um pequeno sistema de avaliação de atendimento, o qual: 

a) Pergunte a nota para o atendimento 

b) Ao clicar num botão "Avaliar atendimento", pode uma dessas frases abaixo do botão: 

    b.1) "Nota inválida", caso a nota não esteja entre 0 e 10 

    b.2) "Não aprovado", caso a nota for entre 0 e menor que 5 

    b.3) "Neutro", caso a nota for entre 5 e 6 

    b.4) "Aprovado", caso a nota for mais que 6 

2. Simulador de Preferências de Compras: Será que Robervaldo Gostaria?

Imagine que Robervaldo está buscando um novo celular. Ele tem algumas preferências específicas para a escolha de modelo.

Robervaldo prefere celulares com tela grande (acima de 6.5 polegadas) e que sejam da cor preta ou prata.

Com base nessas informações, crie um simulador no qual:

a) Solicite o tamanho da tela do celular encontrado.

b) Solicite a cor do celular encontrado, dentre as opções:

    Preto
    Prata
    Azul
    Vermelho

c) Ao clicar em "Será que ele gosta?", mostre, abaixo:

    A imagem de uma pessoa feliz, caso as características do celular coincidam com as preferências de Robervaldo.
    Ou a imagem de uma pessoa decepcionada, caso contrário.  

  
3. Simulador de Preço do Bilhete Único de São Paulo

Crie um pequeno simulador de preço de passagem de Bilhete Único de São Paulo num programa, o qual: 

a) Tenha uma combo para indicar o tipo de passageiro, com os itens 

            Comum 
            Estudante 
            Idoso/PNE 

b) Tenha uma outra combo, para indicar o tipo de passagem, com os itens 

            Passagem única 
            Passagem integração 

c) Ao clicar num botão "Simular preço", considere que o preço unitário de uma passagem única é R$4,40 e que a integração é R$5,90 para fazer os cálculos necessários para exibir uma frase como esta: 

            Valor da passagem escolhida: R$X,XX 

d) Considere ainda que um estudante tem 50% de desconto e idoso/PNE possuem gratuidade em qualquer tipo de passagem 

4. Autenticação Segura: Acesso ao Banco Melete

Um novo banco eletrônico, o Banco Melete possui um sistema diferenciado de autenticação no qual pede um login, uma senha e uma 3ª informação pessoal, que pode ser o ano de nascimento ou o nome do animal de estimação do cliente. Crie um protótipo que simule a autenticação de um determinado cliente, o qual: 

a) Solicite o login, a senha e a informação pessoal ao usuário 

b) Ao clicar num botão "Autenticar", exiba uma dessas frases abaixo do botão: 

     b.1.) "Usuário autenticado", caso o login seja "ana", a senha "braga" e a informação pessoal for ou "1949" ou "louro josé" 

     b.2.) "Falha na autenticação", caso as regras de verificação em b.1) falhem 

  

  
5. Avaliação do Clima: Está Agradável ou Desconfortável?

Crie um programa em que ajude a avaliar o clima de um ambiente, o qual: 

a) Solicite a temperatura 

b) Solicite a umidade do ar 

c) Ao clicar em 'Avaliar clima': 

      c.1) Caso a umidade for inválida, ou seja, menor que 0 ou maior que 100, exiba um alert "Valor de umidade inválido" e limpe qualquer outro texto que exista na tela (item c.2) 
      c.2) Caso a umidade for válida, exiba uma dessas frases na própria página, abaixo do botão: 

            "Clima agradável", caso a temperatura for entre 22 e 23 e a umidade for menor que 60. 
            "Clima desconfortável", em caso contrário.  

  

  
6. Desempenho Escolar: O Aluno Foi Aprovado?

Crie um programa que avalie o desempenho de um aluno, o qual: 

a) Solicite a nota e a frequência do aluno 

b) Ao clicar em "Analisar aluno", faça as seguintes ações... 

c) Caso a nota não seja válida, ou seja, caso não esteja entre 0 e 10, exiba um alert "Onde já se viu nota <0 ou >10?!" e limpe qualquer outro resultado que já estiver aparecendo na tela 

d) Caso a frequência não seja válida, ou seja, caso não esteja entre 0 e 100, exiba um alert "Onde já se viu frequência <0 ou >100?!" e limpe qualquer outro resultado que já estiver aparecendo na tela 

e) Caso a nota estiver entre 0 e menor que 6, exiba na tela essa frase: "Aluno ficou abaixo da média" 

f) Caso a nota estiver entre 6 e 8, exiba na tela essa frase: "Aluno ficou na média" 

g) Caso a nota estiver entre mais que 8 e 10, exiba na tela essa frase: "Aluno acima da média" 

h) Caso o aluno tiver frequência a partir de 75, exiba na tela "Aluno aprovado por frequência" ou "Aluno reprovado por frequência", em caso contrário 

  

  
7. Autenticação Segura com Tentativas Limitadas

Melhore o exercício 4, de tal forma que: 

a) Sempre que ocorrer uma falha na autenticação, deve aparecer abaixo da frase de "Falha de autenticação" uma outra frase, como esta: 

            Você ainda tem 2 tentativa(s) 

b) A ideia é que o usuário tem 3 tentativas de autenticação. Sempre que errar novamente na autenticação, o "contador" de tentativas reduz em 1 na tela. 

c) Uma vez que se esgotarem as tentativas, deve surgir mais uma frase abaixo, que seria 

     Usuário BLOQUEADO! Procure seu gerente! 

d) Em caso de usuário bloqueado, não adianta nem tentar fazer uma autenticação com as credenciais corretas, que nada mais acontecerá 

e) Caso o usuário autentique com sucesso, sem que tenham sido queimadas as 3 tentativas, a mensagem de autenticação aparece normalmente e a frase com a quantidade de tentativas deve sumir da tela e deve ser "reiniciada" para as próximas falhas. 
