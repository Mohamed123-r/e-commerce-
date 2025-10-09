import 'dart:math';

import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/screen/forgot_password_screen.dart';
import 'package:e_commerce/features/auth/logIn/presentation/cubits/login_cubit.dart';
import 'package:e_commerce/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/helper_functions/custom_dialog.dart';
import '../../../../../core/helper_functions/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await customSuccess(context, massage: "Login Successful");
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          CacheHelper.sharedPreferences.setString(kToken, state.accessToken);
          CacheHelper.sharedPreferences.setBool(kIsLogin, true);
        }
        if (state is LoginFailure) {
          customError(context, massage: state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Scaffold(
            bottomNavigationBar: CustomButtonBottomNavigation(
              title: 'Login',
              isLoading: context.watch<LoginCubit>().state is LoginLoading
                  ? true
                  : false,
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                    email: _emailController.text,
                    password: _passwordController.text,
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
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: AppColors.greyFAColor,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Welcome',
                      style: AppTextStyles.style28SemiBold(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Please enter your data to continue',
                      style: AppTextStyles.style15Regular(
                        context,
                      ).copyWith(color: AppColors.grey9EColor),
                    ),
                    Expanded(child: SizedBox(height: 8)),
                    CustomTextField(
                      controller: _emailController,
                      title: 'Email',
                      hint: 'Example@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(context, value),
                      onChanged: (value) {
                        if (_formKey.currentState != null) {
                          _formKey.currentState!.validate();
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: _passwordController,
                      title: 'Password',
                      hint: 'Example@123',
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
                      validator: (value) => validatePassword(context, value),
                      onChanged: (value) {
                        if (_formKey.currentState != null) {
                          _formKey.currentState!.validate();
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordScreen.routeName,
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: AppTextStyles.style15Regular(
                            context,
                          ).copyWith(color: AppColors.redColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remember me',
                          style: AppTextStyles.style13Regular(context),
                        ),
                        Switch(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value;
                            });
                          },
                          activeColor: AppColors.greenColor,
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox(height: 8)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          children: const [
                            TextSpan(
                              text:
                                  'By connecting your account confirm that you agree\nwith our ',
                            ),
                            TextSpan(
                              text: 'Term and Condition',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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
