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
      text: 'Siapa yang sebenarnya disukai oleh si A ?',
      options: [
        const Option(text: 'Si B', isCorrect: false, score: 0),
        const Option(text: 'Si C', isCorrect: true, score: 10),
        const Option(text: 'Si Asep', isCorrect: false, score: 0),
        const Option(text: 'Si D', isCorrect: false, score: 0),

      ]
  ),

  Question(
      text: 'Mengapa si A menyukai orang tersebut ?',
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

  Question(
    text: 'Dimana naskah SUPERSEMAR yang asli di simpan ?',
    options: [
      const Option(text: 'Di meja belajar andi', isCorrect: false, score: 0),
      const Option(text: 'Di laci meja presiden', isCorrect: false, score: 0),
      const Option(text: 'Di museum nasional', isCorrect: false, score: 0),
      const Option(text: 'Tidak tahu', isCorrect: true, score: 0),
    ]
  ),

  Question(
    text: 'Siapa dalang pembunuhan Munir ?',
    options: [
      const Option(text: 'Tidak tahu', isCorrect: false, score: 0),
      const Option(text: 'Tanya Rezim', isCorrect: false, score: 0),
      const Option(text: 'Tanya Polisi', isCorrect: false, score: 0),
      const Option(text: 'Saya ditangkap,tolong', isCorrect: true, score: 10),
    ]
  )
  
];