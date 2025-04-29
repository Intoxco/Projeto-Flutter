String criarStringDaData(DateTime date){
  String data;
  if (date.day < 10){
          data ="0${date.day.toString()}";
          }
        else{
          data = date.day.toString();
        }
        if(date.month < 10){
          data +="/0${date.month.toString()}";
        }
        else{
          data ="/${date.month.toString()}";
        }
    return data;
}