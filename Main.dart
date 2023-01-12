import 'src/core/Game.dart';

Game? MainGame;

void main(List<String> args) {
  print("Hello World!");

  MainGame = new Game();

  MainGame?.Initialize();
}