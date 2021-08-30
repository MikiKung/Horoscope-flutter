import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_pj/switch_page.dart';

class PageHome extends StatefulWidget {
  final GlobalKey<SwitchPageState> swKey;
  const PageHome({Key? key, required this.swKey}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool switchColorNext = false;
  @override
  Widget build(BuildContext context) {
    // ครึ่งเเรกห่างจากส่วนnavbar สูง100
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
      // กล่องเก็บโลโก้ ชื่อแอป ปุ่มสตาร์ท
      child: Container(
        width: double.infinity,
        // height: size.height,
        child: Column(
          children: [
            // สร้างlogo
            Container(
              child: Image.asset("assets/images/seer.png"),
              width: 200,
              height: 200,
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            // สร้างชื่อapp
            Text(
              "Horoscope ",
              style: GoogleFonts.quicksand(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(209, 21, 171, 1)),
            ),
            Padding(padding: EdgeInsets.only(top: 150)),
            // สร้างปุ่มสตาร์ท
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  // เปลี่ยนสีcssไปอีกแบบ
                  // ignore: unnecessary_statements
                  switchColorNext = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  // ignore: unnecessary_statements
                  // เปลี่ยนสีcssไปแบบเดิม
                  switchColorNext = false;
                  // linkไปหน้าดูดวง
                  widget.swKey.currentState!.go("Horoscope");
                });
              },
              // UIปุ่มสตาร์ท
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: switchColorNext
                          ? Color.fromRGBO(246, 103, 222, 1)
                          : Color.fromRGBO(209, 21, 171, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Start',
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        color: Color.fromRGBO(243, 196, 251, 1),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
