import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Aniversario.dart';

class AniversarioEdicaoPage extends StatelessWidget{
  AniversarioEdicaoPage({super.key,required this.aniversario});
  final Aniversario aniversario;
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _descricao = TextEditingController();
  final _data = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
      title:Text(
          "Editar",
          textAlign:TextAlign.center,
          style:TextStyle(
            fontSize:20,
            color:Colors.white
            ),
          ),
        backgroundColor:Colors.red,
        actions: [
          IconButton(
          onPressed: (){},
          icon:Icon(Icons.save,size:40,color:Colors.white),
          )
        ],
      ),
      
    );
  }
}