import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_to_byte/image_to_byte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Image to byte'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? image;

  void _imageToByte() async {
    Uint8List iByte = await imageToByte('https://scaffoldtecnologia.com.br/wp-content/uploads/2021/11/i257652.jpeg');
    setState(() => image = iByte);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click button to convert',
              style: Theme.of(context).textTheme.headline4,
            ),

            Image.network('https://scaffoldtecnologia.com.br/wp-content/uploads/2021/11/i257652.jpeg'),
            const SizedBox(height: 10.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '$image',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _imageToByte,
        tooltip: 'Convert',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
