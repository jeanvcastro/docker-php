# Bem vindo ao docker-php 👋

## Introdução

Ambiente de desenvolvimento PHP/Laravel 🐘 baseado em Docker 🐳.

## Estrutura de Pastas

| Pasta | Descrição |
|--|--|
| apps/ | É o local onde você vai clonar seu projetos |
| mysql/ | Contém as configurações do MySQL |
| nginx/ | Contém as configurações do Nginx |
| php/ | Contém as configurações do php-fpm, php-cli e xdebug |
| redis/ | Contém as configurações do Redis|

**Importante:** Renomeie os arquivos .example nessas pastas antes de montar sua imagem. As alterações nesses arquivos devem ser feitas com muito cuidado pois refletem diretamente no container!

## Xdebug

O propósito dessa imagem é criar um container para desenvolvimento (por favor, não use em produção!) e por isso o xdebug é instalado por padrão. Você pode mudar isso editando o Dockerfile. As configurações do xdebug podem ser editadas no arquivo `/php/mods-available/xdebug.ini`.

Feito isso agora é só configurar a sua IDE. Segue abaixo o exemplo da configuração para o PHPStorm.

 1. Acesse o menu: File > Settings >Languages & Frameworks > PHP > Debug
 2. Em Xdebug, marque todas as caixas e selecione a porta. A porta padrão desse projeto é a 9001, mas pode ser qualquer outra, contanto que seja a mesma definida no `.env` e no `/php/mods-available/xdebug.ini`
 3. Acesse o menu: File > Settings >Languages & Frameworks > PHP > Servers
 4. Clique no botão (**+**) para adicionar um servidor
 5. Preencha os campos da seguinte maneira:
	 - **Name:** xdebug-docker (o mesmo nome utilizado em serverName no docker-compose.yml)  
    - **Host:**  dev.seuapp.com.br  
    - **Use path mappings:** selecione a caixa
Ao lado da pasta projeto, preencha o campo **Absolute path on the serve**r com o caminho do seu projeto no container (exemplo: /var/www/app).

## Entry point
No fim do Dockerfile existe uma instrução para executar o script `docker-start` que vai iniciar os serviços e baixar as dependências dos projetos via composer o npm.

## Instalação

Para iniciar é só executar `docker-compose up --build` e começar a programar!

***
Desenvolvido com ❤️ por [@jeanvcastro](https://github.com/jeanvcastro)
