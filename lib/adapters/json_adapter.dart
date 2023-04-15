import 'dart:convert';

Object jsonFromString(String jsonString) {
  return jsonDecode(jsonString);
}

String jsonToString(Object objectToConvert) {
  return jsonEncode(objectToConvert);
}
