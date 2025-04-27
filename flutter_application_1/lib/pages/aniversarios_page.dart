import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/AniversarioListView.dart';

class AniversariosPage extends StatelessWidget{
  const AniversariosPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor:Colors.red,
        title: const Text(
          "Próximos aniversários",
          style:TextStyle(
            color:Colors.white,
            fontStyle: FontStyle.italic,
          )
        )
      ),
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
        
    bottomNavigationBar: FloatingActionButton(onPressed: ()=>((){})),
      body: AniversarioListView(data:DateTime(1),checkData:false)
    );
  

}

}