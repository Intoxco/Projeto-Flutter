import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Aniversario.dart';
import 'package:flutter_application_1/classes/AniversarioList.dart';

class AniversarioListView extends StatefulWidget{
const AniversarioListView({super.key});

  @override
  State<AniversarioListView> createState()=> _AniversarioListView();

}
class _AniversarioListView extends State<AniversarioListView>{
  final busca = ValueNotifier<String>('');
  late TextEditingController controller;
  late List<Aniversario> lista;

  @override
  void initState(){
    super.initState();
    lista= buscarListaComNome(busca.value);
    controller = TextEditingController(text:"");
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  



  List<Aniversario> buscarListaComNome(String nome){
    List<Aniversario> lista = AniversarioList.filtrarAniversariosPorNome(nome);
    lista.sort((a,b)=>a.data.compareTo(b.data));
    return lista;
  }
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable:busca,
      builder: (BuildContext context,_,_){
      return Padding(
      padding: const EdgeInsets.all(10),
      child:ListView.separated(
        separatorBuilder: (context, int aniversario){
          return Divider();
        },
        itemBuilder: (BuildContext context,int aniversario){
        if(aniversario == 0){
          return SizedBox(
            height: 60,
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, _){
                return TextFormField(
                  controller:controller,
                  decoration:InputDecoration(
                    filled:true,
                    fillColor: Colors.white,
                    border:const OutlineInputBorder(),
                    hintText:'Pesquisar nome',
                    suffixIcon:IconButton(
                      iconSize:30,
                      icon: const Icon(Icons.search),
                      color:Colors.black,
                      onPressed: ()=> setState((){
                        busca.value = controller.text;
                        lista = buscarListaComNome(busca.value);
                      }),
                    ),
                    ),
                  );
             }),
            );
          }
        else{
          return ListTile(
            title:Text(lista[aniversario-1].usuario.nome),
            trailing: Text(
              lista[aniversario-1].pegarData(),
              style:TextStyle(
                fontSize: 15
              )
            ),
          );
        }
        }
        ,
        padding:EdgeInsets.all(16),
        
        itemCount: lista.length+1,
      ),
      );
      }
      );
  }
}