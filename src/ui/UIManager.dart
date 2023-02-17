// This class will manage state of the UI
import 'dart:html';
import 'dart:indexed_db';

import '../core/Vector.dart';
import 'components/Button.dart';
import 'components/Timeline.dart';
import 'components/ToggleButton.dart';
import 'components/UIComponent.dart';
import 'components/UIGrid.dart';
import 'states/UIIdle.dart';
import 'states/UIState.dart';

// System class for managing all UIComponents and UIStates
class UIManager {
  List<UIState> States = <UIState>[];

  UIComponent? Cursor;

  UIState? CurrentState;

  List<UIComponent> Components = <UIComponent>[];

  UIManager() {
    Init();
  }

  void Init() {
    UIIdle IdleState = new UIIdle();

    States.add(IdleState);

    SetState(States[0]);

    // Dynamically create our components, we can do it via some json or database?
    Components.add(new UIGrid(new Vector2(0, 0)));
    Components.add(
        new TimeLine(new Vector2(0, 0), querySelector('#TimeLine')!, "Test"));
    Components.add(new ToggleButton(new Vector2(0, 0), "#ToggleGrid", () {
      Components[0].SetActive();
    }, "#AAAAAA", "#99CC99"));

    // Initialize each UI component
    Components.forEach((uiobject) {
      uiobject.Init();
    });
  }

  void SetState(UIState state) {
    CurrentState?.Exit();

    CurrentState = state;

    CurrentState?.Enter();
  }

  void SetCursor(UIComponent Cursor) {
    this.Cursor = Cursor;
  }

  void Tick() {
    CurrentState?.Update();

    //Update all components
    Components.forEach((element) {
      element.Tick();
    });
  }

  void Draw() {
    Components.forEach((element) {
      element.Render();
    });
  }
}
