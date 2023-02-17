import '../../core/Vector.dart';

class UIComponent {
  Vector2 Position = new Vector2(0, 0);

  bool isActive = true;

  UIComponent(Vector2 Position) {
    this.Position = Position;
  }

  void SetActive() {
    isActive = !isActive;
  }

  void Render() {}

  void Tick() {}

  void Init() {}
}
