import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/controller/otp_screen_state.dart';

class OtpScreenCubit extends Cubit<OtpScreenState> {
  OtpScreenCubit() : super(OtpScreenInitial());

  TextEditingController controller = TextEditingController();

  bool isDisabled = true;

  void isButtonDisabled() {
    emit(OtpScreenLoading());
    if (controller.text.isNotEmpty) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    emit(OtpScreenLoading());
  }
}
