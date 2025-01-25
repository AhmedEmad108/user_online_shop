import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('===========================User is currently signed out!');
    //   } else {
    //     print('=====================User is signed in!');
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.imagesOnlineShop,
      ),
    );
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   SignInView.routeName,
      //   (route) => false,
      // );
      var isLogin = FirebaseAuth.instance.currentUser != null;
      // var emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (isLogin) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainView.routeName,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          SignInView.routeName,
          (route) => false,
        );
      }
    });
  }
}
