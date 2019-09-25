import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(MyApp());
}

class Pic {
  String _path;
  Pic(this._path);
  path() {
    return this._path;
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showCard = false;
  Pic pic;


  @override
  Widget build(BuildContext context) {
    return showCard ? _makeColumn() : GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(16),
    );
  }

  List<Stack> _buildGridTileList(int count) => List.generate(
      count, (i) => _buildStack(Pic('images/pic${i + 1}.jpg')));




  Widget _makeColumn() => Column(
    children: <Widget>[
      _buildStack(pic),
      _buildCard(),
    ],
  );

  Widget _buildCard() => SizedBox(
    height: 210,
    width: 500,
    child: GestureDetector(
     onTap: () {
       setState(() {
         showCard = !showCard;
       });
     },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('1625 Main Street',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('(408) 555-1212',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    pic = Pic("hi");
                  });
                },
                child: Icon(
                    Icons.more_vert),
                ),
              ),
            ListTile(
              title: Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    )
  );
  // #enddocregion Card



  // #docregion Stack
  Widget _buildStack(Pic image) => Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(image.path()),
        radius: 100,
      ),
      GestureDetector(
        onTap: () {
         setState(() {
           showCard = !showCard;
           pic = image;
         });
        },
        child:  Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            image.path(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}

class MyApp extends StatelessWidget {
  static final showCard = false; // Set to false to show ListView

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Body(),
      ),
    );
  }
  // #docregion Card

// #enddocregion Stack
}