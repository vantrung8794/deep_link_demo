import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      try {
        getInitialUri().then((value) {
          setState(() {
            data = value?.pathSegments.last ?? '';
          });
        });
      } on FormatException {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter External App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Another External App'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
          child: Text(
            data,
            style: const TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
