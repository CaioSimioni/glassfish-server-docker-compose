# Glassfish4.1 Server feito em Docker Compose

## To-do List
[ ] Arrumar o arquivo de entrypoint para fazer as configurações de admin e habilitar o console-admin
[ ] Deixar um app de teste opcional

## Setup

Baixar o Zip do glassfish no site da oragle: http://download.oracle.com/glassfish/4.1.2/release/glassfish-4.1.2.zip
E colocar o arquivo zip numa pasta `./downloads` com o seguinte nome: glassfish-4.1.2.zip

Agora crie um arquivo `.env`, e preencha as informações

## Deploy

Para subir o container use: `docker-compose up -d --build`

Dentro do container, use os seguintes comandos para habilitar o console-admin:

`asadmin change-admin-password`

`asadmin enable-secure-admin`

`asadmin restart-domain`

`Ctrl + c`
