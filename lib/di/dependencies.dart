import 'package:blinck_app/service/login/facebook_login_service.dart';
import 'package:blinck_app/service/login/i_login_service.dart';

class _Store {
	
	final ILoginService _facebookLoginService = new FacebookLoginService();
	
}

class Dependencies {
	
	static final _Store $ = new _Store();
	
	
	
	static ILoginService get loginService => $._facebookLoginService;
	
	
	
}

