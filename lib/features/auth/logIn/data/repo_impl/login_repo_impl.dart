import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/logIn/data/api_sources/api_sources.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper_functions/get_it.dart';
import '../../domain/repo/login_repo.dart';
import '../models/Login_model.dart';





class LoginRepoImpl implements LoginRepo {
    ApiSources apiSources ;
  LoginRepoImpl({required  this.apiSources}) ;

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }){
    return apiSources.login(email: email, password: password);
  }
}
