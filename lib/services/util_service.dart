import 'package:todo_with_firebase_auth/blocs/auth/auth_bloc.dart';

class Util {
  validateRegistration(SignUpEvent event) {
    return event.username.isNotEmpty && event.email.length >= 6 && event.password.isNotEmpty && event.password == event.prePassword;
  }

  validateRegistrationSignIn(SignInEvent event) {
    return event.email.length >= 6 && event.password.isNotEmpty;
  }
}
