import 'dart:html';

import '../../core/Input.dart';
import '../../core/Vector.dart';
import 'UIComponent.dart';

class InputField extends UIComponent {
  TextInputElement? InputFieldObject;

  InputField(Vector2 Position, Function OnFieldChange) : super(Position) {
    //InputFieldObject.addEventListener(type, (event) => null))
  }
}
