import 'package:equatable/equatable.dart';

abstract class Herbi extends Equatable{

  Herbi([List<Object> props = const[]]): super([props]);

}

class Animal extends Herbi{
  String name;
  Animal({this.name}): super([name]);

  @override
  String toString() =>'Animal name: ${name}';
}


class Fish extends Herbi{
  String name;
  Fish({this.name}): super([name]);

  @override
  String toString() =>'Animal name: ${name}';
}

void main(){

  Animal animal = Animal(name:'Bob');
  Fish fish = Fish(name: 'Bob');
  print("Check both instance are equal: ${animal == fish}");

  print("Compare the objects are equal: ${Animal(name: 'Jan') ==  Fish(name: 'Jan')}");

}