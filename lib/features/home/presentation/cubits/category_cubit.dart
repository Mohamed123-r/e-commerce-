import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/repo/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryRepo categoryRepo;

  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());

  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    final result = await categoryRepo.getCategory();
    result.fold(
      (l) => emit(CategoryFailure(l.errorMessage)),
      (r) => emit(CategorySuccess(r)),
    );
  }
}
