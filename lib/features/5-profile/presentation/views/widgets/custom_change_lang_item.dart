import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/cubit/lang_cubit/lang_cubit.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_listtile.dart';
import 'package:user_online_shop/features/5-profile/data/models/lang_class.dart';
import 'package:user_online_shop/generated/l10n.dart';

class CustomChangeLangItem extends StatefulWidget {
  const CustomChangeLangItem({
    super.key,
  });

  @override
  State<CustomChangeLangItem> createState() => _CustomChangeLangItemState();
}

class _CustomChangeLangItemState extends State<CustomChangeLangItem> {
  @override
  Widget build(BuildContext context) {
    List<LangClass> langList = [
      LangClass(locale: 'en', name: S.of(context).english),
      LangClass(locale: 'ar', name: S.of(context).arabic),
    ];
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        String sharLang = Prefs.getString('lang');
        return CustomListTile(
          title: S.of(context).change_language,
          icon: Icons.language_outlined,
          trailing: DropdownButton<String>(
            value: sharLang,
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(8),
            elevation: 0,
            items: [
              for (var i = 0; i < langList.length; i++)
                DropdownMenuItem<String>(
                  value: langList[i].locale,
                  child: Text(
                    langList[i].name,
                    style: AppStyle.styleSemiBold22(),
                  ),
                ),
            ],
            onChanged: (value) {
              context.read<LangCubit>().changeLang(lang: value!);
            },
          ),
        );
      },
    );
  }
}
