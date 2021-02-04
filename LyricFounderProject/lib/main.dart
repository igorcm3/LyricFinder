import 'package:flutter/material.dart';

import 'Views/Home.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue), home: Home());
  }
}
