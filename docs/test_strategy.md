## Estrategia de pruebas UD6 Navegación y gestión de estado

## Objetivos:
· Validacion de la fluidez de la app(navegación entre pantallas).
· Probar el estado global de provider(CartRepository) se mantiene entre las pantallas gracias a la arquitectura MVVM.
· Proteger contra regresiones criticas (contador del carrito nunca negativo)

## Tipos de prueba

·Integración: dos test de flujos end-to-end con interación.
·Unidad / Widget: comportamiento aislado de lógica (CartViewModel)

## Matriz de pruebas

Área            Caso                                      Tipo            Éxito
----------------------------------------------------------------------------------------------
Navegación   | Home->Añadir->Cart                       | Integración | LLega a cart y comprueba que hay un item
----------------------------------------------------------------------------------------------

Navegación   | Home->ProductCart->Detail->Añadir->Cart | Integración | llega a detalles, añade producto, va a cart y comproeba que hay un producto
----------------------------------------------------------------------------------------------

Regresión    | Contador nunca <0                       | Unidad      | count == 0 si se elimina estando vacio
-----------------------------------------------------------------------------------------------

## Criterios de paso

·Los dos test de integración pasan en interation_test/
·La prueba de unidad de regrasión pasa en test/
·Evidencia responsive incluida en Readme (Capturas de pantallas de mas o menos de 800px)

## Como ejecutar

· Pruebas de regresión
    flutter test test/cart_viewmodel_regression_test.dart

·Pruebas de integración
    flutter test integration_test/app_flow_test.dart
    flutter test integration_test/navigation_detail_flow_test.dart
 