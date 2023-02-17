//import 'dart:ffi';
import 'dart:html';

import '../../core/Vector.dart';
import '../../game/LevelAction.dart';
import 'ListGroup.dart';
import '../../../Main.dart';

// Time line which will contain all the level actions sorted
class TimeLine extends ListGroup {
  
  // TODO: Might belong its own class as TimeLineBar component
  RangeInputElement? TimeLineScrollBar =
      querySelector("#TimelineScrollBar") as RangeInputElement;

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

  void OnTimelineEntryClick(String Value) {
    TimeLineScrollBar?.value = Value;
  }

  void RenderTimeline() {
    MainGame?.level.LevelActions.forEach((key, value) {
      Element? element = new Element.div();
      element.classes.add("list-group-item");
      element.classes.add("list-group-item-action");
      element.classes.add("border-bottom");
      element.classes.add("lh-sm");

      SpanElement inner = new SpanElement();
      inner.appendHtml(key);

      element.append(inner);

      element.addEventListener("click", (event) => OnTimelineEntryClick(key));

      LevelAction.DecodeLevelAction(value);

      Container?.append(element);
    });
  }
}