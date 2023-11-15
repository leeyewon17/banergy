import 'package:flutter/material.dart';
import 'package:flutter_ex1/main.dart';
import '../mypage/mypage.dart';

class productadd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품등록'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(label: '상품명 *'),
            InputField(label: '상품 정보*', maxLength: 255, isTextArea: true),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InquiryDetailScreen(),
                  ),
                );
              },
              child: Text('상품 등록하기'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final int maxLength;
  final bool isTextArea;
  final String hintText;

  InputField({
    required this.label,
    this.maxLength = 255,
    this.isTextArea = false,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        isTextArea
            ? TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "상품 영양정보 및 회사명 등등",
                  border: OutlineInputBorder(),
                ),
              )
            : TextField(
                maxLength: maxLength,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
      ],
    );
  }
}

class MyPageWidget extends StatefulWidget {
  const MyPageWidget({Key? key}) : super(key: key);

  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends State<MyPageWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildList() {
    // Implement your list building logic here
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildList(),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainpageApp()),
                  );
                },
                child: Icon(Icons.home),
              ),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.adjust),
              text: "Lens",
            ),
            Tab(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MypageApp()),
                  );
                },
                child: Icon(Icons.person),
              ),
              text: "My",
            ),
          ],
        ),
      ),
    );
  }
}

class InquiryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 이미지 넣기'),
      ),
      body: Center(
        child: Text('상품 이미지 넣기 구현해야함'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: productadd(),
  ));
}
