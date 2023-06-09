import 'dart:io';

void printHeader() {
  print("    CÁLCULO PARA REGRA DE 3     \n\n"
        "  Considere o seguinte modelo:  \n"
        "      'w'  está para  'x'       \n"
        "           assim como           \n"
        "      'y'  está para  'z'       \n\n"
        "  Então:                        \n"
        "         w * z = y * x          \n\n"
        " Deixe apenas 1 dos elementos em\n"
        "  branco para obter o seu valor \n\n");
}

bool confirmValue(String value) {
  if(value == "0") {
    print("Insira um valor maior do que 0!");
    return false;
  }

  for (var char in value.codeUnits) {
    if(char < 48 && char != 46 || char > 57) {
      print("Você inseriu algum caractere não número!");
      return false;
    }
  }

  return true;
}

String processValue(String element) {
  String temp;

  do {
    print("Insira o valor de $element: ");
    temp = stdin.readLineSync() ?? "";
  } while(!confirmValue(temp));

  return temp;
}

double convertValue(String value) {
  if(value != "") return double.parse(value);
  return 0;
}

void main(List<String> arguments) {
  List<String> strValues = [];
  double w, x, y, z;
  late int emptyValueIndex;
  String unknownValueName = "";
  String equation = "";
  late double result;

  printHeader();

  while(true) {
    int counter = 0;

    print("'w' está para 'x':");
    strValues.add(processValue('w'));
    strValues.add(processValue('x'));
    print("\n'y' está para 'z':");
    strValues.add(processValue('y'));
    strValues.add(processValue('z'));

    for (var value in strValues) {
      if(value == "") {
        counter++;
        emptyValueIndex = strValues.indexOf(value);
        switch(emptyValueIndex) {
          case 0:
            unknownValueName = 'w';
            break;
          case 1:
            unknownValueName = 'x';
            break;
          case 2:
            unknownValueName = 'y';
            break;
          case 3:
            unknownValueName = 'z';
            break;
        }
      };
    }

    if(counter > 1) {
      print("Você deixou mais de um elemento vazio:");
      print(" w = ${strValues[0] == "" ? "?" : strValues[0]}\n"
            " z = ${strValues[1] == "" ? "?" : strValues[1]}\n"
            " y = ${strValues[2] == "" ? "?" : strValues[2]}\n"
            " x = ${strValues[3] == "" ? "?" : strValues[3]}\n");
      strValues = [];
      counter = 0;
    } else break;
  }

  w = convertValue(strValues[0]);
  x = convertValue(strValues[1]);
  y = convertValue(strValues[2]);
  z = convertValue(strValues[3]);

  strValues[emptyValueIndex] = unknownValueName;
  equation = "${strValues[0]} * ${strValues[3]} = ${strValues[2]} * ${strValues[1]}";

  print("\nA equação ficou:\n"
        " ${strValues[0]} está para ${strValues[1]}\n"
        "  assim como\n"
        " ${strValues[2]} está para ${strValues[3]}\n\n"
        "ou seja,\n"
        " $equation");

  double multiplication;
  double temp;
  if(emptyValueIndex == 0 || emptyValueIndex == 3) {
    multiplication = y * x;
    if(emptyValueIndex == 0) {
      temp = z;
    } else {
      temp = w;
    }
  } else {
    multiplication = w * z;
    if(emptyValueIndex == 1) {
      temp = y;
    } else {
      temp = x;
    }
  }
  equation = " ${temp.toStringAsFixed(2)}$unknownValueName = ${multiplication.toStringAsFixed(2)}";
  print(equation);
  equation = " $unknownValueName = ${multiplication.toStringAsFixed(2)} / $temp";
  print(equation);
  result = multiplication / temp;

  print("\nPortanto:\n"
        " $unknownValueName = ${result.toStringAsFixed(2)} \n\n");
}
