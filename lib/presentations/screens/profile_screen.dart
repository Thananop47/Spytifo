import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spytifo/presentations/screens/about_screen.dart';
import 'package:spytifo/presentations/screens/change_password.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Your Name';
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController();
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : NetworkImage('URL_TO_YOUR_IMAGE') as ImageProvider,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isEditing
                      ? Expanded(
                          child: TextField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
                      : Text(
                          _name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                  IconButton(
                    icon: Icon(_isEditing ? Icons.check : Icons.edit,
                        color: Colors.white),
                    onPressed: () {
                      setState(() {
                        if (_isEditing) {
                          _name = _nameController.text;
                        }
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text('About', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.white),
                title: Text('Change password',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChangePasswordPage()), // นำทางไปยัง ChangePasswordPage
                  );
                },
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text('Log out', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
