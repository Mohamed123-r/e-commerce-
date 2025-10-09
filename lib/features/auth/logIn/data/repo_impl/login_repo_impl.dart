import 'package:logger/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/logIn/data/api_sources/api_sources.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper_functions/get_it.dart';
import '../../domain/repo/login_repo.dart';
import '../models/Login_model.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiSources apiSources;
  final Logger logger = Logger();

  LoginRepoImpl({required this.apiSources});

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiSources.login(email: email, password: password);
      final loginModel = LoginModel.fromJson(response);
      return Right(loginModel);
    } catch (e) {
      logger.e('Login error', error: e);
      return Left(
        ServerFailure(
          (e is ServerException)
              ? e.errorModel.errors["generalErrors"][0]!
              : 'Unexpected error',
        ),
      );
    }
  }
}
