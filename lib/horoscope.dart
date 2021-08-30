import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_pj/globalCard.dart';
import 'package:midterm_pj/models/carddata.dart';
import 'package:midterm_pj/switch_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

class PageHoroscope extends StatefulWidget {
  //  เรียกใช้้อมูลในglobal(หน้าอะไร)
  final GlobalKey<SwitchPageState> swKey;
  const PageHoroscope({Key? key, required this.swKey}) : super(key: key);

  @override
  _PageHoroscopeState createState() => _PageHoroscopeState();
}

class _PageHoroscopeState extends State<PageHoroscope> {
  // *เปลี่ยนสีปุ่มback
  bool switchColorBack = false;
  // แสดวข้อมูลในfolder Model
  List<CardData> data = allData;
  // เช็คว่าการ์ดถูกเปิดรึยัง
  bool isOpen = false;
  // *เปลี่ยนสีปุ่มback
  bool switchColorBin = false;
  // เก็บค่าที่เคยสุ่มได้จากในfolder model
  late CardData yourCard;

  late GlobalKey<FlipCardState> cardKey;

  //  ล้างค่าว่ากดการ์ดอยู่
  void clearData() {
    setState(() {
      isOpen = false;
      // เรียกใช้library flipcard
      cardKey.currentState!.toggleCard();
    });
  }

// ถ้ามีการ์ดถูกกดอยู่ไม่สามารถกดเพิ่มได้
  bool cardOpen(CardData card, GlobalKey<FlipCardState> key) {
    if (isOpen == true) {
      return false;
    } else {
      setState(() {
        isOpen = true;
        yourCard = card;
        cardKey = key;
        context.read<GlobalCard>().add(card);
      });
      return true;
    }
  }

  @override
  // สลับการ์ดเมื่อเข้าหน้าสุ่มไพ่ใหม่
  void initState() {
    super.initState();
    data.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return
        // loop card ให้กดเลือกได้
        Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            // เเสดงlistการ์ด
            child: ListView(
              // ทำให้เป็นเเนวนอน
              scrollDirection: Axis.horizontal,
              children: [
                // loopข้อมูลเข้าไปในi ตามในdataที่มี
                for (var i in data)
                  // เเสดงข้อมูลตามiทั้งหมดเเละเรียกใช้UIจากฟังก์ชันMycard
                  MyCard(
                    card: i,
                    cardOpen: cardOpen,
                  )
              ],
            ),
          ),
        ),
        // กล่องเปล่าที่สูง30
        SizedBox(height: 30),
        // เงื่อนไขการเเสดงข้อมูล
        isOpen
            // ถ้ามีการเปิดการ์ด
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 196, 251, 0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  yourCard.cardName,
                                  style: GoogleFonts.quicksand(
                                      fontSize: 28,
                                      color: Color.fromRGBO(209, 21, 171, 1)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                    onTapDown: (_) {
                                      setState(() {
                                        switchColorBin = true;
                                      });
                                    },
                                    onTapUp: (_) {
                                      setState(() {
                                        switchColorBin = false;
                                        clearData();
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: switchColorBin
                                          ? Color.fromRGBO(246, 103, 222, 1)
                                          : Color.fromRGBO(209, 21, 171, 1),
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Text(
                                "          ${yourCard.detailCard}",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: Color.fromRGBO(209, 21, 171, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
              )
            // ถ้าไม่มีการเปิดการ์ด
            : Padding(
                padding: EdgeInsets.only(top: 30, left: 40, right: 40),
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
              ),
      ],
    );
  }
}

// ฟังก์ชันเเสดงการ์ด
class MyCard extends StatefulWidget {
  final CardData card;
  final bool Function(CardData card, GlobalKey<FlipCardState> key) cardOpen;
  const MyCard({Key? key, required this.card, required this.cardOpen})
      : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var key = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          bool canOpen = widget.cardOpen(widget.card, key);
          if (canOpen == true) {
            key.currentState!.toggleCard();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          child: FlipCard(
            key: key,
            front: Image.asset(widget.card.backCard),
            back: Image.asset(widget.card.frontCard),
            flipOnTouch: false,
          ),
          width: MediaQuery.of(context).size.height * 0.1,
          height: double.infinity,
        ),
      ),
    );
  }
}
