import 'package:covid_certificate_shortcut/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget body;

  const CustomCard({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.lightRed, AppColors.red]),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0))),
                padding: const EdgeInsets.all(3),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                )),
            Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(3),
                // color: Colors.blueAccent,
                child: body)
          ],
        ),
      ),
    );
  }
}
