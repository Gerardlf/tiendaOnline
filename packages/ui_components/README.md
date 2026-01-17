## Que es ProductCard
ProductCard es un componente creado para poder ser reutilizado en diferentes partes del código. Este componente devuelve una card donde podemos mostrar el id, nombre, precio, icono un producto además de un boton añadir que usa una Callback para realizar una acción (añadir un producto a traves del viewmodel).

## Como se ha creado
Este componente se genera dentro de un paquete local que se ha genera con el comando: "flutter create --template=package packages/ui_components"

## Como importarlo
Para importar este componente debemos hacerlo en nuestro archivo pubspec.yaml añadiendolo a las dependencias : ui_components:    path: packages/ui_components, para poder usarlo en nuestra app.


## Usarlo

Para usar este componente debemos importarlo donde lo querramos usar: "import 'package:ui_components/product_card.dart';", una vez importado podemos usarla creando un producto llamando a ProductCard y pasandole los parametros necesarios a mostrar en la tarjeta de ese producto, todo esto en homeScreen lo usamos con un listview.builer que usa la lista de productos fake para ir pintando cada ProductCard de la lista fake.


