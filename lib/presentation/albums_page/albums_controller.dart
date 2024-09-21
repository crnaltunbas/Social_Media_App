import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/model/album_model/album_model.dart';
import '../models/album_model.dart';

class AlbumController {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> albumJson = json.decode(response.body);
      return albumJson.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<void> deleteAlbum(int albumId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$albumId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete the album.');
    }
  }
}
