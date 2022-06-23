class MyCalculate {
  String cutWord({required String Word}) {
    String result = Word;
    if (result.length > 100) {
      result = result.substring(0, 100);
      result = '$result ...';
    }
    return result;
  }
}
