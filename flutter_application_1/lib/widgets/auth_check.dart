import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login_view.dart';
import 'package:flutter_application_1/view/tela_padrao_view.dart';
import 'package:flutter_application_1/widgets/auth_service.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget{
  const AuthCheck({super.key});
    
  @override
  State<AuthCheck>  createState()=>_AuthCheckState();

}
class _AuthCheckState extends State<AuthCheck>{
  @override
  Widget build(BuildContext context){
    AuthService auth = Provider.of<AuthService>(context);
    if(auth.isLoading){
      return loading();
    }
    else if(auth.usuario == null){
      return Login();
    }
    else{
      return HomeScreen();
      }
  }

  loading(){
    return Scaffold(
      body:Center(
        child:CircularProgressIndicator()
      )
    );
  }
}