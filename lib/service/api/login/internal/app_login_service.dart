import 'package:blinck_app/service/api/api.dart';
import 'package:blinck_app/service/api/login/internal/i_login_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AppLoginService extends ILoginService {

	static const String EP_LOGIN = ApiEndpoints.SERVER_URL + "/login/user";

	const AppLoginService();
	
	@override
	Future<String> loginUser(LoginForm form) async {
		
		final response = await http.post(EP_LOGIN, body: json.encode(form.toJson()));
		return response.statusCode == 200
			? response.headers[ApiHeaders.AUTHORIZATION_HTTP]
			: null;
	}

}