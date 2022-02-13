import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:covid_certificate_shortcut/shared/strings.dart';
import 'package:covid_certificate_shortcut/widgets/qr_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PdfProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.doesPathExist(),
          builder: (
            BuildContext context,
            AsyncSnapshot<bool> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return QrCard(
                    title: StringResources.title, path: provider.qrImagePath);
              } else {
                return Center(child: Text(StringResources.empty));
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        );
      },
    );
  }
}
