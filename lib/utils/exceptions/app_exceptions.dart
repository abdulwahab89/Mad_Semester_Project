class AppExceptions implements Exception{
  final _message;
  final _prefix;
AppExceptions(
    [this._message, this._prefix]
    );
  @override
  String toString(){
return '$_prefix$_message';
  }
}
