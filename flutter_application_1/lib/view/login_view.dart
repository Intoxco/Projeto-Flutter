import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  State<Login> createState()=> _LoginState();
}
class _LoginState extends State<Login>{
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool isLogin = true;  
  late String titulo;
  late String actionButton;
  late String toggleButton;
  @override
  initState(){
    super.initState();
    setFormAction(true);
  }
  setFormAction(bool acao){
    setState((){
      isLogin=acao;
      if(isLogin){
        titulo = "Bem Vindo";
        actionButton = "Login";
        toggleButton = "Ainda não tem conta? Cadastre-se agora.";
      }
      else{
        titulo = "Crie sua conta";
        actionButton = "Cadastrar";
        toggleButton = "Voltar ao Login";
      }
    });
  }
  login() async{
    try{
      await context.read<AuthService>().login(email.text,senha.text);
    } on AuthException catch (e){
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  registrar() async{
    try{
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch(e){
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content:Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SingleChildScrollView(
        child:Padding(
          padding:EdgeInsets.only(top:100),
          child:Form(
            key:formKey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize:35,
                    fontWeight:FontWeight.bold,
                    letterSpacing:-1.5,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.all(24),
                  child:TextFormField(
                    controller:email,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText:'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe o email corretamente";
                      }
                      return null;
                    },
                  )
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
                  child:TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText:"Senha",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe sua senha!";
                      }else if(value.length < 6){
                        return "Sua senha deve ter no mínimo 6 caracteres";
                      }
                      return null;
                    },
                  )
                ),
              Padding(
                padding:EdgeInsets.all(24.0),
                child:ElevatedButton(
                onPressed:(){
                  if(formKey.currentState!.validate()){
                    if(isLogin){
                      login();
                    }else{  
                      registrar();
                    }
                  }
                },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding:EdgeInsets.all(16.0),
                        child:Text(
                          actionButton,
                          style:TextStyle(fontSize:20),
                        )
                      )
                    ],
                  ),
                )
              ),
              TextButton(
              onPressed: ()=>setFormAction(!isLogin)
              , child: Text(toggleButton)
              )
              ],
            )
          )
        )
      )
    );
  }
}