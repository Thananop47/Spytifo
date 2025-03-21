import 'package:flutter/material.dart';

class Loginwith extends StatelessWidget {
  Loginwith({
    super.key,
    required this.imageLogoPath,
  });

  String imageLogoPath = '';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
