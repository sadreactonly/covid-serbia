import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfProvider extends ChangeNotifier {
  String _path = '';

  String get path => _path;

  String _pdfImagePath = '';

  String get pdfImagePath => _pdfImagePath;

  String _qrImagePath = '';

  String get qrImagePath => _qrImagePath;

  setFile(File tmp) {
    _saveQR(tmp.readAsBytesSync());
    notifyListeners();
  }

  Future<bool> doesPathExist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pdfPath = prefs.getString("qrImagePath");
    if (pdfPath != null) {
      _qrImagePath = pdfPath.toString();
      return true;
    }
    return false;
  }

  Future addCertificatePressed() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      await _convertPdfToImage(result.files.single.path.toString());

      notifyListeners();
    }
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

  String _base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future _saveQR(imageRaw) async {
    _qrImagePath = _base64String(imageRaw);

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
