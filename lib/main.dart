import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassWord486',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PassWord486(),
    );
  }
}

class PassWord486 extends StatelessWidget {
  const PassWord486({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password486'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }
}
