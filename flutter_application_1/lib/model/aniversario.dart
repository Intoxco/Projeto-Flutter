class Aniversario{
    DateTime data;
    String nomeAniversariante;
    String? detalhes;
    Aniversario(this.data,this.nomeAniversariante,this.detalhes,this.uid);
    String? uid;
    String pegarData(){
    String dataRetorno;
    if(data.day<10) {
      dataRetorno="0${data.day}/";
    } else {
      dataRetorno="${data.day}/";
    }
    if(data.month<10) {
      dataRetorno+="0${data.month}";
    } else {
      dataRetorno+="${data.month}";
    }
    return dataRetorno;
    }

}