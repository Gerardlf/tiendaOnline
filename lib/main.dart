import 'package:app_navegacion_estado/app_router.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:app_navegacion_estado/state/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/api_client.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        //provader nuevo para la API
        ChangeNotifierProvider(
          create: (_) => ProductListViewModel(ApiClient()),
        ),
      ],
      child: MaterialApp.router(
        title: "UD7 · API REST - FIREBASE",
        routerConfig: AppRouter.goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
