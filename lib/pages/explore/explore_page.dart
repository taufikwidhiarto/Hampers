import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(color: Colors.amber),
    //   child: Text('explore'),
    // );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
