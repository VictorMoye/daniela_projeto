import 'dart:io';
import 'package:daniela/HelpMe/database_helper.dart';
import 'package:daniela/models/contato.dart';
import 'package:daniela/pages/contatoPage.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();

}

class _HomePageState extends State<HomePage>{

  DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = List<Contato>();

  @override
  void initState() {
    super.initState();

    //Contato c = Contato(1,"Maria",2,2,2);
    // Contato c1 = Contato(2,"Pedro","pedro@uol.com.br",null);
    //db.insertContato(c);
    // db.insertContato(c1);

    _exibeTodosContatos();
  }

  void _exibeTodosContatos(){
    db.getContatos().then( (lista) {
      setState(() {
        contatos = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exibeContatoPage();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contatos.length ,
        itemBuilder: (context, index) {
          return _listaContatos(context,index);
        },
      ),
    );
  }

  _listaContatos(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
          child: Padding(padding: EdgeInsets.all(10.0),
              child:Row(
                children: <Widget>[
                  Container(
                    width: 70.0, height: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(contatos[index].nome ?? "",
                              style: TextStyle(fontSize: 20)
                          ),
                          Text("Hrs:  " + contatos[index].HT.toString() ?? "",
                              style: TextStyle(fontSize: 15)
                          ),
                          Text("R\$: " + contatos[index].LE.toString() ?? "",
                              style: TextStyle(fontSize: 15)
                          ),
                          Text("R\$: " + contatos[index].VL.toString() ?? "",
                              style: TextStyle(fontSize: 15)
                          )
                        ],
                      )
                  )
                ],
              )
          )
      ),
      onTap: () {
        _exibeContatoPage(contato: contatos[index]);
      },
    );
  }

  void _exibeContatoPage({Contato contato}) async {
    final contatoRecebido =  await Navigator.push(context,
      MaterialPageRoute(
          builder: (
              context)=> ContatoPages(contato: contato)
      ),
    );

    if(contatoRecebido != null){
      if(contato != null )
      {
        await db.updateContato(contatoRecebido);
      }else{
        await db.insertContato(contatoRecebido);
      }
      _exibeTodosContatos();
    }
  }
}