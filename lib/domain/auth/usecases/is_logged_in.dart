import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/source/auth_service.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthService>().isLoggedIn();
  }
}
