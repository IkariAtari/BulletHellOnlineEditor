import 'dart:convert';
import 'dart:core';
import 'dart:html';
import 'dart:collection';

import '../core/Game.dart';
import '../core/GameEvent.dart';

class Level {
  final String MapName = "";
  final String Author = "";

  List<String> Imports = <String>[];

  Map<String, dynamic> LevelActions = new Map();

  Element? JsonPreview;

  GameEvent? OnActionAdd;

  Level() {
    JsonPreview = querySelector("#JsonPreview");
  }

  void Init() {
    print("Initialize Level");
    OnActionAdd = new GameEvent();

    print(OnActionAdd.toString());
  }

  int Compile() {
    LevelActions.addAll({
      "1": {
        "Actions": [
          {"ActionType": "PlayerSpawn"},
          {"ActionType": "EnemySpawn"}
        ]
      },
      "2": {
        "Actions": [
          {"ActionType": "PlayerSpawn"},
          {"ActionType": "EnemySpawn2"}
        ]
      },
      "3": {
        "Actions": [
          {"ActionType": "PlayerSpawn"},
          {"ActionType": "EnemySpawn3"}
        ]
      },
      "4": {
        "Actions": [
          {"ActionType": "PlayerSpawn"},
          {"ActionType": "EnemySpawn4"}
        ]
      },
      "60": {
        "Actions": [
          {"ActionType": "PlayerSpawn"},
          {"ActionType": "EnemySpawn5"}
        ]
      }
    });

    AddAction("100", {
      "Actions": [
        {"ActionType": "PlayerSpawn"},
        {"ActionType": "EnemySpawn6"}
      ]
    });

    String json = jsonEncode(LevelActions);

    JsonPreview?.innerHtml = json;

    // Successful
    return 0;
  }

  AddAction(String Time, dynamic Action) {
    LevelActions.addAll({Time: Action});
    OnActionAdd?.Fire();
  }
}
