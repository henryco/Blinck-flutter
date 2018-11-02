import 'package:blinck_app/service/api/api.dart';
import 'package:http/http.dart' as http;
import './session.dart';
import 'dart:convert';
import 'dart:async';

class AppSessionService extends ISessionService {

	static const String INFO_USER = ApiEndpoints.SERVER_URL + "/session/user";
	static const String INFO_ADMIN = ApiEndpoints.SERVER_URL + "/session/admin";
	
	const AppSessionService();
	
	@override
	Future<Status> getUserInfo(String sessionJwt) async {
		
		final response = await http.get(INFO_USER, headers: {
			ApiHeaders.AUTHORIZATION_HTTP: sessionJwt
		});
		
		print("RESPONSE: $response");
		print("STATUS: ${response.statusCode}");
		print("BODY: ${response.body}");
		
		return response.statusCode == 200
			? Status.fromJson(json.decode(response.body))
			: null;
	}
	
}