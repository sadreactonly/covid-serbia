import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:covid_certificate_shortcut/providers/stats_provider.dart';
import 'package:covid_certificate_shortcut/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/routes.dart';
import '../theme/theme_data.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Provider.of<StatsProvider>(context, listen: false).init();
    await Provider.of<PdfProvider>(context, listen: false).init();
    Navigator.popAndPushNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appBackground,
        child:
        Center(
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loading", style: TextStyle(color: AppColors.red, fontSize: 25),),

                  SizedBox(
                    height: 5,
                    width: 200,
                    child: LinearProgressIndicator(
                      backgroundColor: AppColors.lightBlue,
                      color: AppColors.red,
                    ),
                  )
                ],
              )

        )
    );
  }
}
