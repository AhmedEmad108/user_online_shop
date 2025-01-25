import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/cubit/theme_cubit/theme_cubit_cubit.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_listtile.dart';
import 'package:user_online_shop/features/5-profile/data/models/theme_class.dart';
import 'package:user_online_shop/generated/l10n.dart';

class CustomChangeThemeItem extends StatelessWidget {
  const CustomChangeThemeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ThemeClass> themeList = [
      ThemeClass(theme: 'light', name: S.of(context).light_mode),
      ThemeClass(theme: 'dark', name: S.of(context).dark_mode),
    ];
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        String theme = Prefs.getString('themeMode');
        return CustomListTile(
          title: S.of(context).change_theme,
          icon: Icons.dark_mode_outlined,
          trailing: DropdownButton<String>(
            value: theme,
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(8),
            elevation: 0,
            items: [
              for (var i = 0; i < themeList.length; i++)
                DropdownMenuItem<String>(
                  value: themeList[i].theme,
                  child: Text(
                    themeList[i].name,
                    style: AppStyle.styleSemiBold22(),
                  ),
                ),
            ],
            onChanged: (value) {
              context.read<ThemeCubit>().changeTheme(themeMode: value!);
            },
          ),
        );
      },
    );
  }
}
