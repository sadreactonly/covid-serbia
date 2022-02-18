import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pdf_provider.dart';
class QrCodeActionBar extends StatelessWidget {
  const QrCodeActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PdfProvider>(
      builder: (context, provider, child) {
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  var isAdded =
                  await provider.addCertificatePressed();
                  if (isAdded) {
                    await Navigator.pushNamed(context, '/crop');
                  }
                },
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pdf-view');
                },
                icon: const Icon(Icons.zoom_in_outlined)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.watch_outlined))
          ],
        );
      },
    );
  }
}
