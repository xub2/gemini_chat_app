import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_page.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
              fontSize: 90, // 타이틀 글자 크기 설정
              fontWeight: FontWeight.bold, // 타이틀 글자 두께 설정
              color: Colors.white, // 타이틀 글자 색상 설정
            ),
          ),
          Spacer(flex: 2), // 타이틀과 버튼 사이 공간
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                    minimumSize: Size(200, 60), // 버튼 크기 설정
                    textStyle: TextStyle(
                      fontSize: 20, // 글자 크기 설정
                      fontWeight: FontWeight.bold, // 글자 굵기 설정
                    ),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse('https://gemini.google.com/'));
                  },
                  child: Text(
                    '🔷 Gemini Web',
                    style: TextStyle(
                      color: Color(0xFF223E9A), // 글자 색상 설정
                      fontWeight: FontWeight.bold, // 글자 굵기 설정
                    ),
                  ),
                ),
                SizedBox(height: 20), // 버튼 사이에 공간 추가
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                    minimumSize: Size(200, 60), // 버튼 크기 설정
                    textStyle: TextStyle(
                      fontSize: 20, // 글자 크기 설정
                      fontWeight: FontWeight.bold, // 글자 굵기 설정
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  child: Text(
                    '🔍 시작해 볼까요?',
                    style: TextStyle(
                      color: Color(0xFF223E9A), // 글자 색상 설정
                      fontWeight: FontWeight.bold, // 글자 굵기 설정
                    ),
                  ),
                ),
                SizedBox(height: 20), // 버튼 사이에 공간 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                        minimumSize: Size(150, 50), // 버튼 크기 설정
                        textStyle: TextStyle(
                          fontSize: 18, // 글자 크기 설정
                          fontWeight: FontWeight.bold, // 글자 굵기 설정
                        ),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('https://xuv2.notion.site/My-Gemini-by-Gemini-API-37863f4c42d24d028af5ba190c716809?pvs=4'));
                      },
                      child: Text(
                        '🔗 Notion',
                        style: TextStyle(
                          color: Color(0xFF223E9A), // 글자 색상 설정
                          fontWeight: FontWeight.bold, // 글자 굵기 설정
                        ),
                      ),
                    ),
                    SizedBox(width: 20), // 버튼 사이에 공간 추가
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                        minimumSize: Size(150, 50), // 버튼 크기 설정
                        textStyle: TextStyle(
                          fontSize: 18, // 글자 크기 설정
                          fontWeight: FontWeight.bold, // 글자 굵기 설정
                        ),
                      ),
                      onPressed: () {
                        SystemNavigator.pop(); // 어플 종료
                      },
                      child: Text(
                        '🚪 종료',
                        style: TextStyle(
                          color: Colors.red, // 글자 색상 설정
                          fontWeight: FontWeight.bold, // 글자 굵기 설정
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(flex: 5), // 아래쪽 공간
        ],
      ),
    );
  }
}
