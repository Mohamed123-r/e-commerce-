 import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';

class ApiSources   {
DioConsumer dioConsumer;
  ApiSources({
    required this.dioConsumer,
});
  login({
    required String email,
    required String password,
  })async{
    return await dioConsumer.post(
      EndPoint.login,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

 }