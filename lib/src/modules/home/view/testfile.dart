import 'package:flutter/material.dart';

class TestClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expanded Column Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 100,
              child: Center(child: Text('Above Column')),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Full Width',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // More widgets can be added here if needed
                ],
              ),
            ),
            Container(
              color: Colors.green,
              height: 100,
              child: Center(child: Text('Below Column')),
            ),
          ],
        ),
      ),
    );
  }
}