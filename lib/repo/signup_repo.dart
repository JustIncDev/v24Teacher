import 'package:v24_teacher_app/repo/base_repo.dart';
import 'package:v24_teacher_app/repo/provider/remote/signup_remote_provider.dart';

class SignUpRepo extends BaseRepo {
  SignUpRepo()
      : _signUpRemoteProvider = SignUpRemoteProvider(),
        super();

  final SignUpRemoteProvider _signUpRemoteProvider;
}
