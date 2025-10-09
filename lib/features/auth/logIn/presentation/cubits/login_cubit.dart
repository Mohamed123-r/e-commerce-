import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(LoginFailure(l.errorMessage)),
      (r) => emit(LoginSuccess(r.accessToken!)),
    );
  }
}
