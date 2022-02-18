import 'package:covid_certificate_shortcut/shared/extensions.dart';
import 'package:covid_certificate_shortcut/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String number;

  const StatsCard({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        title: title,
        body: McCountingText(
            duration: const Duration(seconds: 1),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 35),
            begin: 0,
            end: double.parse(number.parseCovidStats())));
  }
}
