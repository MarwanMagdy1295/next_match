import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/ui/reset_password_screen.dart';
import 'package:next_match/widget/custom_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height.h,
        width: MediaQuery.sizeOf(context).width.w,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: Assets.images.backgroundImage.provider(),
            //   fit: BoxFit.fill,
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
                        'forget_password_screen.forget_password.tr()',
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'forget_password_screen.forget_password.tr()',
                        style: AppTheme.textTheme.displaySmall!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Constatnts.height6,
                      Text(
                        'forget_password_screen.send_verification.tr()',
                        style: AppTheme.textTheme.displaySmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      Constatnts.height30,
                      PinCodeTextField(
                        // controller: controller,
                        keyboardType: TextInputType.number,
                        enablePinAutofill: true,
                        autoFocus: true,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.slide,
                        onSaved: (v) {},
                        enableActiveFill: true,
                        hintCharacter: '0',
                        textStyle: AppTheme.textTheme.displayLarge!.copyWith(
                          color: AppColors.white,
                          fontSize: 26.0.sp,
                        ),
                        pinTheme: PinTheme(
                          fieldHeight: 60.0.h,
                          fieldWidth: MediaQuery.of(context).size.width.w / 7.5,
                          selectedFillColor: AppColors.transparent,
                          selectedColor: AppColors.white,
                          borderRadius: BorderRadius.circular(8.0.r),
                          borderWidth: 1,
                          inactiveColor: AppColors.white,
                          activeColor: AppColors.white,
                          inactiveFillColor: AppColors.transparent,
                          shape: PinCodeFieldShape.box,
                          activeFillColor: AppColors.transparent,
                          errorBorderColor: AppColors.red,
                          disabledColor: AppColors.white,
                        ),
                        appContext: context,
                        onChanged: (String value) {},
                      ),
                      Constatnts.height30,
                      customButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen(),
                            ),
                          );
                        },
                        title: 'forget_password_screen.verify_email.tr()',
                        titleStyle: AppTheme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.all(14.0),
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'forget_password_screen.recive_email.tr()',
                            style: AppTheme.textTheme.headlineMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0.sp,
                            ),
                          ),
                          Text(
                            'forget_password_screen.resend.tr()',
                            style: AppTheme.textTheme.headlineMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0.sp,
                            ),
                          ),
                        ],
                      ),
                      Constatnts.height16,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.white,
                            ),
                            Constatnts.width8,
                            Text(
                              'forget_password_screen.back_to_login.tr()',
                              style:
                                  AppTheme.textTheme.headlineMedium!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
