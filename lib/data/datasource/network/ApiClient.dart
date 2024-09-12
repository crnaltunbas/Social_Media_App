import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String endpoint = "";
  final http.Client httpClient;
  final Logger logger =
      Logger(); // Logger'ı burada tanımladık her çağrıda yeni bir logger nesnesi oluşturmayalım diye

  ApiClient(
      {required this.httpClient}); // baseUrl ApiClientta tanımaladığımdan sınıfın içine bi daha eklemedim.
  Future<http.Response?> get(String endpoint) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode != 200) {
      logger.e('Failed request with status : ${response.statusCode}.');
      throw Exception(
          'Failed request with status: ${response.statusCode}.'); //Burada null yerine bir exception fırlattık.
    } else {
      return response;
    }
  }
}
