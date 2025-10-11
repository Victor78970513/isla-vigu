import 'package:flutter/material.dart';
import 'package:isla_vigu/core/router/router.dart';
import 'package:isla_vigu/service_locator.dart';

void main() async {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
