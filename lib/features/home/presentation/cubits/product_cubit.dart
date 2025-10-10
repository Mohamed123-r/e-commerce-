import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo productRepo;
  ProductCubit({required this.productRepo}) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (l) => emit(ProductFailure(l.errorMessage)),
      (r) => emit(ProductSuccess(r)),
    );
  }
}
