
import 'dart:convert';

import 'package:flutter_music_player/model/music_response.dart';
import 'package:flutter_music_player/network/endpoint.dart';
import "package:http/http.dart" show Client, StreamedResponse;
import "package:http/http.dart" as http;


class ApiProvider {
  Client client = Client();

  Future<MusicResponse?> getMusic(String term) async {

    final response = await client.get(Uri.parse("${EndPoint.baseApi}?term=$term"));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return MusicResponse.fromMap(json.decode(response.body));
      } else {
        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }


}