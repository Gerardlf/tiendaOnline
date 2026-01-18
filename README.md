# app_navegacion_estado

## Arquitectura

Este proyecto sigue la estructura MVVM para separar las responsabilidades

-- La carpeta data contiene los archivos relacionados con los datos (model). Aqui tenemos los archivos correspondientes a la clase Producto, cart_repository que se encarga de modificar la lista inmutable del carrito que solo se puede modificar dentro de esta clase.

--La carperta state contiene el archivo carViewModel (viewModel) es la encargada de exponer el estado y las acciones a la ui y de conectarse con el repositorio del model y notificar cambios a las vistas.

--La carpeta screen contiene los archivos de las vistas de la app, estas vistas solo "escuchan" al viewmodel con el Provider.

## Rutas y navegación

Usamos el archivo app_router para la navegación con GoRouter, aqui tenemos todas las rutas de navegación hacia cada pantalla de la app.
Usamos context.goNamed para navegar a alguna pantalla especifica y context.pushNamed('ruta', extra: objeto) cuando queremos navegar enviando un objeto, en nuestro caso un producto.

## Responsive

Se ha creado dentro de la carpeta widgets, un widget personalizado llamado responsiveScaffold que devuelve un LayoutBuilder donde dependiendo del tamaño de la pantalla (800px), devuelve un scaffold con un BottomNavigationBar si la pantalla es de menos de 800px o un NavigationRail si la pantalla es de mas de 800px. Este widget lo usamos en las pantallas de home y de cart envolviendo con éste el scaffold de cada pantalla.

## Uso del paquete ui_components

Usamos el paquete ui_components donde tenemos nuestro archivo ProductCard que es un widget personalizado y reutilizable que nos ayuda a crear una tarjeta con los detalles del producto que necesitamos mostrar (Actualmente la usamos para "pintar" la lista de productos disponibles).

## Capturas de la app 
![Home>800px](docs\capturas\HomePantalla+800.png)
![Cart>800px](docs\capturas\CartPantalla+800.png)
![Home<800px](docs\capturas\HomeMovil.png)
![Detail<800px](docs\capturas\DetailMovil.png)
![Cart<800px](docs\capturas\CartMovil.png)



## Nota

Esta App se ampliará en la UD7

## 18/enero/2026

## inicio unidad 7
Debido a que la unidad 6 no estaba calificada al empezar la unidad 7 y que no queria tocar nada de ese código debido a que estaba subido como un repositorio público, he decidico compiar toda la unidad 6 y comenzar desde alli en un repo nuevo.

## Tienda Online (UD7) · API REST + Firebase (continuación de la unidad 6)

- Consumo de una **API REST pública** (FakeStoreAPI)
- **Firebase Auth** (Login anónimo)
- **FireStore** para poder guardar los favoritos del usuario, mostrarlos y usarlos en los informes


## Arquitectura (MVVM)
 
 - **data/** → Modelos y repositorios  
  Contiene Product (modelo de producto) y CartRepository (lógica del carrito). Se creó un nuevo producto llamado producto para que se adaptara a los datos de la API.

- **state/** → ViewModels / Providers  
  Contiene CartViewModel (estado del carrito) y ProductListViewModel (estado de lista de productos desde API REST).

- **screens/** → Pantallas (UI)  
  Contiene las pantallas principales: AuthScreen, HomeScreen, DetailScreen , CartScreen, FavoritesScreen, etc.  
  Las vistas escuchan a los ViewModels mediante Provider.

- **api/** → Cliente REST  
  Contiene ApiClient, encargado de realizar la petición HTTP a la API y devolver una lista de productos.

- **services/** → Servicios externos  
  Contiene FirebaseService, encargado de autenticación y operaciones con Firestore.

  ## API REST (FakeStoreAPI)

  La app obtiene los productos desde la API pública:
  https://fakestoreapi.com/products

  -Usamos http
  - Los datos don Json que se transforman a objetos Product mediante Product,fromJson
  - Gestionan estados en la UI:
    - Cargando
    - Errores
    - Sin resultados
    - La lista de productos correcta con ListView.builder

## Firebase (Auth + Firestore)

## Autenticación
La app usa login anónimo creamdo un usuario temporal único por dispositivo

## Firestore (para los favoritos)
Cada usuario tiene su propia coleccion de favoritos en: 
 users/<uid>/favorites

 Se guardan datos del producto:
 - title
 - price
 - category
 - imageUrl
 - createdAt
 
 Los favoritos se muestran en una pantalla con StreamBuilder

 ## Configuración Firebase (IMPORTANTE)

Este repositorio es público, por lo que **no se incluyen archivos de configuración de Firebase**.

Para ejecutar el proyecto con Firebase debes generarlos localmente:

1) Activar FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
flutterfire configure



