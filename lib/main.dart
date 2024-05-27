import 'package:flutter/material.dart';
import 'views/home_page.dart'; // 새로 생성한 home_page.dart 파일을 import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // 첫 화면을 HomePage로 설정
    );
  }
}