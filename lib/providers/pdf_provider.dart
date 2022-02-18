import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfProvider extends ChangeNotifier {
  String _pdfPath = '';

  String get pdfPath => _pdfPath;

  String _pdfImagePath = '';

  String get pdfImagePath => _pdfImagePath;

  String _qrImagePath = '';

  String get qrImagePath => _qrImagePath;


  setFile(File tmp) {
    _saveQR(tmp.readAsBytesSync());
    notifyListeners();
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var qrImagePath = prefs.getString("qrImagePath");
    var pdfPath = prefs.getString("pdfPath");
    if (qrImagePath != null && pdfPath != null) {
      _pdfPath = pdfPath.toString();
      _qrImagePath = qrImagePath.toString();
    }
  }

  Future<bool> addCertificatePressed() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      _pdfPath = result.files.single.path.toString();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('pdfPath', _pdfPath);
      await _convertPdfToImage(_pdfPath);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future _convertPdfToImage(path) async {
    var document = await PdfDocument.openFile(path);
    var page = await document.getPage(1);
    final pageImage = await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageImageFormat.jpeg);
    await page.close();

    await _saveImage(pageImage!.bytes);
  }

  Future _saveQR(imageRaw) async {
    _qrImagePath = base64Encode(imageRaw);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('qrImagePath', _qrImagePath);

    notifyListeners();
  }

  Future _saveImage(imageRaw) async {
    final dir = await getExternalStorageDirectory();
    _pdfImagePath = dir!.path + "/qr_cert.jpeg";
    File imageFile = File(_pdfImagePath);
    if (!await imageFile.exists()) {
      imageFile.create(recursive: true);
    }
    imageFile.writeAsBytes(imageRaw!);
  }
}
