// math_solver_screen.dart
import 'package:flutter/material.dart';
import 'math_operations.dart';

class MathSolverScreen extends StatefulWidget {
  @override
  _MathSolverScreenState createState() => _MathSolverScreenState();
}

class _MathSolverScreenState extends State<MathSolverScreen> {
  String problem = '';
  String solution = '';
  String userAnswer = '';
  String feedback = '';
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateProblem();
  }

  void generateProblem() {
    final operation = MathOperations.generateRandomOperation();
    int result = operation['result'];

    setState(() {
      problem = '${operation['operand1']} ${operation['operator']} ${operation['operand2']} = ';
      solution = result.toString();
      feedback = '';
      userAnswer = '';
      answerController.clear();
    });
  }

  int solveProblem(int operand1, int operand2, String operator) {
    // Решение математического примера
    int result = 0;
    switch (operator) {
      case '+':
        result = operand1 + operand2;
        break;
      case '-':
        result = operand1 - operand2;
        break;
      case '*':
        result = operand1 * operand2;
        break;
      case '/':
        result = operand1 ~/ operand2;
        break;
    }

    return result;
  }
  Widget buildNumberButton(String digit) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => appendDigit(digit),
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.purple,
                width: 10
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              digit,
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnswerButton(String digit) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: digit == 'can' ? clearInput : (digit == 'del' ? deleteLastDigit : checkAnswer),
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.purple,
                width: 10
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              digit,
              style: TextStyle(
                fontSize: digit == 'can' ? 35 : digit == 'del' ? 35 : 45,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildZeroButton(String digit) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 10,
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              digit,
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALARM'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
                'Math Problem:',
                style: TextStyle(fontSize: 40, color: Colors.purple, fontWeight: FontWeight.bold)
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  problem,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                SizedBox(width: 80,
                  child:
                  TextField(
                    decoration: InputDecoration(contentPadding: EdgeInsets.fromLTRB(0,0,0,10)),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.purple),
                    controller: answerController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height:70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildAnswerButton('can'),
                buildZeroButton(''),
                buildAnswerButton('del'),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumberButton('1'),
                buildNumberButton('2'),
                buildNumberButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumberButton('4'),
                buildNumberButton('5'),
                buildNumberButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumberButton('7'),
                buildNumberButton('8'),
                buildNumberButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumberButton('-'),
                buildNumberButton('0'),
                buildAnswerButton('✔')

              ],
            ),

            SizedBox(height: 10),
            Text(
              feedback,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: feedback == 'Correct!' ? Colors.green : Colors.red,
              ),
            ),

          ],
        ),
      ),
    );
  }

  void appendDigit(String digit) {
    setState(() {
      userAnswer = '$userAnswer$digit';
      answerController.text = userAnswer;
    });
  }

  void checkAnswer() {
    setState(() {
      userAnswer = answerController.text;
      if (userAnswer == solution) {
        feedback = 'Correct!';
      } else {
        feedback = 'Incorrect. Try again.';
        generateProblem();
      }
    });
  }

  void deleteLastDigit() {
    setState(() {
      if (userAnswer.isNotEmpty) {
        userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        answerController.text = userAnswer;
      }
    });
  }

  void clearInput() {
    setState(() {
      userAnswer = '';
      answerController.clear();
    });
  }
}
