import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              scaffoldKey?.currentState?.openDrawer();
            },
          ),
          CycleThemeIconButton(),
        ],
      ),
    );
  }
}
