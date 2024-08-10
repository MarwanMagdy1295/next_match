import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/signup/presentation/controller/cubit/signup_screen_state.dart';

class SignupScreenCubit extends BaseCubit<SignupScreenState> {
  SignupScreenCubit() : super(SignupScreenInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool isLaoding = false;
  bool isHide = true;
  bool isHideReapetPassword = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(SignupScreenHidePasswordState());
    isHide = !isHide;
    emit(SignupScreenHidePasswordState());
  }

  hideReapetPassword() {
    emit(SignupScreenHidePasswordState());
    isHideReapetPassword = !isHideReapetPassword;
    emit(SignupScreenHidePasswordState());
  }

  // Future<void> postLoginData() async {
  //   if (formKey.currentState!.validate()) {
  //     isLaoding = true;
  //     emit(SignInLoadingState());
  //     await _authRepository
  //         .login(
  //             body: AuthLoginRequestModel(
  //       phoneNumber: emailController.text,
  //       password: passwordController.text,
  //     ))
  //         .then((value) {
  //       emit(SignInLoadingState());
  //       isLaoding = false;
  //       RouteManager.navigateAndPopAll(
  //         const MapScreen(),
  //       );
  //     }).catchError((onError) {
  //       emit(SignInLoadingState());
  //       isLaoding = false;
  //       print('login error=>  $onError');
  //     });
  //   }
  // }
}
