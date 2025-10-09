import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';

class ApiSourcesLogin {
  DioConsumer dioConsumer;

  ApiSourcesLogin({required this.dioConsumer});

  login({required String email, required String password}) async {
    try {
      final response = await dioConsumer.post(
        EndPoint.login,
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
