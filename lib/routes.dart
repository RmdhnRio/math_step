import 'package:flutter/material.dart';
import 'package:math_step/quiz.dart';
import 'main.dart';
import 'materi.dart';
import 'kompetensi.dart';
import 'quiz.dart';
import 'tentang.dart';
import 'video.dart';

// general animation config
const _begin = Offset(0.0, 1.0);
const _end = Offset.zero;
const _curve = Curves.fastOutSlowIn;

var _tween = Tween(begin: _begin, end: _end).chain(CurveTween(curve: _curve));



Route mainRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const MainMenu(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
        position: animation.drive(_tween),
        child: child,
      );
    },
  );
}

Route materiRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const MateriPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        return SlideTransition(
            position: animation.drive(_tween),
            child: child,
        );
      },
  );
}

Route quizRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => const QuizIntro(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
          position: animation.drive(_tween),
          child: child,
      );
    },
  );
}

Route videoRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => VideoPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
          position: animation.drive(_tween),
        child: child,
      );
    },
  );
}

Route tentangRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => const TentangPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
        position: animation.drive(_tween),
        child: child,
      );
    }
  );
}

Route kompetensiRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => const KompetensiPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
        position: animation.drive(_tween),
        child: child,
      );
    }
  );
}

Route QuizFormRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => const QuizForm(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
        position: animation.drive(_tween),
        child: child,
      );
    }
  );
}

Route QuizStartRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => const QuizStart(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return SlideTransition(
        position: animation.drive(_tween),
        child: child,
      );
    }
  );
}



