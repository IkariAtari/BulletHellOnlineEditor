import 'dart:html';

class Console {
  static Element? _CONSOLE;

  // Console should only be Initialized once
  static void Initialize() {
    Console._CONSOLE = querySelector('#console') as Element;

    Console.Log("Console has been initialized");
  }

  static void Log(String message) {
    Console._CONSOLE?.innerHtml = message;
  }
}