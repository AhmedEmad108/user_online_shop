import 'package:user_online_shop/features/1-splash/presentation/views/splash_view.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_in_view.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_up_view.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/become_seller_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/chang_password/change_password_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/change_email_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_profile/edit_profile_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/profile_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case (SignInView.routeName):
      return MaterialPageRoute(builder: (context) => const SignInView());
    case (MainView.routeName):
      return MaterialPageRoute(builder: (context) => const MainView());
    case (SignUpView.routeName):
      return MaterialPageRoute(builder: (context) => const SignUpView());

    // case (CheckEmailView.routeName):
    //   return MaterialPageRoute(builder: (context) => const CheckEmailView());

    // case (VerifyCodeResetPassView.routeName):
    //   return MaterialPageRoute(
    //       builder: (context) => VerifyCodeResetPassView(
    //             email: settings.arguments as String,
    //           ));

    // case (ResetPasswordView.routeName):
    //   return MaterialPageRoute(builder: (context) => const ResetPasswordView());

    // case (SuccessResetPasswordView.routeName):
    //   return MaterialPageRoute(
    //       builder: (context) => const SuccessResetPasswordView());
    // case (DashboardView.routeName):
    //   return MaterialPageRoute(builder: (context) => const DashboardView());
    case (ProfileView.routeName):
      return MaterialPageRoute(builder: (context) => const ProfileView());
    // case (AddCategoryView.routeName):
    //   return MaterialPageRoute(builder: (context) => const AddCategoryView());
    // case (CategoryView.routeName):
    //   return MaterialPageRoute(builder: (context) => const CategoryView());
    // case (EditCategoryView.routeName):
    //   return MaterialPageRoute(
    //       builder: (context) => EditCategoryView(
    //             categories: settings.arguments as CategoryEntity,
    //           ));
    // case (AddProductView.routeName):
    //   return MaterialPageRoute(builder: (context) => const AddProductView());
    // case (ProductView.routeName):
    //   return MaterialPageRoute(builder: (context) => const ProductView());
    // case (EditProductView.routeName):
    //   return MaterialPageRoute(
    //     builder: (context) {
    //       final arguments =
    //           settings.arguments as Map<String, dynamic>; // فك الخريطة
    //       final product =
    //           arguments['product'] as ProductEntity; // استخرج المنتج
    //       final isDes = arguments['isDes']
    //           as bool?; // استخرج الـ isDes (يمكن أن يكون null)
    //       return EditProductView(
    //         product: product,
    //         isDes: isDes,
    //       );
    //     },
    //   );
    // case (DesProductView.routeName):
    //   final args = settings.arguments as DesProductView;

    //   return MaterialPageRoute(
    //     builder: (context) => DesProductView(
    //       product: args.product,
    //     ),
    //   );
    case (EditProfileView.routeName):
      return MaterialPageRoute(builder: (context) => EditProfileView());
    case (ChangeEmailView.routeName):
      return MaterialPageRoute(builder: (context) => ChangeEmailView());
    case (ChangePasswordView.routeName):
      return MaterialPageRoute(builder: (context) => ChangePasswordView());
    case (BecomeSellerView.routeName):
      return MaterialPageRoute(builder: (context) => BecomeSellerView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
