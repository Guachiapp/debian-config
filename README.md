## Comandos Linux usados en el server debian VPS de Contabo para Centinela ##

### Instalación de servicio en Debian 13

Copiar el archivo con la configuración para servicios

```
cp /root/codes/debian-config/centinela.service /etc/systemd/system/centinela.service
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