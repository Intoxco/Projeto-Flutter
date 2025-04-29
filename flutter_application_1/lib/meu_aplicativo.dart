import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/tela_padrao.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: [const Locale('pt', 'BR')],
      title: "Agenda de Aniversários",
      debugShowCheckedModeBanner:false,
      home:HomeScreen(),
    );
  }
}