import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/aniversario_list.dart';
import 'package:flutter_application_1/view/aniversarios_view.dart';
import 'package:flutter_application_1/view/calendario_view.dart';
import 'package:flutter_application_1/view/perfil_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AniversarioList aniversarioList;
  int _indice = 0;
  late List<Widget> telas;
  @override 
void didChangeDependencies() {
  super.didChangeDependencies();
  aniversarioList = Provider.of<AniversarioList>(context);
}
  @override
  Widget build(BuildContext context) {
    telas = [
        CalendarioPage(aniversarioList:aniversarioList),
    AniversariosPage(),
    PerfilPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("BDAY", style: TextStyle(
          fontSize: 25,
          color: const Color.fromARGB(255, 0, 0, 0)
        ),
        ),
        backgroundColor: Color(0xFF67ABF5),
      ),
      body: telas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Calendário",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Lista",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        )
        ],
        onTap: (index){
          setState(() {
            _indice = index;
          });
        },
      ),
    );
  }
}
