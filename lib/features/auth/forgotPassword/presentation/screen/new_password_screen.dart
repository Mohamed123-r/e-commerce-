import 'package:e_commerce/core/helper_functions/validator.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_arrow_back.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_cubit.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_dialog.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.email, required this.otp});

  static const String routeName = '/new-password';
  final String email;
  final String otp;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {

        if (state is ChangePasswordFailure) {
          customError(context, massage: state.message);
        }
        if (state is ChangePasswordSuccess) {
         await customSuccess(context, massage: state.message);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Scaffold(
            bottomNavigationBar: CustomButtonBottomNavigation(
              title: 'Reset Password',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<ForgetPasswordCubit>().changePassword(
                    email: widget.email,
                    otp: widget.otp,
                    newPassword: _passwordController.text,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    CustomArrowBack(),
                    Text(
                      'New Password',
                      style: AppTextStyles.style28SemiBold(context),
                    ),
                    Expanded(child: SizedBox(height: 8)),
                    CustomTextField(
                      controller: _passwordController,
                      title: 'Password',
                      hint: 'Enter new password',
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey9EColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      validator: (value) {
                        return validatePassword(context, value);
                      },
                      onChanged: (_) {
                        if (autovalidateMode == AutovalidateMode.always) {
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      title: 'Confirm Password',
                      hint: 'Re-enter password',
                      obscureText: _obscureConfirmPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey9EColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onChanged: (_) {
                        if (autovalidateMode == AutovalidateMode.always) {
                          setState(() {});
                        }
                      },
                    ),
                    Expanded(child: SizedBox(height: 8)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Please write your new password.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.style13Regular(
                          context,
                        ).copyWith(color: AppColors.grey9EColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
