import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/view/aniversarios_cadastrar_view.dart';
import 'package:flutter_application_1/widgets/aniversario_list_view.dart';
import 'package:provider/provider.dart';

class AniversariosPage extends StatelessWidget{
  const AniversariosPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:FloatingActionButton(
        shape:CircleBorder(),
        backgroundColor:Colors.white,
        onPressed:()=>Navigator.push(context,MaterialPageRoute(
          builder: (_) => AniversarioCadastroPage(aniversarioList:Provider.of<AniversarioList>(context))
          )
        ),
        child:Icon(
          Icons.add,size:50,color:Colors.black
          ),
        ),        
      body: AniversarioListView(data:DateTime(1),checkData:false,aniversarioList: Provider.of<AniversarioList>(context))
    );
  

}

}