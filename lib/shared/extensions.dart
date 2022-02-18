import 'package:flutter/material.dart';

extension StringExtensions on String {
  String parseCovidStats() => replaceAll(RegExp(r'[^\w\s]+'), '');


  String countryCodeToFlag(){
    switch(this){
      case 'sr':
        return 'RS';
      case 'en':
        return 'GB';
      default:
        return 'RS';
    }
  }
}