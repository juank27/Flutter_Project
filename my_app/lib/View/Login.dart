import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Container(
                width: 100,
                height: 100,
                child: Image.asset('image/img.png'),
              )),
            ),
          ]),
        ));
  }
}
