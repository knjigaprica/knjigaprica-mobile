class StringExtensions {
  static replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  static String generateEmptyString(int length) {
    return List.generate(length, (index) => ' ').join();
  }
}
