import 'package:blinck_app/service/api/login/facebook/facebook_login_service.dart';
import 'package:blinck_app/service/api/login/facebook/i_login_service.dart';
import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/storage/token/token_shared_storage_service.dart';


class Dependencies {
	
	static const Map<String, Object> $ = {
		"tokenStorageService": const TokenSharedStorageService(),
		"facebookLoginService": const FacebookLoginService(),
		// todo more
	};
	
	
	static ILoginService get loginService => $["facebookLoginService"];
	
	static ITokenStorageService get tokenStorageService => $["tokenStorageService"];
	
	
}

