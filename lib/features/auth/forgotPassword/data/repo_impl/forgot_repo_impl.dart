import 'dart:math' as logger;

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/forgotPassword/data/models/forgot_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repo/forgot_repo.dart';
import '../api_sources/api_sources.dart';

class ForgotRepoImpl implements ForgotRepo {
  final ApiSourcesForgot apiSources;

  ForgotRepoImpl({required this.apiSources});

  @override
  Future<Either<Failure, String>> forgetPassword({required String email}) {
    try {
      final response = apiSources.forgotPassword(email: email);
      return Future.value(
        Right(
          "If the email is registered, you will receive an OTP to reset your password",
        ),
      );
    } catch (e) {
      return Future.value(
        Left(ServerFailure('Failed to send OTP to email , please try again')),
      );
    }
  }

  @override
  Future<Either<Failure, String>> resentOTP({required String email}) async {
    try {
      final response = await apiSources.resentOTP(email: email);

      return Future.value(
        Right(
          "If the email is registered, you will receive an OTP to reset your password",
        ),
      );
    } catch (e) {
      return Future.value(
        Left(ServerFailure('Failed to send OTP to email , please try again')),
      );
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) {

    try {
      final response = apiSources.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
      return Future.value(Right("Password reset successfully")
      );
    } catch (e) {
      return Future.value(
        Left(ServerFailure('Failed to reset password , please try again')),
      );
    }
  }
  @override
  Future<Either<Failure, String>> verifyOTP({
    required String email,
    required String codeOTP,
  }) async {
    try {
      final response = await apiSources.verifyOTP(email: email, codeOTP: codeOTP);
      return Right("OTP verified successfully");
    } catch (e) {

      return Left(
        ServerFailure(
          (e is ServerException)
              ? e.errorModel.errors["otp"][0] ?? 'OTP verification failed'
              : 'Unexpected error' ,
        ),
      );
    }
  }
}
