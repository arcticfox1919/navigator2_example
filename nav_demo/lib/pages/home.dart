import 'package:flutter/material.dart';
import 'package:nav_demo/models/movie.dart';
import 'package:nav_demo/pages/details.dart';
import 'package:nav_demo/services/service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie>? _movieList;

  @override
  void initState() {
    super.initState();
    Service.fetchMovieList().then((value) {
      setState(() {
        _movieList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBF79A4),
        title: const Text(
          '电影',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showDialog<bool>(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: const Text('确定要注销登录吗？'),
                        actions: [
                          TextButton(
                            child: const Text('取消'),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                          TextButton(
                            child: const Text('确定'),
                            onPressed: () {
                              Navigator.pop(ctx);
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                        ],
                      );
                    });
              }),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: _movieList != null ? _movieList!.length : 0,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Details(
                            _movieList![i].name, _movieList![i].imgUrl)));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: Image.network(_movieList![i].imgUrl)),
                  Text(_movieList![i].name),
                ],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 2,
            childAspectRatio: 3 / 4,
          ),
        ),
      ),
    );
  }
}
