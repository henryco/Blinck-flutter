import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:blinck_app/service/login/i_login_service.dart';
import 'package:blinck_app/screen/router.dart';
import 'package:blinck_app/util/util.dart';
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
	State<LoginScreen> createState() => new _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
	final _Logic $ = new _Logic();
	
	bool authorized = false;
	
	_LoginScreenState() {
		$.tryToLogin(this).then((v) {
			setState(() {
				authorized = v;
				print('status: $v');
			});
		});
	}
	
	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			
			
			appBar: AppBar(
				title: Text(widget.title),
			),
			
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: $ifs(authorized, _authorized, _unauthorized),
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
				onPressed: () => $.onLoginButtonPressed(this),
				child: Text('Login with Facebook'),
			),
			
		];
	}
	
	
}


class _Logic {
	
	
	Future<bool> tryToLogin(_LoginScreenState $) async {
		String token = await $.widget.tokenStorageService.currentFacebookToken();
		print('trying');
		return token != null;
	}
	
	
	onLoginButtonPressed (_LoginScreenState $) async {
  	var token = await $.widget.loginService.initiateLoginProcess();
  	var saved = await $.widget.tokenStorageService.saveFacebookToken(token.token);
  	
  	print('saved: $saved');
  	Navigator.pushReplacementNamed($.context, Router.SCREEN_MAIN);
  }

	
}