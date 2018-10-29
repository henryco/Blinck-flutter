import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedStorageService extends ITokenStorageService {
	
	static const String TOKEN_FB = "fb_token";
	
	
	@override
	Future<bool> saveFacebookToken(String token) async {
		final prefs = await SharedPreferences.getInstance();
		return await prefs.setString(TOKEN_FB, token);
	}
	
	@override
	Future<String> currentFacebookToken() async {
		final prefs = await SharedPreferences.getInstance();
		return prefs.getString(TOKEN_FB);
	}
	
	
	
}