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

## Executando comandos

Para executar algum comando do PHP/Laravel, composer ou nodejs basta executar o comando na raiz do projeto detro da pasta `apps`. Veja alguns exemplos de possíveis comandos:

```shell
docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && php -S localhost:8000"

docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && composer install"

docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && php artisan inspire"

docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && npm install"

docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && npm run prod"

docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && npm run watch"
```

Note que o `WORKDIR` definido no `Dockerfile` está na pasta que contém os projetos, por isso é necessário entrar na pasta (`cd $(basename $PWD)`) antes de executar o comando desejado.

# Aliases

Você pode deixar os comandos mais naturais se adicionar aliases no shell que você utiliza (bash, zsh, etc...):

```shell
alias php='function _php(){  docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && php $*"; }; _php'

alias composer='function _composer(){  docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && composer $*"; };_composer'

alias npm='function _npm(){  docker-compose exec php-nodejs sh -c "cd $(basename $PWD) && npm $*"; };_npm'
```

Agora é só executar os comandos normalmente:

```shell
php -S localhost:8000

php artisan migrate

composer install

npm run dev

```

***

Desenvolvido com ❤️ por [@jeanvcastro](https://github.com/jeanvcastro)