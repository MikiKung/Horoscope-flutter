import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_pj/globalCard.dart';
import 'package:midterm_pj/switch_page.dart';
import 'package:provider/provider.dart';

class PageHISTORY extends StatefulWidget {
  final GlobalKey<SwitchPageState> swKey;
  const PageHISTORY({Key? key, required this.swKey}) : super(key: key);

  @override
  _PageHISTORYState createState() => _PageHISTORYState();
}

class _PageHISTORYState extends State<PageHISTORY> {
  bool switchColorBack = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ชื่อหน้า
        Text(
          "History",
          style: GoogleFonts.quicksand(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(209, 21, 171, 1)),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02)),
        // กล่องเก็บรายชื่อการ์ดที่เคยสุ่มได้
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(243, 196, 251, 0.5),
          ),
          child: Padding(
            // ข้อมูลข้างในกล่องห่างจากขอบบน ล่าง 20
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: Column(
              children: [
                Text(
                  "วันนี้คุณได้ดูดวงไปแล้ว " +
                      // เเสดงการนับจำนวนข้อมูลในlistที่เก็บชื่อที่เคยสุ่มได้
                      context
                          .watch<GlobalCard>()
                          .listHistory
                          .length
                          .toString() +
                      " ครั้ง",
                  style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(209, 21, 171, 1)),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                // Loop ไพ่ที่เคยสุ่มได้
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: context.watch<GlobalCard>().listHistory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 3)),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(242, 90, 202, 1)),
                              child: Center(
                                  // แสดงข้อมูลชื่อไพ่ที่เคยสุ่มได้
                                  child: Text(
                                "${index + 1}.${context.watch<GlobalCard>().listHistory[index].cardName.toString()}",
                                style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(209, 21, 171, 1)),
                              )),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        // ปุ่มback
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: 40,
              right: 40),
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                switchColorBack = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                switchColorBack = false;
                widget.swKey.currentState!.go("Home");
              });
            },
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
