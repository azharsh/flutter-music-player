import 'package:flutter_music_player/network/api_provider.dart';
import 'package:get_it/get_it.dart';
import 'dart:io';

import '../repository/repository.dart';


final sl = GetIt.instance;

Future<void> init() async {

  final httpClient = HttpClient();
  final apiProvider = ApiProvider();

  sl.registerLazySingleton(() => httpClient);
  sl.registerLazySingleton(() => apiProvider);

  sl.registerLazySingleton<Repository>(
          () => RepositoryImpl(apiProvider:sl()));




}