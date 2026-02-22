import 'package:url_launcher/url_launcher.dart';

class Services {
  Future<void> launchURL({required String url}) async {
    await launchUrl(Uri.parse(url));
  }
}
