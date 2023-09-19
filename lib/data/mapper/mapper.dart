import 'package:job_application/core/utils/extension.dart';
import 'package:job_application/data/responce/responce.dart';

import '../../core/utils/constance.dart';
import '../../domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponce? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.nameOfNotification.orZero() ?? Constant.zero,
    );
  }
}

extension ContactResponseMapper on ContactResponce? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.link.orEmpty() ?? Constant.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponce? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contact.toDomain(),
    );
  }
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponce? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constant.empty;
  }
}

extension ForgetPasswordByPhoneResponseMapper
    on ForgetPasswordByPhoneResponce? {
  String toDomain() {
    return this?.phone?.orEmpty() ?? Constant.empty;
  }
}
