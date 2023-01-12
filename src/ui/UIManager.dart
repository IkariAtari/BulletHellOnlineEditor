// This class will manage state of the UI
import 'dart:html';
import 'dart:indexed_db';

import '../core/Vector.dart';
import 'components/Timeline.dart';
import 'components/UIComponent.dart';
import 'components/UIGrid.dart';
import 'states/UIIdle.dart';
import 'states/UIState.dart';

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

    Components.add(new UIGrid(new Vector2(0, 0)));
    Components.add(new TimeLine(new Vector2(0, 0), querySelector('#TimeLine')!, "Test"));

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