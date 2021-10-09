import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ClipPath(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff622F74),
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.deepOrangeAccent],
                    //  blue deepOrangeAccent
                    begin: Alignment.centerRight,
                    end: Alignment(-1.0, -1.0))),
          ),
        ],
      ),
      clipper: MyClipper(),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, size.height / 2)
      ..lineTo(size.width, size.height / 2 - 100)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
