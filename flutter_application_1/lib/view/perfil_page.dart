import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}


class _PerfilPageState extends State<PerfilPage>{

  bool _edicao = false;

  String nome = 'Maria da Biqueira';
  DateTime aniversario = DateTime.now();
  String recado = "Gosto de flores";

  final _dataController = TextEditingController();
  final _nomeController = TextEditingController();
  final _recadoController = TextEditingController();

  @override
  void dispose() {
    _dataController.dispose();
    _nomeController.dispose();
    _recadoController.dispose();
    super.dispose();
  }

  void mudarEstado(bool estado) {
  setState(() {
    _edicao = estado;
    print("Estado atual: $_edicao");
  });
}


  
  @override
  Widget build(BuildContext context){
    

    
    final alturaTela = MediaQuery.of(context).size.height;
    final larguraTela = MediaQuery.of(context).size.width;
    double raioAvatar = larguraTela * 0.2;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  width: larguraTela,
                  height: alturaTela * 0.25,
                  child: _edicao 
                    ? IconButton(
                        onPressed: () => mudarEstado(false), 
                        icon: Icon(Icons.check),
                      )
                    : IconButton(
                        onPressed: () => mudarEstado(true), 
                        icon: Icon(Icons.edit),
                      )
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  width: larguraTela,
                  height: alturaTela * 0.75,
                  child: _edicao 
                    ? _editar()
                    : _visualizar()
                ),
              ),
            ],
          ),
          Positioned(
                top: alturaTela * 0.25 - raioAvatar * 1.5 ,
                left: (larguraTela / 2) - raioAvatar,
                child: CircleAvatar(
                  radius: raioAvatar,
                  backgroundImage: NetworkImage('https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?semt=ais_hybrid&w=740'),
                )
          ),
        ],
      ),
    );
  }

  Widget _editar(){
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite seu nome';
              } else if (value.length > 200) {
                return 'O limite de caracteres é 200';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _dataController,
            decoration: InputDecoration(labelText: 'Data de Aniversário'),
            readOnly: true,
            onTap: () async{
              DateTime? dataEscolhida = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), 
                firstDate: DateTime(1900), 
                lastDate: DateTime(2100),
                );
                if (dataEscolhida != null){
                  setState(() {
                    _dataController.text = '${dataEscolhida.day}/${dataEscolhida.month}/${dataEscolhida.year}';
                  });
                }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, escolha sua data de nascimento';
              } 
              return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _recadoController,
            decoration: InputDecoration(labelText: 'Recado'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite seu recado';
              } else if (value.length > 1000) {
                return 'O limite de caracteres é 1000';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Formulário válido!')),
                );
              }
            },
            child: Text("Salvar"),
            ),
        ],
      )
    );
  }
  Widget _visualizar(){
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 150),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            //SizedBox(height:MediaQuery.of(context).size.width  * 0.7),
            SizedBox(width: 20),
            Icon(
              Icons.person,
              size: 50,
              color: Colors.blueGrey,
            ),
            SizedBox(width: 10),
            Text(_nomeController.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            SizedBox(height: 90,),
            SizedBox(width: 20),
            Icon(
              Icons.cake,
              size: 50,
              color: Colors.blueGrey,
            ),
            SizedBox(width: 10),
            Text(_dataController.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            SizedBox(height:30),
            SizedBox(width: 20),
            Icon(
              Icons.textsms_rounded,
              size: 50,
              color: Colors.blueGrey,
            ),
            SizedBox(width: 10),
            Text(_recadoController.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}