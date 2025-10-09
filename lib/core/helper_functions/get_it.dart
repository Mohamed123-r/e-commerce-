import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/logIn/data/api_sources/api_sources.dart';
import '../../features/auth/logIn/data/repo_impl/login_repo_impl.dart';
import '../../features/auth/logIn/domain/repo/login_repo.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<ApiSources>(
    () => ApiSources(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiSources: getIt.get<ApiSources>()),
  );
}
