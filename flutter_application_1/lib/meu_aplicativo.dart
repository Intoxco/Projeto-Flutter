
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/widgets/auth_check.dart';
import 'package:flutter_application_1/controlller/auth_check_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers:[
      ChangeNotifierProvider(create:(context)=>AuthService()),
      ChangeNotifierProxyProvider<AuthService, AniversarioList>(
      create: (context) => AniversarioList(auth: context.read<AuthService>()),
      update: (context, auth, anterior) {
        anterior ??= AniversarioList(auth: auth);
        anterior.auth = auth;
        anterior.popularLista();
        return anterior;
      },
    ),
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
