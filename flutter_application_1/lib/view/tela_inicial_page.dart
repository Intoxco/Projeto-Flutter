import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/aniversarios_view.dart';
import 'package:flutter_application_1/view/calendario_page.dart';
import 'package:flutter_application_1/view/tela_padrao_view.dart';

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
              ElevatedButton(
              onPressed: (){
                Navigator.push(
                  contex, 
                  MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              }, 
              child: Text("Home")),
          ],
        ),
      ),
    );
  }
}