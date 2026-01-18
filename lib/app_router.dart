import 'package:app_navegacion_estado/screens/auth/authScreen.dart';
import 'package:app_navegacion_estado/screens/cart/cart.dart';
import 'package:app_navegacion_estado/screens/detail/detail.dart';
import 'package:app_navegacion_estado/screens/favorites/favorites_screen.dart';
import 'package:app_navegacion_estado/screens/home/home.dart';
import 'package:app_navegacion_estado/screens/report/report_screen.dart';
import 'package:go_router/go_router.dart';
import 'data/product.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "auth",
        builder: (context, state) => const AuthScreen(),
      ),

      GoRoute(
        path: "/home",
        name: "home",
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: "/detail",
        name: "detail",
        builder: (context, state) {
          final producto = state.extra! as Product;
          return DetailProduct(producto: producto);
        },
      ),
      GoRoute(
        path: "/cart",
        name: "cart",
        builder: (context, state) => const CartScreen(),
      ),

      GoRoute(
        path: "/favorites",
        name: "favorites",
        builder: (context, state) => const FavoritesScreen(),
      ),

      GoRoute(
        path: "/report",
        name: "report",
        builder: (context, state) => const ReportScreen(),
      ),
    ],
  );
}
