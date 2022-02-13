import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:covid_certificate_shortcut/shared/strings.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  Widget _getPDF() {
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
                return PdfViewPinch(
                    controller: PdfControllerPinch(
                        document: PdfDocument.openFile(provider.path)));
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

  @override
  Widget build(BuildContext context) {
    return _getPDF();
  }
}
