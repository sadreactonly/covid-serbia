import 'package:covid_certificate_shortcut/screens/qr_code_screen.dart';
import 'package:covid_certificate_shortcut/shared/routes.dart';
import 'package:covid_certificate_shortcut/theme/colors.dart';
import 'package:covid_certificate_shortcut/widgets/stats_card.dart';
import 'package:flutter/material.dart';

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

  List<Widget> _createAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: _onSettingsPressed,
      )
    ];
  }

  _onSettingsPressed() {
    Navigator.pushNamed(context, Routes.settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blue,
          leading: Padding(
              child: Image.asset("assets/logo.png"),
              padding: const EdgeInsets.all(5)),
          //title: Text(StringResources.title),
          actions: _createAppBarActions()),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.maxFinite,
          child: SingleChildScrollView(
              child: Column(
            children: const [
              QrCodeScreen(),
              StatsCard(
                  title: "БРОЈ ТЕСТИРАНИХ ОСОБА У ПОСЛЕДЊА 24 ЧАСА",
                  number: '111'),
              StatsCard(
                  title: "БРОЈ ПОТВРЂЕНИХ СЛУЧАЈЕВА У ПОСЛЕДЊА 24 ЧАСА",
                  number: '111'),
              StatsCard(
                  title: "БРОЈ ПРЕМИНУЛИХ ОСОБА У ПОСЛЕДЊА 24 ЧАСА",
                  number: '111'),
            ],
          ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
