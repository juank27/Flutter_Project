import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  @override
  UserRegisterApp createState() => UserRegisterApp();
}

class UserRegisterApp extends State<UserRegister> {
  TextEditingController fecha = TextEditingController();
  var currentSatate;
  //DateTime selectedDate = DateTime.now();

//Future <DateTime?> getDatePickerWidget(){
  //return showDatePicker(

  // )
//}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 500,
                  height: 70,
                  child: Image.asset('image/avatar2.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.name,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Nombres',
                  hintText: 'Digite nombres y apellido',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.name,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Identificación ',
                  hintText: 'Digite nombres y apellido',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Identificación',
                  hintText: 'Digite si identifiación',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Correo',
                  hintText: 'Digite su correo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Stack(
                alignment: const Alignment(1.0, 0),
                children: [
                  new TextField(
                    controller: fecha,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Fecha de nacimiento',
                      hintText: 'Digite su fecha de nacimiento',
                    ),
                  ),
                  new FlatButton(
                      onPressed: () {
                        callDataPcker();
                      },
                      child: new Icon(
                        Icons.date_range_outlined,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//utilidad de fecha
  var _currentSelectedDate;
  void callDataPcker() async {
    var selectedDate = await getDatePickerWidget();
    //print(DateFormat.yMMMd().format(DateTime.now()));
    //var date = DateFormat.yMMd().format(DateTime.now());
    setState(() {
      _currentSelectedDate = selectedDate;
      fecha.text = _currentSelectedDate.toString();
    });
    print("Holaaaa esta es una funcion");
    print(_currentSelectedDate);
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //initialDate: DateFormat.yMMd().format(DateTime.now());
        firstDate: DateTime(2022),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: Center(child: child));
        });
  }
}
