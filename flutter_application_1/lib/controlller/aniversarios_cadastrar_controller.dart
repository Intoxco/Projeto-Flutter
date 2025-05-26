
import 'package:flutter_application_1/model/aniversario.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';

adicionarAniversario(String data,String nome,String? descricao,AniversarioList aniversarioList){
  aniversarioList.adicionarAniversario(Aniversario(DateTime(DateTime.now().year,int.parse(data.split("/")[1]),int.parse(data.split("/")[0])),nome,descricao,""));
}