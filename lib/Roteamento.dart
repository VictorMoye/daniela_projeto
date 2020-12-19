import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:daniela/main.dart';
import 'package:daniela/Login_senha.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/main':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/second':

        if (args is String){
          return MaterialPageRoute(
            builder: (_) => MyAppLogin(),
          );
        }

        return _errorRoute();
      default:


        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });

  }

}