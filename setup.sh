#!/bin/bash
#script criado por Valdir valdirbussola@gmail.com
#Execute esse script com usuario root ou sudo

echo "============================================================================================"
echo " Script iniciou sua execucao!!!!"
echo " Aguarde o processo de instalacao terminar"
echo "============================================================================================"



apt-get install apache2 php libapache2-mod-php unzip curl -y  #instalação do apache e PHP (não senti falta de mais pacotes php-* geralmentes utilizados

#teste com git
#cd /root/prova-devops-tray/
#git clone https://github.com/Bussola2015/prova-devops-tray.git
#git config --global user.name user_name
#git config --global user.email email_id

wget https://github.com/Bussola2015/prova-devops-tray/archive/master.zip  #download dos arquivos Git
unzip master.zip
mkdir /var/www/html/perguntas
rm prova-devops-tray-master/perguntas.json
rm /var/www/html/index.html
cp -r prova-devops-tray-master/* /var/www/html/
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/olatray.com.br.conf
a2dissite 000-default.conf  #desabilita site default
a2ensite olatray.com.br.conf
chown -R root:www-data /var/www/*   #mudança de proprietário
chmod -R 775 /var/www/*   #permissão ao arquivos do apache/PHP
apache2ctl configtest #verifica sintaxe
#sed 's/2M/1G/g' /etc/php/7.0/apache2/php.ini
systemctl reload apache2   #releitura dos arquivos e configuração

echo "============================================================================================"
echo "Terminou"
echo "Instalado com sucesso!!"
echo "============================================================================================"

echo "============================================================================================"
echo "Removendo arquivos nao necessarios"
echo "============================================================================================"

rm -r master.zip prova-devops-tray-master
#apt-get autoremove

echo "============================================================================================"
echo " Já pode acessar seu servidor no navegador web"
echo "============================================================================================"
