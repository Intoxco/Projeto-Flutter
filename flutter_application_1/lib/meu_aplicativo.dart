
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/widgets/auth_check.dart';
import 'package:flutter_application_1/widgets/auth_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers:[
      ChangeNotifierProvider(create:(context)=>AuthService()),
      ChangeNotifierProvider(create:(context)=> AniversarioList(auth:context.read<AuthService>()))
    ],
    child:MaterialApp(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ],
  supportedLocales: [const Locale('pt', 'BR')],
      title: "Agenda de Aniversárioss",
      debugShowCheckedModeBanner:false,
      home:AuthCheck()
    )
  );
  }
}
