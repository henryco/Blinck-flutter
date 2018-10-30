import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/login/i_login_service.dart';
import 'package:blinck_app/screen/router.dart';
import 'package:blinck_app/util/model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
	
	final String title = "LoginScreen";
	final ILoginService loginService;
	final ITokenStorageService tokenStorageService;
	
	LoginScreen({
		@required this.tokenStorageService,
		@required this.loginService,
		Key key,
	}) : super(key: key);
	
	@override
	State<LoginScreen> createState() => new _State();
}


class _State extends ViewState<LoginScreen, _Logic> {
	
	@override
	_Logic createLogic() => new _Logic();
	
	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			
			
			appBar: AppBar(
				title: Text(widget.title),
			),
			
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: $ifs($.authorized, _authorized, _unauthorized),
				),
			),
			
		
		);
	}
	
	
	List<Widget> _authorized() {
		print('+');
		return [
		
			Text('AUTHORIZED')
		
		];
	}
	
	
	List<Widget> _unauthorized() {
		print('-');
		return [
		
			RaisedButton(
				onPressed: () => $.onLoginButtonPressed(),
				child: Text('Login with Facebook'),
			),
			
		];
	}
	
}


class _Logic extends ViewLogic<LoginScreen, _State> {
	
	
	bool authorized = false;
	
	
	@override
	void initialize() async {
		bool fbToken = await tryToLogin();
		
		update(() {
			authorized = fbToken;
			print('status: $fbToken');
		});
	}
	
	
	Future<bool> tryToLogin() async {
		String token = await $.tokenStorageService.currentFacebookToken();
		print('trying');
		return token != null;
	}
	
	
	onLoginButtonPressed () async {
  	var token = await $.loginService.initiateLoginProcess();
  	var saved = await $.tokenStorageService.saveFacebookToken(token.token);
  	
  	print('saved: $saved');
  	Navigator.pushReplacementNamed($context, Router.SCREEN_MAIN);
  }
  

	
}