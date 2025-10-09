import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_arrow_back.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_cubit.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_state.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/screen/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/widgets/custom_button_bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper_functions/custom_dialog.dart';
import '../../../../../generated/assets.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key, required this.email});

  static const String routeName = '/verification-code';

  final String email;

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> _codeControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  int _remainingSeconds = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_remainingSeconds > 0 && mounted) {
        setState(() {
          _remainingSeconds--;
        });
        _startTimer();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async {
        if (state is ResendOTPSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is ResendOTPFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is ConfirmNumSuccess) {
          await customSuccess(context, massage: state.message);
        }
        if (state is ConfirmNumFailure) {
          customError(context, massage: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomButtonBottomNavigation(
            title: 'Confirm Code',
            isLoading:
                context.watch<ForgetPasswordCubit>().state is ConfirmNumLoading
                ? true
                : false,
            onPressed: () {
              String code = _codeControllers.map((e) => e.text).join();
              if (code.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter the complete code'),
                  ),
                );
                return;
              }
              context.read<ForgetPasswordCubit>().confirmNum(
                email: widget.email,
                codeOTP: code,
              );
              Navigator.pushNamed(
                context,
                NewPasswordScreen.routeName,
                arguments: [widget.email, code],
              );
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
                    'Verification Code',
                    style: AppTextStyles.style28SemiBold(context),
                  ),
                  Expanded(flex: 1, child: SizedBox(height: 8)),
                  Image.asset(
                    Assets.imagesForgotPasswordImage,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Expanded(flex: 1, child: SizedBox(height: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 45,
                        height: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextFormField(
                          controller: _codeControllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: AppTextStyles.style28SemiBold(context),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.grey9EColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.grey9EColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColors.purpleColor,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              _focusNodes[index + 1].requestFocus();
                            }
                            if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  Expanded(flex: 6, child: SizedBox(height: 8)),

                  _remainingSeconds == 0
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              _remainingSeconds = 30;
                              context.read<ForgetPasswordCubit>().resentOTP(
                                email: widget.email,
                              );
                            });
                            _startTimer();
                          },
                          child: Text(
                            'Resend Code',
                            style: AppTextStyles.style13Regular(context)
                                .copyWith(
                                  color: AppColors.purpleColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        )
                      : RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.style13Regular(
                              context,
                            ).copyWith(color: AppColors.grey9EColor),
                            children: [
                              TextSpan(
                                text:
                                    '00:${_remainingSeconds.toString().padLeft(2, '0')}',
                                style: AppTextStyles.style13Regular(context)
                                    .copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const TextSpan(
                                text: ' resend confirmation code.',
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
