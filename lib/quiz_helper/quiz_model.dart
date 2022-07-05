class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option{
  final String text;
  final bool isCorrect;
  final int score;

  const Option({
    required this.text,
    required this.isCorrect,
    required this.score,
  });
}

final questions = [
  Question(
      text: 'Siapa yang sebenarnya disukai oleh si A', 
      options: [
        const Option(text: 'Si B', isCorrect: false, score: 0),
        const Option(text: 'Si C', isCorrect: true, score: 10),
        const Option(text: 'Si Asep', isCorrect: false, score: 0),
        const Option(text: 'Si D', isCorrect: false, score: 0),

      ]
  ),

  Question(
      text: 'Mengapa si A menyukai orang tersebut',
      options: [
        const Option(text: 'Karena dia effort', isCorrect: false, score: 0),
        const Option(text: 'Karena punya aerox', isCorrect: true, score: 10),
        const Option(text: 'Karena dia ganteng', isCorrect: false, score: 0),
        const Option(text: 'Karena dia sholeh', isCorrect: false, score: 0),

      ]
  ),

  Question(
      text: 'Siapa yang paling dirugikan dari cerita tersebut ?',
      options: [
        const Option(text: 'Si A', isCorrect: false, score: 0),
        const Option(text: 'Si B', isCorrect: false, score: 0),
        const Option(text: 'Asep', isCorrect: true, score: 10),
        const Option(text: 'Aparatur Sipil Negara', isCorrect: false, score: 0),

      ]
  ),
  
];