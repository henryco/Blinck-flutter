import 'package:meta/meta.dart';

abstract class ITokenStorageService {
	
	@virtual
  Future<bool> saveFacebookToken(Token token);

  @virtual
  Future<Token> currentFacebookToken();
  
  @virtual
  Future<bool> removeFacebookToken();
  
  const ITokenStorageService();
}

class Token {
  final String uid;
  final String token;

  const Token({@required this.uid, @required this.token});

  @override
  String toString() {
    return 'Token{uid: $uid, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          token == other.token;

  @override
  int get hashCode => uid.hashCode ^ token.hashCode;
}
