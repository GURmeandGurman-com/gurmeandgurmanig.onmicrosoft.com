# Internet Etecsa login

![Internet Etecsa login](icons/internet-etecsa-login.jpg)

Gestione su sesión de internet wifi etecsa solo presionando una tecla

## Nota

### Para usuarios Nauta Hogar

La app aún no ha sido probada con el servicio nauta hogar.

### Para usuarios con router AirOS

Esta app ha sido probada con un NSM5 versión AirOS XW.v6.2.0, puede ser que funcione en otros dispositivos AirOS.

#### Importante

Cuando el dispositivo AirOS pierde la sesión dhcp con el router de etecsa la app se encarga de enviar la orden al dispositivo AirOS para que inicie una nueva sesión dhcp, el dispositivo AirOS tarda alrededor de unos 14 segundos en este proceso, también depende de la calidad del enlace con el router de etecsa. En este caso debe esperar a que termine esta operación, después de esto la app iniciará la conexión a internet.

## Próximamente

- Versión para Windows

## Requisitos previos

- Distribución basada en debian.

> La app ha sido probada en Ubuntu 18.04 LTS y 19.10

- Ping indicator para ver estado de conexión a internet

  Configurar la extensión con ip `1.1.1.1`

  [Ping Indicator](https://extensions.gnome.org/extension/923/ping-indicator/)

- Algunos paquetes `npm` están bloqueados para Cuba, defina el proxy en el
  archivo `~/.npmrc`.

  Copie el siguiente texto dentro del archivo `~/.npmrc` y modifíquelo:

  ```text
  proxy=http://USER:PASS@PROXY-IP:PROXY-PORT
  https-proxy=http://USER:PASS@PROXY-IP:PROXY-PORT
  ```

  ```bash
  nano ~/.npmrc
  ```

## Actualizar

Para actualizar la app ejecute:

```bash
sudo bash /opt/internet-etecsa-login/bin/update
```

## Instalar

Ejecute:

```bash
wget -qO - https://raw.githubusercontent.com/yunielrc/internet-etecsa-login/master/bin/install | sudo bash
```

### Configurar

Edite al archivo `.env`

- Defina las credenciales de su cuenta internet nauta.
- Si tiene un router AirOS quite los comentarios a las variables `AIROS_ROUTER_IP`
y `BEFORE_CONNECT` removiendo la almohadilla `#`. Defina la ip del router.

```bash
sudo nano /opt/internet-etecsa-login/.env
```

ó

```bash
sudo gedit /opt/internet-etecsa-login/.env
```

Proteja el archivo `.env` después de editarlo

```bash
sudo chown nauta:nauta /opt/internet-etecsa-login/.env
sudo chmod 444 /opt/internet-etecsa-login/.env
```

Añada la clave pública ssh `/tmp/id_rsa.pub` al dispositivo AirOS:  

![AirOS](docs/airos-ssh-key.png)

Instale e inicie el servicio

```bash
sudo systemctl enable internet-etecsa-login --now
```  

Asigne una tecla al comando `gtk-launch internet-etecsa-login` para conectarse
y desconectarse con más comodidad, pruebe asignarle `F9` como se muestra acontinuación:

![AirOS](docs/keyboard-shortcut.png)

Pruebe ver el log:

```bash
tail -f /var/log/internet-etecsa-login.log
```

Para actualizar la app automáticamente se creó una entrada en el cron del usuario `root`.

Para modificarla ejecute:

```bash
sudo crontab -e
```

## Uso

Presione la tecla asignada para conectarse y desconectarse a internet o ejecute el acceso directo `Internet Login` para conectarse y vuélvalo a ejecutar para desconectarse.
