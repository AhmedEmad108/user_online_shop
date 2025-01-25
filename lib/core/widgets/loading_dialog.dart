import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

loadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: Lottie.asset(
        Assets.imagesLoading,
        height: 200,
        width: 200,
      ),
    ),
  );
}
