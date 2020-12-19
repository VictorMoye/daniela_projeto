import 'package:flutter/material.dart';
import 'package:daniela/Roteamento.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



void main() {
  runApp(MyApp());
}
var _firebaseRef = FirebaseDatabase().reference().child(tabela);
TextEditingController _txtCtrl = TextEditingController();

var  tabela = '';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
        centerTitle: true,
      ),
      body: Container(
        padding: new EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("Image/bibiimagem.jpeg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.green.withOpacity(1.0), BlendMode.dstATop))),
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 360.0,
                  height: 100.0,
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: RaisedButton(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text("Vendas"),
                    color: Colors.deepPurple,
                    onPressed: () => Navigator.of(context)
                        .pushNamed('/second', arguments: ''), // ação ,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 360.0,
                  height: 100.0,
                  child: RaisedButton(
                    child: new Text("DashBoard"),
                    color: Colors.yellow,
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 360.0,
                  height: 100.0,
                  child: RaisedButton(
                    child: new Text("Lucros"),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 360.0,
                  height: 100.0,
                  child: RaisedButton(
                    child: new Text("Prejuizo"),
                    color: Colors.green,
                    onPressed:(){
                      sendMessage();
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

sendMessage() {
  _firebaseRef.push().set({
    "message": "torcendo",
    "timestamp": 'agora foi',
  });
}

