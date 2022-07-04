import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_step/style.dart' as style;
import 'main.dart' as m;
import 'package:pdfx/pdfx.dart';

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
      title: 'Materi',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MateriPage(),
    );
  }
}


class MateriPage extends StatefulWidget {
  const MateriPage({Key? key }) : super(key: key);


  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {

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
      document: PdfDocument.openAsset('assets/documents/contoh_slide.pdf'),


    );


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
                  child: Text(style: style.title, 'Judul Materi'),
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
                              width: 434,
                              height: 244,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(237, 194, 59, 1),
                                    // borderRadius: BorderRadius.circular(16.0),

                                ),
                                child: PdfView(
                                  controller: pdfController,
                                  scrollDirection: Axis.horizontal,
                                ),
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
