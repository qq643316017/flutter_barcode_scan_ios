import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_barcode_scan_ios/flutter_barcode_scan_ios.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    Future.delayed(Duration(seconds: 5),() async{
      String barcode;
//    if(Platform.isIOS){
      var options = ScanOptions(
        strings: {
          "cancel": '取消',
          "flash_on": '打开闪光灯',
          "flash_off": '关闭闪光灯',
        },
      );

      ScanResult result = await FlutterBarcodeScanIos.scan(options: options);
      barcode = result.rawContent;
//    }else{
//      barcode = await scanner.scan();
//    }
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
