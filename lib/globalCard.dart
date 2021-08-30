import 'package:flutter/cupertino.dart';
import 'package:midterm_pj/models/carddata.dart';

class GlobalCard with ChangeNotifier {
  // เอาไว้เก็บค่าข้อมูลที่เคยสุ่มได้
  List<CardData> _listHistory = [];
  // เก็บค่าไว้ในอีกตัวแปรนึงเพื่อเอาไปใช้ในfileอื่น
  List<CardData> get listHistory => _listHistory;
  
  void add(CardData card) {
    // เพิ่มcardที่เคยสุ่มได้ลงลิส
    _listHistory.add(card);
    
    notifyListeners();
  }
}
