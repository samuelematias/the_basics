import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/routing/router.dart';
import 'package:the_basics/services/navigation_service.dart';
import 'package:the_basics/views/layout_template/layout_template.dart';
import 'package:theme_provider/theme_provider.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true, // Auto save any theme change we do
      loadThemeOnInit:
          false, // Do not load the saved theme(use onInitCallback callback)
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        var savedTheme = await previouslySavedThemeFuture;

        if (savedTheme != null) {
          // If previous theme saved, use saved theme
          controller.setTheme(savedTheme);
        } else {
          // If previous theme not found, use platform default
          var platformBrightness =
              SchedulerBinding.instance.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          // Forget the saved theme(which were saved just now by previous lines)
          // ignore: unawaited_futures
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(
          id: 'dark',
        ), // This is standard dark theme (id is default_dark_theme)
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            title: 'Flutter Web The Basics',
            theme: ThemeProvider.themeOf(themeContext).data,
            builder: (context, child) => LayoutTemplate(
              child: child,
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: generateRoute,
            initialRoute: HomeRoute,
          ),
        ),
      ),
    );
  }
}
