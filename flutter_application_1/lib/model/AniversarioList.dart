import "dart:collection";

import "package:flutter/material.dart";

import "Aniversario.dart";
class AniversarioList extends ChangeNotifier{
  List <Aniversario> _lista= [];
  UnmodifiableListView <Aniversario> get lista => UnmodifiableListView(_lista);
  adicionarAniversario(Aniversario aniversario){
    _lista.add(aniversario);
    notifyListeners();
    }
  removerAniversario(Aniversario aniversario){
    _lista.removeWhere((niver)=>niver.nomeAniversariante == (aniversario.nomeAniversariante) && niver.detalhes == aniversario.detalhes && aniversario.data == niver.data);
    notifyListeners();
  }
  editarAniversario(Aniversario aniversarioAntigo,Aniversario aniversarioNovo){
    int index = _lista.indexWhere(
    (a)=>a.data.isAtSameMomentAs(aniversarioAntigo.data) && 
    a.detalhes ==aniversarioAntigo.detalhes &&
    a.nomeAniversariante == aniversarioAntigo.nomeAniversariante);
    _lista[index] = aniversarioNovo;
    notifyListeners();
  }
  List <Aniversario> getProximosAniversarios(){
    List <Aniversario> lista= List.from(
      _lista.where(
        (a)=>(a.data.month.compareTo(DateTime.now().month) == 0 
        && a.data.day.compareTo(DateTime.now().day) >= 0 ) ||a.data.month.compareTo(DateTime.now().month) >0
      )
    );
    lista.sort((a,b)=>a.data.compareTo(b.data));
    return lista;
  }
  List <Aniversario> filtrarAniversariosPorNome(String nome){
      List <Aniversario> lista = List.from(
    _lista.where(
    (a) =>a.nomeAniversariante.contains(nome))
    );
    return lista;
  }
  List<Aniversario> filtrarAniversariosPorDataENome(DateTime data,String nome){
    List <Aniversario> lista = List.from(
      _lista.where(
      (a) => a.data.month.compareTo(data.month).isEven && a.data.day.compareTo(data.day).isEven
      )
    );
    lista = List.from(
    lista.where(
    (a) =>a.nomeAniversariante.contains(nome))
    );
    return lista;
  }
  static bool mesmaData(DateTime data1, DateTime data2) {
  return data1.year == data2.year &&
         data1.month == data2.month &&
         data1.day == data2.day;
}
}