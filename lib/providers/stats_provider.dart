import 'package:covid_certificate_shortcut/services/scrap_service.dart';
import 'package:flutter/foundation.dart';

class StatsProvider extends ChangeNotifier {
  String _tested24hours = '';

  String get tested24hours => _tested24hours;

  String _infected24hours = '';

  String get infected24hours => _infected24hours;

  String _deceased24hours = '';

  String get deceased24hours => _deceased24hours;

  Future<void> init() async {
    _deceased24hours = await ScrapService.getDeathCases();
    _infected24hours = await ScrapService.getConfirmedCases();
    _tested24hours = await ScrapService.getTestedCases();
    notifyListeners();
  }

  Future<void> update() async {
    _deceased24hours = await ScrapService.getDeathCases();
    _infected24hours = await ScrapService.getConfirmedCases();
    _tested24hours = await ScrapService.getTestedCases();
    notifyListeners();
  }
}
