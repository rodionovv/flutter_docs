import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';



class MyApp extends StatelessWidget {

  Colors geRandomColor() {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                RandomColor _randomColor = RandomColor();
                Color _color = _randomColor.randomColor();
                return Container(color: _color, height: 150
                ,child: Center(child: Text(_color.toString())));
              }),
            )
          ],
        ),
      )
    );
  }
}

void main() => runApp(MyApp());
