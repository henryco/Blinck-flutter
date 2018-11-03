import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/api/login/facebook/i_login_service.dart' as Fb;
import 'package:blinck_app/service/api/login/internal/i_login_service.dart' as App;
import 'package:blinck_app/screen/router.dart';
import 'package:blinck_app/service/storage/token/token_shared_storage_service.dart';
import 'package:blinck_app/util/model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
	
	final App.ILoginService appLoginService;
	final Fb.ILoginService fbLoginService;
	
	LoginScreen({
		@required this.appLoginService,
		@required this.fbLoginService,
		
		Key key,
	}) : super(key: key);
	
	@override
	State<LoginScreen> createState() => new _State();
}


class _State extends ViewModel<LoginScreen, _Logic> {
	
	@override
	_Logic createLogic() => new _Logic();
	
	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			
			
			appBar: AppBar(
				title: Text("LoginScreen"),
			),
			
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: $ifs($.authorized, _authorized, _unauthorized),
				),
			),
			
		
		);
	}
	
	/// SHOW SPLASH SCREEN
	List<Widget> _authorized() {
		print('+');
		return [
		
			// todo SPLASH SCREEN
			Text('SPLASH SCREEN')
		];
	}
	
	/// show login button
	List<Widget> _unauthorized() {
		print('-');
		return [
		
			RaisedButton(
				onPressed: () => $.loginToFacebook(),
				child: Text('Login with Facebook'),
			),
			
		];
	}
	
}


class _Logic extends ViewLogic<LoginScreen, _State> {
	
	final _tokenStorage = TokenSharedStorageService.getInstance();
	bool authorized = false;
	
	@override
	void initialize() async {
		final token = await _tokenStorage.currentFacebookToken();
		
		update(() {
			authorized = token != null;
			if (authorized) loginDirectly();
		});
	}
	
	void loginToFacebook() async {
		final token = await $.fbLoginService.initiateLoginProcess();
		await _tokenStorage.saveFacebookToken(
			new Token(uid: token.userId, token: token.token)
		);
		
		loginDirectly();
	}

	void loginDirectly() async {
		final token = await _tokenStorage.currentFacebookToken();
		final authorization = await $.appLoginService.loginUser(
			App.LoginForm(fbToken: token.token, fbId: token.uid)
		);
		
		print('Auth: $authorization');
		await _tokenStorage.saveSessionString(authorization);
		Navigator.pushReplacementNamed($context, Router.SCREEN_MAIN);
	}
	
  

	
}