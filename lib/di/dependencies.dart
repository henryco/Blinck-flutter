import 'package:blinck_app/service/login/facebook_login_service.dart';
import 'package:blinck_app/service/login/i_login_service.dart';
import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/storage/token/token_shared_storage_service.dart';

class _Store {
	
	final ILoginService _facebookLoginService = new FacebookLoginService();
	final ITokenStorageService _tokenStorageService = new TokenSharedStorageService();
}

class Dependencies {
	
	static final _Store $ = new _Store();
	
	
	
	static ILoginService get loginService => $._facebookLoginService;
	
	static ITokenStorageService get tokenStorageService => $._tokenStorageService;
	
	
}

