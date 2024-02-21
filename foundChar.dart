import 'dart:collection';

List<String> countTV(String input) {
  Map<String, String> telexMap = {
    'ă': 'aw',
    'â': 'aa',
    'đ': 'dd',
    'ê': 'ee',
    'ô': 'oo',
    'ơ': 'ow',
    'ư': 'uw',
    'ư': 'w'
  };

  List<String> foundChars = [];

  for (int i = 0; i < input.length - 1; i++) {
    String twoChars = input.substring(i, i + 2);
    if (telexMap.containsValue(twoChars)) {
      foundChars.add(twoChars);
    } else if (twoChars.endsWith('w')) {
      String oneChar = twoChars.substring(0, 1);
      if (!foundChars.contains(oneChar)) {
        foundChars.add(oneChar);
      }
    }
  }

  return foundChars;
}

void main() {
  String input = 'hfdawhwhcoomdd';
  List<String> foundChars = countTV(input);
  int count = foundChars.length;
  print('$count (${foundChars.join(", ")})');
}
