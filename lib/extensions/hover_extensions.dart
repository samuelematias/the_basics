import 'package:flutter/material.dart';

import 'package:the_basics/widgets/translate_on_hover.dart';

extension HoverExtensions on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
