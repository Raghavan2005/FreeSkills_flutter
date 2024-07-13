import 'package:http/http.dart' as http;

class ImageNetworkProvider {
  static Future<String> getProfileLink(String username) async {
    if (username != null) {
      final String url =
          'https://ui-avatars.com/api/?name=$username&bold=true&size=128';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return url;
      } else {
        throw Exception('Failed to generate profile link');
      }
    } else {
      return "Null Value Not Supported";
    }
  }
}
