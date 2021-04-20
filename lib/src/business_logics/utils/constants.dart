const String BASE_URL = 'https://erp.ibos.io/identity/TokenGenerate/IbosLogin';

class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 900;
  static const int SUCCESSFUL = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}

class UserData {
  static String email, refreshToken, token;
}