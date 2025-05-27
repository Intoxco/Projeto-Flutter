import "dart:collection";
import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import "package:flutter_application_1/controlller/auth_check_controller.dart";
import "package:flutter_application_1/model/db_firestore.dart";

class PerfilModel {

  late FirebaseFirestore db;
  late AuthService usuario;

  PerfilModel (){
    -_startFirestore();
  }

  _startFirestore() async{
    db = DBFirestore.get();
  }

  adicionarPerfilInfo(String nome, String recado, DateTime data){

  }
  
}
