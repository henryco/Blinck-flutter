import 'package:meta/meta.dart';

abstract class ILoginService {

	@virtual
	Future<AccessToken> initiateLoginProcess();
	
	const ILoginService();
}

class AccessToken {
	final DateTime expires;
	final String userId;
	final String token;
	
	AccessToken({this.token, this.userId, this.expires});
}