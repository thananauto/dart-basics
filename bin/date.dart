// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final _name;

    // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  get _name => '';

  String greet(String who){
    return 'Hi $who. Do you know who I am?$_name';
  }
}

String greetBob(Person person) => person.greet('Bob');

void main() {

  Person person = Person('Kathy');
  person.greet('Bob');
  print(person._name);
  //print(greetBob(Person('Kathy')));
  Person impos = Impostor();
  print(impos.greet('Bob'));
  print(impos._name);
  //print(greetBob(Impostor()));

  double value = 19.2358996545;
  print(value.roundToDouble());
}