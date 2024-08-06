import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/login.dart';
import '../../../core/utils/global_states.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  loginUser(Login data) async {
    try {
      emit(LoginLoading());
      final response =
          await repository.login(data.email ?? "", data.password ?? "");

      //log("response body first: ${response.datas}");
      if (response.isConnectionSuccessful()) {
        emit(LoginLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(LoginFailure(message: '${response.name}'));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
