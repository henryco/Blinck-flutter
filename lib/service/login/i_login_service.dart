abstract class ILoginService {

	Future<AccessToken> initiateLoginProcess();
}

class AccessToken {
	final DateTime expires;
	final String userId;
	final String token;
	
	AccessToken({this.token, this.userId, this.expires});
}