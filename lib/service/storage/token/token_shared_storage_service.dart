import 'package:meta/meta.dart';
import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedStorageService extends ITokenStorageService {
	
	static const String TOKEN_FB = "fb_token";
	
	
	@override
	Future<bool> saveFacebookToken(Token token) async {
		final prefs = await SharedPreferences.getInstance();
		var data = (token == null ? null : <String>[token.uid, token.token]);
		return prefs.setStringList(TOKEN_FB, data);
	}
	
	@override
	Future<Token> currentFacebookToken() async {
		final prefs = await SharedPreferences.getInstance();
		var data = prefs.getStringList(TOKEN_FB);
		return data != null ? new Token(uid: data[0], token: data[1]) : null;
	}
	
	@override
	Future<bool> removeFacebookToken() async {
		return saveFacebookToken(null);
	}
	
}