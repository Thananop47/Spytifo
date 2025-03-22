import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF121212), // สีด้านบน
              Color(0xFF1E1E1E), // สีด้านล่าง
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            // ใช้ ListView เพื่อให้เลื่อนทั้งหน้าได้
            children: [
              Image.asset(
                "assets/images/heryented.jpg",
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true, // ให้ GridView มีขนาดตามเนื้อหา
                physics:
                    NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ GridView
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
}
