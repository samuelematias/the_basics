import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/widgets/centered_view/centered_view.dart';
import 'package:the_basics/widgets/navigation_bar/navigation_bar.dart';
import 'package:the_basics/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        key: _scaffoldKey,
        drawer: sizingInformation.isMobile
            ? NavigationDrawer(
                scaffoldKey: _scaffoldKey,
              )
            : null,
        // backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(
                scaffoldKey: _scaffoldKey,
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
