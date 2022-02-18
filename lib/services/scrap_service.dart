import 'dart:developer';

import 'package:covid_certificate_shortcut/shared/covid_stats_helper.dart';
import 'package:web_scraper/web_scraper.dart';

class ScrapService {
  static Future<String> get() async {
    final webScraper = WebScraper(CovidStatsHelper.source);
    try {
      if (await webScraper.loadWebPage(CovidStatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(CovidStatsHelper.infected24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getConfirmedCases() async {
    final webScraper = WebScraper(CovidStatsHelper.source);
    try {
      if (await webScraper.loadWebPage(CovidStatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(CovidStatsHelper.infected24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getTestedCases() async {
    final webScraper = WebScraper(CovidStatsHelper.source);
    try {
      if (await webScraper.loadWebPage(CovidStatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(CovidStatsHelper.tested24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }

  static Future<String> getDeathCases() async {
    final webScraper = WebScraper(CovidStatsHelper.source);
    try {
      if (await webScraper.loadWebPage(CovidStatsHelper.path)) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement(CovidStatsHelper.deceased24hours, []);
        return elements[0]['title'];
      }
    } on WebScraperException catch (e) {
      log(e.errorMessage().toString());
    }
    return 'There has been an error';
  }
}
