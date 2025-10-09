import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../data/models/forgot_model.dart';

abstract class ForgotRepo {
  Future<Either<Failure, String>> forgetPassword({required String email});

  Future<Either<Failure, String>> resentOTP({required String email});

  Future<Either<Failure, String>> verifyOTP({
    required String email,
    required String codeOTP,
  });
  Future<Either<Failure, String>> resetPassword({

    required String email,
      required String otp,
      required String newPassword,
  });
}
