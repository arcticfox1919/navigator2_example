import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String name;
  final String imgSrc;

  // ignore: use_key_in_widget_constructors
  const Details(this.name, this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBF79A4),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('详情页',
                  style: TextStyle(fontSize: 26)),
              const SizedBox(height: 16,),
              Image.network(
                imgSrc,
                fit: BoxFit.fitWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
