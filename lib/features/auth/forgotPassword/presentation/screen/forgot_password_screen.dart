import 'package:e_commerce/core/helper_functions/validator.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_arrow_back.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_cubit.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/screen/verification_code_screen.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_dialog.dart';
import '../cubits/forgot_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const String routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {
        if (state is SendCodeFailure) {
          customError(context, massage: state.message);
        }
        if (state is SendCodeSuccess) {
          await customSuccess(context, massage: state.message);
          Navigator.pushNamed(
            context,
            VerificationCodeScreen.routeName,
            arguments: _emailController.text,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Scaffold(
            bottomNavigationBar: CustomButtonBottomNavigation(
              title: 'Confirm Mail',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<ForgetPasswordCubit>().sendCode(
                    email: _emailController.text,
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
                      'Forgot Password',
                      style: AppTextStyles.style28SemiBold(context),
                    ),
                    Expanded(flex: 1, child: SizedBox(height: 8)),
                    Image.asset(
                      Assets.imagesForgotPasswordImage,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Expanded(flex: 1, child: SizedBox(height: 8)),
                    CustomTextField(
                      controller: _emailController,
                      title: 'Email Address',
                      hint: 'Enter your email',
                      onChanged: (_) {
                        if (autovalidateMode == AutovalidateMode.always) {
                          setState(() {});
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return validateEmail(context, value);
                      },
                    ),
                    Expanded(flex: 6, child: SizedBox(height: 8)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Please write your email to receive a\nconfirmation code to set a new password.',
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
