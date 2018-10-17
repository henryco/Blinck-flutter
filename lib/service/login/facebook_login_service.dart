import './i_login_service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginService implements ILoginService {
	
	final List<String> _permissions = [
		"user_birthday",
		"user_location",
		"user_likes",
		"user_photos",
		"user_friends",
		"user_gender",
		"public_profile",
	];
	
	
	@override
	Future<AccessToken> initiateLoginProcess() async {
		
		var facebookLogin = FacebookLogin();
		var result = await facebookLogin.logInWithReadPermissions(_permissions);
		
		switch (result.status) {
			
			case FacebookLoginStatus.loggedIn: {
				return new AccessToken(
						token: result.accessToken.token,
						userId: result.accessToken.userId,
						expires: result.accessToken.expires
				);
			}
			
			default: {
				return Future.error(result.errorMessage);
			}
		}
		
	}
	
}