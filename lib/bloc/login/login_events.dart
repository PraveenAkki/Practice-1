part of 'login_bloc.dart';

class LoginEvents extends Equatable {

  const LoginEvents();

  @override
  List<Object?> get props => [];
}

class EmailButton extends LoginEvents{
  final String email;
  const EmailButton({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordButton extends LoginEvents{
  final String password;
  const PasswordButton({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginEventApi extends LoginEvents{
  const LoginEventApi();
}