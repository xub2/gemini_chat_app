import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF223E9A), // 화면 배경색을 변경
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 1), // 위쪽 공간을 조금 더 비움
          Text(
            'My\nGemini',
            textAlign: TextAlign.center, // 중앙 정렬
            style: GoogleFonts.lobster(
              fontSize: 100, // 타이틀 글자 크기 설정
              fontWeight: FontWeight.bold, // 타이틀 글자 두께 설정
              color: Colors.white, // 타이틀 글자 색상 설정
            ),
          ),
          Spacer(flex: 2), // 타이틀과 버튼 사이 공간
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                minimumSize: Size(200, 60), // 버튼 크기 설정
                textStyle: TextStyle(
                  fontSize: 20, // 글자 크기 설정
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
              child: Text(
                '시작해 볼까요?',
                style: TextStyle(
                  color: Color(0xFF223E9A), // 글자 색상 설정
                ),
              ),
            ),
          ),
          Spacer(flex: 5), // 아래쪽 공간
        ],
      ),
    );
  }
}