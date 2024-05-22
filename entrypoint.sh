#!/bin/bash

# Função para alterar a senha do administrador
change_admin_password() {
    if [ -n "$ADMIN_PASSWORD" ]; then
        asadmin start-domain
        echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > /tmp/passwordfile
        asadmin --user admin --passwordfile /tmp/passwordfile change-admin-password
        rm /tmp/passwordfile
        asadmin stop-domain
    else
        echo "A senha do administrador não foi definida. Defina a variável de ambiente ADMIN_PASSWORD."
        exit 1
    fi
}

# Função para habilitar o Secure Admin
enable_secure_admin() {
    asadmin start-domain
    asadmin enable-secure-admin
    asadmin stop-domain
}

# Função para iniciar o domínio
start_domain() {
    asadmin start-domain -v
}

# Função para parar o domínio
stop_domain() {
    asadmin stop-domain
}

# Função para fazer o deploy da aplicação
deploy_app() {
    if [ -n "$APP_NAME" ] && [ -f "/app/$APP_NAME" ]; then
        asadmin deploy --force=true /app/$APP_NAME
    else
        echo "Nenhum arquivo WAR encontrado para fazer o deploy"
    fi
}

# Função principal para tratar comandos
main() {
    case "$1" in
        configure)
            change_admin_password
            enable_secure_admin
            ;;
        start)
            start_domain
            ;;
        stop)
            stop_domain
            ;;
        deploy)
            deploy_app
            ;;
        *)
            echo "Uso: $0 {configure|start|stop|deploy}"
            exit 1
    esac
}

# Executa a função principal com o comando passado
main "$@"
