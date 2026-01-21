**Tutorial rápido**

Guia desde cero hasta el informe final

1) Clonar o descomprimir el proyecto

**Opción A Clonar el repositorio**
git clone https://github.com/Gerardlf/tiendaOnline.git
 
**Opción B Descargar ZIP**
- Descargar y descomprimir el proyecto.

2) Configurar variables/claves minimas

este repositorio es público, por lo que no incluye archivos sensibles:

- /lib/firebase_options.dart
- android/app/google-services.json
 Una vez creado un proyecto en Firebase ejecutamos:
 
 - flutter pub get
 - dart pub global activate glutter_cli
 - flutterfire configure

 3) Ejecutar la App

 - flutter run 
 - flutter run -d chrome

 4) Hacer login anónimo
    - Al iniciar la app pulsa "Continuer como invitado" y entraras a Home.

    ![AUTH](capturas/PantallaAuth.png)


5) Añadir al carrito
    - Pulsar botón añadir para añadir dicho producto al carrito.
    ![Cart](capturas/CartPantalla+800.png)   


6) Guardar un favorito
    - Pulsar sobre favorito para añadir a favoritos

7) Abrir pantalla favoritos
     - Pulsar el icono de favoritos en el Appbar de la aplicación.
     ![FAV](capturas/Favoritos.png)

8) Abrir pantalla de informe
    - Pulsar icono de informe
        En esta pantalla se muestran:
        - Cálculo: total de productos según la categoría.
        - Tabla: lista de productos.
        - Gráfico: productos por categoría

        ![Graf](capturas/TablaGrafico.png)

9) Ver detalles producto

    - Pulsando sobre un producto accedemos a los detalles del producto.
    ![Detail](capturas/DetailMovil.png)


 

