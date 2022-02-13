import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  initState() {
    super.initState();
  }

  Widget _getSettingsBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<PdfProvider>(builder: (context, provider, child) {
          return Center(
              child: ElevatedButton(
                  child: const Text('Dodaj sertifikat'),
                  onPressed: () async {
                    await provider.addCertificatePressed();
                    await Navigator.pushNamed(context, '/crop');
                  }));
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: FittedBox(
          child: Row(children: const [
            Icon(Icons.settings),
            Text("Settings"),
          ]),
        )),
        body: _getSettingsBody());
  }
}
