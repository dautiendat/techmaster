import 'dart:ffi';

import 'package:ffi/ffi.dart';

class GiaiPhuongTrinh {
  late DynamicLibrary _lib;
  late Function _giaiPhuongTrinhBac2;

  GiaiPhuongTrinh() {
    _lib = DynamicLibrary.open('libmy_native.so');
    _giaiPhuongTrinhBac2 = _lib.lookupFunction<
        Void Function(Float, Float, Float, Pointer<Float>, Pointer<Float>, Pointer<Int32>),
        void Function(double, double, double, Pointer<Float>, Pointer<Float>, Pointer<Int32>)>(
      'giaiPhuongTrinhBac2',
    );
  }

  String giai(double a, double b, double c) {
    final x1 = calloc<Float>();
    final x2 = calloc<Float>();
    final resultCode = calloc<Int32>();

    _giaiPhuongTrinhBac2(a, b, c, x1, x2, resultCode);

    final result = resultCode.value;
    String resultText = '';

    if (result == 0) {
      resultText = 'Đây không phải phương trình bậc 2.';
    } else if (result == 1) {
      resultText = 'Phương trình có hai nghiệm phân biệt:\nx1 = ${x1.value}, x2 = ${x2.value}';
    } else if (result == 2) {
      resultText = 'Phương trình có nghiệm kép:\nx1 = x2 = ${x1.value}';
    } else {
      resultText = 'Phương trình vô nghiệm.';
    }
    //giải phóng bộ nhớ (con trỏ)
    calloc.free(x1);
    calloc.free(x2);
    calloc.free(resultCode);

    return resultText;
  }
}
