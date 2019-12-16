import 'dart:convert';
import 'package:intl/intl.dart';

class MyPerson{
  String name;
  int age;

  MyPerson(String name, int age){
    this.name = name;
    this.age = age;
  }

  MyPerson.useCurly({String name, int age = 60}){
    this.name = name;
    this.age = age;
  }

  MyPerson.useThis({this.name, this.age});
}


void main(){
//  DateTime time = DateTime('');
  var parsedDate = DateTime.parse('2019-09-29T00:51:30.339492+05:30');
  print(new DateFormat.jms().format(parsedDate));

  var values = [MyPerson('Thanan', 30), MyPerson.useCurly(name: 'Syed'), MyPerson.useThis(name: 'Muthu', age: 6)];

  for(var i in values){
    print(i.name);
    print(i.age);
  }
}
