import 'package:flutter/material.dart';
import 'package:flutter_ex1/main.dart';
import '../mypage/mypage.dart';
import '../mypage/mypage_allergy_information.dart';
import '../mypage/mypage_record_allergy_reactions.dart';
import '../mypage/mypage_filtering_allergies.dart';
import '../mypage/mypage_product_add.dart';
import '../mypage/mypage_freeboard.dart';

void main() {
  runApp(const MypageApp());
}

class MypageApp extends StatelessWidget {
  const MypageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
        () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToPage(String pageName) {
    // 페이지 이름에 따라 다른 동작 수행
    switch (pageName) {
      case "알러지 정보":
        // 알러지 정보 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const allergyinformation()),
        );
        break;
      case "알러지 반응 기록":
        // 알러지 반응 기록 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const recordallergyreactions()),
        );
        break;
      case "알러지 필터링":
        // 알러지 필터링 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FilteringAllergies()),
        );
        break;
      case "상품추가":
        // 상품추가 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => productadd()),
        );
        break;
      case "자유게시판":
        // 자유게시판 페이지으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const freeboard()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
      ),
      body: Center(
        child: _buildlist(),
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
                  // home 아이콘이 눌렸을 때 main.dart 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainpageApp()),
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
                  // home 아이콘이 눌렸을 때 main.dart 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MypageApp()),
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

  Widget _buildlist() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        final buttonText = [
          "알러지 정보",
          "알러지 반응 기록",
          "알러지 필터링",
          "상품추가",
          "자유게시판",
        ][index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildButton(buttonText),
        );
      },
    );
  }

  Widget _buildButton(String buttonText) => ElevatedButton(
        onPressed: () {
          _navigateToPage(buttonText);
        },
        child: Text(buttonText),
      );
}
