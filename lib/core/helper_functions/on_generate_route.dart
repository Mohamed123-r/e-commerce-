import 'package:e_commerce/features/auth/forgotPassword/domain/repo/forgot_repo.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/cubits/forgot_cubit.dart';
import 'package:e_commerce/features/auth/forgotPassword/presentation/screen/new_password_screen.dart';
import 'package:e_commerce/features/auth/signUp/presentation/cubits/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/forgotPassword/presentation/screen/forgot_password_screen.dart';
import '../../features/auth/forgotPassword/presentation/screen/verification_code_screen.dart';
import '../../features/auth/logIn/domain/repo/login_repo.dart';
import '../../features/auth/logIn/presentation/cubits/login_cubit.dart';
import '../../features/auth/logIn/presentation/screen/logIn_screen.dart';
import '../../features/auth/signUp/domain/repo/sign_up_repo.dart';
import '../../features/auth/signUp/presentation/screen/sign_up.dart';

import '../../features/auth/signUp/presentation/screen/verification_code_from_sign_upscreen.dart';
import '../../features/auth/start_screen.dart';
import '../../features/home/domain/repo/category_repo.dart';
import '../../features/home/domain/repo/product_repo.dart';
import '../../features/home/presentation/cubits/category_cubit.dart';
import '../../features/home/presentation/cubits/product_cubit.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/home/presentation/screen/product_detail_screen.dart';
import '../../features/splash/persentation/screen/splash_screen.dart';
import 'get_it.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case StartScreen.routeName:
      return MaterialPageRoute(builder: (_) => StartScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => LoginCubit(loginRepo: getIt.get<LoginRepo>()),

          child: LoginScreen(),
        ),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => SignUpCubit(signUpRepo: getIt.get<SignUpRepo>()),

          child: SignUpScreen(),
        ),
      );
    case VerificationCodeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt.get<ForgotRepo>()),

          child: VerificationCodeScreen(email: settings.arguments as String),
        ),
      );
    case VerificationCodeSignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt.get<ForgotRepo>()),

          child: VerificationCodeSignUpScreen(
            email: settings.arguments as String,
          ),
        ),
      );
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt.get<ForgotRepo>()),

          child: ForgotPasswordScreen(),
        ),
      );

    case NewPasswordScreen.routeName:
      List arguments = settings.arguments as List;
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt.get<ForgotRepo>()),

          child: NewPasswordScreen(
            email: arguments[0] as String,
            otp: arguments[1] as String,
          ),
        ),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  ProductCubit(productRepo: getIt.get<ProductRepo>()),
            ),
            BlocProvider(
              create: (context) =>
                  CategoryCubit(categoryRepo: getIt.get<CategoryRepo>()),
            ),
          ],
          child: HomeScreen(),
        ),
      );
    case ProductDetailScreen.routeName:
      return MaterialPageRoute(builder: (_) => ProductDetailScreen());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
