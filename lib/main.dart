import 'package:embed_native_to_flutter/native_android_view.dart';
import 'package:embed_native_to_flutter/native_controller.dart';
import 'package:embed_native_to_flutter/native_ios_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NativeController _nativeController;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Flutter view'),
          TextButton(
            child: Center(
              child: Text('Send signal to iOS'),
            ),
            onPressed: () {
              _nativeController.sendFromFlutter("Flutter's signal!");
              //_nativeController.receiveFromFlutter("Flutter's signal!");
            },
          ),
          (() {
            switch (defaultTargetPlatform) {
              case TargetPlatform.android:
                return Expanded(child: NativeAndroidView());
              case TargetPlatform.iOS:
                return Expanded(
                  child: NativeIosView(
                    onNativeViewCreated: (NativeController controller) {
                      setState(() {
                        _nativeController = controller;
                      });
                    },
                  ),
                );
              default:
                throw UnsupportedError("Unsupported platform view");
            }
          }()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
