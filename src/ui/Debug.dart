// General class to handle Debug stuff
import 'dart:html';

class Debug {
  Element? UIState;

  Debug() {
    UIState = querySelector('#UIStateBullet');
  }
}