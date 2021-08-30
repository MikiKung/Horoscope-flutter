import 'package:flutter/material.dart';

import 'package:midterm_pj/globalCard.dart';
import 'package:midterm_pj/history.dart';
import 'package:midterm_pj/home.dart';
import 'package:midterm_pj/horoscope.dart';
import 'package:midterm_pj/infomation.dart';
import 'package:midterm_pj/switch_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // * การเรียกใช้ตัวแปร Global
      ChangeNotifierProvider(create: (_) => GlobalCard()),
    ],
    // *การสั่งใช้งาน Class MyApp
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // *การปิดคำว่าdebug ที่เป็นเเถบสีแดง
      debugShowCheckedModeBanner: false,
      // *การเรียกใช้ class Home
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // *เปลี่ยนสีปุ่มinfomation
  bool switchColorInfo = false;
  // *เปลี่ยนสีปุ่มHoroscope
  bool switchColorHoroscope = false;
  // *เปลี่ยนสีปุ่มhistory
  bool switchColorHistory = false;
  // *เปลี่ยนสีปุ่มnext
  bool switchColorNext = false;
  // *การให้ประกาศตัวแปรให้ swKey เป็นข้อมูลในglobal
  var swKey = GlobalKey<SwitchPageState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // *ทำให้เว้นพื้นที่ของstatus bar
      body: SafeArea(
        // todo: background
        child: Container(
            // *ยาวไม่มีสิ้นสุด
            width: double.infinity,
            // *สูงไม่มีสิ้นสุด
            height: double.infinity,
            // *เอาไว้จัดCSSให้กล่อง
            decoration: BoxDecoration(
              // *ถ้าไม่มีจะใส่รูปไม่ได้
              image: DecorationImage(
                // *เรียกใช้รูปbackground
                image: AssetImage("assets/images/background.jpg"),
                // *รูปขยาให้เต็มsizeที่กำหนด
                fit: BoxFit.cover,
              ),
            ),
            // todo: ตัวUIข้างใน
            child: Column(
              children: [
                // todo test
                // TextButton(onPressed: (){
                //   final test = AudioCache();
                //   test.play("assets/sounds/main-sound-anohana.mp3");
                // }, child: Text("asdas")),
                // *ทำให้ส่วนของiconข้างบนห่างจากขอบทุกมุม
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // *ตัวrow ของicon
                  child: Row(
                    // *ทำให้iconอยู่ทที่มุมขวา
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // *ทำปุ่ม icon Info ให้กดได้เเล้วทำอะไร
                      GestureDetector(
                        // *ถ้ากดนิ้วลงไป
                        onTapDown: (_) {
                          // *การเปลี่ยนค่า
                          setState(() {
                            // ignore: unnecessary_statements
                            // *ทำให้เปลี่ยนcssเป็นอีกแบบ
                            switchColorInfo = true;
                          });
                        },
                        // *ถ้ายกนิ้วขึ้น
                        onTapUp: (_) {
                          // *การเปลี่ยนค่า
                          setState(() {
                            // ignore: unnecessary_statements
                            // *ทำให้เปลี่ยนcss เป็นเหมือนเดิม
                            switchColorInfo = false;
                            swKey.currentState!.go("Info");
                          });
                        },
                        // *ปุ่มInfomation
                        child: Icon(
                          Icons.info,
                          // *ขนาดของปุ่ม
                          size: 30,
                          // *การสลับcss
                          color: switchColorInfo
                              ? Color.fromRGBO(246, 103, 222, 1)
                              : Color.fromRGBO(209, 21, 171, 1),
                        ),
                      ),
                      // *ให้ปุ่มห่างจากอีกปุ่ม
                      Padding(padding: EdgeInsets.only(left: 10)),
                      // *ทำปุ่ม Historyให้กดได้
                      GestureDetector(
                        // *ถ้ากดนิ้วลงไป
                        onTapDown: (_) {
                          setState(() {
                            // ignore: unnecessary_statements
                            // *ทำให้เปลี่ยนcssเป็นอีกแบบ
                            switchColorHistory = true;
                          });
                        },
                        // *ถ้ายกนิ้วขึ้น
                        onTapUp: (_) {
                          // *การเปลี่ยนค่า
                          setState(() {
                            // *ทำให้เปลี่ยนcss เป็นเหมือนเดิม
                            switchColorHistory = false;
                          });
                          // *linkไปอีกหน้า
                          swKey.currentState!.go("History");
                        },
                        child: Icon(
                          Icons.history,
                          // *ขนาดของปุ่ม
                          size: 30,
                          // *การสลับcss
                          color: switchColorHistory
                              ? Color.fromRGBO(246, 103, 222, 1)
                              : Color.fromRGBO(209, 21, 171, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                // todo: ประกาศหน้าทั้งหมดที่ทำเพื่อให้สามารถกดlinkหน้าได้
                SwitchPage(
                  key: swKey,
                  initPages: [
                    // *หน้าแรก
                    SwitchPageProps(
                        name: "Home", component: PageHome(swKey: swKey)),
                    // *หน้าข้อมูลการดูดวง
                    SwitchPageProps(
                        name: "Info", component: PageINFO(swKey: swKey)),
                    // *หน้าประวัติการดูดวง
                    SwitchPageProps(
                        name: "History", component: PageHISTORY(swKey: swKey)),
                    // *หน้าดูดวง
                    SwitchPageProps(
                        name: "Horoscope",
                        component: PageHoroscope(swKey: swKey)),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
