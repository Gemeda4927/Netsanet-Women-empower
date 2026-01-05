abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  const LoginEvent({required this.phone, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String fullName;
  final String phone;
  final String serviceType;
  final String city;

  const RegisterEvent({
    required this.fullName,
    required this.phone,
    required this.serviceType,
    required this.city,
  });
}
