class Vector2 {
  double x = 0;
  double y = 0;

  Vector2(double x, double y) {
    this.x = x;
    this.y = y;
  }

  Vector2 operator +(Vector2 a) {
    return new Vector2(this.x + a.x, this.y + a.y);
  }

  static double Magnitude() {
    return 0;
  }

  static double Normalize() {
    return 0;
  }
}