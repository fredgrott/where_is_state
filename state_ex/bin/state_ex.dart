// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: The state pattern is used in computer programming
//       to encapsulate varying behavior for the same object,
//       based on its internal state. This can be a cleaner way
//       for an object to change its behavior at runtime without
//       resorting to conditional statements and thus improve
//       maintainability.
//
//       See: Wikipedia Entry https://en.wikipedia.org/wiki/State_pattern
//
//       Mechanism-wise we are finding a way to store an instance that changes 
//       from it's parent. Or to  put it another way we are changing the 
//       storeage reference to the parent. This is only one varaition of this 
//       technique. As we could implement it as a Type storage as well, not 
//       to mention another variation that is used in Reactive programming.
//
//       The difference between this and the Flutter Stateful and State setup is that
//       we still use context to grab the mutable immeditate stuff. But, different 
//       methods are are set up that set state in our extension of the state class with 
//       the extending a class being similar to the abstract class(interface) and implemented 
//       class. I.E. it's instead the abstace State class(base class) and extended class.

abstract class State {
  void handler(Stateful context);
  @override
  String toString();
}

class StatusOn implements State {
  @override
  handler(Stateful context) {
    print("  Handler of StatusOn is being called!");
    context.state = StatusOff();
  }

  @override
  String toString() {
    return "on";
  }
}

class StatusOff implements State {
  @override
  handler(Stateful context) {
    print("  Handler of StatusOff is being called!");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class Stateful {
  State state;

  Stateful(this.state);

  void touch() {
    print("  Touching the Stateful...");
    state.handler(this);
  }
}

void main() {
  var lightSwitch = Stateful(StatusOff());
  print("The light switch is ${lightSwitch.state}.");
  print("Toggling the light switch...");
  lightSwitch.touch();
  print("The light switch is ${lightSwitch.state}.");
}
