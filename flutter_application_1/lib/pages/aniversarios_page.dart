import 'package:flutter/material.dart';
import '../classes/AniversarioList.dart';
import '../classes/Aniversario.dart';
import '../classes/Usuario.dart';

class AniversariosPage extends StatelessWidget{
  const AniversariosPage ({super.key});

  @override
  Widget build(BuildContext context) {
    final List tabela =  AniversarioList.getProximosAniversarios();
    tabela.sort((a,b)=>a.data.compareTo(b.data));
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
      body: ListView.separated(
        separatorBuilder: (context, int aniversario){
          return Divider();
        },
        itemBuilder: (BuildContext context,int aniversario){
        if(aniversario == 0){
          return ListTile(
            tileColor: const Color.fromARGB(255, 251, 120, 120),
            title:Text("Aniversariante",style:TextStyle(fontSize:30)),
            trailing: Text(
              "Data",
              style:TextStyle(
                fontSize: 30
              )
            )
          );
          }
        else{
          return ListTile(
            title:Text(tabela[aniversario-1].usuario.nome),
            trailing: Text(
              tabela[aniversario-1].pegarData(),
              style:TextStyle(
                fontSize: 15
              )
            ),
          );
        }
        },
        padding:EdgeInsets.all(16),
        
        itemCount: tabela.length+1,
      ),
    bottomNavigationBar: FloatingActionButton(onPressed: AniversarioList.adicionarAniversario(Aniversario(DateTime(2000,10,31),Usuario(login:"Luiz",senha:"321",nome:"Luiz Felipe"),"Ir para palmeira","Um Livro"))),
      
    );

  }
}