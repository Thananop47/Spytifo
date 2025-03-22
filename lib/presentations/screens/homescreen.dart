import 'package:flutter/material.dart';
import 'package:spytifo/presentations/screens/home_screen.dart';
import 'package:spytifo/presentations/screens/playlist_screen.dart';
import 'package:spytifo/presentations/screens/profile_screen.dart';
import 'package:spytifo/presentations/screens/search_screen.dart';

class HomescreenNavi extends StatefulWidget {
  const HomescreenNavi({super.key});

  @override
  State<HomescreenNavi> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomescreenNavi> {
  int _selectedIndex = 0;
  String searchQuery = "";

  // รายการเพลงทั้งหมด (ตัวอย่าง)
  final List<String> allSongs = ["ตีหนึ่งที่คูเมือง", "นครดารา", "DAY ONE"];

  // ฟังก์ชันกรองเพลงตามคำที่ค้นหา
  List<String> get filteredSongs {
    if (searchQuery.isEmpty) {
      return [];
    }
    return allSongs
        .where((song) => song.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  final Map<int, Map<String, Widget>> _navigationMap = {
    0: {"title": const Text("Home"), "screen": HomeScreen()},
    1: {"title": const Text("Search"), "screen": SearchScreen()},
    2: {"title": const Text("Yourlists"), "screen": PlaylistScreen()},
    3: {"title": const Text("Profile"), "screen": ProfilePage()},
  };

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children:
                _navigationMap.values.map((page) => page["screen"]!).toList(),
          ),

          // แสดงผลลัพธ์การค้นหา
          if (searchQuery.isNotEmpty)
            Container(
              color: Colors.black.withOpacity(0.8), // พื้นหลังโปร่งใส
              child: ListView.builder(
                itemCount: filteredSongs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredSongs[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // กดแล้วให้เล่นเพลง (สามารถเชื่อมต่อ Media Player ได้)
                      print("Playing: ${filteredSongs[index]}");
                    },
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6C2D2C), Color(0xFF42313A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/home.png", width: 30, height: 30),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/search.png",
                  width: 30, height: 30),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/playlist.png",
                  width: 30, height: 30),
              label: "",
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/user.png", width: 30, height: 30),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
