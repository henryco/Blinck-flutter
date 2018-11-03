import 'package:blinck_app/service/api/api.dart';
import 'package:blinck_app/service/api/login/internal/i_login_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AppLoginService extends ILoginService {

	static const String EP_LOGIN = ApiEndpoints.SERVER_URL + "/login/user";
	static final String header = ApiHeaders.AUTHORIZATION_HTTP.toLowerCase();

	const AppLoginService();
	
	@override
	Future<String> loginUser(LoginForm form) async {
		
		final response = await http.post(EP_LOGIN, body: json.encode(form.toJson()));
		if (response.statusCode != 200)
			throw new Exception("RESPONSE CODE: ${response.statusCode}");
		for (var key in response.headers.keys)
			if (key.toLowerCase() == header)
				return response.headers[header];
		throw new Exception("Cannot find authorization header");
	}

}