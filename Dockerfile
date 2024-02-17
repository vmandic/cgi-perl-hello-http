# Use the official Apache image as the base image
FROM httpd:latest

# Install cpanm command for Perl module distributions from CPAN
RUN apt-get update && apt-get install --assume-yes cpanminus

# Enable CGI module
RUN sed -i '/httpd-ssl.conf/a LoadModule cgi_module modules/mod_cgi.so' /usr/local/apache2/conf/httpd.conf

# Install Perl dependencies
RUN cpanm --skip-satisfied CGI::Tiny

# Copy the CGI script into the container
COPY hello.cgi /usr/local/apache2/cgi-bin/

# Set permissions for the CGI script
RUN chmod +x /usr/local/apache2/cgi-bin/hello.cgi

# Expose port 80
EXPOSE 80

CMD ["httpd-foreground"]
