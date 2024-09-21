import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../model/posts_model/posts_model.dart';
import '../../model/user_model/user_model.dart';

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

  Future<List<UserModel>> getUsersFromApi() async {
    final response = await httpClient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      Logger().i(jsonData);
      return jsonData.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Post'ları API'den çekmek için metod
  Future<List<PostModel>> getPostsFromApi() async {
    final response = await httpClient.get(Uri.parse('${baseUrl}posts'));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      logger.i(jsonData);
      return jsonData.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
