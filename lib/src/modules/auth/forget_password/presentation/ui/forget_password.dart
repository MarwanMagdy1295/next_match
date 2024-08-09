import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/ui/otp_screen.dart';
import 'package:next_match/widget/custom_text_form_field.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/widget/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        Constatnts.width16,
                        Text(
                          forget_password_screen.forget_password.tr(),
                          style: AppTheme.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Constatnts.height52,
                    Row(
                      children: [
                        Text(
                          forget_password_screen.forget_password_title.tr(),
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
                          forget_password_screen.forget_password_sub_title.tr(),
                          style: AppTheme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.paragraphs),
                        ),
                      ],
                    ),
                    Constatnts.height60,
                    Constatnts.height20,
                    customTextFeild(
                      title: forget_password_screen.email.tr(),
                      isTitileAviable: true,
                      hint: forget_password_screen.email.tr(),
                      hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.paragraphs,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                      titleStyle: AppTheme.textTheme.titleLarge,
                      contentStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.paragraphs,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                    ),
                    Constatnts.height40,
                    Constatnts.height8,
                    customButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpScreen(
                              fromSignup: false,
                            ),
                          ),
                        );
                      },
                      title: forget_password_screen.send_email.tr(),
                      titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
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
                    Constatnts.height24,
                    Constatnts.height2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forget_password_screen.recalled_your_password.tr(),
                          style: AppTheme.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.paragraphs),
                        ),
                        Text(
                          ' ${forget_password_screen.signin.tr()}',
                          style: AppTheme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
