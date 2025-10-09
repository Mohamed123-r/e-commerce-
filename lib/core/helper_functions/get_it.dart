import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/forgotPassword/data/api_sources/api_sources.dart';
import 'package:e_commerce/features/auth/forgotPassword/domain/repo/forgot_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/forgotPassword/data/repo_impl/forgot_repo_impl.dart';
import '../../features/auth/logIn/data/api_sources/api_sources.dart';
import '../../features/auth/logIn/data/repo_impl/login_repo_impl.dart';
import '../../features/auth/logIn/domain/repo/login_repo.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<ApiSourcesLogin>(
    () => ApiSourcesLogin(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<ApiSourcesForgot>(
    () => ApiSourcesForgot(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiSources: getIt.get<ApiSourcesLogin>()),
  );
  getIt.registerLazySingleton<ForgotRepo>(
    () => ForgotRepoImpl(apiSources: getIt.get<ApiSourcesForgot>()),
  );
}
