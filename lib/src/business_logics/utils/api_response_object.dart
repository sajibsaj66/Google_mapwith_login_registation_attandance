import 'constants.dart';

class ResponseObject {
  int id;
  Object object;

  ResponseObject({this.id: ResponseCode.NO_INTERNET_CONNECTION, this.object});
}