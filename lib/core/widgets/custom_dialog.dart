import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_style.dart';

customDialog(BuildContext context,
    {required String title,
    String? content,
    String? image,
    String? textOk,
    void Function()? onPressed}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image == null
              ? Container()
              : SvgPicture.asset(
                  image,
                  height: 100,
                  width: 100,
                ),
          SizedBox(
            height: image == null ? 0 : 16,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyle.styleBold22(),
          ),
        ],
      ),
      content: onPressed == null || content == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // content == null
                //     ? const SizedBox(
                //         height: 0,
                //       )
                //     :
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: AppStyle.styleRegular22(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColor.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColor.red),
                        ),
                      ),
                      child: Text(textOk ?? S.of(context).delete),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColor.primaryColor),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // غلق النافذة
                      },
                      child: Text(S.of(context).cancel),
                    ),
                  ],
                )
              ],
            ),
    ),
  );
}
