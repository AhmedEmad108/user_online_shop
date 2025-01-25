import 'package:flutter/material.dart';

import '../utils/app_style.dart';

AppBar customAppBar(BuildContext context,
    {required String title, bool? icon = false, Widget? trailing,PreferredSizeWidget? bottom
}) {
  return AppBar(
    leading: icon == true
        ? GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          )
        : null,
    title: Text(
      title,
      style: AppStyle.styleBold30(),
    ),
    centerTitle: true,
    elevation: 0,
    actions: [trailing ?? const SizedBox()],
    bottom: bottom,
    // backgroundColor: AppColor.transparent,
    // iconTheme: const IconThemeData(color: AppColor.black),
    // foregroundColor: AppColor.black,
  );
}
