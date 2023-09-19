import 'dart:async';

import 'package:job_application/core/utils/base_view_model.dart';

import '../../../core/state_renderer/state_renderer.dart';
import '../../../core/state_renderer/stete_render_impl.dart';
import '../../../domain/usecase/forge_password_by_phone.dart';
import '../../../domain/usecase/forget_password_usecase.dart';

class ForgetViewModel extends BaseViewModel
    implements ForgetPasswordInput, ForgetPasswordOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _phoneStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final ForgotPasswordByPhoneUseCase forgotPasswordByPhoneUseCase;
  var phone = "";
  var email = "";

  ForgetViewModel(
      this.forgotPasswordUseCase, this.forgotPasswordByPhoneUseCase);
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _phoneStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  forgetPAssword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await forgotPasswordUseCase.execute(email)).fold(
        (l) => inputState
            .add(ErrorState(StateRendererType.popupErrorState, l.message)),
        (r) => inputState.add(SuccessState(r)));
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  _isAllInputValid() {
    return isEmailValid(email);
  }

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputValid());

  @override
  forgetPAsswordbyPhone() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await forgotPasswordByPhoneUseCase.execute(phone)).fold(
        (l) => inputState
            .add(ErrorState(StateRendererType.popupErrorState, l.message)),
        (r) => inputState.add(SuccessState(r)));
  }

  @override
  Sink get inputPhone => _phoneStreamController.sink;

  bool _isPhoneValid(String phone) {
    return phone.isNotEmpty;
  }

  @override
  Stream<bool> get outIsPhoneValid =>
      _phoneStreamController.stream.map((phone) => _isPhoneValid(phone));

  @override
  setPhone(String phone) {
    inputPhone.add(phone);
    this.phone = phone;
  }
}

abstract class ForgetPasswordInput {
  setEmail(String email);
  setPhone(String phone);
  forgetPAssword();
  forgetPAsswordbyPhone();
  Sink get inputEmail;
  Sink get inputPhone;
  Sink get inputIsAllInputValid;
}

abstract class ForgetPasswordOutput {
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsPhoneValid;
  Stream<bool> get outputIsAllInputValid;
}
