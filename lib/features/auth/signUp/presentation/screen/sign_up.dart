import 'package:e_commerce/core/helper_functions/custom_dialog.dart';
import 'package:e_commerce/core/helper_functions/validator.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_arrow_back.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/logIn/presentation/screen/logIn_screen.dart';
import 'package:e_commerce/features/auth/signUp/presentation/cubits/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/signUp/presentation/screen/verification_code_from_sign_upscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = true;
  String value = '';

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUpFailure) {
          customError(context, massage: state.message);
        }
        if (state is SignUpSuccess) {
          await customSuccess(context, massage: state.message);

          Navigator.pushNamed(
            context,
            VerificationCodeSignUpScreen.routeName,
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
              title: 'Sign Up',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<SignUpCubit>().signUp(
                    lastName: _lastNameController.text,
                    firstName: _firstNameController.text,
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
                    CustomArrowBack(),
                    Text(
                      'Sign Up',
                      style: AppTextStyles.style28SemiBold(context),
                    ),
                    Expanded(child: SizedBox(height: 8)),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _firstNameController,

                              title: 'First Name',
                              hint: 'Enter your first name',
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                validateName(context, value);
                              },
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              controller: _lastNameController,
                              title: 'Last Name',
                              hint: 'Enter your Last name',
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                validateName(context, value);
                              },
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              controller: _emailController,
                              title: 'Email Address',
                              hint: 'Example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return validateEmail(context, value);
                              },
                            ),
                            const SizedBox(height: 24),

                            CustomTextField(
                              controller: _passwordController,
                              title: 'Password',
                              hint: 'Example@123',
                              obscureText: _obscurePassword,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    value,
                                    style: AppTextStyles.style13Regular(
                                      context,
                                    ).copyWith(color: AppColors.greenColor),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey9EColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;

                                        if (_formKey.currentState != null) {
                                          _formKey.currentState!.validate();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              validator: (value) {
                                return validatePassword(context, value);
                              },
                              onChanged: (text) {
                                setState(() {
                                  value = checkPasswordStrength(text);
                                });
                              },
                            ),
                            const SizedBox(height: 24),
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
                          ],
                        ),
                      ),
                    ),

                    Expanded(child: SizedBox(height: 0)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String checkPasswordStrength(String text) {
    if (text.length >= 8) {
      if (RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!#%*?&])[A-Za-z\d@$!#%*?&]{8,}$',
      ).hasMatch(text)) {
        return "Strong";
      } else if (RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$',
      ).hasMatch(text)) {
        return "Medium";
      } else {
        return "Weak";
      }
    } else {
      return "Too Short";
    }
  }
}
