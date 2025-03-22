import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spytifo/data/models/songs/playlist_provider.dart';
import 'package:spytifo/presentations/screens/artist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Songs",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C2D2C), Color(0xFF42313A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
              Color(0xFF121212), // สีด้านบน
              Color(0xFF1E1E1E), // สีด้านล่าง
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/heryented.jpg",
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
                children: [
                  _buildGridButton(
                      context, Icons.favorite_border, "Like", "Yented"),
                  _buildGridButton(
                      context, Icons.music_note, "Daily mix1", "YoungOhm"),
                  _buildGridButton(
                      context, Icons.album, "Youngohm", "YoungOhm"),
                  _buildGridButton(context, Icons.play_circle, "PUN", "PUN"),
                  _buildGridButton(
                      context, Icons.color_lens, "Illslick", "Illslick"),
                  _buildGridButton(context, Icons.star, "YENTED", "Yented"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, IconData icon, String text, String artistName) {
    final playlistProvider =
        Provider.of<PlaylistProvider>(context, listen: false);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF665A5A),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistDetailScreen(
              artistName: artistName,
              songs: playlistProvider.playlist
                  .where((song) => song.artistName == artistName)
                  .toList(),
            ),
          ),
        );
      },
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
