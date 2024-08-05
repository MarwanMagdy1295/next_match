import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/splash_screen/presentation/ui/splash_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: const Locale('en'),
      // Locale(di<PrefsService>()
      //     .locale
      //     .get()),
      //const Locale('en'), //Locale(Platform.localeName.split('_')[0]),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Next Match',
          theme: ThemeData(
            fontFamily: 'Cairo',
            sliderTheme: const SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              thumbColor: AppColors.lightGreen,
            ),
            primaryColor: AppColors.white,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.all(AppColors.black),
            ),
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.black,
              elevation: 0,
              titleTextStyle: AppTheme.textTheme.displayLarge,
              centerTitle: true,
              toolbarTextStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              foregroundColor: AppColors.white,
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
