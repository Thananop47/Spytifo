import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C2D2C), Color(0xFF42313A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                hintText: 'What song?',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF121212),
              Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Grid ของปุ่ม
              Flexible(
                child: GridView.count(
                  shrinkWrap:
                      true, // ป้องกันไม่ให้ GridView ขยายเกินพื้นที่จำเป็น
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3,
                  children: [
                    _buildGridButton(Icons.favorite_border, "Like"),
                    _buildGridButton(Icons.music_note, "Daily mix1"),
                    _buildGridButton(Icons.album, "Youngohm"),
                    _buildGridButton(Icons.play_circle, "p9d"),
                    _buildGridButton(Icons.color_lens, "tattoo colour"),
                    _buildGridButton(Icons.star, "YENTAD"),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // หัวข้อ "Thai song"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "Thai song",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5),

              // แถวของรูปภาพ 2 รูป
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCard(
                      "Tattoo colour", "assets/images/tattooColour.jpg"),
                  _buildImageCard("BigAss", "assets/images/bigass.jpg"),
                ],
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "Hot",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5),

              // แถวของรูปภาพ 2 รูปสำหรับ "Hot"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCard("Z9", "assets/images/z9.jpg"),
                  _buildImageCard("4EVE", "assets/images/4eve.jpeg"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(IconData icon, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF665A5A),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildImageCard(String title, String imagePath) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
