 import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';

class ApiSourcesForgot   {
DioConsumer dioConsumer;
ApiSourcesForgot({
    required this.dioConsumer,
});

forgotPassword({required String email}) async {
  try {
    final response = await dioConsumer.post(
      EndPoint.forgotPassword,
      data: {'email': email},
    );
    return response;
  } catch (e) {
    rethrow;
  }
}
verifyOTP({required String email, required String codeOTP}) async {
  try {
    final response = await dioConsumer.post(
      EndPoint.verifyOTP,
      data: {'email': email, 'otp': codeOTP},
    );
    return response;
  } catch (e) {
    rethrow;
  }
}
resetPassword({required String email, required String otp, required String newPassword, }) async {
  try {
    final response = await dioConsumer.post(
      EndPoint.resetPassword,
      data: {
        'email': email,
        'otp': otp,
        'newPassword': newPassword,
      },
    );
    return response;
  } catch (e) {
    rethrow;
  }
}
resentOTP({required String email}) async {
  try {
    final response = await dioConsumer.post(
      EndPoint.resentOTP,
      data: {'email': email},
    );
    return response;
  } catch (e) {
    rethrow;
  }
}

 }