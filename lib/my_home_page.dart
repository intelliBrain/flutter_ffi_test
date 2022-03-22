import 'dart:io';

import 'package:flutter/material.dart';

import 'ffi_bridge.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final platform = Platform.isMacOS
        ? "MacOS"
        : Platform.isIOS
            ? "iOS"
            : Platform.isAndroid
                ? "Android"
                : Platform.isLinux
                    ? "Linux"
                    : Platform.isWindows
                        ? "Windows"
                        : Platform.isFuchsia
                            ? "Fuchsia"
                            : "Undefined";

    const normalTextStyle = TextStyle(
      fontSize: 40,
      color: Colors.black45,
    );

    const redTextStyle = TextStyle(
      fontSize: 40,
      color: Colors.red,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Platform: ',
                  style: normalTextStyle,
                ),
                Text(
                  platform,
                  style: redTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'add: 1 + 2 = ',
                  style: normalTextStyle,
                ),
                Text(
                  '${FFIBridge.add(1, 2)}',
                  style: redTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'capitalize: ',
                  style: normalTextStyle,
                ),
                Text(
                  FFIBridge.capitalize('hello world'),
                  style: redTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
