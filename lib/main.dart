import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main screen',
        ),
      ),
      body: GestureDetector(
        child: MyHero('https://picsum.photos/250?image=9'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: MyHero('https://picsum.photos/250?image=9'),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class MyHero extends StatelessWidget {
  final String path;

  MyHero(this.path);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'imageHero',
      child: Image.network(
        path,
      ),
    );
  }
}


void main() => runApp(MyApp());
