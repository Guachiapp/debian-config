## Comandos Linux usados en el server debian VPS de Contabo para Centinela ##

### Instalación de servicio en Debian 13

Copiar el archivo con la configuración para servicios

```
sudo cp /home/guachi/codes/debian-config/centinela.service /etc/systemd/system/centinela.service
```

Verificar copiado
```
cd /etc/systemd/system/
ls
```
Instalar

```
systemctl daemon-reload
systemctl enable centinela.service
systemctl start centinela.service
systemctl status centinela.service
```


## 🧱 1. Crear el enlace simbólico desde `/srv` a tu carpeta en `/home`

```bash
sudo ln -s /home/guachi/files/visitas /srv/guachi/visitas
```

Esto crea el alias visible como:

```bash
/srv/guachi/visitas → /home/guachi/files/visitas
```

---

## 🔐 2. Ajustar permisos de directorios para que `www-data` pueda atravesarlos

Nginx necesita permiso de **ejecución (`x`)** en cada directorio de la ruta. Ejecuta:

```bash
chmod o+x /home
chmod o+x /home/guachi
chmod o+x /home/guachi/files
chmod o+x /home/guachi/files/visitas
chmod o+r /home/guachi/files/visitas/* # si los archivos no son legibles por www-data
```

Esto permite que cualquier usuario (incluido `www-data`) pueda **navegar** por la estructura de carpetas.

---

## 📂 3. Dar permisos de lectura a los archivos servidos

Para que Nginx pueda leer las imágenes:

```bash
chmod -R o+r /home/guachi/files/visitas
```

---
