import 'package:blinck_app/service/login/i_login_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
	
	final String title = "LoginScreen";
	final ILoginService loginService;
	
	LoginScreen({Key key, @required this.loginService})
			: super(key: key);
	
	@override
	State<LoginScreen> createState() => new _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
	final _Logic $ = new _Logic();
	
	
	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			
			
			appBar: AppBar(
				title: Text(widget.title),
			),
			
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					
					children: <Widget>[
						
						
						RaisedButton(
							onPressed: () => $.onLoginButtonPressed(this),
							child: Text('Login with Facebook'),
						),
						
						
						
					],
				),
			),
			
		
		);
	}
}


class _Logic {
	
  
  onLoginButtonPressed (_LoginScreenState $) async {
  	var token = await $.widget.loginService.initiateLoginProcess();
  	print('TOKEN: $token');
  }
  
}