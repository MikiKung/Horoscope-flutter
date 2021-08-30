import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_pj/switch_page.dart';

class PageINFO extends StatefulWidget {
  //  เรียกใช้้อมูลในglobal(หน้าอะไร)
  final GlobalKey<SwitchPageState> swKey;
  const PageINFO({Key? key, required this.swKey}) : super(key: key);

  @override
  _PageINFOState createState() => _PageINFOState();
}

class _PageINFOState extends State<PageINFO> {
  // *เปลี่ยนสีปุ่มinfomation
  bool switchColorInfo = false;
  // *เปลี่ยนสีปุ่มcredit
  bool switchColorCredit = false;
  // *เปลี่ยนสีปุ่มback
  bool switchColorBack = false;

  // *หน้าalertdialog
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // *เเสดงหน้าต่างalert
          return AlertDialog(
            // *ทำให้ข้ความขอบคุณอยู่ตรงกลาง
            title: Center(child: Text("ขอขอบคุณ")),
            // *สร้างกล่องข้อความที่สูง100
            content: Container(
              height: 100,
              // สร้างที่อยู่เเบบเเนวตัวให้ข้อความ
              child: Column(
                children: [
                  // สร้าเเถวข้อความรูปสวยๆ
                  Row(
                    children: [
                      Text(
                        "รูปสวยๆจาก :",
                        style:
                            TextStyle(color: Color.fromRGBO(204, 45, 162, 1)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        "หลายๆเว็ป",
                        style:
                            TextStyle(color: Color.fromRGBO(242, 90, 202, 0.5)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "ฟ้อนต์สวยๆนี้ชื่อ :",
                        style:
                            TextStyle(color: Color.fromRGBO(204, 45, 162, 1)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        "Quicksand",
                        style:
                            TextStyle(color: Color.fromRGBO(242, 90, 202, 0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ให้กดตรงไหนเเล้วมีactionอะไร
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // สร้างช่องว่างข้างบนให้note
        Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01)),
        Text(
          "Note",
          // จัดcssให้text ใช้ฟ้อนด้วยlibrary google fonts
          style: GoogleFonts.quicksand(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(209, 21, 171, 1)),
        ),
        // สร้างช่องว่างขอบนอกให้กล่องข้ความ
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01, left: 40, right: 40),
          // สร้างกล่องไว้เก็บข้อความ
          child: Container(
            // เอาไว้จัดcssให้container
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
                color: Color.fromRGBO(243, 196, 251, 0.5),
                // ทำขอบโค้ง
                borderRadius: BorderRadius.circular(10)),
            // สร้างช่องว่างขอบในให้กล่องข้ความ
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 5),
              child: ListView(
                children: [
                  Text(
                    "         เป็นศาสตร์หนึ่งที่ไม่ได้รับการยอมรับทางวิทยาศาสตร์ มีความเกี่ยวข้องกับการทำนายอนาคต หรือ โชคชะตาของมนุษย์, ปรากฏการณ์ต่าง ๆ ของบ้านเมืองและของโลก โดยอาศัย เวลา และ ตำแหน่งของดวงดาวต่าง ๆ บนท้องฟ้า เป็นสำคัญ แล้วบันทึกไว้เป็นสถิติ โหราศาสตร์ เป็นวิชาที่ต่างกับวิทยาศาสตร์ ด้วยแม้จะสามารถพิสูจน์ทราบได้โดยใช้กฎเกณฑ์ และเหตุผลในทางโหราศาสตร์ นำมาทดลอง พิสูจน์ให้เห็นประจักษ์ สามารถสรุปออกมาเป็นทฤษฎีได้ ไม่ว่าจะทดลองกี่ครั้ง ที่ใด ๆ ในโลกเช่นเดียวกับวิทยาศาสตร์[ต้องการอ้างอิง] โหราศาสตร์ก็ยังคงเป็นวิชาที่ค่อนข้างลึกลับ ด้วยเหตุนี้นักวิทยาศาสตร์จึงไม่รับรองโหราศาสตร์ว่าเป็นศาสตร์อย่างหนึ่ง อย่างไรก็ตามทางรัฐบาลอินเดียได้มีการประกาศเมื่อวันที่ 11 พค. 2544 ให้มีการสอนวิชาโหราศาสตร์ในมหาวิทยาลัยได้",
                    style: GoogleFonts.prompt(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 21, 171, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // ทำพื้นที่ว่าง
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
        // ปุ่มcredit
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03, left: 40, right: 40),
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                // เปลี่ยนสีcssไปอีกแบบ
                switchColorCredit = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                // เปลี่ยนสีcssไปแบบเดิม
                switchColorCredit = false;
                // โชว์alertdialog
                _showDialog(context);
              });
            },
            // UIปุ่มcredit
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: switchColorCredit
                      ? Color.fromRGBO(246, 103, 222, 1)
                      : Color.fromRGBO(209, 21, 171, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'Credit',
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    color: Color.fromRGBO(243, 196, 251, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
        // ปุ่มBack
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03, left: 40, right: 40),
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                switchColorBack = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                switchColorBack = false;
                // เมื่อกดเเล้วจะไปเปลี่ยนข้อมูลในglobaldata(ทำให้กลับไปหน้าHome)
                widget.swKey.currentState!.go("Home");
              });
            },
            // UIปุ่มback
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: switchColorBack
                      ? Color.fromRGBO(246, 103, 222, 1)
                      : Color.fromRGBO(209, 21, 171, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'Back',
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
    );
  }
}
