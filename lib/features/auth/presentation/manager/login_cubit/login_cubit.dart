import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);

  void signInAnonymous(){
    emit(LoginLoading());
    final FirebaseAuth _auth=FirebaseAuth.instance;
      _auth.signInAnonymously().then((value){
        emit(LoginSucess(value.user!.uid));
      }).catchError((e){
        emit(LoginErorr(e.message));
      });
    }


    }



