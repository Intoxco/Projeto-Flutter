
import 'package:flutter_application_1/model/aniversario.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';

editarAniversario(String data,String nomeAniversariante,String detalhes,Aniversario aniversarioAntigo,AniversarioList aniversarioList){
  aniversarioList.editarAniversario(aniversarioAntigo, Aniversario(DateTime(DateTime.now().year,int.parse(data.split("/")[1]),int.parse(data.split("/")[0])), nomeAniversariante,detalhes,""));
}