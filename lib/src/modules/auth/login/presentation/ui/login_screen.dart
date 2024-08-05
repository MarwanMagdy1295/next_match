import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/forget_password/presentation/ui/forget_password.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 52.0.h,
          left: 44.0.w,
          right: 44.0.w,
        ),
        width: double.maxFinite,
        child: customButton(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const MainScreen(),
            //   ),
            // );
          },
          title: 'login_screen.login.tr()',
          titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
            color: AppColors.white,
            fontSize: 16.0.sp,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.all(14.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.sizeOf(context).height.h,
        width: MediaQuery.sizeOf(context).width.w,
        decoration: BoxDecoration(
            // image: DecorationImage(
            // image: Assets.images.backgroundImage.provider(),
            // fit: BoxFit.fill,
            // ),
            ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 160.0.h,
                    margin: EdgeInsets.symmetric(horizontal: 24.0.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.r),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width.w,
                    padding: EdgeInsets.only(bottom: 20.0.h),
                    height: 140.0.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40.r),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'login_screen.login.tr()',
                        style: AppTheme.textTheme.displayMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Container(
                height: MediaQuery.sizeOf(context).height.h,
                margin:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.0.h),
                padding: EdgeInsets.all(20.0.w),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen.withOpacity(.15),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                ),
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 80.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'login_screen.welcome_back.tr()',
                          style: AppTheme.textTheme.displayMedium!.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Constatnts.height10,
                        Text(
                          'login_screen.please_enter_your_data.tr()',
                          style: AppTheme.textTheme.displaySmall!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0.sp,
                          ),
                        ),
                        Constatnts.height30,
                        customTextFeild(
                          title: 'login_screen.user_name.tr()',
                          isTitileAviable: true,
                          hint: 'login_screen.user_name.tr()',
                          hintStyle:
                              AppTheme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.white,
                          ),
                          titleStyle:
                              AppTheme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.white,
                            fontSize: 12.0.sp,
                          ),
                          contentStyle:
                              AppTheme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            fontSize: 14.0.sp,
                          ),
                          keyboardType: TextInputType.text,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Constatnts.height16,
                        customTextFeild(
                          title: 'login_screen.password.tr()',
                          isTitileAviable: true,
                          obscureText: true,
                          hint: 'login_screen.password.tr()',
                          hintStyle:
                              AppTheme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.white,
                            fontSize: 16.0.sp,
                          ),
                          titleStyle:
                              AppTheme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.white,
                            fontSize: 14.0.sp,
                          ),
                          contentStyle:
                              AppTheme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                          keyboardType: TextInputType.text,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Constatnts.height10,
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              ' login_screen.forget_password.tr()',
                              style: AppTheme.textTheme.titleLarge?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
