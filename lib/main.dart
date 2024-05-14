import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Routes/routing.dart';
import 'package:practice/View/webView.dart';
import 'package:practice/controller/networkController.dart';

Future<void> main() async {
  runApp(MyApp());
  // DependecyInjection.init();
}

class MyApp extends StatelessWidget {
  final AppRoutes namerouter = AppRoutes();
  // This widget is the root of your application.flutter
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Risaala Valet  ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WebViewClass(),
      onGenerateRoute: namerouter.onGenrateRoot,
      //  debugShowCheckedModeBanner: false,
    );
  }
}
