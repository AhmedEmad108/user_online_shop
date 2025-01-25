import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user_online_shop/core/cubit/lang_cubit/lang_cubit.dart';
import 'package:user_online_shop/core/cubit/theme_cubit/theme_cubit_cubit.dart';
import 'package:user_online_shop/core/cubit/user/user_cubit.dart';
import 'package:user_online_shop/core/helper_functions/on_generate_routs.dart';
import 'package:user_online_shop/core/services/custom_bloc_observer.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/core/services/supabase_storage.dart';
import 'package:user_online_shop/core/theme/theme.dart';
import 'package:user_online_shop/features/1-splash/presentation/views/splash_view.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:user_online_shop/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initSupabase();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  setupGetIt();
  await Prefs.init();
  String? lang = Prefs.getString('lang');
  await Prefs.setString(
      'lang',
      lang == null || lang == "" || lang.isEmpty
          ? Platform.localeName == 'ar_EG'
              ? 'ar'
              : 'en'
          : lang);
  String? themeMode = Prefs.getString('themeMode');
  await Prefs.setString(
    'themeMode',
    themeMode == null || themeMode == "" || themeMode.isEmpty
        ? 'light'
        : themeMode,
  );

  runApp(const UserOnlineShop());
}

class UserOnlineShop extends StatelessWidget {
  const UserOnlineShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LangCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(
            getIt<AuthRepo>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LangCubit, LangState>(
            builder: (context, state) {
              final String sharLang = Prefs.getString('lang');
              final String themeMode = Prefs.getString('themeMode');
              return MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale(sharLang),
                title: 'Online Shop',
                theme: themeMode == 'light' ? lightTheme : darkTheme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: onGenerateRoute,
                initialRoute: SplashView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
