import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/forgotPassword/data/api_sources/api_sources.dart';
import 'package:e_commerce/features/auth/forgotPassword/domain/repo/forgot_repo.dart';
import 'package:e_commerce/features/auth/signUp/data/api_sources/api_sources_sign_up.dart';
import 'package:e_commerce/features/auth/signUp/data/repo_impl/sign_up_repo_impl.dart';
import 'package:e_commerce/features/auth/signUp/domain/repo/sign_up_repo.dart';
import 'package:e_commerce/features/home/domain/repo/product_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/forgotPassword/data/repo_impl/forgot_repo_impl.dart';
import '../../features/auth/logIn/data/api_sources/api_sources.dart';
import '../../features/auth/logIn/data/repo_impl/login_repo_impl.dart';
import '../../features/auth/logIn/domain/repo/login_repo.dart';
import '../../features/home/data/api_sources/api_sources_home.dart';
import '../../features/home/data/repo_impl/category_repo_impe.dart';
import '../../features/home/data/repo_impl/product_repo_impl.dart';
import '../../features/home/domain/repo/category_repo.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<ApiSourcesLogin>(
    () => ApiSourcesLogin(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<ApiSourcesSignUp>(
    () => ApiSourcesSignUp(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<ApiSourcesForgot>(
    () => ApiSourcesForgot(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<ApiSourcesHome>(
    () => ApiSourcesHome(dioConsumer: getIt.get<DioConsumer>()),
  );

  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiSources: getIt.get<ApiSourcesLogin>()),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(apiSources: getIt.get<ApiSourcesSignUp>()),
  );
  getIt.registerLazySingleton<ForgotRepo>(
    () => ForgotRepoImpl(apiSources: getIt.get<ApiSourcesForgot>()),
  );
  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(apiSources: getIt.get<ApiSourcesHome>()),
  );
  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(apiSources: getIt.get<ApiSourcesHome>()),
  );
}
