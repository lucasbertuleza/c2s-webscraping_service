# Web Scraping Service
<sup>Repositório parte do teste técnico da C2S.</sup>

Este serviço é composto por um back-end (aplicação Rails + banco de dados) e um Web Driver, ambos representados na cor verde. O back-end é um consumer do tópico `scraper.tasks.pending` responsável por processar tarefas pendentes enviadas pela [webapp](https://github.com/lucasbertuleza/c2s-main_app). Utiliza o Selenium Web Driver para carregar as páginas e extrair dados, enquanto os resultados são armazenados em um banco de dados MySQL.

![c4_container](https://github.com/user-attachments/assets/de1c731c-49d9-4a8a-b7d8-83533e09d18f)

## Dependências

- Docker
- Docker Compose
- Serviço de notificação executando ([notification_service](https://github.com/lucasbertuleza/c2s-notification_service))

**Observação 1:** Talvez você encontre alguma dificuldade para fazer o build da aplicação caso esteja executando o Linux no Windows com o WSL. \
**Observação 2:** Se você utiliza o compose como plugin, utilize `docker-compose` ao invés de `docker compose` ao executar os comandos.

## Build

Caso você tenha o utilitário `make` instalado, basta executar o seguinte comando na raiz do projeto:

```sh
make build
```

Caso contrário:

```sh
cp .env.example .env
docker compose build
```

## Executando a aplicação

⚠️ **Atenção!** \
Certifique-se de que o micro serviço de notificação já está em execução na sua máquina antes de continuar. Este serviço faz parte de um conjunto de 4 serviços e é uma das dependências do [gerenciador de tarefas](https://github.com/lucasbertuleza/c2s-main_app), dessa forma, é necessário que ele esteja em execução junto com os demais para que o gerenciador de tarefas possa funcionar corretamente.

```bash
make up
# ou
docker compose up -d
```

Verifique o status (**Up**) de todos os containers para garantir que não houve qualquer problema:

```bash
docker compose ps -a --format "table {{.Name}}\t{{.Status}}"
```
