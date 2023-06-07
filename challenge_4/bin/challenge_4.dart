import 'VigenereClass.dart';

void main(List<String> arguments) {
  String myText = "ExemPlo dE TexTo com VÁrias pal@Vras em maiÚSCulAS e minÚSculaS, "
                  "números 123456789 e caracteres especiais ~][´@!#\$%&*()\"'><:;/?] ";

  VigenereClass cryptography = VigenereClass();

  print("Texto original:");
  print(myText);

  print("\nChave gerada:");
  String key = cryptography.generateKey(myText);
  print(key);

  print("\nTexto codificado:");
  String myEncodedText = cryptography.encode(myText, key);
  print(myEncodedText);

  print("\nTexto decodificado:");
  String myDecodedText = cryptography.decode(myEncodedText, key);
  print(myDecodedText);

  print("\nTexto de volta ao original:");
  List<int> upperCasePositions = cryptography.identifyUpperCase(myText);
  String myOriginalText = cryptography.returnToOriginal(myDecodedText, upperCasePositions);
  print(myOriginalText);
}
