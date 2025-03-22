import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spytifo/data/models/songs/playlist_provider.dart';
import 'package:spytifo/data/models/songs/song.dart';
import 'package:spytifo/presentations/screens/song_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final playlistProvider = Provider.of<PlaylistProvider>(context);
    final List<Song> filteredSongs = playlistProvider.playlist
        .where((song) =>
            song.songName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

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
            colors: [Color(0xFF121212), Color(0xFF1E1E1E)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: searchQuery.isEmpty
              ? _buildDefaultContent() // แสดงข้อมูลเริ่มต้น
              : _buildSearchResults(filteredSongs, playlistProvider),
        ),
      ),
    );
  }

  /// แสดงผลการค้นหาเพลง
  Widget _buildSearchResults(
      List<Song> songs, PlaylistProvider playlistProvider) {
    if (songs.isEmpty) {
      return Center(
        child: Text(
          "No results found",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        Song song = songs[index];

        return ListTile(
          leading: Icon(Icons.music_note, color: Colors.white),
          title: Text(song.songName, style: TextStyle(color: Colors.white)),
          subtitle:
              Text(song.artistName, style: TextStyle(color: Colors.white70)),
          onTap: () {
            int songIndex = playlistProvider.playlist.indexOf(song);
            playlistProvider.currentSongIndex = songIndex;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SongPage()),
            );
          },
        );
      },
    );
  }

  /// แสดงข้อมูลหน้าแรก (Grid button + Thai song + Hot)
  Widget _buildDefaultContent() {
    return ListView(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
          children: [
            _buildGridButton(Icons.favorite_border, "Like"),
            _buildGridButton(Icons.music_note, "Daily mix1"),
            _buildGridButton(Icons.album, "Youngohm"),
            _buildGridButton(Icons.play_circle, "p9d"),
            _buildGridButton(Icons.color_lens, "Tattoo Colour"),
            _buildGridButton(Icons.star, "YENTAD"),
          ],
        ),
        SizedBox(height: 10),
        _buildSectionTitle("Thai song"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageCard("Tattoo Colour", "assets/images/tattooColour.jpg"),
            _buildImageCard("BigAss", "assets/images/bigass.jpg"),
          ],
        ),
        SizedBox(height: 20),
        _buildSectionTitle("Hot"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageCard("Z9", "assets/images/z9.jpg"),
            _buildImageCard("4EVE", "assets/images/4eve.jpeg"),
          ],
        ),
      ],
    );
  }

  /// ปุ่ม Grid ด้านบน
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
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  /// แสดงชื่อหมวดหมู่ (Thai Song / Hot)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  /// การ์ดแสดงรูปภาพศิลปิน
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
