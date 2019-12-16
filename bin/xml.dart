import 'package:xml/xml.dart' as xml;

void main(){

  var xml_string = '''<?xml version = "1.0"?> 
   <bookshelf> 
      <book> 
         <title lang = "english">Growing a Language</title> 
         <price>29.99</price> 
      </book> 
      
      <book> 
         <title lang = "english">Learning XML</title> 
         <price>39.95</price> 
      </book> 
      <price>132.00</price> 
   </bookshelf>''';
  
  var document = xml.parse(xml_string);
  
  print(document.findElements("book").isEmpty);

  int amt =0;

  /*if(amt == 0){
    throw Format1Exception().Exception("This is sample error");
  }
*/


  Calculator(4, 5, Add);
}

typedef ManyOperation(int firstNo , int secondNo);   //function signature
Add(int firstNo,int second){
  print("Add result is ${firstNo+second}");
}
Subtract(int firstNo,int second){
  print("Subtract result is ${firstNo-second}");
}
Divide(int firstNo,int second){
  print("Divide result is ${firstNo/second}");
}
Calculator(int a,int b ,ManyOperation oper){
  print("Inside calculator");
  oper(a,b);
}

class Format1Exception implements Exception {


  Exception(msg) =>  "Exception is formatted: ${msg}";

}