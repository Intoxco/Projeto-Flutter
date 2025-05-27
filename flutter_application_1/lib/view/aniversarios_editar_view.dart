import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/widgets/date_picker.dart';
import 'package:flutter_application_1/widgets/input_counter.dart';
import 'package:flutter_application_1/controlller/aniversarios_editar_controller.dart';
class AniversarioEdicaoPage extends StatelessWidget{
  AniversarioEdicaoPage({super.key,required this.aniversario,required this.aniversarioList}); 
  final Aniversario aniversario;
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _descricao = TextEditingController();
  final _data = TextEditingController();
  final AniversarioList aniversarioList;
  salvar(BuildContext context) {
  if (_form.currentState!.validate()) {
    editarAniversario(_data.text, _nome.text, _descricao.text,aniversario,aniversarioList);
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
        backgroundColor:Color(0xFF67ABF5),
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
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:InputCounter(loadText:true,text:aniversario.detalhes??"",maxLength:70,label:"Descrição do aniversário",textController:_descricao))),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:DatePicker(loadDate:true,date:aniversario.data,label: "Selecione o dia/mês", textController: _data))),
        ],
        )
      )
      
    );
  }
}