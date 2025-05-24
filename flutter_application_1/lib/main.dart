import 'package:flutter/material.dart';
import 'package:flutter_application_1/meu_aplicativo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MeuAplicativo());
}