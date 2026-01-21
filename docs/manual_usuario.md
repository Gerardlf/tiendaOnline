## Manual de usurio - Tienda Online (UD7)

## 1. Descripción general

Nuestra App es una tiensa online muy sencilla desarrollada con Flutter como práctica de la unidad 6 y 7 de DIN.

La App nos permite:
- Consultar una lista de productos desde la API REST pública (FakeStoreAPI).
- Iniciar sesión con Firebase mediante autenticación anónima.
- Guardar productos como favoritos en Firestore y verlos en una pantalla.
- Consultar un informe con una tabla de productos y un gráfico por categoría y un cálculo del total de productos que mostramos.


## 2. Requisitos

Para usar la aplicación necesitas:

- Un dispositivo Android (o un navegador moderno como Chrome si se ejecuta en Web).
- Conexión a Internet (la app necesita acceder a la API y a Firebase).
- Para la parte de favoritos: acceso a Firebase configurado en el proyecto.

## 3. Primeros pasos

1. Abre la aplicación.
2. En la pantalla de acceso, pulsa **Continuar como invitado**
3. Una vez dentro, verás un listado de productos cargados desde la API REST.
4. Puedes: 
    - Tocar un producto para ver sus detalles.
    - Añadirlo al carrito.
    - Marcarlo como favorito.
5. en la barra superior puedes acceder:
    - Carrito
    - Favoritos
    - Informe (tabla + gráfico)

## 4. Pantallas principales


## 4.1. Login

Pantalla Inicial de la App.
- Muestra un mensaje informativo.
- Permite iniciar sesión de forma anónima.
- Al pulsar el botón se crea un usuario temporal con un uid propio y se accede a la pantalla home.
 ![AUTH>800px](capturas/PantallaAuth.png)


## 4.2. Home - Lista de productos

Pantalla principal donde se muestran los productos obtenidos desde la API con los elementos:

- Imagen del producto.
- Título.
- Categoría.
- Precio.
- Botón Añadir para añadir al carrito.
- Botón Favorito para guardarlo en favoritos.

Puede tener 3 estados posibles:

- Cargando productos (spinner).
- Error de red (mensaje y opción de reintentar).
- Sin productos



## 4.3. Favoritos

Pantalla donde se muestras los productos que has marcado como favoritos

- Los favoritos se guardan en Firestore asociados al usuario autenticado.
- La lista de actualiza gracias a un Stream.
- Si no hay favoritos, se muestra un mensaje indicandolo.

![FAV>800PX](docs/capturas/Favoritos.png)

## 4.4. Informe

Pantalla de informe con datos obtenidos desde la API.

- Tiene un filtro por categoría.
- Tiene un cálculo del total de productos mostrados tras aplicar el filtro.
- Tiene un tabla con los productos con las columnas título, caregoría y precio.
- Tiene un gráfico de barras con la distribución por categoría.

![INFORME>800PX](docs/capturas/Tabla%20y%20Grafico.png)

## 5. Mensajes y errores frecuentes

- **Error al cargar productos** -> puede deberse a falta de conexión a internet o a un fallo de la API.
- Solución: revisar la conexión y usar el botón Reintentar

- **Sin productos desponibles** -> puede deberse si el filtro no encuentra resultados.
- Solución: seleccionar Todas en el filtro o volver a cargar.

## 6. Accesibilidad básica

- Se utilizan textos legibles y botones con contraste suficiente.
- Los botones tienen etiquetas claras.
- Se usa contraste alto en el AppBar.
- La app muestra estados claros para evitar confusión del usuario.