import 'package:blinck_app/service/api/login/facebook/facebook_login_service.dart';
import 'package:blinck_app/service/api/login/internal/i_login_service.dart' as App;
import 'package:blinck_app/service/api/login/facebook/i_login_service.dart' as Fb;
import 'package:blinck_app/service/api/login/internal/app_login_service.dart';
import 'package:blinck_app/service/api/session/app_session_service.dart';
import 'package:blinck_app/service/api/session/session.dart';
import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/storage/token/token_shared_storage_service.dart';


class Dependencies {
	
	static const Map<String, Object> $ = {
		"tokenStorageService": const TokenSharedStorageService(),
		"facebookLoginService": const FacebookLoginService(),
		"appLoginService": const AppLoginService(),
		"appSessionService": const AppSessionService()
	};
	
	
	static ITokenStorageService get tokenStorageService => $["tokenStorageService"];
	
	static Fb.ILoginService get fbLoginService => $["facebookLoginService"];
	
	static App.ILoginService get appLoginService => $["appLoginService"];
	
	static ISessionService get sessionService => $["appSessionService"];
}

