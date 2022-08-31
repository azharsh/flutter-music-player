

import 'package:flutter_music_player/model/music_response.dart';
import 'package:flutter_music_player/network/api_provider.dart';


abstract class Repository {

  final apiProvider = ApiProvider();

  Future<MusicResponse?> getMusic(String term) => apiProvider.getMusic(term);

}

class RepositoryImpl implements Repository{

  final ApiProvider apiProvider;

  RepositoryImpl({required this.apiProvider});

  @override
  Future<MusicResponse?> getMusic(String term) async {
    try {
      final response = await apiProvider.getMusic(term);
      return response;
    } catch (ex) {
      return null;
    }

  }


}