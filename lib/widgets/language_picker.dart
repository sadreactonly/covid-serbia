import 'package:covid_certificate_shortcut/shared/extensions.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          width: 150,
          padding: const EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.centerLeft,
          child: DropdownButton<String>(
            value: 'sr',

            elevation: 0,
            style: const TextStyle(color: Colors.white),
            underline: Container(
              height: 1,
            ),
            onChanged: (String? newValue) {
              MyApp.of(context)
                  ?.setLocale(Locale.fromSubtags(languageCode: newValue!));

            },
            items: ['rs','gb']
                .map<DropdownMenuItem<String>>(
                  (String value) {

                return DropdownMenuItem<String>(
                  value: value,
                  child: Flag.fromString(value.countryCodeToFlag(), height: 20, width: 20, fit: BoxFit.fill)
                );
              },
            ).toList(),
          ),
        );

  }
}
