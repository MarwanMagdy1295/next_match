import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

Column customTextFeild({
  controller,
  title,
  hint,
  icon,
  suffixIconColor,
  lines = 1,
  isTitileAviable = true,
  keyboardType,
  maxLength,
  inputFormatters,
  color,
  String? Function(String?)? validator,
  obscureText = false,
  border,
  padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
  hintStyle,
  isFill = false,
  titleStyle,
  contentStyle,
  textInputAction,
  onTap,
  isForgetAviable = false,
  suffixIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      isTitileAviable
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                isForgetAviable
                    ? GestureDetector(
                        onTap: onTap,
                        child: Text(
                          signin_screen.forgot_password.tr(),
                          style: AppTheme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : Container(),
              ],
            )
          : const SizedBox(),
      Constatnts.height6,
      TextFormField(
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        maxLength: maxLength,
        controller: controller,
        cursorColor: AppColors.white,
        validator: validator,
        maxLines: lines,
        keyboardType: keyboardType,
        style: contentStyle,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          enabledBorder: border,
          disabledBorder: border,
          border: border,
          focusedBorder: border,
          contentPadding: padding,
          filled: isFill,
          fillColor: color,
          isDense: true,
          hintText: hint,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
        ),
      ),
    ],
  );
}
