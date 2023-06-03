void printBMITable() {
  print(" | --------- Classificação IMC --------- |\n"
        " | Menor que 18,5       - Abaixo do peso |\n"
        " | Entre 18,5 e 24,9    - Peso normal    |\n"
        " | Entre 25 e 29,9      - Sobrepeso      |\n"
        " | Igual ou acima de 30 - Obesidade      |\n"
        " | ------------------------------------- |\n");
}

double calculateBMI(double height, double weight) {
  return weight / (height * height);
}

void main(List<String> arguments) {
  String name;
  double height;
  double weight;
  double result;
  String classification;

  printBMITable();

  name = "Lucas";
  height = 1.73;
  weight = 75.5;

  result = calculateBMI(height, weight);

  print(" Nome:   $name");
  print(" Altura: $height");
  print(" Peso:   $weight");

  switch(result) {
    case < 18.5:
      classification = "'Abaixo do Peso'";
      break;
    case <= 24.9:
      classification = "com 'Peso Normal'";
      break;
    case <= 29.9:
      classification = "com 'Sobrepeso'";
      break;
    case >= 30:
      classification = "com 'Obesidade'";
      break;
    default:
      classification = "como 'não classificado'";
      break;
  }

  print("\n $name, seu IMC é ${result.toStringAsFixed(2)}, portanto você está $classification.");
} 
