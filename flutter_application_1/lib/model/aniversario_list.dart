import "dart:collection";
import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import "package:flutter_application_1/model/db_firestore.dart";
import "package:flutter_application_1/widgets/auth_service.dart";

import "aniversario.dart";
class AniversarioList extends ChangeNotifier{
  List <Aniversario> _lista= [];
  UnmodifiableListView <Aniversario> get lista => UnmodifiableListView(_lista);

  late FirebaseFirestore db;
  late AuthService auth;

  
  AniversarioList({required this.auth}){
    _copularLista();
    _startFirestore();
  }
  _copularLista() async{
    if(auth.usuario != null && _lista.isEmpty){
      final snapshot = await db.collection("usuarios/${auth.usuario}!.uid/aniversarios").get();
      _lista = snapshot.docs.toList() as List<Aniversario>;
      notifyListeners();
    }
  }
  _startFirestore(){
    db = DBFirestore.get();
  }
  adicionarAniversario(Aniversario aniversario) async{
    _lista.add(aniversario);
    notifyListeners();
    await db
    .collection('usuarios/${auth.usuario!.uid}/aniversarios')
    .doc()
    .set({// fazer com que o nome do aniversariante seja unico
      'descricao':aniversario.detalhes,
      'data':aniversario.data,
    });
    }
  removerAniversario(Aniversario aniversario) async {
    _lista.removeWhere((niver)=>niver.nomeAniversariante == (aniversario.nomeAniversariante) && niver.detalhes == aniversario.detalhes && aniversario.data == niver.data);
    notifyListeners();
    await db
    .collection('usuarios/${auth.usuario!.uid}/aniversarios')
    .doc(_lista.length.toString())
    .delete(); // adicionar algo para garantir a deleção ao inves do length
  }
  editarAniversario(Aniversario aniversarioAntigo,Aniversario aniversarioNovo) async{
    int index = _lista.indexWhere(
    (a)=>a.data.isAtSameMomentAs(aniversarioAntigo.data) && 
    a.detalhes ==aniversarioAntigo.detalhes &&
    a.nomeAniversariante == aniversarioAntigo.nomeAniversariante);
    _lista[index] = aniversarioNovo;
    notifyListeners();
    await db
    .collection('usuarios/${auth.usuario!.uid}/aniversarios')
    .doc(_lista.length.toString())
    .set({// fazer com que o nome do aniversariante seja unico, diferente do length
      'descricao':aniversarioNovo.detalhes,
      'data':aniversarioNovo.data,
    });
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