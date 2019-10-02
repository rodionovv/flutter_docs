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
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    RandomColor _randomColor = RandomColor();
                    Color _color = _randomColor.randomColor();
                    return Container(
                      color: _color,
                      height: 150,
                    );
                  }
              ),
            )
          ],
        ),
      )
    );
  }
}

void main() => runApp(MyApp());
