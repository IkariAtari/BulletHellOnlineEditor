import 'dart:html';

import '../../core/Vector.dart';
import 'UIComponent.dart';

class Button extends UIComponent {
  ButtonElement? ButtonObject;
  Function? Action = null;

  Button(Vector2 Position, String ButtonName, Function Action)
      : super(Position) {
    ButtonObject = querySelector(ButtonName) as ButtonElement?;
    this.Action = Action;

    ButtonObject?.addEventListener("click", (event) => OnPressed());
  }

  OnPressed() {
    Action?.call();
  }
}
