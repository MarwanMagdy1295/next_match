import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_match/src/modules/auth/forget_password/presentation/controller/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
}
