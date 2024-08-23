import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/model/verify_model.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/repositories/login_screen_repository.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/controller/otp_screen_state.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/ui/premiere_league_id_screen.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/ui/reset_password_screen.dart';

class OtpScreenCubit extends BaseCubit<OtpScreenState>
    with
        AdaptiveCubit<OtpScreenState>,
        ResetLazySingleton<OtpScreenCubit, OtpScreenState> {
  final VerifyScreenRepository _verifyScreenRepository;
  OtpScreenCubit({required VerifyScreenRepository verifyScreenRepository})
      : _verifyScreenRepository = verifyScreenRepository,
        super(OtpScreenInitial());

  TextEditingController controller = TextEditingController();

  bool isDisabled = true;
  bool isLoading = false;
  bool fromSignup = false;
  UserModel? user;

  void isButtonDisabled() {
    emit(OtpScreenLoading());
    if (controller.text.isNotEmpty) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    emit(OtpScreenLoading());
  }

  Future<void> postFBLData(BuildContext context) async {
    VerifyModel? res;
    isLoading = true;
    emit(OtpScreenLoading());
    await _verifyScreenRepository
        .verify(
      code: controller.text,
    )
        .then((value) {
      res = value;
      user = res!.userModel!;
      log('user=>  ${user!.email}');
      isLoading = false;
      emit(OtpScreenLoading());
      fromSignup
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PremiereLeagueIdScreen(),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(
                  email: user!.email!,
                ),
              ),
            );
    }).catchError((onError) {
      isLoading = false;
      emit(OtpScreenLoading());
      log('user error=>  $onError');
    });
  }
}
