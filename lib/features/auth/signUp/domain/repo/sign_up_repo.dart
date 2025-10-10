import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/signUp/domain/entities/sign_up_entity.dart';
import '../../../../../core/errors/failure.dart';


abstract class SignUpRepo {
  Future<Either<Failure,String >> signUp ({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
