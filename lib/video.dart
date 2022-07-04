import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_step/style.dart' as style;
import 'package:path_provider/path_provider.dart';
import 'main.dart' as m;
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';



late final VideoPlayerController videoPlayerController;

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),

      home: VideoPage(),

    );
  }
}


class VideoPage extends StatefulWidget {

   VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();


}

class _VideoPageState extends State<VideoPage> {
late ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    _chewieController = ChewieController(videoPlayerController: VideoPlayerController.asset('assets/videos/sample.mp4'),
      autoPlay: false,
      looping: true,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
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
                  child: Text(style: style.title, 'Judul Video'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 10, 90, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child:  SizedBox(
                                width: 435,
                                height: 245,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(237, 194, 59, 1),
                                    // borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Chewie(controller: _chewieController,),

                               ),
                              ),
                            ),
                        ],
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
                              _chewieController.pause();
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
                            onPressed: () {
                              _chewieController.pause();
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

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController.dispose();

  }

}
