# Usar a imagem base do GlassFish com Java 8
FROM glassfish:4.1-jdk8

# Copiar o script de entrada
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Dar permissão de execução ao script de entrada
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expor a porta padrão do GlassFish
EXPOSE 8080 4848

# Definir o script de entrada como ponto de entrada
ENTRYPOINT ["entrypoint.sh"]
