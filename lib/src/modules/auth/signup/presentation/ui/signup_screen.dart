// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/ui/otp_screen.dart';
import 'package:next_match/src/modules/auth/signup/presentation/controller/cubit/signup_screen_cubit.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocProvider(
          create: (BuildContext context) => SignupScreenCubit(),
          child: Builder(builder: (context) {
            final cubit = context.watch<SignupScreenCubit>();
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              color: AppColors.background,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Constatnts.height20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              signup_screen.signup.tr(),
                              style:
                                  AppTheme.textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height52,
                        Row(
                          children: [
                            Text(
                              signup_screen.signup_title.tr(),
                              style: AppTheme.textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height14,
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              signup_screen.signup_sub_title.tr(),
                              style: AppTheme.textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.paragraphs),
                            ),
                          ],
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.darkGrey),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginScreen(),
                                    ),
                                    (_) => false,
                                  );
                                },
                                child: Container(
                                  width: 92.0.w,
                                  height: 36.0.h,
                                  margin: EdgeInsetsDirectional.only(
                                      top: 8.0.h,
                                      start: 8.0.h,
                                      end: 16.0.h,
                                      bottom: 8.0.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.transparent,
                                    borderRadius: BorderRadius.circular(4.0.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      signup_screen.signin.tr(),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.textTheme.titleLarge
                                          ?.copyWith(
                                        color: AppColors.appBlack,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 92.0.w,
                                height: 36.0.h,
                                margin: EdgeInsetsDirectional.only(
                                    top: 8.0.h,
                                    start: 8.0.h,
                                    end: 16.0.h,
                                    bottom: 8.0.h),
                                decoration: BoxDecoration(
                                  color: AppColors.appBlack,
                                  borderRadius: BorderRadius.circular(4.0.r),
                                ),
                                child: Center(
                                  child: Text(
                                    signup_screen.signup.tr(),
                                    textAlign: TextAlign.center,
                                    style:
                                        AppTheme.textTheme.titleLarge?.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          title: signup_screen.email.tr(),
                          isTitileAviable: true,
                          hint: signup_screen.email.tr(),
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge,
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          title: signup_screen.password.tr(),
                          isTitileAviable: true,
                          hint: '********',
                          obscureText: cubit.isHide,
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge,
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.hidePassword();
                            },
                            child: cubit.isHide
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.appBlack,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.appBlack,
                                  ),
                          ),
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          title: signup_screen.Repeat_password.tr(),
                          isTitileAviable: true,
                          hint: '********',
                          obscureText: cubit.isHideReapetPassword,
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge,
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraphs,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.hideReapetPassword();
                            },
                            child: cubit.isHideReapetPassword
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.appBlack,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.appBlack,
                                  ),
                          ),
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        customButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(
                                  fromSignup: true,
                                ),
                              ),
                            );
                          },
                          title: signup_screen.signup.tr(),
                          titleStyle:
                              AppTheme.textTheme.displayMedium?.copyWith(
                            color: AppColors.white,
                            fontSize: 16.0.sp,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          boxShadow: [
                            const BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.all(14.0),
                        ),
                        // Constatnts.height40,
                        // Constatnts.height8,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 18.0.w, vertical: 14.0.h),
                        //         decoration: BoxDecoration(
                        //           color: AppColors.white,
                        //           borderRadius: BorderRadius.circular(4.0.r),
                        //           border: Border.all(color: AppColors.grey),
                        //         ),
                        //         child: const FaIcon(FontAwesomeIcons.apple),
                        //       ),
                        //     ),
                        //     Constatnts.width20,
                        //     Constatnts.width4,
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 16.0.w, vertical: 14.0.h),
                        //         decoration: BoxDecoration(
                        //           color: AppColors.white,
                        //           borderRadius: BorderRadius.circular(4.0.r),
                        //           border: Border.all(color: AppColors.grey),
                        //         ),
                        //         child: const FaIcon(FontAwesomeIcons.google),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
