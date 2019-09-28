import 'package:flutter/material.dart';


class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'routing',
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentScreen.routeName) {
          final ScreenArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
      }
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtractArgumentsScreen(),
                    settings: RouteSettings(
                      arguments: ScreenArguments(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      )
                    )
                  )
                );
              },
            ),
            RaisedButton(
              child: Text('Navigate to a named that accepts arguments'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute function.',
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PassArgumentScreen extends StatelessWidget {
  static const routeName = '/passArguments';
  final String title;
  final String message;

  const PassArgumentScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }

}


class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title
        ),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

void main() => runApp(MyApp());
