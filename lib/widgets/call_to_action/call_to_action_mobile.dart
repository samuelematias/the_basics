import 'package:flutter/material.dart';
import 'package:the_basics/constants/app_colors.dart';
import 'package:the_basics/utils/hyperlink.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;
  const CallToActionMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => hyperlink(
        url:
            'https://www.youtube.com/watch?v=33kyEzDMTZU&list=PLdTodMosi-Bxf___3xPh3_NS-on4dc0sJ&index=1',
      ),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
