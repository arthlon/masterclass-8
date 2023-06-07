import 'dart:math';

class VigenereClass {

  VigenereClass();

  String generateKey(String text) {
    String key = '';
    Random rand = Random();
    for(int i = 0; i < text.length; i++) {
      key += String.fromCharCode(rand.nextInt(94) + 33);
    }
    return key;
  }

  String encode(String text, String key) {
    String encodedText = '';
    int count = 0;
    List charCodeText = text.toUpperCase().codeUnits;
    List charCodeKey = key.codeUnits;
    for (var charCode in charCodeText) {
      if(charCode >= 65 && charCode <= 90) {
        int newChar = ((charCode + charCodeKey[count]) % 26) + 65;
        encodedText += String.fromCharCode(newChar);
      } else {
        encodedText += String.fromCharCode(charCode);
      }
      count++;
    }
    return encodedText;
  }

  String decode(String encodedText, String key) {
    String decodedText = '';
    int count = 0;
    List charCodeEncoded = encodedText.codeUnits;
    List charCodeKey = key.codeUnits;
    for (var charCode in charCodeEncoded) {
      if(charCode >= 65 && charCode <= 90) {
        int newChar = ((charCode - charCodeKey[count] + 26) % 26) + 65;
        decodedText += String.fromCharCode(newChar);
      } else {
        decodedText += String.fromCharCode(charCode);
      }
      count++;
    }
    return decodedText;
  }

  // Métodos adicionais
  List<int> identifyUpperCase(String text) {
    List<int> upperCasePositions = [];
    for(int i = 0; i < text.length; i++) {
      if(text[i] == text[i].toUpperCase()) {
        upperCasePositions.add(i);
      }
    }
    return upperCasePositions;
  }

  String returnToOriginal(String decodedText, List<int> upperCasePositions) {
    decodedText = decodedText.toLowerCase();
    for(int i = 0; i < upperCasePositions.length; i++) {
      decodedText = decodedText.replaceRange(
        upperCasePositions[i], upperCasePositions[i] + 1, decodedText[upperCasePositions[i]].toUpperCase());
    }
    return decodedText;
  }
}