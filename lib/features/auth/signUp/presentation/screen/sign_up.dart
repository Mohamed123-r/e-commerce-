import 'package:e_commerce/core/helper_functions/validator.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_arrow_back.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        bottomNavigationBar: CustomButtonBottomNavigation(
          title: 'Sign Up',
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // TODO: Implement sign up logic
            }
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                CustomArrowBack(),
                Text('Sign Up', style: AppTextStyles.style28SemiBold(context)),
                Expanded(child: SizedBox(height: 8)),
                CustomTextField(
                  controller: _usernameController,
                  title: 'Username',
                  hint: 'Enter your username',
                  keyboardType: TextInputType.name,
                  suffixIcon: const Icon(Icons.check, color: Colors.green),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
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
                        'Strong',
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
                          });
                        },
                      ),
                    ],
                  ),
                  validator: (value) {
                    return validatePassword(value);
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _emailController,
                  title: 'Email Address',
                  hint: 'Example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Icon(Icons.check, color: Colors.green),
                  validator: (value) {
                    return validateEmail(value);
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
                Expanded(child: SizedBox(height: 8)),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
