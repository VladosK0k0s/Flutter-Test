import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light().copyWith(primary: Colors.green[400]),
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('App')),
          body: Center(child: Text('Hello World')),
        ));
  }
}
