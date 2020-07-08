# Configuração de servidor web
Contém os arquivos da avaliação da tray

# Documentação
**Etapa 1:** Criar usuário Linux e verificar o acesso remoto ao servidor.

Usuário root sem acesso ao terminal (shell).  
Configurar/verificar o arquivo */etc/ssh/sshd_config* e verificar linha #PermitRootLogin.  

**Comandos:**
```sh
$ adduser valdir 
$ vim /etc/ssh/sshd_config 
$ systemctl restart ssh
```
**Etapa 2:** Instalação e configuração do programa Servidor Web PHP Apache2. **Comandos:**
```sh
$ apt-get update 
$ apt-get upgrade 
$ apt-get install apache2 php 
$ vim /etc/apache2/apache2.conf 
$ cp /etc/apache2/sites-available/000-default.conf olatray.com.br.conf 
$ vim /etc/apache2/sites-available/olatray.com.br.conf
```
**Etapa 3:** Debbugar os códigos PHP do servidor Web.  
Para debbugar e corrigir os erros adotei a abordagem de logs em */var/log/apache2/error.log*. Conforme o acesso era feito pelo navegador, realizava o monitoramento em outro terminal das respectivas mesnsagens. As correções realizadas estão comentadas no código.  
Foi criada uma pasta chamada **perguntas**, para atender as necessidades do código e o arquivo *index.php*, fora da pasta perguntas, para redirecionamento automatizado via *http://ip* para *http://ip/perguntas*.  
No arquivo *apache2.conf* foi realizada configuração para não permitir acesso direto pelo path da URL a algum arquivo (removendo INDEXES ou também editando *php.ini*).

**Comandos utilizados:**
``` sh
$ wget https://github.com/luishscosta/prova-devops/archive/master.zip
$ unzip master.zip
$ scp -r master/* /var/www/html/ 
$ chown -R root:www-data /var/www/html/* 
$ chmod -R 755 root:www-data /var/www/html/*  
$ tail -f /var/log/apache2/error.log 
$ mkdir /var/www/html/perguntas 
$ vim /var/www/html/perguntas/index.php 
$ touch /var/www/html/index.php
```

**Etapa 4:** Softwares e artefatos utilizados.

- Servidor AWS tipo EC2 gratuito;
- Sistema operacional Linux Ubuntu 18.04.4; (uname -a ou lsb_release)
- Servidor Web Apache2 versão 2.4.25 (apache2ctl -version)
- PHP 7.0.33 (php -v) Servidor utlizado para teste:
- Acesso ao servidor http://3.135.231.183/perguntas
- Acesso ao monitoramento do servidor com atualização a cada 5 segundos - - http://3.135.231.183/server-status/?refresh=5

**Epata 5:** Criação do script de automação. 
**Comandos:**
``` sh
$ vim setup.sh 
$ chmod 777 setup #permissão total
$ ./setup or sh setup.sh
```

**Referências:**  
https://linuxize.com/post/how-to-install-php-on-ubuntu-18-04/  
https://pt.stackoverflow.com/questions/27534/passando-vari%C3%A1veis-pela-url-utilizando-url-amig%C3%A1veis-via-get  
https://linuxhint.com/install_dig_debian_9/  
https://httpd.apache.org/docs/current/mod/mod_status.html  
https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu/  
https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html  
https://serversmtp.com/smtp-error/  
https://community.hostek.com/t/how-do-i-fix-outlook-error-550-no-such-user-here/472  
https://registro.br/  
https://tools.ietf.org/html/rfc822  
https://www.zabbix.com/integrations/apache  
https://infotux.blogspot.com/2011/12/entendendo-os-registros-de-dns-aaaa-ns.html  
https://www.cyberciti.biz/faq/linux-unix-dig-command-examples-usage-syntax/
