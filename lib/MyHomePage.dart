import 'package:flutter/material.dart';
import 'package:tooltip_demo_app/GetPositionWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GetWidgetPosition(
              location: (properties) => print(
                  'This text location is at (${properties.position.dx},${properties.position.dy})\nThis widget has a width: ${properties.size.width}, height:${properties.size.height}'),
              child: Text(
                'Hello World',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
