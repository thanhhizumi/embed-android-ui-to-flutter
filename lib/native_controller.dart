import 'package:flutter/services.dart';

class NativeController {
  MethodChannel _channel;

  NativeController.init(int id) {
    _channel = new MethodChannel('NativeView/$id');
    _channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'sendFromNative':
        String text = call.arguments as String;
        print("Text from native: $text");
        return new Future.value("Text from native: $text");
    }
  }

  Future<void> sendFromFlutter(String text) async {
    try {
      final String result =
          await _channel.invokeMethod('sendFromFlutter', {"text": text});
      print("Result from native: $result");
    } on PlatformException catch (e) {
      print("Error from native: $e.message");
    }
  }
}
