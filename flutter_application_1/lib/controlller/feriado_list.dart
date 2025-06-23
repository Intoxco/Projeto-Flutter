import 'dart:convert';

import 'package:flutter_application_1/model/feriado.dart';
import 'package:http/http.dart' as http;
class FeriadoList{
  static late List <Feriado> dados;


  static buscarFeriados() async{
    int ano = DateTime.now().year;
    String uri = 'https://solucoes.dev.br/calc/api/api-feriados.php?ano=$ano';
    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      FeriadoList.dados = (json['data'] as List).map((e) => Feriado.fromJson(e))
          .toList();
    }else{
      print("Houve um erro no contato com a API");
    }
  }
  static buscarPorMes(int mes){
    List <Feriado> feriados = List.from(dados.where(
      (a)=>a.data.month == mes));
      return feriados;
  }
}