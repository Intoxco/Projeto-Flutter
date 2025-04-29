import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/tela_padrao_view.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agenda de Aniversários",
      debugShowCheckedModeBanner:false,
      home:HomeScreen(),
    );
  }
}