import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: Text('Pryecto'),
        home: Scaffold(
      appBar: AppBar(title: const Text('Hola')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('image/img.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 10, right: 10, bottom: 0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(400, 50)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text('Ingresar'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
