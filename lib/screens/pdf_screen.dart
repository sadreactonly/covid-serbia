import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.picture_as_pdf_outlined,
        ),
      ),
      body: Consumer<PdfProvider>(
        builder: (context, provider, child) {
          if (provider.pdfPath.isNotEmpty) {
            return PdfViewPinch(
                controller: PdfControllerPinch(
                    document: PdfDocument.openFile(provider.pdfPath)));
          } else {
            return Center(child: Text(AppLocalizations.of(context)!.empty));
          }
        },
      ),
    );
  }
}
