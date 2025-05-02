import 'package:appoint_it/routing/app_navigator.dart';
import 'package:appoint_it/routing/app_route_generator.dart';
import 'package:appoint_it/routing/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutesNames.initial,
        navigatorKey: AppNavigation.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}