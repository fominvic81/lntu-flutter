
import 'package:flutter/services.dart';

class NativeCodeService {
  static const MethodChannel _channel = MethodChannel('com.example/native_code');

  static Future<String?> getNativeData() async {
    final String? nativeData = await _channel.invokeMethod('getNativeData');
    return nativeData;
  }
}
