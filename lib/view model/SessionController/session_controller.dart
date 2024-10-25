class SessionController {
  static final SessionController _instance = SessionController._internal();

  factory SessionController() {
    return _instance;
  }

  SessionController._internal();

   String? userID;
}
