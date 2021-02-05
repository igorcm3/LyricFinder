import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Views/Home.dart';

void main() {
  runApp(App());
  configLoading();
  EasyLoading.init();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 50.0
    ..radius = 20.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    //..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true;
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Home(),
      builder: EasyLoading.init(),
    );
  }
}
