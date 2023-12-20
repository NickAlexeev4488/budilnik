// math_operations.dart
import 'dart:math';

class MathOperations {
  static Map<String, dynamic> generateRandomOperation() {
    int operand1 = generateRandomNumber(1, 10);
    int operand2 = generateRandomNumber(1, 10);
    String operator = generateRandomOperator();

    if (operator == '/') {
      operand2 = generateRandomNumber(1, 9);
      operand1 = operand2 * generateRandomNumber(1, 9);
    }

    int result = solveProblem(operand1, operand2, operator);

    return {
      'operand1': operand1,
      'operand2': operand2,
      'operator': operator,
      'result': result,
    };
  }

  static int generateRandomNumber(int min, int max) {
    Random random = Random();
    return random.nextInt(max - min + 1) + min;
  }

  static String generateRandomOperator() {
    List<String> operators = ['+', '-', '*', '/'];
    Random random = Random();
    return operators[random.nextInt(operators.length)];
  }

  static int solveProblem(int operand1, int operand2, String operator) {
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
}
