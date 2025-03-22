import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loginwith extends StatelessWidget {
  Loginwith({super.key, required this.imageLogoPath, required this.onPressed});

  String imageLogoPath = '';

  var onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(72, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            imageLogoPath,
            height: 24,
          ),
        ],
      ),
    );
  }
}
