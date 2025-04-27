import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aniversarios_page.dart';
import 'package:flutter_application_1/pages/calendario_page.dart';

class TelaInicialPage extends StatelessWidget{


  @override
  Widget build(BuildContext contex){
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  contex, 
                  MaterialPageRoute(builder: (context) => CalendarioPage()),
              );
              }, 
              child: Text("Calendário")),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  contex, 
                  MaterialPageRoute(builder: (context) => AniversariosPage()),
              );
              }, 
              child: Text("Lista")),
          ],
        ),
      ),
    );
  }
}