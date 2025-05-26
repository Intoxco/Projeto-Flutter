import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception{
  String message;
  AuthException({required this.message});
}
class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;
  AuthService(){
    _authCheck();
  }
  _authCheck(){
    _auth.authStateChanges().listen((User? user){
      usuario = (user == null)?null:user;
      isLoading = false;
      notifyListeners();
    });
  }
  login(String email,String senha) async{
try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        throw AuthException(message:"Email não encontrado, cadastre-se");
      }else if(e.code == "wrong-password"){
        throw AuthException(message: "Senha incorreta, tente novamente");
      }
    }   
  }
  logout() async{
  await _auth.signOut();
  _getUser();
  }
   _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }
  registrar(String email,String senha) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        throw AuthException(message:"A senha passada é muito fraca");
      }else if(e.code == "email-already-in-use"){
        throw AuthException(message: "O email já está em uso");
      }
    }
  }
}
