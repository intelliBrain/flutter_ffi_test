import 'package:flutter/material.dart';

import 'ffi_bridge.dart';
import 'my_app.dart';

void main() {
  FFIBridge.initialize();
  runApp(const MyApp());
}
