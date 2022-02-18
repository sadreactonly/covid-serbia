import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:covid_certificate_shortcut/providers/stats_provider.dart';
import 'package:covid_certificate_shortcut/screens/loading_screen.dart';
import 'package:covid_certificate_shortcut/shared/routes.dart';
import 'package:covid_certificate_shortcut/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(language: 'sr',));
}

class MyApp extends StatefulWidget {
  String language;

  MyApp({Key? key,  required this.language}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  void setLocale(Locale value) {
    widget.language = value.languageCode;

    setState(() {
      _locale = value;
    });
  }

  String getLanguage() {
    return widget.language;
  }

  @override
  void initState() {
    super.initState();
    setLocale(Locale.fromSubtags(languageCode: widget.language));
  }
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
          routes: Routes.appRoutes,
          onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
          theme: appTheme,
          locale: _locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('sr', ''),
            Locale('en', ''),
          ],
          home: const LoadingScreen(),
        ));
  }
}
