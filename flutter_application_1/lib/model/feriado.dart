class Feriado{
    DateTime data;
    String diaSemana;
    String tipo;
    String nome;

  Feriado({
    required this.data,
    required this.diaSemana,
    required this.tipo,
    required this.nome,
  });
  factory Feriado.fromJson(Map<String, dynamic> json) {
    return Feriado(
      tipo:json["tipo"],
      diaSemana: json["dia_semana"],
      data: DateTime.parse(json['data']),
      nome: json['nome'],
    );
  }
}