import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/view/aniversarios_editar_view.dart';
import 'package:flutter_application_1/controlller/aniversario_list_view_controller.dart';

class AniversarioListView extends StatefulWidget{
  final DateTime data;
  final bool checkData;
  final AniversarioList aniversarioList;
  const AniversarioListView({super.key,required this.data, required this.checkData,required this.aniversarioList});
  @override
  State<AniversarioListView> createState()=> _AniversarioListView();

}
class _AniversarioListView extends State<AniversarioListView> {
  final busca = ValueNotifier<String>('');
  late TextEditingController controller;
  late List <Aniversario> lista;
  @override
  void initState() {
    super.initState();
      controller = TextEditingController(text: "");
  }
  _atualizarLista(){
    lista= atualizarLista(widget.data,busca.value,widget.checkData,widget.aniversarioList);
  }

  @override
  void dispose() {
    busca.removeListener(_atualizarLista);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lista = atualizarLista(widget.data, busca.value, widget.checkData, widget.aniversarioList);
    busca.addListener((){
      setState((){
        _atualizarLista;}
        );
    });
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      hintText: 'Pesquisar nome',
                      suffixIcon: IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.search),
                        color: Colors.black,
                        onPressed: () => busca.value = controller.text,
                      ),
                    ),
                  ),
                );
              } else {
                return ListTile(
                  onTap: ()=>{
                  showDialog(
                    context:context,
                    builder:(context){
                      return AlertDialog(
                        title: Text(
                          "Ações",
                          textAlign:TextAlign.center,
                          style:TextStyle(
                            fontSize:40,
                            fontWeight:FontWeight.bold,
                            ),
                          
                          ),
                        content:Container(
                          height:100,
                          decoration:BoxDecoration(color:Colors.white70,border:Border.all(width:1.5)),
                          child:Column(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            InkWell(
                              onTap:(){
                              setState( (){
                                removerAniversario(lista[index-1],widget.aniversarioList);
                                _atualizarLista();
                                Navigator.pop(context);
                                showDialog(
                                  context:context,
                                  builder:(context){
                                    return AlertDialog(
                                    title:Text("Aniversário deletado com sucesso!")
                                    );
                                  },
                                );
                                }
                              );
                                },
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color:Colors.red,
                                    size:45
                                ),
                                  Text(
                                    " Deletar",
                                    style:TextStyle(
                                      fontSize:30,
                                      color:Colors.red
                                    ))
                                ],
                              ),
                            ),
                            Container(height:1.5,width:220,decoration:BoxDecoration(border:Border.all(width:1.5)),),
                            InkWell(
                              onTap:()=>{Navigator.push(context,MaterialPageRoute(
                                  builder: (_) => AniversarioEdicaoPage(aniversario:lista[index-1],aniversarioList:widget.aniversarioList,)
                                )
                              )
                              },
                              child:
                              Row(
                              
                                mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color:Colors.green,
                                      size:40
                                  ),
                                    Text(
                                      " Editar",
                                        style:TextStyle(
                                          fontSize:30,
                                          color:Colors.green
                                        )
                                        )
                                ],
                                )
                            )
                            ]
                          )
                        ),
                      );
                    }
                  )
              },
                  title: Text(lista[index - 1].nomeAniversariante),
                  subtitle: Text(lista[index-1].detalhes ?? ""),
                  trailing: Text(
                    lista[index - 1].pegarData(),
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
            },
            padding: EdgeInsets.all(16),
            itemCount: lista.length + 1,
          ),
        );
  }
}
