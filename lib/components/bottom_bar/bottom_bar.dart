import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hamper/components/bottom_bar/bottom_bar_item.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key, required this.items, this.currentIndex = 0, this.onTap})
      : super(key: key);

  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    const test = [Colors.purple, Colors.yellow, Colors.blue];

    final List<Widget> tiles = <Widget>[];
    for (var i = 0; i < widget.items.length; i++) {
      tiles.add(BottomBarItem(
        item: widget.items[i],
        selected: i == widget.currentIndex,
        indicator: test[i],
        onTap: () {
          widget.onTap?.call(i);
        },
      ));
    }
    return Container(
      height: 64,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 14, spreadRadius: 2)
          ]),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tiles,
      ),
    );
  }
}
