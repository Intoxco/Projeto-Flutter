import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlller/date_picker_controller.dart';
class DatePicker extends StatefulWidget{
  const DatePicker({super.key,required this.loadDate,required this.date,required this.label,required this.textController});
  final TextEditingController textController;
  final String label;
  final bool loadDate;
  final DateTime date;
  @override
  State<DatePicker> createState()=> _DatePicker();
}
class _DatePicker extends State<DatePicker>{
    @override
    void initState(){
      super.initState();
      if(widget.loadDate){
        widget.textController.text = criarStringDaData(widget.date);
      }
    }
    Future<void> selectDate(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context, 
      firstDate: DateTime(DateTime.now().year-4,1,1), 
      lastDate: DateTime(DateTime.now().year,12,31)
    );
    if(picked != null){
      setState(() {
        widget.textController.text = criarStringDaData(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      alignment:Alignment.centerRight,
      child:TextFormField(
        validator:(value){
          if(value!.isEmpty){
            return "Preencha esse campo";
          }
          return null;
        },
        textAlign: TextAlign.center,
        readOnly: true,
        controller:widget.textController,
        style:TextStyle(
          fontSize: 22,
        ),
        decoration:InputDecoration(
          suffix:Text("dd/mm"),
          border:OutlineInputBorder(),
          alignLabelWithHint: true,
          label:Center(child: Text("Selecione a data",style: TextStyle(fontSize:22),),),
          filled:true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.purple
            )
          ),
          prefixIcon:IconButton(
            onPressed:(){
              selectDate(context);
            },
            icon:Icon(
              Icons.calendar_today_outlined,
              color:Colors.black
            )
          )
        )
    )
  );
  }
}
