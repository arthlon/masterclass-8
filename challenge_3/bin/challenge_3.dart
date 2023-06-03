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
    if(char < 48 || char > 57) {
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
  List<String> values = [];
  double w, x, y, z;
  late int emptyValueIndex;
  String unknown = "";
  String equation = "";
  late double result;

  printHeader();

  while(true) {
    int counter = 0;

    values.add(processValue('w'));
    values.add(processValue('z'));
    values.add(processValue('y'));
    values.add(processValue('x'));

    for (var value in values) {
      if(value == "") {
        counter++;
        emptyValueIndex = values.indexOf(value);
        switch(emptyValueIndex) {
          case 0:
            unknown = 'w';
            break;
          case 1:
            unknown = 'z';
            break;
          case 2:
            unknown = 'y';
            break;
          case 3:
            unknown = 'x';
            break;
        }
      };
    }

    if(counter > 1) {
      print("Você deixou mais de um elemento vazio:");
      print(" w = ${values[0] == "" ? "?" : values[0]}\n"
            " z = ${values[1] == "" ? "?" : values[1]}\n"
            " y = ${values[2] == "" ? "?" : values[2]}\n"
            " x = ${values[3] == "" ? "?" : values[3]}\n");
      values = [];
      counter = 0;
    } else break;
  }

  w = convertValue(values[0]);
  z = convertValue(values[1]);
  y = convertValue(values[2]);
  x = convertValue(values[3]);

  values[emptyValueIndex] = unknown;
  equation = values[0] + " * " + values[1] + " = " + values[2] + " * " + values[3];

  print("\nA equação ficou:\n"
        " $equation");

  switch(emptyValueIndex) {
    case 0:
      result = (x * y) / z;
      break;
    case 1:
      result = (x * y) / w;
      break;
    case 2:
      result = (w * z) / x;
      break;
    case 3:
      result = (w * z) / y;
      break;
  }

  print("Portanto:\n"
        " $unknown = ${result.toStringAsFixed(2)} \n\n");
}
