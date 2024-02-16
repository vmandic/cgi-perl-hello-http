# Use the official Apache image as the base image
FROM httpd:latest

# Enable CGI module
RUN sed -i '/httpd-ssl.conf/a LoadModule cgi_module modules/mod_cgi.so' /usr/local/apache2/conf/httpd.conf

# Create a directory for CGI scripts
RUN mkdir -p /usr/local/apache2/cgi-bin

# Copy the CGI script into the container
COPY hello.cgi /usr/local/apache2/cgi-bin/

# Set permissions for the CGI script
RUN chmod +x /usr/local/apache2/cgi-bin/hello.cgi

RUN apt update && apt install -y libcgi-pm-perl

# Expose port 80
EXPOSE 80

CMD ["httpd-foreground"]

