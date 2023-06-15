import 'dart:io';
import 'CPF.dart';

void main(List<String> arguments) {
  int menu = 99;

  while(menu != 0) {
    menu = printHeader();

    switch(menu) {
      case 1:
        validateCPF();
        break;
      case 2:
        generateCPF();
        break;
    }
  }
}

void clearConsole() {
  stdout.write("\x1B[2J\x1B[0;0H");
}

int printHeader() {
  clearConsole();

  stdout.writeln('Tratamento de números de CPF\n'
               ' 1 - Validar CPF\n'
               ' 2 - Gerar CPF válido\n');
  stdout.writeln(' 0 - Sair\n');
  stdout.write('Selecione a opção desejada: ');
  String option = stdin.readLineSync() ?? '';

  if(int.tryParse(option) != null) {
    return int.parse(option);
  }
  return 99;
}

void validateCPF() {
  clearConsole();
  String cpfStr;

  while(true) {
    stdout.write(' Insira o número do CPF, sem pontos e traços: ');
    cpfStr = stdin.readLineSync() ?? '';
    clearConsole();

    if(cpfStr.length < 11) {
      stdout.writeln(' ATENÇÃO! O CPF inserido tem menos de 11 caracteres.');
    } else if(cpfStr.length > 11) {
      stdout.writeln(' ATENÇÃO! O CPF inserido tem mais de 11 caracteres.');
    } else if(int.tryParse(cpfStr) == null) {
      stdout.writeln(' ATENÇÃO! O CPF inserido deve possuir apenas caracteres numéricos.');
    } else {
      clearConsole();
      CPF cpf = CPF(number: cpfStr);
      bool isValid = cpf.validate();
      if(isValid) stdout.writeln(' O CPF ${cpf.number} é um CPF válido.\n');
      else stdout.writeln(' O CPF ${cpf.number} não é um CPF válido.\n');

      stdout.write(' Pressione a tecla \'ENTER\' para voltar ao menu principal.');
      stdin.readLineSync();
      break;
    }
    stdout.writeln(' -> $cpfStr\n');
    stdout.writeln(' Tente novamente...\n');
  }
}

void generateCPF() {
  clearConsole();
  int amount = 0;

  while(amount == 0) {
    stdout.write(' Insira quantos CPF\'s deseja gerar: ');
    amount = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    if(amount == 0) {
      clearConsole();
      stdout.writeln(' ATENÇÃO! Insira um valor numérico.');
      stdout.writeln(' Tente novamente...\n');
    }
  }

  clearConsole();
  stdout.writeln(' Lista de $amount CPF\'s válidos:');

  List<String> validCPFList = [];
  for(int i = 0; i < amount; i++) {
    validCPFList.add(CPF.empty().generateValidCPF());
  }

  for (var cpfNumber in validCPFList) {
    stdout.writeln('  $cpfNumber');
  }

  stdout.write('\n Pressione a tecla \'ENTER\' para voltar ao menu principal.');
  stdin.readLineSync();
}