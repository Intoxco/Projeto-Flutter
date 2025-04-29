
import 'package:flutter_application_1/model/Aniversario.dart';
import 'package:flutter_application_1/model/AniversarioList.dart';

adicionarAniversario(String data,String nome,String? descricao){
  AniversarioList.adicionarAniversario(Aniversario(DateTime(DateTime.now().year,int.parse(data.split("/")[1]),int.parse(data.split("/")[0])),nome,descricao));
}