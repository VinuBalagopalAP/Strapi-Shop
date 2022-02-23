import 'package:flutter/material.dart';
import 'package:pm_app/providers/productNotifier.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setData() async {
    await Provider.of<ProductNotifier>(context, listen: false)
        .getProductModel();
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductNotifier>(context);

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(data.productModel.data.attributes.title),
        ),
        body: Center(
          child: ListView.builder(
            shrinkWrap: true,
            // itemCount: data.productModel.data.attributes.variants,
            itemCount: 3,

            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text(data.productModel.data.attributes.title),
                  Text(data.productModel.data.attributes.description),
                ],
              );
            },
            // return Column(
            //   children: [
            //     Text(data.productModel.data.attributes.title),
            //     Text(data.productModel.data.attributes.description),
            //     Text("Price: \$ " +
            //         data.productModel.data.attributes.price.toString()),
            //     Text("Quantity: " +
            //         data.productModel.data.attributes.qty.toString()),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
