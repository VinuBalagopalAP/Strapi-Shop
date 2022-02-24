import 'package:flutter/material.dart';
import 'package:pm_app/providers/productNotifier.dart';
import 'package:pm_app/screens/homePage.dart';
import 'package:pm_app/screens/productScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductNotifier>(
            create: (_) => ProductNotifier(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const HomePage(),
      ),
      routes: {
        '/productScreen': (context) => const ProductScreen(),
      },
    );
  }
}
