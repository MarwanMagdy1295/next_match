import 'package:next_match/src/modules/auth/login/data/data_source/login_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/login/data/model/login_model.dart';

abstract class LoginScreenRepositoryInterface {
  Future<LoginModel?> login({required String email, required String password});
}

class LoginScreenRepository extends LoginScreenRepositoryInterface {
  final LoginScreenRemoteDataSource _loginRemoteDataSource;

  LoginScreenRepository({
    required LoginScreenRemoteDataSource loginScreenRemoteDataSource,
  }) : _loginRemoteDataSource = loginScreenRemoteDataSource;

  @override
  Future<LoginModel?> login({required String email, required String password}) {
    return _loginRemoteDataSource.login(email: email, password: password);
  }
}
