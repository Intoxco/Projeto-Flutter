import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aniversarios_page.dart';
import 'package:flutter_application_1/pages/calendario_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _indice = 0 ;
  final List<Widget> _telas = [
    CalendarioPage(),
    AniversariosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BDAY", style: TextStyle(
          fontSize: 25,
          color: const Color.fromARGB(255, 218, 198, 198)
        ),
        ),
        backgroundColor: Color.fromARGB(255, 64, 64, 228),
      ),
      body: _telas[_indice],
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
