import 'dart:math';

class CPF {
  late String number;

  CPF({required this.number});

  bool validate() {
    int firstCheckDigit = calculateDigit(8, this.number);
    int secondCheckDigit = calculateDigit(9, this.number);
    if(firstCheckDigit == int.parse(number[9])
        && secondCheckDigit == int.parse(number[10])) return true;
    return false;
  }

  int calculateDigit(int iteration, String cpfNumber, {int multiplierValue = 2}) {
    int digit = multiplyMembers(iteration, multiplierValue, cpfNumber) % 11;
    if(digit < 2) digit = 0;
    else digit = 11 - digit;
    return digit;
  }

  int multiplyMembers(int iteration, int multiplierValue, String cpfNumber) {
    if(iteration == 0) return int.parse(cpfNumber[iteration]) * multiplierValue;
    return int.parse(cpfNumber[iteration]) * multiplierValue + multiplyMembers(iteration - 1, multiplierValue + 1, cpfNumber);
  }

  String generateValidCPF() {
    String cpfNumber = generateDigits(9);
    int firstCheckDigit = calculateDigit(8, cpfNumber);
    cpfNumber += firstCheckDigit.toString();
    int secondCheckDigit = calculateDigit(9, cpfNumber);
    cpfNumber += secondCheckDigit.toString();
    return cpfNumber;
  }

  String generateDigits(int amount) {
    if(amount == 0) return '';
    return Random().nextInt(10).toString() + generateDigits(amount - 1);
  }
}