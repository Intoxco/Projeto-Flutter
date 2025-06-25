import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feriado.dart';
import 'package:flutter_application_1/controlller/feriado_api_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../controlller/calendario_controller.dart';
import '../widgets/aniversario_list_view.dart';
import '../model/aniversario_list.dart';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({super.key,required this.aniversarioList});
  final AniversarioList aniversarioList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
    );
  }
Widget buildPageView(){

  return PageView.builder(
    itemCount: 12,
    itemBuilder: (contex, pageIndex){
      int mesAtual = pageIndex + 1;
      List <Feriado> feriados = FeriadoList.buscarPorMes(mesAtual);
      DateTime dataMes = DateTime(anoAtual,mesAtual,1);
      int diaSemanaComecoMes = dataMes.weekday;
      if (diaSemanaComecoMes == 7){
        diaSemanaComecoMes = 0;
      }
      int diasMes = DateTime(anoAtual, (mesAtual +1), 0).day;

      return Column(
        children: [
          SizedBox(height: 16,),
          Text('${nomesMeses[mesAtual-1]} $anoAtual',
            style: TextStyle(
               fontSize: 20,
            ),
          ),
          SizedBox(height: 16,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: diasDaSemana.map((dias)=> 
              Expanded(
                child: Center(child: Text(dias)),
              )
            ).toList(),
          ),
          Expanded(
            child: 
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7 ,//7  colunas
                  mainAxisSpacing: 4 ,//espaçamento entre linhas
                  crossAxisSpacing: 4, //espaçamento entre colunas
                  ),
                itemCount: diasMes + diaSemanaComecoMes,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  int dia = (index - diaSemanaComecoMes) + 1;
                  dia <= 0 ? dia = 0 : dia = dia;
                  DateTime diaClicado = DateTime(anoAtual,mesAtual,dia);

                  bool temAniversario;
                  if (mesAtual != diaClicado.month){
                    temAniversario = false;
                  } else {
                    temAniversario = aniversarioList.lista.any(
                    (aniversario) => AniversarioList.mesmaData(aniversario.data, diaClicado),
                    );
                  }

                  return InkWell(
                    
                  onTap: (){
                    if (temAniversario){
                      showDialog(
                        context: context, 
                        builder: (context){
                          return AlertDialog(
                            title: Text("Aniversariantes", textAlign: TextAlign.center,),
                            content: SizedBox(
                              width: double.maxFinite,
                              height: 400,
                              child: AniversarioListView(
                                data: diaClicado,
                                checkData: true,
                                aniversarioList: Provider.of<AniversarioList>(context),
                              ),
                            )
                          );
                        }
                        );
                    }
                  },
                  hoverColor: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        (index < diaSemanaComecoMes) 
                        ? SizedBox()
                        : Text(dia.toString()),
                      dataAtual.day == dia && dataAtual.month == mesAtual ?
                        Container(
                          width: 25,
                          height: 2,
                          color: Colors.green,
                        )
                        : SizedBox(),
                      temAniversario ? 
                        Container(
                          width: 25,
                          height: 2,
                          color: Colors.blue, 
                        )
                        : SizedBox(),
                      
                      ],
                      )
                  );
                }
              )
          ),
        Expanded(
         child: ListView.separated(
            separatorBuilder:(_, __) {
                return Divider();
              },
              itemBuilder:(BuildContext context,int index){
                return ListTile(
                  title:Text(feriados[index].nome),
                  subtitle: Text( DateFormat('EEEE', 'pt_BR').format(feriados[index].data)),
                  trailing: Text("${feriados[index].data.day}/${feriados[index].data.month}",style:TextStyle(fontSize:15))
                );
              },
              itemCount: feriados.length,
          )
        )
        ],
      );
      
    }
  );
}
}
