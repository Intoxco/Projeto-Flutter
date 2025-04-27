
final Map<int, List<int>> aniversarios = {
  1: [3, 7, 22],   // Janeiro: dias 3, 7 e 22
  2: [1, 14],      // Fevereiro: dias 1 e 14
  3: [5, 12, 25],  // Março: dias 5, 12 e 25
  4: [],           // Abril: nenhum aniversário
  5: [9, 19],      // Maio: dias 9 e 19
  6: [3, 21, 30],  // Junho: dias 3, 21 e 30
  7: [15],         // Julho: dia 15
  8: [5, 22, 28],  // Agosto: dias 5, 22 e 28
  9: [],           // Setembro: nenhum
  10: [12, 31],    // Outubro: dias 12 e 31
  11: [11],        // Novembro: dia 11
  12: [24, 25]     // Dezembro: dias 24 e 25
};

List<String> nomesMeses = [
  'Janeiro', 'Fevereiro', 'Março', 'Abril',
  'Maio', 'Junho', 'Julho', 'Agosto',
  'Setembro', 'Outubro', 'Novembro', 'Dezembro'
];


DateTime dataAtual = DateTime.now();
int anoAtual = dataAtual.year;
List <String> diasDaSemana = ['D','S','T','Q','Q','S','S'];