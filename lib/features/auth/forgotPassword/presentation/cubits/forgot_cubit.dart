import 'package:e_commerce/features/auth/forgotPassword/domain/repo/forgot_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgotPasswordRepo) : super(ForgetPasswordInitial());

  final ForgotRepo forgotPasswordRepo;

  void sendCode({required String email}) async {
    emit(SendCodeLoading());

    final result = await forgotPasswordRepo.forgetPassword(email: email);

    result.fold(
      (l) => emit(SendCodeFailure(l.errorMessage)),
      (r) => emit(
        SendCodeSuccess("If the email is registered, you will receive an OTP to reset your password"),
      ),
    );
  }

  void resentOTP({required String email}) async {
    emit(ResendOTPLoading());

    final result = await forgotPasswordRepo.forgetPassword(email: email);

    result.fold(
      (l) => emit(ResendOTPFailure(l.errorMessage)),
      (r) => emit(
        ResendOTPSuccess("Successfully sent code, please check your email"),
      ),
    );
  }

  confirmNum({required String email, required String codeOTP}) async {
    emit(ConfirmNumLoading());

    final result = await forgotPasswordRepo.verifyOTP(
      email: email,
      codeOTP: codeOTP,
    );

    result.fold(
      (l) => emit(ConfirmNumFailure(l.errorMessage)),
      (r) => emit(ConfirmNumSuccess(r)),
    );
  }

  Future<void> changePassword({
    required String email,
    required String otp,
    required String newPassword,

  }) async {
    emit(ChangePasswordLoading());
    final result = await forgotPasswordRepo.resetPassword(
      email: email,
      otp:otp,
      newPassword: newPassword,
    );

    result.fold(
      (l) => emit(ChangePasswordFailure(l.errorMessage)),
      (r) => emit(ChangePasswordSuccess(r)),
    );
  }
}
