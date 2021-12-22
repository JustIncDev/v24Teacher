import 'package:firebase_auth/firebase_auth.dart';
import 'package:v24_teacher_app/repo/base_repo.dart';
import 'package:v24_teacher_app/repo/provider/signup_remote_provider.dart';

class SignUpRepo extends BaseRepo {
  SignUpRepo()
      : _signUpRemoteProvider = SignUpRemoteProvider(),
        super();

  final SignUpRemoteProvider _signUpRemoteProvider;
}
