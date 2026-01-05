import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsanet/features/auth/data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await authRepository.login(event.phone, event.password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await authRepository.register(
        fullName: event.fullName,
        phone: event.phone,
        serviceType: event.serviceType,
        city: event.city,
      );
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
