import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection("User");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (user.text == cursor.get('User')) {
            print("Hola");
            if (pass.text == cursor.get('Pass')) {
              // ignore: avoid_print
              print(cursor.get('User'));
              mensaje('Mensaje', 'Dato encontrado');
              pass.clear();
            }
          }
          //print(cursor.get('User'));
        }
      }
    } catch (e) {
      mensaje('Error', e.toString());
    }
  }

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
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'User',
                  hintText: 'Digite el usuario',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Pass',
                  hintText: 'Digite contraseña',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  validarDatos();
                  //pass.clear();
                  print('Ingresar');
                },
                child: Text('Ingresar'),
              ),
            )
          ]),
        ));
  }

  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
