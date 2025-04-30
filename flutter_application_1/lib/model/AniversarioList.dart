import "Aniversario.dart";
class AniversarioList {
  static List <Aniversario> lista= [
  ];
  
  static adicionarAniversario(Aniversario aniversario){
    AniversarioList.lista.add(aniversario);
    }
  static removerAniversario(Aniversario aniversario){
        AniversarioList.lista.removeWhere((niver)=>niver.nomeAniversariante == (aniversario.nomeAniversariante) && niver.detalhes == aniversario.detalhes && aniversario.data == niver.data);
  }
  static editarAniversario(Aniversario aniversarioAntigo,Aniversario aniversarioNovo){
    int index = AniversarioList.lista.indexWhere(
    (a)=>a.data.isAtSameMomentAs(aniversarioAntigo.data) && 
    a.detalhes ==aniversarioAntigo.detalhes &&
    a.nomeAniversariante == aniversarioAntigo.nomeAniversariante);
    AniversarioList.lista[index] = aniversarioNovo;
  }
  static List <Aniversario> getProximosAniversarios(){
    List <Aniversario> lista= List.from(
      AniversarioList.lista.where(
        (a)=>(a.data.month.compareTo(DateTime.now().month) == 0 
        && a.data.day.compareTo(DateTime.now().day) >= 0 ) ||a.data.month.compareTo(DateTime.now().month) >0
      )
    );
    lista.sort((a,b)=>a.data.compareTo(b.data));
    return lista;
  }
  static List <Aniversario> filtrarAniversariosPorNome(String nome){
      List <Aniversario> lista = List.from(
    AniversarioList.lista.where(
    (a) =>a.nomeAniversariante.contains(nome))
    );
    return lista;
  }
  static List<Aniversario> filtrarAniversariosPorDataENome(DateTime data,String nome){
    List <Aniversario> lista = List.from(
      AniversarioList.lista.where(
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