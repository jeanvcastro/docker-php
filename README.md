# Bem vindo ao docker-php 👋

## Introdução

Este é um ambiente de desenvolvimento PHP/Laravel 🐘 baseado em Docker 🐳.

## Estrutura de Pastas

| Pasta | Descrição |
|--|--|
| apps/ | É o local onde você vai clonar seu projetos |
| mysql/ | Aqui você pode adicionar os seus backups de banco de dados. Eles serão importados em ordem alfabética. |
| nginx/ | É o local onde vai definir os arquivos de configuração (hosts) do Nginx |

## Xdebug

O propósito dessa imagem é criar um container para desenvolvimento (por favor, não use em produção!) e por isso o Xdebug 3 é instalado por padrão. Você pode definir as configurações usando as variáveis de ambiente `XDEBUG_MODE`, `XDEBUG_CONFIG`, `XDEBUG_SESSION` no arquivo `.env`. Caso queira desativar o debugger é só definir a variável `XDEBUG_MODE=off`.

Para saber mais sobre essas configurações acesse a página oficial do Xdebug clicando [aqui](https://xdebug.org/docs/all_settings)

Feito isso agora é só configurar a sua IDE. Segue abaixo o exemplo da configuração para o PHPStorm.

1. Acesse o menu: File > Settings >Languages & Frameworks > PHP > Debug

2. Em Xdebug, marque todas as caixas e selecione a porta. A porta padrão desse projeto é a 9003, ou alguma outra definida na variável `XDEBUG_CONFIG` no  `.env`

3. Acesse o menu: File > Settings >Languages & Frameworks > PHP > Servers

4. Clique no botão (**+**) para adicionar um servidor

5. Preencha os campos da seguinte maneira:

-  **Host:** www.meuapp.local

-  **Use path mappings:** selecione a caixa

Ao lado da pasta projeto, preencha o campo **Absolute path on the server** com o caminho do seu projeto no container (Exemplo: /var/www/meu-app).

## Entry point

No fim do Dockerfile existe uma instrução para executar o script `docker-start` que vai iniciar os serviços e baixar as dependências dos projetos via composer e npm.

## Instalação

Para iniciar é só executar `docker-compose up --build` e começar a programar!

***

Desenvolvido com ❤️ por [@jeanvcastro](https://github.com/jeanvcastro)