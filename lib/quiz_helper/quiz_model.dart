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
      text: 'Tempat penampungan air berbentuk balok memiliki ukuran panjang 75 cm, lebar 60 cm, dan tinggi 50 cm. Telah terisi air setinggi 35 cm. Berapa liter air yang ada di dalam tempat penampungan air tersebut?',
      options: [
        const Option(text: 'A. 1,575 liter', isCorrect: false, score: 0),
        const Option(text: 'B. 15,75 liter', isCorrect: false, score: 0),
        const Option(text: 'C. 157,5 liter', isCorrect: true, score: 10),
        const Option(text: 'D. 1575 liter', isCorrect: false, score: 0),

      ]
  ),

  Question(
      text: 'Di sebuah wahana wisata terdapat 2 buah kolam renang dengan ukuran yang sama berbentuk balok. Panjang kolam tersebut adalah 10 m, lebar 8 m dan tinggi 3 m. Dua kolam tersebut diisi penuh. Berapa liter air yang dibutuhkan?',
      options: [
        const Option(text: 'A. 480.000 liter', isCorrect: true, score: 10),
        const Option(text: 'B. 48.000 liter', isCorrect: false, score: 0),
        const Option(text: 'C. 4.800 liter', isCorrect: false, score: 0),
        const Option(text: 'D. 4800', isCorrect: false, score: 0),

      ]
  ),

  Question(
      text: 'Sebuah akuarium berukuran panjang 60 cm, lebar 40 cm, dan tinggi 80 cm. Akuarium itu diisi setengah bagian. Berapakah volume air dalam akuarium tersebut (L)',
      options: [
        const Option(text: 'A. 9,6 liter', isCorrect: false, score: 0),
        const Option(text: 'B. 96 liter', isCorrect: true, score: 10),
        const Option(text: 'C. 960 liter', isCorrect: false, score: 0),
        const Option(text: 'D. 9.600 liter', isCorrect: false, score: 0),

      ]
  ),

  Question(
    text: 'Di rumah Beni terdapat akuarium berbentuk balok dengan ukuran Panjang 45 cm, lebar 30 cm, dan tinggi 35 cm. Beni telah menuangkan air sebanyak 27 liter. Berapa liter kekurangan air pada akuarium yang harus dituangkan Beni? (1 liter = 1.000 cm3)',
    options: [
      const Option(text: 'A. 47,25', isCorrect: false, score: 0),
      const Option(text: 'B. 472,5', isCorrect: false, score: 0),
      const Option(text: 'C. 202,5', isCorrect: false, score: 0),
      const Option(text: 'D. 20,25', isCorrect: true, score: 10),
    ]
  ),

  Question(
    text: 'Edo memiliki akuarium berbentuk kubus dengan panjang rusuk kaca akuarium 3 dm. Berapa liter air yang diperlukan jika diisi penuh?',
    options: [
      const Option(text: 'A. 0,27 liter', isCorrect: false, score: 0),
      const Option(text: 'B. 2,7 liter', isCorrect: false, score: 0),
      const Option(text: 'C. 27 liter', isCorrect: true, score: 10),
      const Option(text: 'D. 270 liter', isCorrect: false, score: 0),
    ]
  ),

  Question(
      text: 'Tiap seminggu sekali Beni menguras bak mandi berbentuk kubus. Kedalaman bak mandi tersebut 80 cm. Setelah dikuras, ia mengisinya hingga penuh. Berapa ml air yang diperlukan?',
      options: [
        const Option(text: 'A. 512.000 ml', isCorrect: true, score: 10),
        const Option(text: 'B. 51.200 ml', isCorrect: false, score: 0),
        const Option(text: 'C. 5.120 ml', isCorrect: false, score: 0),
        const Option(text: 'D. 512 ml', isCorrect: false, score: 0),
      ]
  ),

  Question(
      text: 'Edo mempunyai akuarium berbentuk kubus dengan panjang rusuknya 120 cm. Jika Edo hanya ingin mengisi air setengahnya saja. Berapakah volume air yang harus dimasukkannya?',
      options: [
        const Option(text: 'A. 864 ml', isCorrect: false, score: 0),
        const Option(text: 'B. 8.640 ml', isCorrect: false, score: 0),
        const Option(text: 'C. 864 l', isCorrect: true, score: 10),
        const Option(text: 'D. 8.640 l', isCorrect: false, score: 0),
      ]
  ),

  Question(
      text: 'Sebuah bak mandi berbentuk kubus dengan kedalaman 8 dm. berapa liter air yang diperlukan untuk memenuhi bak mandi tersebut',
      options: [
        const Option(text: 'A. 5.200 l', isCorrect: false, score: 0),
        const Option(text: 'B. 5.200 ml', isCorrect: false, score: 0),
        const Option(text: 'C. 512 ml', isCorrect: true, score: 10),
        const Option(text: 'D. 512 l', isCorrect: false, score: 0),
      ]
  ),

  Question(
      text: 'Sebuah tabung susu memiliki dimeter 14 dan tinggi 14 cm volumenya 2.156 cm3 . Berapa liter susu yang ada didalam kaleng susu tersebut?',
      options: [
        const Option(text: 'A. 21,56 l', isCorrect: false, score: 0),
        const Option(text: 'B. 2,156 l', isCorrect: true, score: 10),
        const Option(text: 'C. 215,6 l', isCorrect: false, score: 0),
        const Option(text: 'D. 2156 l', isCorrect: false, score: 0),
      ]
  ),

  Question(
      text: 'Sebuah tabung memiliki diameter tabung 7 cm dan tinggi tabung ini 18 cm. Berapa ml air yang dibutuhkan agar tabung dapat terisi sebagian?',
      options: [
        const Option(text: 'A. 1.386 ml', isCorrect: true, score: 10),
        const Option(text: 'B. 138,6 ml', isCorrect: false, score: 0),
        const Option(text: 'C. 13,86 ml', isCorrect: false, score: 0),
        const Option(text: 'D. 1,386 ml', isCorrect: false, score: 0),
      ]
  ),



];