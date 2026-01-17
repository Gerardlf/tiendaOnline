import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_navegacion_estado/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Flujo Home -> Datail -> Añadir -> Cart", (
    WidgetTester tester,
  ) async {
    //Arrancamos app
    await tester.pumpWidget(const app.MainApp());
    await tester.pumpAndSettle();

    // Verificar que estamos en Home
    expect(find.text("Home"), findsWidgets);

    // Hacer tap en el primer ProductCard que esta envuelto en un InkWell para ir a Detail
    Finder firstProductCard = find.byType(InkWell).first;
    await tester.tap(firstProductCard);
    await tester.pumpAndSettle();

    // Verificar que estamos en Detail
    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.text("Detail Product"),
      ),
      findsOneWidget,
    );
    expect(find.text("Descripción:"), findsOneWidget);

    //AÑADIR AL CARRITO DESDE DETAIL
    final addToCartButton = find.text("Añadir al carrito");
    expect(addToCartButton, findsOneWidget);
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();

    //NAVEGAR A CART
    final goToCartButton = find.text("Ir al carrito");
    expect(goToCartButton, findsOneWidget);

    await tester.tap(goToCartButton);
    await tester.pumpAndSettle();

    //VERIFICAR QUE ESTAMOS EN CART
    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text("Cart")),
      findsOneWidget,
    );

    //VERIFICAR QUE EL PRODUCTO ESTA EN EL CARRITO
    expect(find.textContaining("€"), findsWidgets);
  });
}
