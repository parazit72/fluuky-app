import 'package:fluuky/data/repositories/auth_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final AuthRepositoryImpl _authRepository;

  VerifyCodeUseCase(this._authRepository);

  Future<void> execute(String code) async {
    await _authRepository.verifyCode(code);
  }
}
