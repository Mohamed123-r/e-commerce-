import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';

class ApiSourcesSignUp {


  DioConsumer dioConsumer;
  ApiSourcesSignUp({
    required this.dioConsumer,
  });


  signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  one,
  }) async {
    try {
      final response = await dioConsumer.post(
        EndPoint.signUp,
        data: {

          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}