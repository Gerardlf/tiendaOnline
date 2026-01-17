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
