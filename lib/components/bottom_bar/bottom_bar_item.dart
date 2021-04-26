import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      {Key? key,
      required this.item,
      this.selected = false,
      this.onTap,
      this.indicator = Colors.black})
      : super(key: key);

  final BottomNavigationBarItem item;
  final bool selected;
  final VoidCallback? onTap;
  final Color indicator;

  @override
  Widget build(BuildContext context) {
    Widget result = InkResponse(
      onTap: onTap,
      child: Container(
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: selected ? item.activeIcon : item.icon,
            ),
            selected
                ? _DotIndicator(
                    color: indicator,
                  )
                : Container()
          ],
        ),
      ),
    );

    return Expanded(child: result);
  }
}

class _DotIndicator extends StatelessWidget {
  const _DotIndicator({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: ClipOval(
        child: Container(
          width: 8,
          height: 8,
          color: color,
        ),
      ),
    );
  }
}
