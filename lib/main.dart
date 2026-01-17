import 'package:app_navegacion_estado/app_router.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartViewModel(),
      child: MaterialApp.router(
        title: "UD6 · Navegación + Estado (MVVM)",
        routerConfig: AppRouter.goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
