import 'dart:async';

import 'package:job_application/core/utils/base_view_model.dart';

import '../../../core/state_renderer/state_renderer.dart';
import '../../../core/state_renderer/stete_render_impl.dart';
import '../../../core/utils/freezed.dart';
import '../../../domain/usecase/regiser_usecase.dart';

class RegisterViewModel extends BaseViewModel
    implements RegisterViewModelInput, RegisterViewModelOutput {
  final RegiserUsecase _regiserUsecase;
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _confirmPasswordStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  var registerObject = RegisterObject("", "", "", "");
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  RegisterViewModel(this._regiserUsecase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    _confirmPasswordStreamController.close();
    _emailStreamController.close();
  }

  //! input
  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  setCnfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    registerObject = registerObject.copyWith(confirmPassword: confirmPassword);
    inputAreAllInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    registerObject = registerObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    registerObject = registerObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    registerObject = registerObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _regiserUsecase.execute(RegisterUseCaseInput(
            registerObject.confirmPassword,
            registerObject.email,
            registerObject.password,
            registerObject.userName)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  //! output
  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsConfirmPasswordValid =>
      _areAllInputsValidStreamController.stream
          .map((confirmPassword) => _isConfirmPasswordValid(confirmPassword));

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  //!
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isEmailValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isConfirmPasswordValid(String conformPassword) {
    return conformPassword.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(registerObject.password) &&
        _isUserNameValid(registerObject.userName) &&
        _isEmailValid(registerObject.email) &&
        _isConfirmPasswordValid(registerObject.confirmPassword);
  }
}

abstract class RegisterViewModelInput {
  setUserName(String userName);
  setEmail(String userName);
  setPassword(String password);
  setCnfirmPassword(String confirmPassword);
  register();
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputEmail;
  Sink get inputConfirmPassword;
  Sink get inputAreAllInputsValid;
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsConfirmPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}
