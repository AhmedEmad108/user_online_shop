import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_online_shop/generated/l10n.dart';

validInput({
  required BuildContext context,
  required String val,
  required String type,
  required int max,
  required int min,
}) {
  if (type == 'userName') {
    if (!GetUtils.isUsername(val)) {
      return S.of(context).not_valid_name;
    }
  }

  if (type == 'text') {
    if (!GetUtils.isUsername(val)) {
      return S.of(context).not_valid_address;
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return S.of(context).not_valid_email;
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return S.of(context).not_valid_phone;
    }
  }
  if (type == 'price') {
    if (!GetUtils.isNum(val)) {
      return S.of(context).not_valid_price;
    }
  }
  if (val.isEmpty) {
    return S.of(context).cant_be_empty;
  }
  if (val.length > max) {
    return '${S.of(context).cant_be_large_than} $max';
  }
  if (val.length < min) {
    return '${S.of(context).cant_be_less_than} $min';
  }
}
