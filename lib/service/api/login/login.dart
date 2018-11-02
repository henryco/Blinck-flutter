import 'package:meta/meta.dart';

class AccessToken {
	final DateTime expires;
	final String userId;
	final String token;
	
	AccessToken({this.token, this.userId, this.expires});
}


class LoginForm {

	final String fbId;
	final String fbToken;
	
	const LoginForm({
		@required this.fbId,
		@required this.fbToken
	});
	
	factory LoginForm.fromAccessToken(AccessToken token) {
		return new LoginForm(fbId: token.userId, fbToken: token.token);
	}
	
	Map<String, dynamic> toJson() => {
		'facebook_uid': fbId,
		'facebook_token': fbToken
	};
}