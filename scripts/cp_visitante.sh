echo "Detener nginx"
systemctl stop nginx
sleep 1

echo ""
echo "Eliminando archivo de configuracion en /etc/nginx/sites-available/visitante.conf"
rm /etc/nginx/sites-available/visitante.conf

echo "Archivo visitante.conf Eliminado."

echo "Copiar archivo /home/guachi/codes/debian-config/nginx/visitante.conf en /etc/nginx/sites-available/visitante.conf"
cp /home/guachi/codes/debian-config/nginx/visitante.conf  /etc/nginx/sites-available/visitante.conf
echo "Archivo visitante.conf copiado."

echo "Crear un enlace simbolico a sites-available para visitante.conf"
ln -s /etc/nginx/sites-available/visitante.conf /etc/nginx/sites-enabled/

sleep 1

echo ""
echo "Validar archivos de configuracion de Nginx"
nginx -t
echo "Archivos de configuracion de Nginx validados."

echo ""
echo "Eliminando carpeta guachi-visitante en /usr/share/nginx/guachi-visitante"
rm -r /usr/share/nginx/guachi-visitante
echo "Carpeta Eliminada."

echo ""
echo "Creando carpeta guachi-visitante en /usr/share/nginx/"
cp -r /home/guachi/codes/vanillajs/guachi-visitante/dist/ /usr/share/nginx/guachi-visitante
echo "Carpeta Creada."

echo ""
echo "Iniciando nginx"
systemctl start nginx
echo "Script Finalizado."
