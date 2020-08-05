import 'package:flutter/material.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/widgets/navbar_item/navbar_item.dart';
import 'package:the_basics/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:theme_provider/theme_provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: ThemeProvider.themeOf(context).id == 'dark'
            ? Color(0xFF252728)
            : Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
          // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
          NavBarItem(
            'Home',
            HomeRoute,
            icon: Icons.home,
            scaffoldKey: scaffoldKey,
          ),
          NavBarItem(
            'Episodes',
            EpisodesRoute,
            icon: Icons.videocam,
            scaffoldKey: scaffoldKey,
          ),
          NavBarItem(
            'About',
            AboutRoute,
            icon: Icons.help,
            scaffoldKey: scaffoldKey,
          ),
        ],
      ),
    );
  }
}
