import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  Future<void> registerUser({required String email ,required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());

    }on  FirebaseAuthException catch (ex) {
      if (ex.code == 'week_password') {
        emit(RegisterFailure(errorMessage: 'week password'));
      } else if (ex.code == 'email_already_use') {
        emit(RegisterFailure(errorMessage: 'email already use'));
      }
    }
    catch (e) {
      emit(RegisterFailure(errorMessage: 'there was an error please try again'));
    }
  }
}
