import "dart:collection";
import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import "package:flutter_application_1/model/db_firestore.dart";
import "package:flutter_application_1/controlller/auth_check_controller.dart";

import "aniversario.dart";
class AniversarioList extends ChangeNotifier{
  List <Aniversario> _lista= [];
  UnmodifiableListView <Aniversario> get lista => UnmodifiableListView(_lista);

  late FirebaseFirestore db;
  late AuthService auth;

  
  AniversarioList({required this.auth}){
    _iniciarLista();
  }
  _iniciarLista()async{
    await _startFirestore();
    await _popularLista();
  }
  _popularLista() async{
    if(auth.usuario != null && _lista.isEmpty){
      final snapshot = await db.collection("usuarios/${auth.usuario!.uid}/aniversarios").get();
      List <Aniversario> lista = [];
      for (var doc in snapshot.docs) {
        Aniversario aniversario = Aniversario(doc.get("data").toDate(),doc.get("nomeAniversariante"),doc.get("descricao"),doc.id);
        lista.add(aniversario);
      }
      _lista = lista;
      notifyListeners();
    }
  }
  _startFirestore() async{
    db = DBFirestore.get();
  }
  adicionarAniversario(Aniversario aniversario) async{
    DocumentReference docRef =  await db
    .collection('usuarios/${auth.usuario!.uid}/aniversarios')
    .add({
      'nomeAniversariante':aniversario.nomeAniversariante,
      'descricao':aniversario.detalhes,
      'data':aniversario.data,
    });
    aniversario.uid = docRef.id;
    _lista.add(aniversario);
    notifyListeners();
    }
  removerAniversario(Aniversario aniversario) async {
    await db
    .collection('usuarios/${auth.usuario!.uid}/aniversarios')
    .doc(aniversario.uid??"")
    .delete();
  _lista.removeWhere((niver)=>niver.nomeAniversariante == (aniversario.nomeAniversariante) && niver.detalhes == aniversario.detalhes && aniversario.data == niver.data);
  notifyListeners();

  }
  editarAniversario(Aniversario aniversarioAntigo,Aniversario aniversarioNovo) async{
    int index = _lista.indexWhere(
    (a)=>a.data.isAtSameMomentAs(aniversarioAntigo.data) && 
    a.detalhes ==aniversarioAntigo.detalhes &&
    a.nomeAniversariante == aniversarioAntigo.nomeAniversariante);
    aniversarioNovo.uid = aniversarioAntigo.uid;
    _lista[index] = aniversarioNovo;
    notifyListeners();
    if (aniversarioAntigo.uid != null && aniversarioAntigo.uid!.isNotEmpty) {
      await db
          .collection('usuarios/${auth.usuario!.uid}/aniversarios')
          .doc(aniversarioAntigo.uid)
          .set({
        'nomeAniversariante': aniversarioNovo.nomeAniversariante,
        'descricao': aniversarioNovo.detalhes,
        'data': aniversarioNovo.data,
      });
    }
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