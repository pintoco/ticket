FROM php:7.4-apache

# Instalar las extensiones necesarias (como pgsql si es necesario)
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pgsql pdo_pgsql

# Crear el directorio de sesiones y establecer permisos
RUN mkdir -p /var/www/html/sessions && chmod 777 /var/www/html/sessions

# Establecer el directorio de sesiones en la configuración de PHP
RUN echo "session.save_path = \"/var/www/html/sessions\"" >> /usr/local/etc/php/conf.d/session.save_path.ini

# Copiar los archivos de la aplicación
COPY . /var/www/html/