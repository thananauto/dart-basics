import 'package:dart_basics/dart_basics.dart' as dart_basics;
import 'package:dart_basics/Foo.dart' as foo_lib;
import 'dart:core';
import 'dart:mirrors';




void main(List<String> arguments){

  Symbol lib = Symbol('foo_lib');

  Symbol className = Symbol('Foo');

  check_class_availability_in_lib(lib, className);

  var foo = foo_lib.Foo();
  foo.method1();

  print(foo_lib.Foo()
      ..printSomeNumber()
      ..printSomeText());

}

bool check_class_availability_in_lib(libraryName, className){
      MirrorSystem mirrorSystem = currentMirrorSystem();
      LibraryMirror libraryMirror = mirrorSystem.findLibrary(libraryName);
      ClassMirror classMirror = libraryMirror.declarations[className];


      if(libraryMirror != null){
        print('Found the library');
        print('No of classes found: ${libraryMirror.declarations.length}');
        libraryMirror.declarations.forEach((Symbol symbol, DeclarationMirror mirror){

          print(symbol);
          print(mirror);
        }
        );
      }

      classMirror.instanceMembers.forEach((s, v) => print(s));
      return false;

}

void Function(Symbol, DeclarationMirror) print_Mirror_declaration(symbol, declarationMirror){

  print(symbol.toString());
  print(declarationMirror.toString());


}


void main1(List<String> arguments) {
//  print('Hello world: ${dart_basics.calculate()}!');
  //print('Just hi message ${dart_basics.hiMsg()} and the arguments value contains: ${arguments.first}');
  String n = "hello";
  print(n);
  print(printMessage());
  static_keyword();
  dynamic str = 'abc';
  if(str) {
    print('String is not empty');
  } else {
    print('Empty String');
  }

}

String printMessage(){
  String name = 'Smith';
  int num = 10;
  return name;
}

void static_keyword(){
  dynamic VarValue = "This is string";
  print(VarValue);
  VarValue = 6;
  print(VarValue);

  int check_value = 32;

  check_value ??= 34;
  print(check_value);


}

