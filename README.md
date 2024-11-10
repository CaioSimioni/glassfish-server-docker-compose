# Glassfish4.1 Server feito em Docker Compose

## Setup

Baixar o Zip do glassfish no site da oragle: http://download.oracle.com/glassfish/4.1.2/release/glassfish-4.1.2.zip

E colocar ees nome dentro da pasta downloads: glassfish-4.1.2.zip

`docker-compose up -d --build`

Dentro do container:

`asadmin change-admin-password`

`asadmin enable-secure-admin`

`asadmin restart-domain`

`Ctrl + c`
