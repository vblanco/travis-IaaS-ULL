# Acceso a IaaS ULL a través de VPN desde Travis

Para realizar un despliegue desde Travis-CI a un backend que se ejecuta 
en el IaaS de la ULL es necesario establecer previamente una conexión a
través de la 
[VPN de la ULL](https://www.ull.es/servicios/stic/2016/05/10/servicio-de-vpn-de-la-ull/).

En este ejemplo se activa la VPN y se realizan conexiones SSH para ejecutar
comandos en un backend. Los archivos de configuración de VPN y la clave 
privada SSH se deben encriptar antes de añadirlas al repositorio. 

## Encriptación de archivos sensibles con Travis-CI

Travis-CI provee de un 
[mecanismo de encriptación](https://docs.travis-ci.com/user/encrypting-files/) 
para estos casos. Como tenemos dos archivos con información sensible, 
se debe crear un paquete (con tar por ejemplo) con todos los archivos, 
encriptar este paquete y subir su versión encriptada al repositorio:

 - `ull.conf` (configuración VPN. NO está añadida al repositorio. Deben 
    tenerlo en su carpeta local)

    ```
    # 
    # Archivo de configuración ull.conf para vpnc
    # 

    IPSec gateway vpn.ull.es
    IPSec ID ULL
    IPSec secret <PSK ULL VPN key>
    Xauth username <your-ULL-username>
    Xauth password <your-ULL-passwd>
    ```

 - `my_ssh_key` (Clave privada de la pareja generada por el comando 
   `ssh-key-gen -f my_ssh_key`. NO está añadida al repositorio. Deben 
    tenerlo en su carpeta local)
 
 - Empaquetamos archivos con: 
   
    ```bash
    tar cf secrets.tar ull.conf my_ssh_key
    ```

 - Encriptamos con la herramienta del linea de comandos [travis](https://github.com/travis-ci/travis.rb#readme)

    ```bash
    travis encrypt-files secrets.tar --add
    ```

Obtendremos un archivo `secrets.tar.enc` que subiermos al repositorio. 
Recuerden poner en `.gitignore` los archivos `secret.tar`, `ull.conf` 
y `my_ssh_key` para que no se suban al repositorio. 

La opción `--add` configura `.travis.yml` con la secuencia de comandos 
necesaria para desecriptar estos archivos en la maquina virtual que se 
instancia en Travis-CI.

## Ejecución de script de despliegue

El metodo de despliegue de Travis-CI que utilizaremos es el basado en un
script a medida. En el repositorio pueden encontrar uno de ejemplo que 
activa la VPN, realiza la ejecución remota en un backend mediante SSH y 
finaliza desconectando la VPN
