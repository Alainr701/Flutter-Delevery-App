import 'package:delevery/src/pages/client/products/list/client_products_controller.dart';
import 'package:delevery/src/pages/login/login_page.dart';
import 'package:delevery/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delevery App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) =>  LoginPage(),
        'register': (context) =>  RegisterPage(),
        'client/products/list': (context) =>  ClientProductsListPage(),
      },
    );
  }
}
