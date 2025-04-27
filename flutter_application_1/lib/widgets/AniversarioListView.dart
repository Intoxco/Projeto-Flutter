import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Aniversario.dart';
import 'package:flutter_application_1/classes/AniversarioList.dart';

// ignore: must_be_immutable
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
    print(widget.data);
    print(widget.checkData);
    if(widget.checkData){
      lista = AniversarioList.filtrarAniversariosPorDataENome(widget.data,busca.value);
    }
    else{
      print("a");
      lista = buscarListaComNome(busca.value);
    }
  }

  @override
  void dispose() {
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
    return ValueListenableBuilder<String>(
      valueListenable: busca,
      builder: (BuildContext context, String nome, Widget? child) {
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
                        iconSize: 30,
                        icon: const Icon(Icons.search),
                        color: Colors.black,
                        onPressed: () => busca.value = controller.text,
                      ),
                    ),
                  ),
                );
              } else {
                return ListTile(
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
      },
    );
  }
}
