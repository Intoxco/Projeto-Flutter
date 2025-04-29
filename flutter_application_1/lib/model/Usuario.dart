import 'package:flutter_application_1/model/Aniversario.dart';

class Usuario{
    static String login = "";
    static String senha = "";
    static String nome = "";
    static String recado = "";
    static DateTime ?data;
    static Aniversario aniversario = Aniversario(DateTime.now(), "", "");
}