import 'package:flutter/material.dart';
import 'build_maths_ex/math_solver_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Solver',
      home: MathSolverScreen(),
    );
  }
}

// main.dart
// import 'package:flutter/material.dart';
// import 'maths_ex.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MathSolverScreen(), // Используем MathSolverScreen как начальный экран
//     );
//   }
// }