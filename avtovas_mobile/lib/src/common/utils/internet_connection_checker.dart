import 'package:http/http.dart' as http;

abstract final class InternetConnectionChecker {
  static Future<bool> pingGoogle() async {
    try {
      const url = 'https://www.google.com/';

      final response = await http
          .get(
        Uri.parse(url),
      )
          .timeout(
        const Duration(seconds: 3),
      );

      return response.statusCode == 200;
    } catch(_) {
      return false;
    }
  }
}
