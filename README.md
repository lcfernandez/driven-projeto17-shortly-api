# driven-projeto17-shortly-api

* **Projeto #17 - Shortly API** do aluno Luiz Cláudio F. Fernandez, Turma 8 da Driven.

* **Deploy** (vulgo *Link da Titia*): https://projeto17-shortly-api.onrender.com

---

## Instruções para rodar localmente

* Certifique-se de ter o [Git](https://git-scm.com/), [Node](https://nodejs.org/en/) (ou [NVM](https://github.com/nvm-sh/nvm)) e [PostgreSQL](https://www.postgresql.org/download/) instalados e configurados.

* Baixe ou clone o projeto na sua máquina local.

* Certifique-se de que o servidor do PostgreSQL esteja rodando.

* Restaure o dump do banco de dados presente em `./dump`.

* Na raiz do projeto, instale as dependências necessárias com o comando:

    ```
    npm i
    ```

    ou

    ```
    npm install
    ```

- Com base no arquivo `.env.example`, crie um arquivo `.env` preenchendo as variáveis de acordo com a configuração do banco criado anteriormente e com os devidos ajustes baseados na sua configuração local. A conexão com o banco exige uma configuração semelhante a:

    ```
    DATABASE_URL = postgres://<usuario>:<senha>@localhost:5432/shortly
    ```

    onde `<usuario>` e `<senha>` são o usuário e senha do seu banco local e assumindo que o Postgres esteja rodando na porta padrão (5432);

    ```
    JWT_SECRET = <chave>
    ```

    onde `<chave>` é um valor arbitrário para codificar/decodificar os futuros tokens criados;

    ```
    PORT = <porta>
    ```

    onde `<porta>` é a porta desejada para que aplicação rode. Caso essa variável não seja especificada, por padrão, será feita a tentativa de conexão na porta 4000; e

    ```
    SSL_ENABLED = false
    ```

    para habilitar a conexão local do banco de dados.

* Rode o projeto no ambiente de desenvolvimento com o comando:

    ```
    npm run dev
    ```

* Um servidor local estará rodando na porta 4000 (ou outra especificada no `.env`) ao ser retornada a mensagem:

    ```
    Server running on port 4000
    ```