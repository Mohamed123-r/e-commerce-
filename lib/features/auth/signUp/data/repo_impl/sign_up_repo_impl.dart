import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';

import 'package:e_commerce/features/auth/signUp/domain/entities/sign_up_entity.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/repo/sign_up_repo.dart';
import '../api_sources/api_sources_sign_up.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiSourcesSignUp apiSources;

  SignUpRepoImpl({required this.apiSources});

  @override
  Future<Either<Failure, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    try {
      final response = apiSources.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      return Future.value(
        Right(
          "Registeration Successfull, an otp is sent to your email inbox please use it to verify your email.",
        ),
      );
    } catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            (e is ServerException)
                ? e.errorModel.errors["email"][0]!
                : 'Email is already in use.',
          ),
        ),
      );
    }
  }

  // Add your implementation here
}
