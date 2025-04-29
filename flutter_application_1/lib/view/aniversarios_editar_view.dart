import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Aniversario.dart';
import 'package:flutter_application_1/widgets/DatePicker.dart';
import 'package:flutter_application_1/widgets/InputCounter.dart';
import 'package:flutter_application_1/controlller/aniversarios_editar_controller.dart';
class AniversarioEdicaoPage extends StatelessWidget{
  AniversarioEdicaoPage({super.key,required this.aniversario}); 
  final Aniversario aniversario;
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _descricao = TextEditingController();
  final _data = TextEditingController();

  salvar(BuildContext context) {
  if (_form.currentState!.validate()) {
    adicionarAniversario(_data.text, _nome.text, _descricao.text);
    Navigator.pop(context);
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Aniversário editado com sucesso!"),
        );
      },
    );
  }
}

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
          onPressed: (){salvar(context);},
          icon:Icon(Icons.save,size:40,color:Colors.white),
          )
        ],
      ),
      body:Form(
        key:_form,
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing:20,
        children: [
          SizedBox(height:100),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:InputCounter(loadText:true,text:aniversario.nomeAniversariante,maxLength:60,label:"Nome do Aniversariante",textController:_nome))),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:InputCounter(loadText:true,text:aniversario.detalhes?? "",maxLength:70,label:"Descrição do aniversário",textController:_descricao))),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:DatePicker(loadDate:true,date:aniversario.data,label: "Selecione o dia/mês", textController: _data))),
        ],
        )
      )
      
    );
  }
}