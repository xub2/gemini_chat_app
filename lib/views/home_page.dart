import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_page.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF223E9A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          Text(
            'My\nGemini',
            textAlign: TextAlign.center,
            style: GoogleFonts.lobster(
              fontSize: 90,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(flex: 2),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(0),
                        fixedSize: Size(130, 130), // 정사각형으로 설정
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('https://gemini.google.com/'));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset(
                              'assets/images/Gemini.png',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            right: 5,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Gemini',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF223E9A),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(0),
                        fixedSize: Size(130, 130), // 정사각형으로 설정
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatPage()),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset(
                              'assets/images/Chat.png',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            right: 5,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Chat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF223E9A),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(0),
                        fixedSize: Size(130, 130), // 정사각형으로 설정
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('https://xuv2.notion.site/My-Gemini-by-Gemini-API-37863f4c42d24d028af5ba190c716809?pvs=4'));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset(
                              'assets/images/Gnotion.png',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            right: 5,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Notion',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF223E9A),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(0),
                        fixedSize: Size(130, 130), // 정사각형으로 설정
                      ),
                      onPressed: () {
                        SystemNavigator.pop(); // 어플 종료
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset(
                              'assets/images/close.png',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 5,
                            right: 5,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Exit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF223E9A),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
