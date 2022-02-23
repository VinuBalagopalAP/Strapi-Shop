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
        .getProductListModel();
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
          title: const Text("Products"),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: data.getProductList.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(data.getProductList.data[index].attributes.name),
              subtitle:
                  Text(data.getProductList.data[index].attributes.description),
              trailing: ElevatedButton(
                child: const Text("+"),
                onPressed: () {
                  data.setQuantity(
                    data.getProductList.data[index].id,
                    int.parse(data.getProductList.data[index].attributes.qty),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
