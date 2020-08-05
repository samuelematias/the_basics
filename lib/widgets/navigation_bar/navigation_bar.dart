import 'package:flutter/material.dart';
import 'package:the_basics/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:the_basics/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(
        scaffoldKey: scaffoldKey,
      ),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
