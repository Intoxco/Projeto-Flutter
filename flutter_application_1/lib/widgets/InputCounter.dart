import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCounter extends StatefulWidget{
  const InputCounter({super.key,required this.text,required this.loadText,required this.maxLength,required this.label,required this.textController});
  final TextEditingController textController;
  final String label;
  final int maxLength;
  final bool loadText;
  final String text;
  @override
  State<InputCounter> createState()=> _InputCounter();

}
class _InputCounter extends State<InputCounter>{
  var _counterText ="0";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.centerRight,
      child: TextFormField(
        validator:(value){
          if(value!.isEmpty){
            return "Preencha esse campo";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        textAlign:TextAlign.center,
        onChanged: (text) {
          setState((){
            _counterText = (text.length).toString();
            });
            },
        maxLength:widget.maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller:widget.textController,
        decoration: InputDecoration(
          alignLabelWithHint:true,
          label: Center(
            child:Text(
              widget.label,
              style:TextStyle(
                fontSize:22,
              )
            )
            ),
          counterText: "$_counterText/${widget.maxLength}",
          border:OutlineInputBorder(),
        ),
        style:TextStyle(
          fontSize:22,
        )
      )
    );
  }
}