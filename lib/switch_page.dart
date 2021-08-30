import 'package:flutter/cupertino.dart';

class SwitchPageProps {
  // *เอาไว้รับค่าnameจากหน้าอื่น
  final String name;
  // *เอาไว้รับค่าcomponentจากหน้าอื่น
  final Widget component;

  // *เอาไว้รอรับค่าหากมีการทำให้เปลี่ยนหน้า (constutor)ที่รอรับค่า
  SwitchPageProps({required this.name, required this.component});
}

class SwitchPage extends StatefulWidget {
  // *list ของหน้าทั้งหมดที่เราประกาศไว้
  final List<SwitchPageProps> initPages;
  // *ตัวรับข้อมูลที่เราจะใช้
  const SwitchPage({Key? key, required this.initPages}) : super(key: key);

  @override
  SwitchPageState createState() => SwitchPageState();
}

class SwitchPageState extends State<SwitchPage> {
  // *เอาไว้รอเปลี่ยนหน้า
  late SwitchPageProps page;

  // *เอาไว้เก็บค่าหน้าที่เคยอยู่
  List<SwitchPageProps> _history = [];

  // *เปลี่ยนหน้าไปตามpagenmeที่รับค่ามา
  void go(String pageName) {
    // *ถ้าข้อมูลในlist == pagename
    var _page = widget.initPages.firstWhere((el) => el.name == pageName);
    setState(() {
      if (_page.name == _history.last.name) {
        // *เรียกใช้ฟังก์ชัน
        popToTop();
      } else {
        this.page = _page;
        // เอา_pageเข้าไปเก็บในlist _history
        _history.add(_page);
      }
    });
  }

// *ฟังก์ชันเมื่อกดเเล้วจะให้ค่ากลับไปเป็นค่าเเรก (ทำให้ค่ากลับเป็นหน้าhome)
  void popToTop() {
    //* ประกาศให้ค่ากลายเป็นค่าinitPageที่0
    var firstPage = widget.initPages[0];
    setState(() {
      // *นำค่าinitepageที่0ไปเก็บในlist
      _history = [firstPage];
    });
  }
// ทำให้เเสดงค่าหน้าล่าสุดหรือกลับไปหน้าเเรก
  SwitchPageProps currentPage() {
    try {
      return _history.last;
    } catch (e) {
      page = widget.initPages[0];
      _history.add(page);
      return page;
    }
  }

  // *เเสดงหน้าในหน้าUI
  Widget render() {
    var _currentPage = currentPage();
    return _currentPage.component;
  }
  // *เรียกใช้ฟังก์ชันreder
  @override
  Widget build(BuildContext context) => render();
}
