import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

class FFIBridge {
  static late DynamicLibrary nativeApiLib;
  static late Function _add;
  static late Function _capitalize;

  static bool initialize() {
    nativeApiLib = Platform.isMacOS || Platform.isIOS
        ? DynamicLibrary.process() // macos and ios
        : (DynamicLibrary.open(Platform.isWindows // windows
            ? 'api.dll'
            : 'libapi.so')); // android and linux

    final add = nativeApiLib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('add');
    _add = add.asFunction<int Function(int, int)>();

    final capitalize = nativeApiLib.lookup<
        NativeFunction<Pointer<Utf8> Function(Pointer<Utf8>)>>('capitalize');
    _capitalize =
        capitalize.asFunction<Pointer<Utf8> Function(Pointer<Utf8>)>();

    return true;
  }

  static int add(int x, int y) {
    return _add(x, y);
  }

  static String capitalize(String string) {
    final str = string.toNativeUtf8();
    Pointer<Utf8> result = _capitalize(str);
    calloc.free(str);
    return result.toDartString();
  }
}
