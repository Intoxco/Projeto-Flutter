import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/usuario.dart';
import '../model/perfil_model.dart';

class PerfilController {
  bool edicao = false;
  //final PerfilModel perfilModel = PerfilModel();
  final nomeController = TextEditingController(text: Usuario.nome);
  final dataController = TextEditingController(
    text: Usuario.data != null
        ? '${Usuario.data!.day}/${Usuario.data!.month}/${Usuario.data!.year}'
        : '--/--/----',
  );
  final recadoController = TextEditingController(text: Usuario.recado);

  final formKey = GlobalKey<FormState>();

  void dispose() {
    nomeController.dispose();
    dataController.dispose();
    recadoController.dispose();
  }

  void mudarEstado(Function callback) {
    edicao = !edicao;
    callback();
  }

  Future<void> escolherData(BuildContext context, Function callback) async {
    DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (dataEscolhida != null) {
      dataController.text =
          '${dataEscolhida.day}/${dataEscolhida.month}/${dataEscolhida.year}';
      callback();
    }
  }

  void salvarFormulario(BuildContext context, Function callback) {
    if (formKey.currentState!.validate()) {
      Usuario.nome = nomeController.text;
      Usuario.recado = recadoController.text;
      Usuario.data = DateFormat('dd/MM/yyyy').parse(dataController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulário enviado!')),
      );
      print("nomes ${Usuario.nome} ${Usuario.recado} ${dataController.text}");
      //perfilModel.adicionarPerfilInfo(Usuario.nome, Usuario.recado, Usuario.data,);
      edicao = false;
      callback();
    }
  }
}
