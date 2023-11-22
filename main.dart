import 'package:flutter/material.dart';

import 'loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
 Widget build(BuildContext context){
    return MaterialApp(
      title: "First Login",
      theme: ThemeData(primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: loginpage(),
    );
  }
}