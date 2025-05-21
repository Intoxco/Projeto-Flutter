import 'package:flutter_application_1/model/Aniversario.dart';
import 'package:flutter_application_1/model/AniversarioList.dart';

List<Aniversario> buscarListaComNome(String nome,AniversarioList aniversarioList) {
    List<Aniversario> lista = aniversarioList.filtrarAniversariosPorNome(nome);
    lista.sort((a, b) => a.data.compareTo(b.data));
    return lista;
  }
List <Aniversario> filtrarAniversariosPorDataENome(DateTime data,String nome,AniversarioList aniversarioList){
  return aniversarioList.filtrarAniversariosPorDataENome(data, nome);
}
removerAniversario(Aniversario aniversario,AniversarioList aniversarioList){
  aniversarioList.removerAniversario(aniversario);
}
  atualizarLista(DateTime data,String busca,bool checkData,AniversarioList aniversarioList){
    if (checkData) {
      return filtrarAniversariosPorDataENome(data, busca,aniversarioList);
    } else {
      return buscarListaComNome(busca,aniversarioList);
    }
  }