import 'dart:html';

import '../../core/Vector.dart';
import 'Button.dart';

class ToggleButton extends Button {

  bool State = false;

  String OnColor = "";
  String OffColor = "";

  ToggleButton(Vector2 Position, String ButtonName, Function Action, String OnColor, String OffColor) : super(Position, ButtonName, Action) {
    this.OnColor = OnColor;
    this.OffColor = OffColor;
  }

  @override
  OnPressed() {
    State = !State;

    if (State == true) {
      ButtonObject?.style.backgroundColor = OnColor;
    } else {
      ButtonObject?.style.backgroundColor = OffColor;
    }

    Action?.call();
  }
}
