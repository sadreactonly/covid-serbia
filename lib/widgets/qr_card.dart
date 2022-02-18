import 'dart:convert';

import 'package:covid_certificate_shortcut/widgets/custom_card.dart';
import 'package:covid_certificate_shortcut/widgets/qr_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pdf_provider.dart';
import '../theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrCard extends StatelessWidget {
  const QrCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(title: AppLocalizations.of(context)!.qrCert, body: _qrCodeCardBody());
  }

  _qrCodeCardBody() {
    return Consumer<PdfProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: provider.qrImagePath.isNotEmpty
                    ? Image.memory(base64Decode(provider.qrImagePath))
                    : Container()),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: AppColors.blue,
                )),
            const QrCodeActionBar()
          ],
        );
      },
    );
  }
}
