import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/pages/cart_page.dart';
import 'package:state_management_provider/pages/products_page.dart';
import 'package:state_management_provider/providers/cart_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => const ProductsPage(),
        "/cart": (context) =>const CartPage(),
      },
    );
  }
}