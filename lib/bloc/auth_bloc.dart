import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/firebase_auth.dart';
import '../model/user_model.dart';

// Eventos
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterEvent({required this.email, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

class AuthStateChangedEvent extends AuthEvent {
  final UserModel? userModel;

  AuthStateChangedEvent(this.userModel);
}

// Estados
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel userModel;

  AuthAuthenticated(this.userModel);
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService = FirebaseAuthenticationService();

  AuthBloc() : super(AuthInitial()) {
    // Ouve as mudanças no estado de autenticação do Firebase
    _authenticationService.user.listen((userModel) {
      add(AuthStateChangedEvent(userModel));
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authenticationService.signInWithEmailAndPassword(event.email, event.password);
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authenticationService.createUserWithEmailAndPassword(event.email, event.password);
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthLogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authenticationService.signOut();
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthStateChangedEvent>((event, emit) {
      if (event.userModel == null) {
        emit(AuthUnauthenticated());
      } else {
        emit(AuthAuthenticated(event.userModel!));
      }
    });
  }
}
