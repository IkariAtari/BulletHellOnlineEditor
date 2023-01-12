import 'Graphic.dart';
import 'Vector.dart';
import 'interfaces/CoreInterfaces.dart';

class GameObject implements ITickable{
  Graphic? Graph = null;

  Vector2 Position = new Vector2(0, 0);
  num Rotation = 0;

  GameObject(Vector2 Position, num Rotation) {
    this.Position = Position;
    this.Rotation = Rotation;
  }

  void Init() {}

  void Tick() {}
}
