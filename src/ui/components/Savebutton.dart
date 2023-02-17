import 'dart:html';

import '../../core/Vector.dart';
import 'Button.dart';

class SaveButton extends Button {
  Element? FormContainer;

  SaveButton(Vector2 Position, String ButtonName, Function Action,
      String FormContainer)
      : super(Position, ButtonName, Action) {
    this.FormContainer = querySelector("#" + FormContainer);
  }

  @override
  OnPressed() {
    FormContainer?.children.forEach((element) {
      if (element is InputElement) {
        String? SettingName = element.getAttribute("setting-name");

        
      }
    });
  }
}
