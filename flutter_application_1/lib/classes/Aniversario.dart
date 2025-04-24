import "Usuario.dart";
class Aniversario{
    DateTime data;
    Usuario usuario;
    String? detalhes;
    String? presente;
    Aniversario(this.data,this.usuario,this.detalhes,this.presente);

    String pegarData(){
    String dataRetorno;
    if(data.day<10)
      dataRetorno="0${data.day}/";
    else 
      dataRetorno="${data.day}/";
    if(data.month<10)
      dataRetorno+="0${data.month}";
    else
      dataRetorno+="${data.month}";
    return dataRetorno;
    }

}