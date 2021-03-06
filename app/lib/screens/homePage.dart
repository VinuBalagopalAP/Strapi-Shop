import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HomePage'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/productScreen");
            },
            child: const Text('Go to Product Page'),
          ),
        ],
      ),
    );
  }
}
