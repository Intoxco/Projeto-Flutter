import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_service.dart';
import 'package:provider/provider.dart';
import '../model/usuario.dart';
import '../controlller/perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final controller = PerfilController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => controller.mudarEstado(() => setState(() {})),
                        icon: Icon(
                          controller.edicao ? Icons.check : Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  width: larguraTela,
                  height: alturaTela * 0.75,
                  child: controller.edicao ? _editar() : _visualizar(),
                ),
              ),
            ],
          ),
          Positioned(
            top: alturaTela * 0.25 - raioAvatar * 1.5,
            left: (larguraTela / 2) - raioAvatar,
            child: CircleAvatar(
              radius: raioAvatar,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?semt=ais_hybrid&w=740'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editar() {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.nomeController,
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
            SizedBox(height: 20),
            TextFormField(
              controller: controller.dataController,
              decoration: InputDecoration(labelText: 'Data de Aniversário'),
              readOnly: true,
              onTap: () =>
                  controller.escolherData(context, () => setState(() {})),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, escolha sua data de nascimento';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.recadoController,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.salvarFormulario(context, () => setState(() {})),
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _visualizar() {
    return Column(
      children: [
        SizedBox(height: 150),
        _linhaItem(Icons.person, Usuario.nome),
        _linhaItem(Icons.cake, controller.dataController.text),
        _linhaItem(Icons.textsms_rounded, Usuario.recado),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: OutlinedButton(
            //onPressed: () =>context.read()<AuthService>().logout(),
            onPressed: () => context.read<AuthService>().logout(),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Sair do App',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
            ),
        )
      ],
    );
  }

  Widget _linhaItem(IconData icone, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(
            icone,
            size: 50,
            color: Colors.blueGrey,
          ),
          SizedBox(width: 10),
          Text(
            texto,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
