import '../../core/Vector.dart';

class UIComponent {

  Vector2 Position = new Vector2(0, 0);

  UIComponent(Vector2 Position) {
    this.Position = Position;
  }

  void Render() {}

  void Tick() {}

  void Init() {}
}