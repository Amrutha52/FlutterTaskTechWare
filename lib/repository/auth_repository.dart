import 'package:either_dart/either.dart';
import 'package:myproo/datasource/auth_datasource.dart';
import 'package:myproo/expention.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> Register(
      String email, String password, String Confirmpassword);
  Future<Either<String, String>> Login(String email, String password);
}

class AuthenticationRepository extends IAuthenticationRepository {
  final AuthenticationRemote _datasource = AuthenticationRemote();
  @override
  Future<Either<String, String>> Login(String email, String password) async {
    try {
      await _datasource.Login(email, password);
      return Right('welcome');
    } on expention catch (ex) {
      return Left(ex.message ?? '');
    }
  }

  @override
  Future<Either<String, String>> Register(
      String email, String password, String Confirmpassword) async {
    try {
      await _datasource.register(email, password, Confirmpassword);
      return Right('Registeration Done');
    } on expention catch (ex) {
      return Left(ex.message ?? '');
    }
  }
}