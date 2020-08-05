import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

void hyperlink({@required String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
