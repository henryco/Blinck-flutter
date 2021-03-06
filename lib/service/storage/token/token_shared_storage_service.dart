import 'package:blinck_app/service/storage/token/i_token_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedStorageService extends ITokenStorageService {
	
	static TokenSharedStorageService getInstance() => _instance;
	static const TokenSharedStorageService _instance
	= const TokenSharedStorageService();
	
	const TokenSharedStorageService();
	
	static const String TOKEN_FB = "fb_token";
	static const String TOKEN_APP = "app_token";
	
	@override
	Future<bool> saveFacebookToken(Token token) async {
		final prefs = await SharedPreferences.getInstance();
		final data = (token == null ? null : <String>[token.uid, token.token]);
		return prefs.setStringList(TOKEN_FB, data);
	}
	
	@override
	Future<Token> currentFacebookToken() async {
		final prefs = await SharedPreferences.getInstance();
		final data = prefs.getStringList(TOKEN_FB);
		return data != null ? new Token(uid: data[0], token: data[1]) : null;
	}
	
	@override
	Future<bool> removeFacebookToken() async {
		return saveFacebookToken(null);
	}
	
	@override
	Future<bool> saveSessionString(String token) async {
		final prefs = await SharedPreferences.getInstance();
		return prefs.setString(TOKEN_APP, token);
	}
	
	@override
	Future<bool> removeSessionString() async {
		return saveSessionString(null);
	}
	
	@override
	Future<String> currentSessionString() async {
		final prefs = await SharedPreferences.getInstance();
		return prefs.getString(TOKEN_APP);
	}
	
}