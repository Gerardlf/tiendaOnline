import 'package:app_navegacion_estado/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  //Inicialización de la integración de pruebas
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Flujo Pantalla Home -> Pantalla Cart con estado global", (
    WidgetTester tester,
  ) async {
    //Ejecutamos la app
    await tester.pumpWidget(const app.MainApp());
    await tester.pumpAndSettle();

    //Verificamos que estamos en la pantalla Home
    expect(find.text("Home"), findsWidgets);

    //Añadimos un producto al carrito pulsando el primer boton "Añadir" del ProductCard
    final addButton = find.widgetWithText(ElevatedButton, "Añadir").first;
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    //Vamos a la pantalla Cart pulsando el icono del carrito en la AppBar o pulsando
    //en el icono del BottomNavigationBar o de NavigationRail
    final cartIcon = find.descendant(
      of: find.byType(AppBar),
      matching: find.byIcon(Icons.shopping_cart),
    );

    await tester.tap(cartIcon);
    await tester.pumpAndSettle();

    //Verificamos que estamos en la pantalla Cart
    expect(find.text("Cart"), findsWidgets);

    //Verificamos que el carrito tiene 1 producto
    expect(find.textContaining("€"), findsOneWidget);
  });
}
