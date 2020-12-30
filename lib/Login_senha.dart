import 'package:flutter/material.dart';
import 'package:daniela/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daniela/Roteamento.dart';

void main() {
  runApp(MyApp());
}

class MyAppLogin extends StatelessWidget {
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
        title: Text('Gestão'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("Image/bibiimagem.jpeg"), fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4),
                    BlendMode.dstATop))),
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(),
              textFormFieldLogin(),
              textFormFieldSenha(),
              FlatButton(),
              new RaisedButton(

                child: new Text("LogIn"),

                color: Colors.blueAccent[600],

                onPressed: () =>Navigator.of(context).pushNamed('/main', arguments: ''),

              ),
            ],
          ),
        ),
      ),
    );
  }

  textFormFieldLogin() {
    return TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Login",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe o login"
        )
    );
  }

  textFormFieldSenha() {
    return TextFormField(
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha"
        )
    );
  }
}
