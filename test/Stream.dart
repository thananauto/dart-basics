
import 'dart:async';

void main1() async{

  Duration duration = Duration(seconds: 1);
  Stream<String> stream = Stream<String>.fromFuture( _callBack());
 // stream = stream.take(60);
  //stream = stream.skip(2);
  print('Code controller before stream......');

   await for(String i in stream){
    print(i);
  }

  print('Code controller is here.......');
}

Future<String> _callBack() async{

  await Future.delayed(Duration(seconds: 5)); //Mock delay
  print("Fetched Data");

  return "Test";
}

bool condition(int x){
  return x <= 10;
}


void main2() async {
  StreamController<String> streamController = StreamController.broadcast();
  print("Creating a StreamController...");
    StreamSubscription<String> streamSubscription =

  //first subscription
  streamController.stream.listen((data) {
    print("DataReceived first: " + data);
  }, onDone: () {
    print("Task Done");
  }, onError: (error) {
    print("Some Error");
  });


  //second subscription
  streamController.stream.listen((data) {
    print("DataReceived second: " + data);

  }, onDone: () {
    print("Task Done");
  }, onError: (error) {
    print("Some Error");
  });

  streamController.add("This a test data");
  print("code controller is here");
   streamController.close();
}



void main() async {
  await for (int i in numbersDownFrom(5)) {
    print('$i bottles of beer');
  }
}

Stream numbersDownFrom(int n) async* {
  if (n >= 0) {
    await new Future.delayed(new Duration(milliseconds: 100));
    yield n;
    yield* numbersDownFrom(n - 1);
  }
}