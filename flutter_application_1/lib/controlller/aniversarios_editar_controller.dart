
import 'package:flutter_application_1/model/Aniversario.dart';
import 'package:flutter_application_1/model/AniversarioList.dart';

editarAniversario(String data,String nomeAniversariante,String detalhes,Aniversario aniversarioAntigo){
  AniversarioList.editarAniversario(aniversarioAntigo, Aniversario(DateTime(DateTime.now().year,int.parse(data.split("/")[1]),int.parse(data.split("/")[0])), detalhes,nomeAniversariante));
}