import 'dart:async';

import 'package:job_application/core/utils/base_view_model.dart';
import 'package:job_application/domain/usecase/verify_use_case.dart';

import '../../core/state_renderer/state_renderer.dart';
import '../../core/state_renderer/stete_render_impl.dart';

class VerifyViewModel extends BaseViewModel
    implements VerifyViewModelInput, VerifyViewModelOutput {
  final StreamController _codeStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final VerifyUsecas verifyUsecas;
  var code = '';

  VerifyViewModel(this.verifyUsecas);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _codeStreamController.close();
    _isAllInputValidStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCode => _codeStreamController.sink;

  @override
  Stream<bool> get outIsCodeValid =>
      _codeStreamController.stream.map((code) => isCodeTrue(code));

  @override
  setCode(String code) {
    inputCode.add(code);
    this.code = code;
  }

  @override
  verify() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await verifyUsecas.execute(code)).fold(
      (l) => inputState
          .add(ErrorState(StateRendererType.popupErrorState, l.message)),
      (data) {
        inputState.add(SuccessState(data));
      },
    );
  }

  bool isCodeTrue(String code) {
    return code.isNotEmpty;
  }
}

abstract class VerifyViewModelInput {
  setCode(String code);

  verify();
  Sink get inputCode;
}

abstract class VerifyViewModelOutput {
  Stream<bool> get outIsCodeValid;
}
