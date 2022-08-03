import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_step/style.dart' as style;
import 'package:pdfx/pdfx.dart';
import 'main.dart' as m;
import 'routes.dart' as route;
import 'package:flutter_intro/flutter_intro.dart';

bool _isVolumeUp = true;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutorial',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const TutorialPage(),
    );
  }
}


class TutorialPage extends StatefulWidget {
  const TutorialPage({ Key? key }) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();


}

class ReadingTutorial extends StatefulWidget {
  const ReadingTutorial({ Key? key }) : super(key: key);

  @override
  State<ReadingTutorial> createState() => _MelihatDokumen();
}

class QuizTutorial extends StatefulWidget {
  const QuizTutorial({ Key? key }) : super(key : key);

  @override
  State<QuizTutorial> createState() => _MenyelesaikanQuiz();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(


      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),

        child: Column(

          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                        child: const Image(
                          image: AssetImage('assets/images/tut-wuri.png'),
                          height: 56,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 16, 0),
                        child: const Image(
                          image: AssetImage('assets/images/unj.png'),
                          height: 56,
                        ),
                      ),
                    ],
                  ),
                ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 40),
                  // child: Text(style: style.title, 'Pilih Menu'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 40, 90, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                route.ReadingTutorialRoute(),
                              );
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              height: 165,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Membaca Dokumen'), ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                route.QuizTutorialRoute(),
                              );
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              height: 165,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Menyelesaikan\n Quiz'), ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 60,
                              alignment: Alignment.center,
                              child: Icon(Icons.arrow_back, size: 18,),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const m.MainMenu()),
                              );
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 60,
                              alignment: Alignment.center,
                              child: Icon(Icons.home, size: 18,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )

              ],

            ),


          ],
        ),
      ),

    );
  }
}

class _MelihatDokumen extends State<ReadingTutorial> {

  Intro intro = Intro(
    /// You can set it true to disable animation
    noAnimation: false,

    /// The total number of guide pages, must be passed
    stepCount: 3,

    /// Click on whether the mask is allowed to be closed.
    maskClosable: true,

    /// When highlight widget is tapped.
    onHighlightWidgetTap: (introStatus) {
      print(introStatus);
    },

    /// The padding of the highlighted area and the widget
    padding: EdgeInsets.all(8),

    /// Border radius of the highlighted area
    borderRadius: BorderRadius.all(Radius.circular(4)),

    /// Use the default useDefaultTheme provided by the library to quickly build a guide page
    /// Need to customize the style and content of the guide page, implement the widgetBuilder method yourself
    /// * Above version 2.3.0, you can use useAdvancedTheme to have more control over the style of the widget
    /// * Please see https://github.com/minaxorg/flutter_intro/issues/26
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      /// Guide page text
      texts: [
        'Kamu bisa menggeser kotak untuk berpindah halaman',
        'Tekan tombol ini untuk kembali ke menu utama',
        'Tekan tombol ini untuk kembali ke halaman sebelumnya',
      ],
      /// Button text
      buttonTextBuilder: (curr, total) {
        return curr < total - 1 ? 'Lanjut' : 'Selesai';
      },
    ),
  );

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        milliseconds: 500,
      ),
      () {
        intro.start(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/documents/materi_satuan_volume.pdf'),


    );


    return Scaffold(

      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),

        child: Column(

          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                        child: const Image(
                          image: AssetImage('assets/images/tut-wuri.png'),
                          height: 56,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 16, 0),
                        child: const Image(
                          image: AssetImage('assets/images/unj.png'),
                          height: 56,
                        ),
                      ),
                    ],
                  ),
                ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(style: style.title, 'Cara membaca dokumen'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10),
                    child:  Container(
                      margin: EdgeInsets.only(top: 27),
                      key: intro.keys[0],
                      width: 434,
                      height: 244,
                      child: PdfView(
                        controller: pdfController,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 205),
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            key: intro.keys[2],
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 60,
                              alignment: Alignment.center,
                              child: const Icon(Icons.arrow_back, size: 18,),
                            ),
                          ),
                          ElevatedButton(
                            key: intro.keys[1],
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const m.MainMenu()),
                              );
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 60,
                              alignment: Alignment.center,
                              child: Icon(Icons.home, size: 18,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )

              ],

            ),


          ],
        ),
      ),

    );
  }
}

class _MenyelesaikanQuiz extends State<QuizTutorial>{

  Intro intro = Intro(
    /// You can set it true to disable animation
    noAnimation: false,

    /// The total number of guide pages, must be passed
    stepCount: 10,

    /// Click on whether the mask is allowed to be closed.
    maskClosable: true,

    /// When highlight widget is tapped.
    onHighlightWidgetTap: (introStatus) {
      print(introStatus);
    },

    /// The padding of the highlighted area and the widget
    padding: EdgeInsets.all(8),

    /// Border radius of the highlighted area
    borderRadius: BorderRadius.all(Radius.circular(4)),

    /// Use the default useDefaultTheme provided by the library to quickly build a guide page
    /// Need to customize the style and content of the guide page, implement the widgetBuilder method yourself
    /// * Above version 2.3.0, you can use useAdvancedTheme to have more control over the style of the widget
    /// * Please see https://github.com/minaxorg/flutter_intro/issues/26
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      /// Guide page text
      ///
      texts: [
        'Ini adalah nomor soal nya',
        'Ini adalah pertanyaan dari soal',
        'Ini adalah tombol pilihan untuk menjawab soal, setiap soal terdiri dari 4 pilihan jawaban yang berbeda',
        'Apabila jawaban kamu benar, maka tombol berubah menjadi hijau dan kamu mendapatkan skor',
        'Apabila jawaban kamu salah, maka tombol berubah menjadi merah dan kamu tidak akan mendapatkan skor',
        'Tekan tombol ini untuk lanjut ke pertanyaan selanjutnya',
        'Tekan tombol ini untuk kembali ke pertanyaan sebelumnya',
        'Tekan tombol ini untuk menghentikan suara dari musik',
        'Tekan tombol ini untuk kembali ke menu utama',
        'Tekan tombol ini untuk kembali ke halaman sebelumnya'
      ],
      /// Button text
      buttonTextBuilder: (curr, total) {
        return curr < total - 1 ? 'Lanjut' : 'Selesai';
      },
    ),
  );

  @override
  void initState(){
    super.initState();
    _isVolumeUp = true;
    Timer(
      const Duration(
        milliseconds: 500,
      ),
          () {
        intro.start(context);
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(

      // resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),

        child: Column(

          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                      child: const Image(
                        image: AssetImage('assets/images/tut-wuri.png'),
                        height: 56,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        2 > 1 ?
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,40,30,0),
                          child: ElevatedButton(
                            key: intro.keys[6],
                            onPressed: () {
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 15,
                              alignment: Alignment.center,
                              child: const Icon(Icons.arrow_back, size: 18,),
                            ),
                          ),
                        )
                            : Container(
                          margin: const EdgeInsets.fromLTRB(0,40,95,0),
                        ),
                        Container(
                          key: intro.keys[0],
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.fromLTRB(0,40,30,0),
                          child: Text(style: style.title, 'Soal No.1',),
                        ),
                        1 < 2?
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: ElevatedButton(
                            key: intro.keys[5],
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),

                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 15,
                              alignment: Alignment.center,
                              child: const Icon(Icons.arrow_forward, size: 18,),
                            ),
                          ),
                        )
                            : Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                route.QuizResultRoute(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),

                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 15,
                              alignment: Alignment.center,
                              child: const Icon(Icons.arrow_forward, size: 18),
                            ),
                          ),
                        )
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 16, 0),
                      child: const Image(
                        image: AssetImage('assets/images/unj.png'),
                        height: 56,
                      ),
                    ),
                  ],
                ),

              ],
            ),

            Row(
              children: <Widget>[
                Column(

                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.fromLTRB(25, 120, 25, 0),
                      child: ElevatedButton(
                        key: intro.keys[7],
                        onPressed: (){
                          if(_isVolumeUp) {
                            setState(() {
                              _isVolumeUp = false;
                            });
                          } else {
                            setState(() {
                              _isVolumeUp = true;
                            });
                          }

                        },
                        style:
                        ElevatedButton.styleFrom(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                          // Foreground color

                          onPrimary: Theme.of(context).colorScheme.onPrimary,
                          // Background color
                          primary: const Color.fromRGBO(156, 180, 236, 1),
                        ),

                        child:
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                            height: 60,
                            width: 20,
                            alignment: Alignment.center,
                            child: _isVolumeUp?
                            const Icon(Icons.volume_up, size: 18,) : const Icon(Icons.volume_off, size: 18,)

                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        key: intro.keys[9],
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style:
                        ElevatedButton.styleFrom(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                          // Foreground color
                          onPrimary: Theme.of(context).colorScheme.onPrimary,
                          // Background color
                          primary: const Color.fromRGBO(156, 180, 236, 1),
                        ),
                        child:
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          height: 60,
                          alignment: Alignment.center,
                          child: const Icon(Icons.arrow_back, size: 18,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 270,
                  width: 538,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          key: intro.keys[1],
                          height: 50,
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(textAlign: TextAlign.center, style: style.quizText, 'Pertanyaan soal yang akan kamu baca disini, baca dengan teliti dan jawab pertanyaan nya dengan menekan dan memilih pilihan dibawh ini!'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  key: intro.keys[2],
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style:
                                    ElevatedButton.styleFrom(
                                      elevation: 3.0,
                                      // side: const BorderSide(width: 2.0, color: Colors.white54),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(20.0)
                                      ),

                                      // Foreground color
                                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                                      // Background color
                                      primary: const Color.fromRGBO(156, 180, 236, 1),
                                    ),
                                    child: Container(
                                      height: 30,
                                      width: 400,
                                      padding: const EdgeInsets.fromLTRB(58,0,58,0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Pilihan jawaban',
                                        style: style.optionText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  key: intro.keys[3],
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style:
                                    ElevatedButton.styleFrom(
                                      elevation: 3.0,
                                      // side: const BorderSide(width: 2.0, color: Colors.white54),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(20.0)
                                      ),

                                      // Foreground color
                                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                                      // Background color
                                      primary: Colors.greenAccent
                                    ),
                                    child: Container(
                                      height: 30,
                                      width: 400,
                                      padding: const EdgeInsets.fromLTRB(58,0,58,0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Pilihan jawaban apabila benar',
                                        style: style.optionText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  key: intro.keys[4],
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style:
                                    ElevatedButton.styleFrom(
                                      elevation: 3.0,
                                      // side: const BorderSide(width: 2.0, color: Colors.white54),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(20.0)
                                      ),

                                      // Foreground color
                                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                                      // Background color
                                      primary: Colors.redAccent,
                                    ),
                                    child: Container(
                                      height: 30,
                                      width: 400,
                                      padding: const EdgeInsets.fromLTRB(58,0,58,0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Pilihan jawaban apabila salah',
                                        style: style.optionText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style:
                                    ElevatedButton.styleFrom(
                                      elevation: 3.0,
                                      // side: const BorderSide(width: 2.0, color: Colors.white54),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(20.0)
                                      ),

                                      // Foreground color
                                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                                      // Background color
                                      primary: const Color.fromRGBO(156, 180, 236, 1),
                                    ),
                                    child: Container(
                                      height: 30,
                                      width: 400,
                                      padding: const EdgeInsets.fromLTRB(58,0,58,0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Pilihan jawaban',
                                        style: style.optionText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.fromLTRB(25, 205, 25, 0),
                  child:

                  ElevatedButton(
                    key: intro.keys[8],
                    onPressed: () {
                      Navigator.push(
                        context,
                        route.mainRoute()
                      );
                      dispose();
                    },
                    style:
                    ElevatedButton.styleFrom(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                      // Foreground color
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      // Background color
                      primary: const Color.fromRGBO(156, 180, 236, 1),
                    ),
                    child:
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: const Icon(Icons.home, size: 18,),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );

  }
}
