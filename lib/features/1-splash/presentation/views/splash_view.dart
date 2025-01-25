import 'package:user_online_shop/features/1-splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
