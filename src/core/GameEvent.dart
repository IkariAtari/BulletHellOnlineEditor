class GameEvent {
  List<Function> Subscribers = <Function>[];

  void Fire() {
    Subscribers.forEach((element) {
      element.call();
    });
  }

  void Subscribe(Function function) {
    print("Adding function: " + function.toString());
    Subscribers.add(function);
  }
}