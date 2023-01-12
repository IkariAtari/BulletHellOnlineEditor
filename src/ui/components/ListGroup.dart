import 'dart:html';

import '../../core/Vector.dart';
import 'UIComponent.dart';

class ListGroup extends UIComponent {
  Element? Container;
  String? ListItem;

  ListGroup(Vector2 Position, Element Container, String ListItem)
      : super(Position) {
    super.Position = new Vector2(0, 0);

    this.Container = Container;
    this.ListItem = ListItem;
  }
}