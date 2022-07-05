
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_step/style.dart' as style;
import 'main.dart' as m;
import 'package:audioplayers/audioplayers.dart';
import 'routes.dart' as route;
import 'quiz_helper/quiz_model.dart';

void main() {
  runApp(const MyApp());
}

bool _isVolumeUp  = true;
final audioPlayer = AudioPlayer();
Duration duration = Duration.zero;
Duration position = Duration.zero;
String _namaSiswa = "";
String _kelas     = "";



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const QuizIntro(),
    );
  }
}


class QuizIntro extends StatefulWidget {
  const QuizIntro({Key? key }) : super(key: key);
  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class QuizForm extends StatefulWidget {
  const QuizForm({Key? key }) : super(key: key);
  @override
  State<QuizForm> createState() => _QuizFormState();
}

class QuizStart extends StatefulWidget {
  const QuizStart({Key? key }) : super(key: key);
  @override
  State<QuizStart> createState() => _QuizStartState();
}


class _QuizIntroState extends State<QuizIntro> {


  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSource(AssetSource('audio/quiz_bgm.mp3'));
    audioPlayer.setVolume(2.0);
    audioPlayer.resume();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    setAudio();
    // _isVolumeUp = true;

    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     _isVolumeUp = state == PlayerState.playing;
    //   });
    // });

    audioPlayer.onDurationChanged.listen((newDuraion) {
      if(mounted) {
        setState(() {
          duration = newDuraion;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

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
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(style: style.title, 'Quiz'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 10, 90, 0),
                      child: Stack(

                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 40),
                            child:  SizedBox(
                              width: 450,
                              height: 140,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(237, 194, 59, 1),
                                  borderRadius: BorderRadius.circular(16.0),

                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
                                  child: Text(textAlign: TextAlign.center, style: style.quizCapt ,'Disini nanti kamu akan membaca pertanyaan\nkemudian menjawab jawaban yang menurut kamu paling benar'),
                                ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child:  SizedBox(
                        width: 80,
                        height: 80,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color.fromRGBO(237, 194, 59, 1), width: 7.0,),

                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/light_animated.gif', width: 40,),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 217),
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 280),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              route.QuizFormRoute(),
                          );
                        },
                        style:
                        ElevatedButton.styleFrom(
                          elevation: 3.0,
                          // Foreground color
                          onPrimary: Theme.of(context).colorScheme.onPrimary,
                          // Background color
                          primary: const Color.fromRGBO(156, 180, 236, 1),
                        ),
                        child:
                        Container(
                          alignment: Alignment.center,
                          child: Text(style: style.btnText,'Ayo Mulai!')
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(top: 120),
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_isVolumeUp) {
                            await audioPlayer.pause();
                            if(mounted) {
                              setState(() {
                                _isVolumeUp = false;
                              });
                            }
                          } else {
                            await audioPlayer.resume();
                            if(mounted) {
                              setState(() {
                                _isVolumeUp = true;
                              });
                            }
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
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 205),
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              audioPlayer.stop();
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
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              height: 60,
                              alignment: Alignment.center,
                              child: const Icon(Icons.arrow_back, size: 18,),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const m.MainMenu()),
                              );
                              audioPlayer.stop();
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

class _QuizFormState extends State<QuizForm> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(

      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),

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
                    child: Text(style: style.title, 'Siapa kamu?'),
                  ),
                ],
              ),

              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(180, 0, 180, 0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(textAlign: TextAlign.center, style:style.quizText,'Isi “Nama” kamu dan “Kelas” kamu\ndi kotak isian dibawah ya!'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextField(
                                style: style.inputText,
                                decoration: InputDecoration(
                                  fillColor: Colors.blue[50],
                                  // focusColor: Colors.blue[100],
                                  filled: true,
                                  labelText: 'Nama'),
                              ),

                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              child: TextField(
                                style: style.inputText,
                                decoration: InputDecoration(
                                  fillColor: Colors.blue[50],

                                  // focusColor: Colors.blue[100],
                                  filled: true,
                                  labelText: 'Kelas'),
                              ),

                            ),
                          ],
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 220),
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 280),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              route.QuizStartRoute(),
                            );
                          },
                          style:
                          ElevatedButton.styleFrom(
                            elevation: 3.0,
                            // Foreground color
                            onPrimary: Theme.of(context).colorScheme.onPrimary,
                            // Background color
                            primary: const Color.fromRGBO(156, 180, 236, 1),
                          ),
                          child:
                          Container(
                              alignment: Alignment.center,
                              child: Text(style: style.btnText,'Lanjutkan')
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(top: 120),
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if(_isVolumeUp) {
                              await audioPlayer.pause();
                              if(mounted) {
                                setState(() {
                                  _isVolumeUp = false;
                                });
                              }
                            } else {

                              await audioPlayer.resume();
                              if(mounted) {
                                setState(() {
                                  _isVolumeUp = true;
                                });
                              }
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
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(top: 205),
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                audioPlayer.stop();
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
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                height: 60,
                                alignment: Alignment.center,
                                child: const Icon(Icons.arrow_back, size: 18,),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const m.MainMenu()),
                                );
                                audioPlayer.stop();
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
      ),

    );

  }

}

class _QuizStartState extends State<QuizStart> {
  int _questionNumber = 1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(

      // resizeToAvoidBottomInset: false,
     body: Container(
        child: Container(
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
                    margin: const EdgeInsets.only(top: 40),
                    child: Text(style: style.title, 'Soal No.$_questionNumber' ),
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

                          onPressed: () async {
                            if(_isVolumeUp) {
                              await audioPlayer.pause();
                              if(mounted) {
                                setState(() {
                                  _isVolumeUp = false;
                                });
                              }
                            } else {
                              await audioPlayer.resume();
                              if(mounted) {
                                setState(() {
                                  _isVolumeUp = true;
                                });
                              }
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
                        padding: EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            audioPlayer.stop();
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
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                            height: 60,
                            alignment: Alignment.center,
                            child: const Icon(Icons.arrow_back, size: 18,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 250,
                    width: 538,
                    child: PageView.builder(
                      itemCount: questions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        final _question = questions[index];
                        return buildQuestion(_question);
                      }
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.fromLTRB(25, 205, 25, 0),
                    child:

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const m.MainMenu()),
                        );
                        audioPlayer.stop();
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
                        child: Icon(Icons.home, size: 18,),
                      ),
                    ),

                  ),
                ],
              )





            ],
          ),
        ),
      ),

    );

  }

  Container buildQuestion(Question question) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(textAlign: TextAlign.center, style:style.quizText, question.text),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: OptionsWidget(
              question: question,
            ),
          )

        ],
      ),
    );
  }

}

class OptionsWidget extends StatelessWidget {
  final Question question;

  const OptionsWidget({
    Key? key,
    required this.question,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList(),
    ),
  );

  Widget buildOption(BuildContext context, Option option) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {

            },
            style:
            ElevatedButton.styleFrom(
              elevation: 3.0,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0) ),
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
                option.text,
                style: style.optionText,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
