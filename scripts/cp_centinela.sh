echo "Detener nginx"
systemctl stop nginx
sleep 1

echo ""
echo "Eliminando archivo de configuracion en /etc/nginx/sites-available/centinela.conf"
rm /etc/nginx/sites-available/centinela.conf

echo "Archivo centinela.conf Eliminado."

echo "Copiar archivo /home/codes/debian-config/nginx/centinela.conf en /etc/nginx/sites-available/centinela.conf"
cp /home/codes/debian-config/nginx/centinela.conf  /etc/nginx/sites-available/centinela.conf
echo "Archivo centinela.conf copiado."

echo "Crear un enlace simbolico a sites-available para centinela.conf"
ln -s /etc/nginx/sites-available/centinela.conf /etc/nginx/sites-enabled/

sleep 1

echo ""
echo "Validar archivos de configuracion de Nginx"
nginx -t
echo "Archivos de configuracion de Nginx validados."

echo ""
echo "Iniciando nginx"
systemctl start nginx
echo "Script Finalizado."
