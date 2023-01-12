import 'dart:html';

import '../../core/Vector.dart';
import '../../game/LevelAction.dart';
import 'ListGroup.dart';
import '../../../Main.dart';

// Time line which will contain all the level actions sorted
class TimeLine extends ListGroup {
  TimeLine(Vector2 Position, Element Container, String ListItem)
      : super(Position, Container, ListItem);

  @override
  void Render() {}

  @override
  void Init() {
    MainGame?.level.OnActionAdd?.Subscribe(() {
      RenderTimeline();
    });
  }

  @override
  void Tick() {}

  void RenderTimeline() {
    MainGame?.level.LevelActions.forEach((key, value) {
      LevelAction.DecodeLevelAction(value);
      Container?.appendHtml(
          "<div class=\"list-group-item list-group-item-action border-bottom lh-sm\"><span>" +
              key +
              "</span></div>");
    });
  }
}
