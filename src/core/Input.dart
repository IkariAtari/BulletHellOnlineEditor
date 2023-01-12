import 'Game.dart';
import 'Vector.dart';
import 'dart:html';

class Input {
  static Vector2 _MousePosition = new Vector2(0, 0);

  static void SetMousePosition(MouseEvent e) {
    Rectangle<num>? rect = Game.CANVAS?.getBoundingClientRect();

    double x = e.client.x as double;
    double y = e.client.y as double;

    Input._MousePosition.x = x - rect!.left;
    Input._MousePosition.y = y - rect.top;
  }

  static Vector2 GetMousePosition() {
    return Input._MousePosition;
  }
}