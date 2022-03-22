import 'package:flutter/material.dart';

import 'ffi_bridge.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'add: 1 + 2 = ${FFIBridge.add(1, 2)}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              'capitalize: ${FFIBridge.capitalize('hello world')}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
