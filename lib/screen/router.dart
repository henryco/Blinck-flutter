import 'package:blinck_app/di/dependencies.dart';
import 'package:blinck_app/screen/login_screen.dart';
import 'package:blinck_app/screen/main_screen.dart';
import 'package:flutter/material.dart';

class Router {

	static const String SCREEN_LOGIN = '/';
	static const String SCREEN_MAIN = '/main';
	
	static String get initialRoute => SCREEN_LOGIN;
	
	static Map<String, WidgetBuilder> get routes => {
		
		SCREEN_LOGIN: (c) => LoginScreen(loginService: Dependencies.loginService),
		SCREEN_MAIN: (C) => MainScreen()
	};

}