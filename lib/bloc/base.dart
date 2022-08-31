import 'package:rxdart/rxdart.dart';
import '../di/injection_container.dart';
import '../network/api_provider.dart';
import '../repository/repository.dart';


abstract class BaseBloc<T> {
  final repository = RepositoryImpl(apiProvider: sl<ApiProvider>());
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}