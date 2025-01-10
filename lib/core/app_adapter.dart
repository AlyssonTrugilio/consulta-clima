import 'package:http/http.dart' as http;

class AppAdpter { 
  const AppAdpter._();
  static final client = http.Client();
}