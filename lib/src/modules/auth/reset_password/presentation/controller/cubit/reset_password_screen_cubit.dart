import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/controller/cubit/reset_password_screen_state.dart';

class ResetPasswordScreenCubit extends BaseCubit<ResetPasswordScreenState> {
  ResetPasswordScreenCubit() : super(ResetPasswordScreenInitial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool isLaoding = false;
  bool isHide = true;
  bool isHideReapetPassword = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(ResetPasswordScreenHidePassword());
    isHide = !isHide;
    emit(ResetPasswordScreenHidePassword());
  }

  hideReapetPassword() {
    emit(ResetPasswordScreenHidePassword());
    isHideReapetPassword = !isHideReapetPassword;
    emit(ResetPasswordScreenHidePassword());
  }
}
