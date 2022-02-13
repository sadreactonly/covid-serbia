import 'dart:async';
import 'dart:io';

import 'package:covid_certificate_shortcut/providers/pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:provider/provider.dart';

class CropScreen extends StatefulWidget {
  static const routeName = '/crop';

  const CropScreen({Key? key}) : super(key: key);

  @override
  _CropImageScreenState createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropScreen> {
  final cropKey = GlobalKey<CropState>();
  File? _lastCropped;
  double finalAngle = 0;

  @override
  void dispose() {
    super.dispose();
    if (_lastCropped != null) {
      _lastCropped!.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Icon(
            Icons.crop_outlined,
          ),
        ),
        body: _buildCroppingImage());
  }

  Widget _buildCroppingImage() {
    return Column(
      children: <Widget>[
        Consumer<PdfProvider>(builder: (context, provider, child) {
          return Expanded(
              flex: 85,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Crop.file(
                  File(provider.pdfImagePath),
                  maximumScale: 2,
                  key: cropKey,
                  aspectRatio: 3.0 / 3.0,
                ),
              ));
        }),
        Expanded(
            flex: 15,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(
                        Icons.crop_outlined,
                      ),
                      onPressed: _cropImage),
                ],
              ),
            ))
      ],
    );
  }

  Future<void> _cropImage() async {
    final scale = cropKey.currentState!.scale;
    final area = cropKey.currentState!.area;

    if (area == null) {
      return;
    }

    var imageToCrop =
        Provider.of<PdfProvider>(context, listen: false).pdfImagePath;

    final sample = await ImageCrop.sampleImage(
      file: File(imageToCrop),
      preferredSize: (5000 / scale).round(),
    );

    final croppedImage = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    Provider.of<PdfProvider>(context, listen: false).setFile(croppedImage);
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
