import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:async' as prefix0;

import 'dart:math';


main(List<String> args) async{
  
  File file = File('Output.txt');
  
  IOSink sink = file.openWrite(mode: FileMode.append);
  sink.add(utf8.encode('THis is sample${DateTime.now()}\n'));

  await sink.flush();
  await sink.close();
  
  
  Stream<List<int>> open = file.openRead();
            open.transform(utf8.decoder)
            .transform(LineSplitter())
            .listen((data){
              print(data);
            },
            onError: (error){
              print('Error: ${error}');
            },
            onDone: (){
              print('File reading is done');
            });
  

  /*String str = await loadString("Hellow world!..");
  print(str);
  print("Executed  before");

  Function x = await addTwoNumber(20);
  int y = await x(30);
  print(y);*/


  Stream stream = getNumbers(10);
  /*await for( int i in stream){
    print(i);
  }*/

  stream.listen((data )=> print(data));


}

Stream<int> getNumbers(int x) async* {
  for(int i=0; i<x; i++){
    yield i;
      }
}

Future<Function> addTwoNumber(int x) async{
  return (int y ) async => x+y;

}

Future<String> loadString(String str) async{
  await Future.delayed(Duration(seconds: 1));
  return "String $str";
}