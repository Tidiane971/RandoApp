import 'package:url_launcher/url_launcher.dart';
import 'page.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(String name, String city) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$name , $city';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
