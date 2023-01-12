import 'dart:async';
import 'dart:html';
import 'dart:math';
import '../map/Level.dart';
import '../ui/components/UIComponent.dart';
import '../ui/components/UIGrid.dart';
import '../ui/UIManager.dart';
import './Console.dart';
import 'GameObject.dart';
import 'Input.dart';
import 'Vector.dart';

class Game {
  static CanvasElement? CANVAS;
  static CanvasRenderingContext2D? CTX;
  static int TICK = 0;
  static double FRAME_TIME = 0;

  static int? WIDTH = 0;
  static int? HEIGHT = 0;

  int _elapsedTicks = 0;

  static List<GameObject> Objects = <GameObject>[];

  Level level = new Level();

  UIManager? GUI;

  Stopwatch _stopwatch = new Stopwatch();

  Game() {
    Game.CANVAS = querySelector('#canvas') as CanvasElement;
    Game.CTX = Game.CANVAS?.context2D;

    Game.WIDTH = Game.CANVAS?.width;
    Game.HEIGHT = Game.CANVAS?.height;
  }

  static void Instantiate(GameObject object) {
    Game.Objects.add(object);
  }

  void Initialize() {
    level.Init();

    GUI = new UIManager();

    Console.Initialize();

    level.Compile();

    Game.CANVAS?.onMouseMove
        .listen((MouseEvent event) => Input.SetMousePosition(event));

    // Initialize each gameobject
    Objects.forEach((object) {
      object.Init();
    });

    Timer.periodic(new Duration(milliseconds: 10), (timer) {
      Tick();
    });
  }

  void Tick() {
    _stopwatch.start();

    Game.TICK += 1;
    _elapsedTicks += 1;

    // Update each gameobject
    Objects.forEach((object) {
      object.Tick();
    });

    // Update each gameobject
    GUI?.Tick();

    // Do fun drawing and update stuff :)
    Game.CTX?.clearRect(0, 0, Game.WIDTH!, Game.HEIGHT!);

    // Drawing
    Objects.forEach((object) {
      object.Graph?.Draw();
    });

    GUI?.Draw();

    if (_stopwatch.elapsedMilliseconds >= 1000) {
      Console.Log("Ticks per second: " + _elapsedTicks.toString());

      _elapsedTicks = 0;
      _stopwatch.reset();
    }
  }
}