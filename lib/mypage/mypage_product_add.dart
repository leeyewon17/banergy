import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("제품추가"),
      ),
      // body: _selectedIndex == 0
      //     ? tabcontainer(context, Colors.indigo, "home Tab")
      //     : _selectedIndex == 1
      //         ? tabcontainer(
      //             context, Colors.amber[600] as Color, "smart lens Tab")
      //         : tabcontainer(context, Colors.black38, "mypage Tab"),
      body: Container(),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.adjust),
              text: "Lens",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "My",
            ),
          ],
        ),
      ),
    );
  }

  // Widget tabcontainer(BuildContext con, Color tabcolor, String tabText) {
  //   return Container(
  //     width: MediaQuery.of(con).size.width,
  //     height: MediaQuery.of(con).size.height,
  //     color: tabcolor,
  //     child: Center(
  //       child: Text(
  //         tabText,
  //         style: const TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
