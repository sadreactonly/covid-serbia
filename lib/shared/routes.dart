import '../screens/crop_screen.dart';
import '../screens/home_screen.dart';
import '../screens/pdf_screen.dart';

class Routes {
  static String settings = '/settings';
  static String crop = '/crop';
  static String pdfView = '/pdf-view';
  static String home = 'home';
  static var appRoutes = {
    Routes.home: (context) => const HomePage(),
    Routes.crop: (context) => const CropScreen(),
    Routes.pdfView: (context) => const PdfScreen()
  };
}
