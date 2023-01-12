import 'dart:html';
import 'dart:math';

import '../../core/Game.dart';
import '../../core/Input.dart';
import '../../core/Vector.dart';
import 'UIComponent.dart';

class UIGrid extends UIComponent {
  int gridx = 0;
  int gridy = 0;

  RangeInputElement? _gridSlider =
      querySelector('#GridSizeSlider') as RangeInputElement;

  UIGrid(Vector2 Position) : super(Position) {
    this.Position = Position;
  }

  // Render the grid
  void Render() {
    double intervalx = Game.WIDTH! / gridx;
    double intervaly = Game.HEIGHT! / gridy;
    Game.CTX?.fillStyle = "#333";
    Game.CTX?.fillRect(0, 0, Game.WIDTH!, Game.HEIGHT!);

    Game.CTX?.strokeStyle = "#ccc";
    Game.CTX?.lineWidth = 0.5;

    for (int x = 0; x < gridx; x++) {
      Game.CTX?.beginPath();
      Game.CTX?.moveTo(x * intervalx, 0);
      Game.CTX?.lineTo(x * intervalx, Game.HEIGHT!);
      Game.CTX?.stroke();
      Game.CTX?.closePath();
    }

    for (int y = 0; y < gridy; y++) {
      Game.CTX?.beginPath();
      Game.CTX?.moveTo(0, y * intervaly);
      Game.CTX?.lineTo(
        Game.WIDTH!,
        y * intervaly,
      );
      Game.CTX?.stroke();
      Game.CTX?.closePath();
    }
    
    // Draw cursor
    Game.CTX?.fillStyle = "#ddd";
    Game.CTX?.font = "12px Arial";

    Game.CTX?.beginPath();
    Game.CTX?.arc(
        (Input.GetMousePosition().x / (Game.WIDTH! / gridx)).round() *
            (Game.WIDTH! / gridx),
        (Input.GetMousePosition().y / (Game.WIDTH! / gridy)).round() *
            (Game.HEIGHT! / gridy),
        5,
        0,
        2 * pi);
    Game.CTX?.stroke();
    Game.CTX?.fill();
    Game.CTX?.closePath();
  }

  void Tick() {
    gridx = int.tryParse(_gridSlider?.value as String) ?? 0;
    gridy = int.tryParse(_gridSlider?.value as String) ?? 0;
  }
}