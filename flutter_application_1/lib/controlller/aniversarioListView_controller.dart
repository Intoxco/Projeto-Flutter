import 'package:flutter_application_1/model/Aniversario.dart';
import 'package:flutter_application_1/model/AniversarioList.dart';

List<Aniversario> buscarListaComNome(String nome) {
    List<Aniversario> lista = AniversarioList.filtrarAniversariosPorNome(nome);
    lista.sort((a, b) => a.data.compareTo(b.data));
    return lista;
  }
List <Aniversario> filtrarAniversariosPorDataENome(DateTime data,String nome){
  return AniversarioList.filtrarAniversariosPorDataENome(data, nome);
}
removerAniversario(Aniversario aniversario){
  AniversarioList.removerAniversario(aniversario);
}