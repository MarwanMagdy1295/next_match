import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/login/presentation/controller/cubit/login_screen_state.dart';

class LoginScreenCubit extends BaseCubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLaoding = false;
  bool isHide = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(LoginScreenHidePasswordState());
    isHide = !isHide;
    emit(LoginScreenHidePasswordState());
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
