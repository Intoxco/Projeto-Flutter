import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Aniversario.dart';
import 'package:flutter_application_1/classes/AniversarioList.dart';
import 'package:flutter_application_1/widgets/DatePicker.dart';
import 'package:flutter_application_1/widgets/InputCounter.dart';

class AniversarioCadastroPage extends StatelessWidget{
  AniversarioCadastroPage({super.key});
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _descricao = TextEditingController();
  final _data = TextEditingController();

  salvar(BuildContext context) {
  if (_form.currentState!.validate()) {
    AniversarioList.adicionarAniversario(Aniversario(DateTime(DateTime.now().year,int.parse(_data.text.split("/")[0]),int.parse(_data.text.split("/")[1])),_nome.text,_descricao.text));
    Navigator.pop(context);
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Aniversário cadastrado com sucesso!"),
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
          "Cadastrar",  
          textAlign: TextAlign.center,
          style:TextStyle(
            fontSize:20,
            color:Colors.white
            ),
          ),
        backgroundColor:Colors.green,
        actions: [
          IconButton(
            icon:Icon(Icons.save,size:40,color:Colors.white),
            onPressed: (){salvar(context);},
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
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:InputCounter(loadText:false,text:"",maxLength:60,label:"Nome do Aniversariante",textController:_nome))),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:InputCounter(loadText:false,text:"",maxLength:70,label:"Descrição do aniversário",textController:_descricao))),
          Center(child:SizedBox(width:MediaQuery.sizeOf(context).width-100,child:DatePicker(loadDate:false,date:DateTime.now(),label: "Selecione o dia/mês", textController: _data))),
        ],
        )
      )
    );
  }
}
