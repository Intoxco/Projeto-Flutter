import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlller/feriado_api_controller.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/meu_aplicativo.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  //await NotificationController().setupNotifications(); // timezone + plugin
  await FeriadoList.buscarFeriados();

  runApp(MeuAplicativo());
}