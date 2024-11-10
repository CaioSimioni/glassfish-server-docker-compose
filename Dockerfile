# Use uma imagem base local do OpenJDK
FROM openjdk:8-jdk

# Defina variáveis para o GlassFish
ENV GLASSFISH_VERSION 4.1.2
ENV GLASSFISH_HOME /opt/glassfish4
ENV PATH="${GLASSFISH_HOME}/bin:${PATH}"
ENV APP_PORT 8080  # Porta do aplicativo
ENV CONSOLE_PORT 4848  # Porta do console

# Copie o GlassFish do sistema local em vez de baixá-lo
COPY ./downloads/glassfish-$GLASSFISH_VERSION.zip /tmp/glassfish.zip

# Instale o GlassFish a partir do arquivo copiado
RUN apt-get update && \
    apt-get install -y unzip && \
    unzip /tmp/glassfish.zip -d /opt && \
    rm /tmp/glassfish.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crie o domínio apenas se ele não existir
RUN if [ ! -d "${GLASSFISH_HOME}/glassfish/domains/domain1" ]; then \
    ${GLASSFISH_HOME}/bin/asadmin create-domain --nopassword domain1; \
    else \
    echo "O domínio 'domain1' já existe."; \
    fi

# Copie o script para dentro do container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Exponha as portas (isso pode ser feito no docker-compose.yml, então não é necessário no Dockerfile)
# EXPOSE ${APP_PORT} ${CONSOLE_PORT}

# Defina o entrypoint do container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
