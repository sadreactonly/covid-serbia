import 'package:covid_certificate_shortcut/providers/stats_provider.dart';
import 'package:covid_certificate_shortcut/widgets/language_picker.dart';
import 'package:covid_certificate_shortcut/widgets/qr_card.dart';
import 'package:covid_certificate_shortcut/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/colors.dart';
import '../theme/theme_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: const Icon(
          Icons.coronavirus_outlined,
        ),
        title: Text(AppLocalizations.of(context)!.appTitle),
        
      ),
      body: Container(
          height: double.maxFinite,
          decoration: appBackground,
          width: double.maxFinite,
          child: SingleChildScrollView(child: Column(
            children: [
              const QrCard(),
              Consumer<StatsProvider>(
                builder: (context, provider, child) {
                  return StatsCard(
                      title: AppLocalizations.of(context)!.tested24,
                      number: provider.tested24hours);
                },
              ),
              Consumer<StatsProvider>(
                builder: (context, provider, child) {
                  return StatsCard(
                      title: AppLocalizations.of(context)!.infected24,
                      number: provider.infected24hours);
                },
              ),
              Consumer<StatsProvider>(
                builder: (context, provider, child) {
                  return StatsCard(
                      title: AppLocalizations.of(context)!.deceased24,
                      number: provider.deceased24hours);
                },
              ),
            ],
          ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
