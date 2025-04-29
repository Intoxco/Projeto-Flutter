import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Aniversario.dart';
import 'package:flutter_application_1/classes/AniversarioList.dart';

class AniversarioListView extends StatefulWidget{
  final DateTime data;
  final bool checkData;
  const AniversarioListView({super.key,required this.data, required this.checkData});
  @override
  State<AniversarioListView> createState()=> _AniversarioListView();

}
class _AniversarioListView extends State<AniversarioListView> {
  final busca = ValueNotifier<String>('');
  late TextEditingController controller;
  late List<Aniversario> lista;

//Dependendo do modelo que escolhermos, vai ter que tirar isso
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "");
    if(widget.checkData){
      lista = AniversarioList.filtrarAniversariosPorDataENome(widget.data,busca.value);
    }
    else{
      lista = buscarListaComNome(busca.value);
    }
  }
  _atualizarLista(){
    setState(() {
    if (widget.checkData) {
      lista = AniversarioList.filtrarAniversariosPorDataENome(widget.data, busca.value);
    } else {
      lista = buscarListaComNome(busca.value);
    }
  });
  }
  @override
  void dispose() {
    busca.removeListener(_atualizarLista);
    controller.dispose();
    super.dispose();
  }

  List<Aniversario> buscarListaComNome(String nome) {
    List<Aniversario> lista = AniversarioList.filtrarAniversariosPorNome(nome);
    lista.sort((a, b) => a.data.compareTo(b.data));
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    busca.addListener(_atualizarLista);
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
                                AniversarioList.removerAniversario(lista[index-1]);
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
                              onTap:()=>{},
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
                  title: Text(lista[index - 1].usuario.nome),
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
