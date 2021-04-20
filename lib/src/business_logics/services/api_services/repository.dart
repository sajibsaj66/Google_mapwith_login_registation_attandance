import 'package:interview/src/business_logics/services/api_services/user_auth_api_services.dart';
import 'package:interview/src/business_logics/utils/api_response_object.dart';

class _Repository {
  final UserAuthAPIServices _userAuthAPIServices = UserAuthAPIServices();

  Future<ResponseObject> userLogin(String email, String password) => _userAuthAPIServices.userLogin(email, password);
}

final repository = _Repository();