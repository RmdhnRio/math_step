import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
import 'style.dart' as style;
import 'kompetensi.dart' as komp;
import 'tentang.dart' as ten;
import 'materi.dart' as mat;
import 'video.dart' as vid;
import 'quiz.dart' as quiz;
import 'routes.dart' as route;
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(const MyApp());
}

bool _isVolumeUp  = true;
final audioPlayer = AudioPlayer();
Duration duration = Duration.zero;
Duration position = Duration.zero;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenu();
}

class _MyHomePageState extends State<MyHomePage> {

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSource(AssetSource('audio/main_bgm.mp3'));
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
        alignment: Alignment.center,

        child: Stack(
         alignment: Alignment.center,

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
            const Image(
              image : AssetImage('assets/images/blob.png'),
              width: 304,

            ),
            Text(textAlign: TextAlign.center,style: style.title, 'Media Pembelajaran \n Interaktif'),
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
            Align(
              alignment: Alignment.bottomCenter,
                child:
                ButtonTheme(
                  minWidth: 500,
                  height: 24.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        route.mainRoute(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      // Foreground color
                      onPrimary: Theme.of(context).colorScheme.onPrimary,
                      // Background color
                      primary: const Color.fromRGBO(156, 180, 236, 1),
                    ),
                    child:
                    Container(
                      width: 244,
                        height: 45,
                        alignment: Alignment.center,
                        child: Text(style: style.btnText,'Mulai'), ),
                  ),

              ),
            ),

          ],
        ),
      ),

    );
  }
}

class _MainMenu extends State<MainMenu> {



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
        // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),


        child:
        DecoratedBox(

          decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(156, 180, 236, 1), width: 7.0),

          ),
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
                  child: Text(style: style.title, 'Menu'),
                ),
              ],
            ),

            Column(

              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // SizedBox(width: 45,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            route.TutorialRoute(),
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
                          height: 80,
                          width: 140,
                          alignment: Alignment.center,
                          child: Text(textAlign: TextAlign.center,style: style.menuText,'Petunjuk \nPenggunaan'), ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            route.kompetensiRoute(),
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
                          height: 80,
                          width: 140,
                          alignment: Alignment.center,
                          child: Text(textAlign: TextAlign.center,style: style.menuText,'Kompetensi'), ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            route.materiRoute(),
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
                          height: 80,
                          width: 140,
                          alignment: Alignment.center,
                          child: Text(textAlign: TextAlign.center,style: style.menuText,'Materi'), ),
                      ),
                      // SizedBox(width: 45,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            route.MariMencobaRoute(),
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
                          height: 80,
                          width: 140,
                          alignment: Alignment.center,
                          child: Text(textAlign: TextAlign.center,style: style.menuText,'Mari Mencoba'), ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 10, 90, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              audioPlayer.dispose();
                              Navigator.push(
                                context,
                                route.quizRoute(),

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
                              height: 80,
                              width: 140,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Quiz'), ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                route.ProfileRoute(),
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
                              height: 80,
                              width: 140,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Profil Pengembang'), ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                route.DaftarPustakaRoute(),
                              );
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0)),
                              // Foreground color
                              onPrimary: Theme.of(context).colorScheme.onPrimary,
                              // Background color
                              primary: const Color.fromRGBO(156, 180, 236, 1),
                            ),
                            child:
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              height: 80,
                              width: 140,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Daftar Pustaka'), ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 75),
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MyHomePage()),
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
                              child: Icon(Icons.arrow_back, size: 18,),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => const MainMenu()),
                          //     );
                          //   },
                          //   style:
                          //   ElevatedButton.styleFrom(
                          //     elevation: 3.0,
                          //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16.0) ),
                          //     // Foreground color
                          //     onPrimary: Theme.of(context).colorScheme.onPrimary,
                          //     // Background color
                          //     primary: const Color.fromRGBO(156, 180, 236, 1),
                          //   ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                          //   child:
                          //   Container(
                          //     padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          //     height: 60,
                          //     alignment: Alignment.center,
                          //     child: Icon(Icons.home, size: 18,),
                          //   ),
                          // ),
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
