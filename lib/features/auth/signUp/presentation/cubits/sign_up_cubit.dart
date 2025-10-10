import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/signUp/domain/repo/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    result.fold(
      (l) => emit(SignUpFailure(l.errorMessage)),
      (r) => emit(SignUpSuccess(r)),
    );
  }
}
