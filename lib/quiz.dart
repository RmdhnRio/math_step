
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
Color _color = const Color.fromRGBO(156, 180, 236, 1);
int _index = 0;
int _score = 0;


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

class QuizResult extends StatefulWidget {
  const QuizResult({Key? key}) : super(key: key);
  @override
  State<QuizResult> createState() => _QuizResultState();
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
    _isVolumeUp = true;

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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Stack(

                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 40),
                            child:  SizedBox(
                              width: 450,
                              height: 140,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(237, 194, 59, 1),
                                  borderRadius: BorderRadius.circular(16.0),

                                ),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
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
                      margin: const EdgeInsets.only(top: 10),
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
                      margin: const EdgeInsets.only(top: 217),
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 280),
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
                              child: const Icon(Icons.home, size: 18,),
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

  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final kelasController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaController.dispose();
    kelasController.dispose();
    super.dispose();
  }

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
                        child:
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Text(textAlign: TextAlign.center, style:style.quizText,'Isi “Nama” kamu dan “Kelas” kamu\ndi kotak isian dibawah ya!'),
                              ),
                              Container(
                                height: 75,
                                alignment: Alignment.center,
                                child: TextFormField(
                                  style: style.inputText,
                                  decoration: InputDecoration(
                                      fillColor: Colors.blue[50],
                                      // focusColor: Colors.blue[100],
                                      filled: true,
                                      labelText: 'Nama'
                                  ),
                                  controller: namaController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty){
                                      return 'Harap isi kolom "Nama" dahulu ya!';
                                    }
                                    return null;
                                  }
                                ),

                              ),
                              Container(
                                height: 75,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: style.inputText,
                                  decoration: InputDecoration(
                                      fillColor: Colors.blue[50],

                                      // focusColor: Colors.blue[100],
                                      filled: true,
                                      labelText: 'Kelas'
                                  ),
                                  controller: kelasController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Harap isi kolom "Kelas" juga yaa!';
                                    }
                                    return null;
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),

                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 222),
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 280),
                        child: ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              Navigator.push(
                                context,
                                route.QuizStartRoute(),
                              );
                              _namaSiswa == namaController.text;
                              _kelas == kelasController.text;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Oops.. harap lengkapi form terlebih dahulu!'))
                              );
                            }
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
                                child: const Icon(Icons.home, size: 18,),
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
  late PageController _controller;
  int _questionNumber = 1;

  bool _islocked = false;

  @override
  void initState(){
    super.initState();
    _controller = PageController(initialPage: 0);
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
                       _questionNumber > 1 ?
                       Container(
                         margin: const EdgeInsets.fromLTRB(0,40,30,0),
                         child: ElevatedButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInExpo,
                            );
                            setState((){
                              _questionNumber--;
                              _islocked = true;
                            });
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
                         alignment: Alignment.topCenter,
                         margin: const EdgeInsets.fromLTRB(0,40,30,0),
                         child: Text(style: style.title, 'Soal No.$_questionNumber',),
                       ),
                       _questionNumber < questions.length?
                       Container(
                         margin: const EdgeInsets.only(top: 40),
                         child: ElevatedButton(
                           onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInExpo,
                            );
                            setState((){
                              _questionNumber++;
                              _islocked = false;
                            });
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
                     padding: const EdgeInsets.only(top: 25),
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
               SizedBox(
                 height: 270,
                 width: 538,
                 child: PageView.builder(
                   itemCount: questions.length,
                   controller: _controller,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context, index){

                     final question = questions[index];
                     return buildQuestion(question);
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

  Column buildQuestion(Question question) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(textAlign: TextAlign.center, style:style.quizText, question.text),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState((){
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _islocked = question.isLocked;
                if(question.selectedOption!.isCorrect){
                  _score += option.score;
                }
              }
            },
          ),
        ),
      ],
    );
  }

}

class _QuizResultState extends State<QuizResult> {
  @override
  void initState(){
    super.initState();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text(style: style.title, 'Hasil'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text('Skor yang kamu dapatkan adalah :',style: style.resultText,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text('$_score/100', style: style.resultPoint,),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 217),
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 280),
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
                            child: Text(style: style.btnText,'Lihat Pembahasan')
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

                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.pop(context);
                          //     audioPlayer.stop();
                          //     dispose();
                          //   },
                          //   style:
                          //   ElevatedButton.styleFrom(
                          //     elevation: 3.0,
                          //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                          //     // Foreground color
                          //     onPrimary: Theme.of(context).colorScheme.onPrimary,
                          //     // Background color
                          //     primary: const Color.fromRGBO(156, 180, 236, 1),
                          //   ),
                          //   child:
                          //   Container(
                          //     padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          //     height: 60,
                          //     alignment: Alignment.center,
                          //     child: const Icon(Icons.arrow_back, size: 18,),
                          //   ),
                          // ),
                          Spacer(),
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
                              child: const Icon(Icons.home, size: 18,),
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





class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
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

    _color = getColorForOption(option, question);
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              onClickedOption(option);
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
              primary: _color
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

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.greenAccent
            : Colors.redAccent;
      } else if (option.isCorrect) {
        return Colors.greenAccent;
      }
    }
    return const Color.fromRGBO(156, 180, 236, 1);
  }
}

