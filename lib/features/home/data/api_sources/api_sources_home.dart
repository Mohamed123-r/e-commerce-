import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';

class ApiSourcesHome {
  DioConsumer dioConsumer;

  ApiSourcesHome({required this.dioConsumer});

  getProducts() async {
    try {
      final response = await dioConsumer.get(EndPoint.getProducts);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  getCategories() async {
    try {
      final response = await dioConsumer.get(EndPoint.getCategories);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
