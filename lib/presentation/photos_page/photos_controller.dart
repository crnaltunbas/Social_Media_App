import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/data/model/photos_model/photos_model.dart';

import '../../data/datasource/network/ApiClient.dart';
import '../../data/repository/repositoryImpl.dart';
import '../../domain/repository/repository.dart';


class PhotosController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;
  init() async {
    client = http.Client();
    apiClient = ApiClient(httpClient: client);
    _repository = RepositoryImpl(apiClient);
    await fetchPhotos();
  }

  List<PhotosModel> _photos = [];
  bool isLoading = false;

  List<PhotosModel> get photos => _photos;
  bool get loading => isLoading;

  Future<void> fetchPhotos() async {
    var isLoading = true;
    notifyListeners();
    await _repository.getAllPhotos().then((value) {
      _photos = value.cast<PhotosModel>();
      isLoading = false;
      notifyListeners();
      return value;
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    }
    );
  }
}