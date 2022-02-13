import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:covid_certificate_shortcut/providers/stats_provider.dart';
import 'package:covid_certificate_shortcut/screens/crop_screen.dart';
import 'package:covid_certificate_shortcut/screens/settings_screen.dart';
import 'package:covid_certificate_shortcut/screens/splash_screen.dart';
import 'package:covid_certificate_shortcut/shared/routes.dart';
import 'package:covid_certificate_shortcut/shared/strings.dart';
import 'package:covid_certificate_shortcut/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    SplashApp(
      key: UniqueKey(),
      onInitializationComplete: (route) =>   runApp(const MyApp())
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PdfProvider>(
            create: (context) => PdfProvider(),
          ),
          ChangeNotifierProvider<StatsProvider>(
            create: (context) => StatsProvider(),
          ),
        ],
        child: MaterialApp(
          routes: {
            Routes.settings: (context) => const SettingsScreen(),
            Routes.crop: (context) => const CropScreen()
          },
          title: StringResources.title,
          theme: ThemeData(
              appBarTheme: AppBarTheme(color: AppColors.blue),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(primary: AppColors.blue),
              )),
          home: const HomePage(),
        ));
  }
}
