import 'package:e_commerce/features/auth/forgotPassword/presentation/screen/new_password_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/forgotPassword/presentation/screen/forgot_password_screen.dart';
import '../../features/auth/forgotPassword/presentation/screen/verification_code_screen.dart';
import '../../features/auth/logIn/presentation/screen/logIn_screen.dart';
import '../../features/auth/signUp/presentation/screen/sign_up.dart';

import '../../features/auth/start_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/home/presentation/screen/product_detail_screen.dart';
import '../../features/splash/persentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case StartScreen.routeName:
      return MaterialPageRoute(builder: (_) => StartScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignUpScreen());
    case VerificationCodeScreen.routeName:
      return MaterialPageRoute(builder: (_) => VerificationCodeScreen());
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
    case NewPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_) => NewPasswordScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case ProductDetailScreen.routeName:
      return MaterialPageRoute(builder: (_) => ProductDetailScreen());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
