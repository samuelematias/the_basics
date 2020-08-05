import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';
import 'package:the_basics/utils/hyperlink.dart';
import 'package:the_basics/widgets/list_view_column/list_view_column.dart';
import 'package:theme_provider/theme_provider.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ListViewColumn(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'To learn more about the project, check the github repository.',
            style: descriptionTextStyle(sizingInformation.deviceScreenType),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          FlatButton(
            onPressed: () => hyperlink(
              url: 'https://github.com/samuelematias/the_basics',
            ),
            child: Tooltip(
              message: 'Access Github project page',
              child: Icon(
                AntDesign.github,
                color: ThemeProvider.themeOf(context).id == 'dark'
                    ? Colors.white
                    : Colors.black,
                size: 50,
              ),
            ),
          ),
        ],
      );
    });
  }
}
