# Proyecto Joits

### Especificaciones fucionales

#### Las urls son :

Login : `/`

Seleccion de tickets : `buying-flow/tickets`

Confirmacion de la compra : `buying-flow/confirm`

Panel de control : `profile`

Buscador de amigos : `profile/friends`

### Desarollo

#### Como levantar el proyecto

##### Frontend

- Ir a la carpeta `frontend` y correr el siguiente comando

`npm run start`

#### Como correr los tests

En caso de querer correrlos todo el tiempo para que cada vez que refresque los archivos me corra los tests (buena practica para tdd)

`npm run test -- --watch`

Si queremos ver un `console.log()` que se ejecuta dentro de nuestros tests lo que debemos hacer es agregar un parametro mas asi :

`npm run test -- --watch --verbose=false`
