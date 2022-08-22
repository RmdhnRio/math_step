import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_step/style.dart' as style;
import 'package:url_launcher/url_launcher.dart';
import 'main.dart' as m;
import 'routes.dart' as route;
// import 'package:url_launcher/url_launcher.dart';

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
      title: 'Tentang',
      theme: ThemeData(

        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const TentangPage(),
    );
  }
}


class TentangPage extends StatefulWidget {
  const TentangPage({Key? key }) : super(key: key);


  @override
  State<TentangPage> createState() => _TentangPageState();
}

class _TentangPageState extends State<TentangPage> {

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
                  child: Text(style: style.title, 'Tentang'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Container(
                  child: Text(textAlign: TextAlign.center, style: style.caption, 'Jadi aplikasi ini berfungsi sebagai media interaktif\nbagi siswa Sekolah Dasar SDN 01 Gondangdia, Jakarta Pusat'),
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
                              height: 165,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Profil'), ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const MainMenu()),
                              // );
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
                              child: Text(textAlign: TextAlign.center,style: style.menuText,'Daftar\n Pustaka'), ),
                          ),


                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 165),
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


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
                  child: Text(style: style.title, 'Profil Penulis'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: ClipRRect(
                              borderRadius:BorderRadius.circular(16.0),
                              child: Image.asset('assets/images/penulis.jpeg'),
                            ),
                          ),
                          Container(
                            width: 360,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            child:  Container(
                              child: RichText(
                                text: TextSpan(
                                style: style.caption,
                                children: <TextSpan>[
                                  TextSpan(text: 'Nama : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'Windi Indriwati Nalle\n'),
                                  TextSpan(text: 'TTL : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'Nusa Tenggara Timur, 29 Februari 2000\n'),
                                  TextSpan(text: 'Biografi Singkat : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'Windi Indriwati Nalle, lahir di Nusa Tenggara Timur tepatnya di pulau Rote tanggal 29 Februari 2000. Tahun 2012 penulis menyelesaikan pendidikan di SDI Touiu, Prov. NTT. Tahun 2015 penulis menyelesaikan pendidikan di SMPN 2 Lobalain, NTT. Pada tahun 2018 penulis menyelesaikan pendidikan di SMAN 1 Rote Barat Laut, NTT. Penulis melanjutkan pendidikan S1  di Universitas Negeri Jakarta, Fakultas Ilmu Pendidikan  dengan Prodi Pendidikan Guru Sekolah Dasar.'),
                                  ],
                                ),
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 210),
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
                                route.mainRoute(),
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

class DaftarPustaka extends StatefulWidget {
  const DaftarPustaka({Key? key}) : super(key: key);

  @override
  State<DaftarPustaka> createState() => _DaftarPustakaState();
}

class _DaftarPustakaState extends State<DaftarPustaka> {

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
                  child: Text(style: style.title, 'Daftar Pustaka'),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(120, 20, 120, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            style: style.dp,
                            '\n● Pronomosidi dkk. 2018. Buku Siswa Senang Belajar Matematika SD/MI Kelas V. Pusat Kurikulum dan Perbukuan, Balitbang, Kemendikbud.'
                          ),
                          Text(
                            style: style.dp,
                            '● Pronomosidi dkk. 2018. Buku Guru Senang Belajar Matematika SD/MI Kelas V. Pusat Kurikulum dan Perbukuan, Balitbang, Kemendikbud.'
                          ),
                          Text(
                            style: style.dp,
                            '● https://ruangguru.co/satuan-volume/',
                          ),
                          Text(
                            style: style.dp,
                            '● https://quipper.co.id/satuan-volume/',
                          ),
                          Text(
                            style: style.dp,
                            '● https://quipper.co.id/1-kg-berapa-liter/',
                          ),
                          Text(
                            style: style.dp,
                            '● https://www.belajarmtk.com/satuan-volume-dan-contoh-soalnya/',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 200),
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
                                route.mainRoute(),
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

_launchURL1() async {
  final Uri url = Uri.parse('https://ruangguru.co/satuan-volume/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  final Uri url = Uri.parse('https://quipper.co.id/satuan-volume/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  final Uri url = Uri.parse('https://quipper.co.id/1-kg-berapa-liter/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  final Uri url = Uri.parse('https://quipper.co.id/1-kg-berapa-liter/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

