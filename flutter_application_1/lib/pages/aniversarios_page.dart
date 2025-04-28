import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/AniversarioListView.dart';

class AniversariosPage extends StatelessWidget{
  const AniversariosPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:FloatingActionButton(
        shape:CircleBorder(),
        backgroundColor:Colors.white,
        onPressed:()=>showDialog(
          context:context,
          builder:(context){
            return AlertDialog(
              title: Text("Cadastro",textAlign:TextAlign.center,),
            );
          }
        ),
        child:Icon(
          Icons.add,size:50,color:Colors.black
          ),
        ),        
      body: AniversarioListView(data:DateTime(1),checkData:false)
    );
  

}

}