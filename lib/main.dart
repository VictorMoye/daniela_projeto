import 'package:daniela/screens/TabelaDeDistribuicao.dart';
import 'package:daniela/screens/planilhaPrecificacao.dart';
import 'package:daniela/screens/precificacao.dart';
import 'package:flutter/material.dart';
import 'package:daniela/Roteamento.dart';
import 'package:flutter/material.dart';
import 'package:daniela/Login_senha.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:daniela/HelpMe/database_helper.dart';
import 'package:daniela/pages/contatoPage.dart';
import 'package:daniela/models/contato.dart';
import 'package:daniela/pages/home_page.dart';

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
  int _counter = 0;

  DatabaseHelper db = DatabaseHelper();

  List<Contato> contatos = List<Contato>();
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      child: new Text("Historico de Vendas"),
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
                      child: new Text("Produtos"),
                      color: Colors.yellow,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyAppLogin()));
                      },
                    ),
                  ),
                ),
                /*Padding(
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
                ),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new SizedBox(
                    width: 360.0,
                    height: 100.0,
                    child: RaisedButton(
                      child: new Text("Tabela de distribuição"),
                      color: Colors.green,
                      onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tabela_De_Distribuicao()));
                      }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new SizedBox(
                    width: 360,
                    height: 100,
                    child: RaisedButton(
                      child: Text("Planilha precificação"),
                      color: Colors.green,
                      onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => planilhaPrecificacao()));
                      }
                    )
                  )
                ),
               /* Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new SizedBox(
                    width: 360.0,
                    height: 100.0,
                    child: RaisedButton(
                      child: new Text("Botão Precificação "),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Precificacao()));
                      },
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  DatabaseHelper db = DatabaseHelper();

  List<Contato> contatos = List<Contato>();
  @override
  void initState() {
    super.initState();

    db.getContatos().then((lista){
      print(lista);
    });

  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: 0,
        itemBuilder: (context, index){

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}

sendMessage() {
  _firebaseRef.push().set({
    "message": "Hoje a gente consegue ",
    "timestamp": 'agora vai ',

  });
}
