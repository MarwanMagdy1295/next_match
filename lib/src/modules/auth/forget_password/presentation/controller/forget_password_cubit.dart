import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/forget_password/data/repositories/forget_password_screen_repository.dart';
import 'package:next_match/src/modules/auth/forget_password/presentation/controller/forget_password_state.dart';
import 'package:next_match/src/modules/auth/login/data/model/login_model.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/ui/otp_screen.dart';

class ForgetPasswordCubit extends BaseCubit<ForgetPasswordState>
    with
        AdaptiveCubit<ForgetPasswordState>,
        ResetLazySingleton<ForgetPasswordCubit, ForgetPasswordState> {
  final ForgetPasswordScreenRepository _forgetPasswordScreenRepository;
  ForgetPasswordCubit(
      {required ForgetPasswordScreenRepository forgetPasswordScreenRepository})
      : _forgetPasswordScreenRepository = forgetPasswordScreenRepository,
        super(ForgetPasswordInitial());

  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  Future<void> sendEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoginModel? res;
      isLoading = true;
      emit(ForgetPasswordLoading());
      await _forgetPasswordScreenRepository
          .forgetPasswordSendEmail(
        email: emailController.text,
      )
          .then((value) {
        res = value;
        // di<PrefsService>().user.put(res!.data!.accessToken!);
        isLoading = false;
        emit(ForgetPasswordLoading());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpScreen(
              fromSignup: false,
            ),
          ),
        );
      }).catchError((onError) {
        isLoading = false;
        emit(ForgetPasswordLoading());
        log('ForgetPassword error=>  $onError');
      });
    }
  }
}
