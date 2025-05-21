import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/AniversarioList.dart';
import 'package:flutter_application_1/view/tela_padrao_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create:(context)=> AniversarioList(),
    child:MaterialApp(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: [const Locale('pt', 'BR')],
      title: "Agenda de Aniversários",
      debugShowCheckedModeBanner:false,
      home:HomeScreen(),
    )
  );
  }
}
